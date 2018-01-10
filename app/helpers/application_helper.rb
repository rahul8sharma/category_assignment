module ApplicationHelper
  def profix_for_sub_category(depth)
    ("&nbsp;" * 4 * depth).html_safe
  end

  def option_for_category(current_id = 0,categories=[], parent_id = nil, depth=0)
    parent_categories = Category.where({parent_id: parent_id, id: current_id})
    parent_categories.each do |category|
      categories << [profix_for_sub_category(depth) + category.name, category.id]
      option_for_category(current_id,categories, category.id, depth+1)
    end

    categories
  end
end
