import { ElementUIComponent } from './component'

/** DataMapper Component */
export declare class ElDataMapper extends ElementUIComponent {
  /** data-mapper data */
  data:object

  /** data-mapper columns */
  columns:object[]

  /** formatter col*/
  formatter:function (data,col,index) 

  /** The placeholder of data-mapper content */
  placeholder:string

  /** data-mapper rows */
  contentRows:number

}
