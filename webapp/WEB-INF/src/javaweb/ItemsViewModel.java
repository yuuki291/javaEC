package javaweb;

import java.util.List;

public class ItemsViewModel {

	public List<Item> itemList(){

		ItemSummaryView sumView = new ItemManager();

		return sumView.itemList();
	}
}
