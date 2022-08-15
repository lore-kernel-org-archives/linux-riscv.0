Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE804C25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 07:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WM91osgp4yv5X5sKwjh6jBgNMCAfC4pgxSYjezLUvs=; b=TNYk4bof2SSA8u
	I/niJ+KgTBr++J24pXZGVXvAU/fGL8N37WzSbxYr8CUYYPQohdURypxnKVEa/n1EFeGcm0i+gNm4V
	QYto+9pJ0j8glJPlEaYV2TYhCLRx/igRNwpREbRd39xFfafMfPxOz77AMw6D8TmcN5/JedvixV3Wn
	Hrv4p5ufGUvsGT2d+wLzOa/GYJF6PEeZOxnuN7oolW2sGGfkBwGrtEUV6VJF5bs+jtjRtVelcIuNL
	baueX5lG2tx+sCYDB0YAZ5bvbJuwcZsRlFg5YPxoXcHLuMskR1FFeFxjcJz0gY5pWt6+vMjvtEGTx
	H8jVEd/WT+Tq2DNfP23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUAr-00CJ9j-B8; Mon, 15 Aug 2022 07:06:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUAn-00CJ7Y-Lo
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 07:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660547165; x=1692083165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+yZ4UPq/zqDB4Wm0RcAQSkIUWHbSPObmZ7PxH6SsOCc=;
  b=bGKu8FAVgXLGtxzvtR/9TfubEpavjy/rZCSIkZ8ewsqyV6aOTVJpJEm6
   bMZes+yKB0Az+gh6V4sbeneivpQIZnd7US0glQAPJEdQfIfNl2bK+gfnc
   4hoYaMdHkUCka8W2dbO4KI2q7NpDitvvUczk1I3fAszu3MBvNaP6VQYoC
   l/4Xaiy/uHIgkUQLlaoXVP0q8y/uxu2X17XoLHNmFX0XCYH8EpkEdfCxm
   Accp4W0de9FR26pSMDkG4IuPDp4vKVJ37WJ52GiIpotmPmSXuV6J9hPzu
   2NXxFmD5wLbULExus39yVNuE4vsBrZxjdCeQiUSTFOKOX+b7FI7tYdUFB
   A==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
   d="scan'208";a="169265688"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 00:06:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 00:06:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 00:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy1y364jo+V75qVxFU7+7/izcUNwEh297lkq9BRrWHZVvcozQtFsNx41EiIfmssNjRvoaFeeADZhZj2F1JFsnWdwsaQUgD4jw8+PmUWxwpPjQ9U99st+Z7Pq88cblkWnZLQH+zklvPfo+3Mpi+Cj3YHqGvAlHbPrBnFHgA1bSIuIYLVESYsWVMZhNuT+q3op5R6vaazZqPqMlVfv/bTpq3BOvKgC7DzksMCP3CpE4pu7Pa4bp1Omhucs0oK1GWerC+CA4sWf6jIr+0IRQj/zZgjMcleCsL+s+M1jlQe1ZBzACbQDS8mBW3zjWHlJeW45+1+zoD51JFnJirdToeDoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yZ4UPq/zqDB4Wm0RcAQSkIUWHbSPObmZ7PxH6SsOCc=;
 b=H3JreFcD1oyZGTi7P4mdZ+ttFHZ/T7DxCZe5dy7FwFEAc+RFr3GYiyogENCZgn/pnbcFy2Vp8AjymWmuh/vrHtLhhcRBz6d/LsuOsOYSthHZvZA1hP8bXCtafZqtkDAfE31PIy6QZTwo+NpeFYikkGzSNQdj0kxMZmMRohrannnwvrFGvKbkQ0kKpZXGdY2u2hGuqljfPSxid/mxOEM4jnGdGp0wyvvP7EPm57h+K+NvM9SN0E+3fy4hDs1b2MePY7c6b6LosRMB/UlZ86DyNeWj0JXMmqFoX7VQoXq6lTUaSrXYj3tyQx7z7wdbcrnrkb8RkVxa+5FCUwJC3pbZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yZ4UPq/zqDB4Wm0RcAQSkIUWHbSPObmZ7PxH6SsOCc=;
 b=Lk7h1vCkidvrpNQO6tJsuoRj5KwAWkxdtda9QgF9B7lnbb5X+HOv5IL43Lv2UolMWHfg85tKWvBJzogu/ptCmiqMPDepD3Rkh+dv4i48FGv1BFT1eWvyJ3W0sD0MfM3bZYkucGqALl0aPBKGjZEI6Rg3lASSURgEL9GYslbhyCE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB0043.namprd11.prod.outlook.com (2603:10b6:4:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 07:05:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 07:05:55 +0000
From: <Conor.Dooley@microchip.com>
To: <samuel@sholland.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
Thread-Topic: [PATCH 00/12] riscv: Allwinner D1 platform support
Thread-Index: AQHYsGUX6yPEPkvFO0eCq9swdC/Ww62vig+A
Date: Mon, 15 Aug 2022 07:05:55 +0000
Message-ID: <50dc816c-3129-f5aa-9777-99c6f0fa58f1@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
In-Reply-To: <20220815050815.22340-1-samuel@sholland.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf15097e-f176-46b8-d9ac-08da7e8c98ed
x-ms-traffictypediagnostic: DM5PR11MB0043:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AXQCLLtSOzgznupV9qjtH19lG86aoQ66MCugq4hNAtCuCCaE7B61UjiB8UEBMlUcPXKrUIpF07scfYEVfFoe7d7RPHkuWZS6B3/63B9WFOcDjpGZ+bgH9y37NrkDLKHRfKSCZ5liiiJcO4RbokYquWyIH8qul1pNLSk600WK7UiBLB8vfFUuDsYyzeEeM8rTbDn6uL6zEyTiITOhF//bUbvdQy4WX89uXR0vBqQP3zojGI09kU6aHAlYhL2V9hw77avTPnSbeSrVFkB7res0gfdA6EWQhek9EN3EFoSGyNRsMQx9fRFqzOM6+05EyTXZSQbf7SX5x2ZFvdl8qlbpBI6t8K0Kr+JKRu6w+2DbX0YTTw/LKhskeCLaIqOtd89IGLS4CIvnl4Afv8MZf46jCV2QFIEzRW04SPjGLU8xUOh653W/PPN07LLAUvOUCK77Ii7O9M1WF8F2TmgGQ0mzyaKTdJ9HhhsjlsQv7wMKJPJpVjFpLx2OpHG5DKpZIqYyI/zscsJKprkgzrbm4ydd6RICzJyXdiWHAWKz8QsYTe3Xvk/+RtZdLWwMKbiA7jmwj+W1R6DK80kLGV2wT+9skSTEwWDKV8UDBuHF+e3NGlHqqxK/d3Ba0tgIvAEM2wn0wwbOMdGVcvSKovBD/V4YXai2yShFnGczpchXGnHPSSwserF6pmiy5JGUg0sz12UXns1VJyHcESoI9dYW3p1M2VtBjyiDL+1tF3K41GQvkPQXatip4xB14ac7SjhBhozXQT80JeDlmG5t0WQMk0SiOg4h7XGJzx9LhQvo8mSYWdyCVVgtaTOESQsMbM1sKQGXCHRP53PEsR20o7VXs/axSzBRfNHhaXBxqajMHp4DIguydXxCJGtLGR6QgWA0hQaSIHmz0oK4aESugjdABclmgeAeywHuXiRSvOVAuxz1fhLfdUNBZcbzQk9IfbkG/LAR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(346002)(376002)(366004)(36756003)(83380400001)(38070700005)(86362001)(31696002)(122000001)(38100700002)(66446008)(66556008)(76116006)(54906003)(66946007)(4326008)(91956017)(8676002)(66476007)(64756008)(110136005)(7416002)(8936002)(2906002)(316002)(5660300002)(53546011)(6506007)(6512007)(26005)(2616005)(186003)(71200400001)(41300700001)(966005)(478600001)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y05SVFdTMG00Sm5vdW95ZUhkZExrekJ2SHBrMlNWdTJUQTZMMnloUDZKU280?=
 =?utf-8?B?cy9WZlRFUzd2aTRyTG9VbFRXYnZNcDZmS0xmRDUvMExXbHdxVHJjOVBNbURD?=
 =?utf-8?B?aHFXVG1Eb1JNYjdLUWg0aTZzeG0rcVYrWE5heGVmd0p2SzkwSG9JU1VoNFZ4?=
 =?utf-8?B?SkRBcldNWGJmN3B1ejhpZXRxZW9yRTIzd3NvZlVOV3RERnVxb2k0R0xoSE9X?=
 =?utf-8?B?TDhuUjRtY3pHZ3VjYVhSNlFoc3B1dXBxN2ZiTk9MV1o0aFhQSTNGdTVxSG02?=
 =?utf-8?B?c2IyeExJZDRTM3ArYkJUYmJSbTgzZDhSMnlSOGlNci9NVEh3YlNhNGJIZmQ3?=
 =?utf-8?B?dDBVR1p0ajRnRzFIbEFsVmszVG1mZHpmdXlLL1FOTlZmcWV4UEhMV29lOEUz?=
 =?utf-8?B?VXBQWVNGdGF0VVZSbTl6SnB1bW5XSjJhcnBhVE1YNkIzaTMzRDNRVzhnQkUz?=
 =?utf-8?B?N0NvRnFsWW5ZMHJ3VUMveHpHUDNUdDF6NXpMWFZ6SklnYmZDZ1ZMcDc5SWRx?=
 =?utf-8?B?a0F6cXh4UFdvQ1gyTWIwQ2R4bUJIa2tMdzRRbzhRSExGSzA5ZVZqak5waHJO?=
 =?utf-8?B?cCtvTHlzNXhmZjJPT0JhK3lPcWFTcjBEZWNxa0o2Rm9RanpxMU94NUtYSlg0?=
 =?utf-8?B?VFNwbjBJS3ZFUkdvZnZ4VGNYMm9hZVFxSTRiQlZROStWM2VXMCtadkt6aW9C?=
 =?utf-8?B?cEpBWVkxb0pIWFU2RkROOWlXU2FVc3g5WWU2bXpVUUtxcmhxZzk2a2hyZWZX?=
 =?utf-8?B?ZTBxaXRIMmgxVGhzamFDT2tmTHlabDJUOFZKV3hUQjIrdnZ1ZUxsM0Q0Yity?=
 =?utf-8?B?ZU1vc2dURjZTYXUrK3JtaHAzL2tvdVNIUGk3bmJjckJQcm9oNTBHS1JlS3dW?=
 =?utf-8?B?RmMya0ROWHdlbUJYSXdFY0Y0U09nc1R6OFhmQmN2Q3pvTGtxL2ZHTEZzZ2hX?=
 =?utf-8?B?MlE5ZmNRazBvMDNpcFJoTlBZSk9IQjJsS0IrQjlJWE0rV1RlWkhKRzhVUlVC?=
 =?utf-8?B?UGtRT0dxYzZtc1IvM09iMHRwcnNMOWNLWlJuOVhkd1dGS1RZL3h1UUgzaUJh?=
 =?utf-8?B?YzdRVG11dElPaUsxNnZIdGVDR0hSUjA0amJubmh2Z3BsZndxNy9xZFdndlpy?=
 =?utf-8?B?Tm9LaGpIbDYzSkJOS3YwY2JJM0I0YUNFd0h2eXF5eWpiNEN3aFNtUHlrQTE2?=
 =?utf-8?B?MEVNWFNJMW5MMWp3K1FiSkJnQ25XSGNlaHI3S3VuK0x0WldPZi9JWVYzWGIv?=
 =?utf-8?B?K1U0RTd3cXlRekpBRU1Ka2FjUWx0ZFNVdGgyT0lta2FjVUQ2c0tQRGtvSjl4?=
 =?utf-8?B?R3dEZlpmVkE3SUgrQ01UaTByUmlGTUhGcURkckd4L1hOMGhwNFR1QVhhVWdD?=
 =?utf-8?B?NFBtc1VYY2dMRmJGSzBjOVJCcXpxeXIvZ1NrbjFycVlpM2lQM043M0M5NlJW?=
 =?utf-8?B?aGFOVzhTSU1pVDBPSjMyNEVncDM1UXQzdHBPREhRNzFmU0RYaFNMay9rQVRz?=
 =?utf-8?B?bjFKSTZ2ZVFKVHZFTWFvYS90anBZemNKNWNrbm1QSkRJbXZUbVYrYXVUVWlP?=
 =?utf-8?B?amE4cndaSTFINjdQSy91VUZJUnVscHdBbXU1ZVRIdmJsMjR1bDNyTXVlOEYy?=
 =?utf-8?B?WVBVMzVKbURBb1VSUTJYZXAzcWtCNXdZWkt4TWxCOFg5QWNBdlJxeERMaGRi?=
 =?utf-8?B?ZWM0ZCtpSmZVRFMrQ0NSQkh6dUNlUzkvTGc3b01LZ0FKZ0xGQzFmRVNYa21O?=
 =?utf-8?B?QWk4SXVES01MUklzY0w3aW5hQW5JWE83cXEzZDIvczdORGlUNnpnQXJkNkpC?=
 =?utf-8?B?Y0QxaVZPUW5PRHRoL3J2Wm8wVjFKZUNCaktiTExBWG00dVJjQ0I4dGZwZktJ?=
 =?utf-8?B?eGdQUWlxL1ZLb3pySng3Mk0ycGdqNkdXbkFKbVVINVBVWTkyZ2xZbkMxVkxv?=
 =?utf-8?B?dEMyV1dXTHN5L2I0dUN6bWhUQi80RGdISVgwWC9pSU9TaUdlUlNjd1l1a1ZG?=
 =?utf-8?B?Ymhxekd5OGtNREJYU2Rvc0dOUlVOc2xiVUVBR2RteFBkNkJJWVBJZEkyc3NC?=
 =?utf-8?B?QVVwck9JNWRLc1JTSHUxQ0NxM0pNby9ROGlpdGdlVEV1clIvL2JLZnBibzl5?=
 =?utf-8?Q?mk9Ige2yHmaP6Czeb33SgECKg?=
Content-ID: <1FE1BD6EFC08684C8611E47016EDCD54@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf15097e-f176-46b8-d9ac-08da7e8c98ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 07:05:55.1967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMRTuaJ+OyGN+oBjm4qw3d6o9zikTKAspo+RQb6pMzEJ20tLiRAVsOaYX5y1doO6bXSfh5WZaAxtKKTWXBoATYariS/UdEvtIxoxNcuFCFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_000605_899608_55ED0522 
X-CRM114-Status: GOOD (  22.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Samuel,
Apologies for the last email, the first 5 patches in this series
didn't correctly land in my inbox and I skimmed & replied to the
wrong cover letter... I blame it being pre 8 AM ;)

On 15/08/2022 06:08, Samuel Holland wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1-based boards. Many features are already enabled,
> including USB, Ethernet, and WiFi.
> 
> The SoC devicetree uses bindings from the following series which have
> not yet been merged:
> - SRAM controller:
>    https://lore.kernel.org/lkml/20220815041248.53268-1-samuel@sholland.org/
> - NVMEM cell bits property change:
>    https://lore.kernel.org/lkml/20220814173656.11856-1-samuel@sholland.org/
> - In-package LDO regulators:
>    https://lore.kernel.org/lkml/20220815043436.20170-1-samuel@sholland.org/
> 
> All three of these are required to set the correct I/O domain voltages
> in the pin controller, which I would consider important to have in the
> initial version of the devicetree.
> 
> The SoC devicetree does contain one small hack to avoid a dependency on
> the audio codec binding, since that is not ready yet: the codec node
> uses a bare "simple-mfd", "syscon" compatible.


I tried this series on top of both 6.0-rc1 & next, but I saw a shed
load of errors from dtbs_check. I'll take a look at the rest of the
series later on, but just FYI. This time I did at least read the
right cover letter and actually applied your dependent series..
/facepalm

I have been trying to get riscv down to 0 warnings and would not be
in favour of accepting patches that go in the other direction.
(This patchset currently produces about 47 new warnings)

Thanks,
Conor.
> 
> 
> Samuel Holland (12):
>    MAINTAINERS: Match the sun20i family of Allwinner SoCs
>    dt-bindings: riscv: Add T-HEAD C906 and C910 compatibles
>    dt-bindings: vendor-prefixes: Add Allwinner D1 board vendors
>    dt-bindings: riscv: Add Allwinner D1 board compatibles
>    riscv: Add the Allwinner SoC family Kconfig option
>    riscv: dts: allwinner: Add the D1 SoC base devicetree
>    riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
>    riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
>    riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
>    riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
>    riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
>    riscv: defconfig: Enable the Allwinner D1 platform and drivers
> 
>   .../devicetree/bindings/riscv/cpus.yaml       |   2 +
>   .../devicetree/bindings/riscv/sunxi.yaml      |  64 ++
>   .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
>   MAINTAINERS                                   |   2 +-
>   arch/riscv/Kconfig.socs                       |   9 +
>   arch/riscv/boot/dts/Makefile                  |   1 +
>   arch/riscv/boot/dts/allwinner/Makefile        |  10 +
>   .../allwinner/sun20i-d1-clockworkpi-v3.14.dts | 242 +++++
>   .../sun20i-d1-common-regulators.dtsi          |  51 +
>   .../dts/allwinner/sun20i-d1-devterm-v3.14.dts |  37 +
>   .../sun20i-d1-dongshan-nezha-stu.dts          | 114 +++
>   .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +
>   .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 +
>   .../sun20i-d1-lichee-rv-86-panel.dtsi         |  92 ++
>   .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  74 ++
>   .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  84 ++
>   .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 128 +++
>   .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 171 ++++
>   arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  | 900 ++++++++++++++++++
>   arch/riscv/configs/defconfig                  |  23 +-
>   20 files changed, 2045 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
>   create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
>   create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> 
> --
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
