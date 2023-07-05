/// <reference path="../node_modules/grafana-sdk-mocks/app/headers/common.d.ts" />
import 'jquery.flot';
import './lib/flot/jquery.flot.gauge';
import 'jquery.flot.time';
import 'jquery.flot.crosshair';
import { MetricsPanelCtrl } from 'app/plugins/sdk';
declare class BlendStatCtrl extends MetricsPanelCtrl {
    private $sanitize;
    private $location;
    static templateUrl: string;
    dataType: string;
    series: any[];
    data: any;
    fontSizes: any[];
    unitFormats: any[];
    invalidGaugeRange: boolean;
    panel: any;
    events: any;
    valueNameOptions: any[];
    blendNameOptions: any[];
    tableColumnOptions: any;
    panelDefaults: {
        links: any[];
        datasource: any;
        maxDataPoints: number;
        interval: any;
        targets: {}[];
        cacheTimeout: any;
        format: string;
        prefix: string;
        postfix: string;
        nullText: any;
        valueMaps: {
            value: string;
            op: string;
            text: string;
        }[];
        mappingTypes: {
            name: string;
            value: number;
        }[];
        rangeMaps: {
            from: string;
            to: string;
            text: string;
        }[];
        mappingType: number;
        nullPointMode: string;
        valueName: string;
        blendName: string;
        prefixFontSize: string;
        valueFontSize: string;
        postfixFontSize: string;
        thresholds: string;
        colorBackground: boolean;
        colorValue: boolean;
        colors: string[];
        sparkline: {
            show: boolean;
            full: boolean;
            lineColor: string;
            fillColor: string;
        };
        gauge: {
            show: boolean;
            minValue: number;
            maxValue: number;
            thresholdMarkers: boolean;
            thresholdLabels: boolean;
        };
        tableColumn: string;
    };
    constructor($scope: any, $injector: any, $sanitize: any, $location: any);
    onInitEditMode(): void;
    setUnitFormat(subItem: any): void;
    onDataError(err: any): void;
    onDataReceived(dataList: any): void;
    seriesHandler(seriesData: any): any;
    tableHandler(tableData: any): any[];
    setTableColumnToSensibleDefault(tableData: any): void;
    setTableValues(tableData: any, data: any): void;
    canModifyText(): boolean;
    setColoring(options: any): void;
    invertColorOrder(): void;
    onColorChange(panelColorIndex: any): (color: any) => void;
    onSparklineColorChange(newColor: any): void;
    onSparklineFillChange(newColor: any): void;
    getDecimalsForValue(value: any): any;
    setValues(data: any): void;
    setValueMapping(data: any): void;
    removeValueMap(map: any): void;
    addValueMap(): void;
    removeRangeMap(rangeMap: any): void;
    addRangeMap(): void;
    link(scope: any, elem: any, attrs: any, ctrl: any): void;
}
declare function getColorForValue(data: any, value: any): any;
export { BlendStatCtrl, BlendStatCtrl as PanelCtrl, getColorForValue };
