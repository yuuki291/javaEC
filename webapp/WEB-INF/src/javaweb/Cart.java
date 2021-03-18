package javaweb;

import java.util.Iterator;

public interface Cart {

	public void add(Item item);

	public Iterator<Item> iterator();

	public int size();
}
