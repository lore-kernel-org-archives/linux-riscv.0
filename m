Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0416EC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkYQ3TxGGBp/RwwLx71z+0ciRcNPBm+cQ8jyhy7jb5Y=; b=idjtrONVhsIZPq
	CF1NnG6aMG6n2hf4rHIf08uH03muvzNFiY003OpmPx6ezhuxLBYoSWFooZUmzvdlO7OnOEKdkGcdZ
	ZT1LEOQy/9ROpWn+ClmU0Hz/HD6tYPlr91/BbAkEj5pXmwnNmJDffEvwFZSVI6wCWZUXRDwD3wXrq
	TwKbXbEEbr9nKjkzZ8Y7JEdqc5rzGj4Kv6Q+vsmtR+cB55t0CcZa5EXF9MdZWjRBgbE+mvqZmMZ4q
	C3P3ZKcnLYPIDJaJsAXJrmqI38JAYMQBfj2Twwbm32EN66iRqQ4Aq+NiUV4kGY7gkR2SgSdOaNy/f
	Gtv9cgYr9C+EEeh4odSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMu2M-008n7s-8U; Tue, 31 Jan 2023 17:03:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMu2I-008n5r-PW
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 17:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675184590; x=1706720590;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=ZeknbBRE1uqcV/o/NXaXBgJXoK1/NLCGPzOcu79HunE=;
  b=kGnxIRWx79bTD9XJusdE4HHIZ6LsZdXuPaU9/c4vjFWppqZ5zilE74wL
   LPhK6Fkbb+oGqBeH7oSZ1+cZuF2ZLdtbXSs1rJ10CWDeyUlK1vqYo3pmu
   67ZTbkmhAvej8h38Nw0B6UfYEAPeIWKCsh/EE3tuS08GOxvBNhc5XUd4y
   2Nf4FuaUJBd3oFkRKODFyonKIAF4pMIXmd8xXZoA9GJhrvrAE5GnaUA7r
   hJvjQ6AWgpY7M7fve8Lf3v27foZ4vjHu24d7rELjKDagL8VUNExLVIebx
   D0TUiBWjdF+FdIi5mPpADBek4XImsN0XfG6QxXTSMQecDje00IAu5V+KA
   A==;
X-IronPort-AV: E=Sophos;i="5.97,261,1669100400"; 
   d="scan'208";a="198767962"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2023 10:03:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 10:03:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 10:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuDiQc9oKGI2jZHcBPl4j3GZdgDnReWasV+DCq2elTInf1EKy/hm2BhEnUa9P18qpKRFq12bmYAPhotKbPe+lHAFgEAyBdHCfqdszRBsLw8zxVUORoc3oyC/tl6jhxA1hTC/8UjuMe71Ll//j54nXjkVux+CwFUexw6eW8a2ZyfOZJNaMgGU+y+s3Mf1CQKG7xDbdPOJuekjPeKzrcSR2zTfV6cu0El+2UiXxzefu6V8/GS4YVnX4sAo7NkmXCZI0H8yoEH53w4/W/FdrZ6mzpOFbTlH0p85s5dB/PFwCD82yjAgvGa7Ap/bbOBlO2OC0+0SOwtJh7+n96yue3CwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeknbBRE1uqcV/o/NXaXBgJXoK1/NLCGPzOcu79HunE=;
 b=kb0lkvo+RqrZpGLzoJbkVBuYeLgxesBxJ/u8eIlKEHPiJE7ZLLq8x0UzjIHq6pnVIgEpGTXZHW/+WHN5zI4ejDRXpSkLpFJutWoQ1ASdzq9bsxmkjMYgigAedpT8ImRORQE2NOxML3O/cutjJozndGVrZOrxJNQG2iwklTdSGoIBNotofSGG75BNXeuL8nU4hPlZpq+OsCEjHPnecjjP/oScPB9pkJFyrd1X4Rig/WYoxRRJr9VwDIj9KQUQ+AN4hp9uC7kDc191XdmOSTptEgee7UgQA2EhDZh9+MLol9N1E8b8uB/LA22iO67WfXpoXOSsF+EY6zdr3gkrlqAXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeknbBRE1uqcV/o/NXaXBgJXoK1/NLCGPzOcu79HunE=;
 b=vuSt04GxY8F/pMhrRC3kANhw6nmXtUcXbi/2a54yxNpibK7ulsrOsF0s8eeCu9FOo2L5Ambe+9v/PVynXkif5n4rJ94b6U3R9vkQoDUQnN8V/RGLOC5pbETxr18L5Wn/F9RxKHw4kt79x2G60Pv6iXUIoOs74uylY9nDfcj6RpA=
Received: from DM6PR11MB3258.namprd11.prod.outlook.com (2603:10b6:5:e::27) by
 PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Tue, 31 Jan 2023 17:03:01 +0000
Received: from DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::9605:fd18:6756:575a]) by DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::9605:fd18:6756:575a%7]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 17:03:00 +0000
From: <Daire.McNamara@microchip.com>
To: <linux-riscv@lists.infradead.org>, <kw@linux.com>,
	<Conor.Dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lpieralisi@kernel.org>, <linux-pci@vger.kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <bhelgaas@google.com>
Subject: Re: [PATCH v3 00/11] PCI: microchip: Partition address translations
Thread-Topic: [PATCH v3 00/11] PCI: microchip: Partition address translations
Thread-Index: AQHZJbu1aZB9JEnRQE6u0tpWWxK2YK644EaA
Date: Tue, 31 Jan 2023 17:03:00 +0000
Message-ID: <d5a5ba3b01953c9db435f2371adee6e2b61d26dd.camel@microchip.com>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
In-Reply-To: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3258:EE_|PH0PR11MB4792:EE_
x-ms-office365-filtering-correlation-id: 64aae0df-0278-4d2f-28ed-08db03ad025e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YcSa8EUnENvFQqcP1ZRI3RHu1s9aAm4O0tJC2ndlvcKPqMo95wqThYTTm3R5uJcvjRra1dPXiwI2MQ0qvV+Zv6q7u55suMd9hyL04x+sCuSp5R45WkHBFLruVsJPWBk8/8w/mO9vRMpL3B3RohruwojSKbsDKZ16GZM9i7NK+8azLis56nS7smtp2MQfjD4wTThUxWmK55ANy6YBKvL26qWU9d0gesjJtniJNlsDqlY5K+nqk4yYMkTzqql78qSTFdcEzWgB7E25eLxy1OhtGbTm0ScjsFaiYbjCJhQ4JfjIHRo4YuyYIixl2TXGkky5w70LdvrJC+751OIDANOhutT7qATLQeDRUiq4GAqaWcNEHMEIgsoowb4O9DqAdZ17VZwmOqOisHwq9g/A6ZkbQ9KcXF5CMOq1wSwHSvhrzIMzRt0VFVjkEX+/b7XzDg35Pt0DpIWWoaSfGvp5RGQrVpV/mbr3Yt5MYttHLz0xGlSpgN9hvtumSfBaWr/0+Eb5FlZjmrQ7pxXijS+nDGIS13ZQxzFZrYIrksuKI1+O6Ipqv7xVQX/uJ/SRa+6DWHhDWMO9r05656qk71czQjX82Ij8A8MsqIAhl0QXMd596IC2iPYNK/0O/1CaXCi2Ue6zf4zk2CCQtIdt2HqyHVqu3nG58YcSDLtMmWl4eJsUPsNmkjgIjAR1IHVYWKHXU2cOZz6Nv85WX6pYSxrwRLA3ZlsXLoLIaUNVBF9NiOe9aHuYyeGadT9PmCp0NUbCu3PM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3258.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(110136005)(5660300002)(316002)(6506007)(7416002)(71200400001)(86362001)(38070700005)(921005)(41300700001)(66946007)(186003)(8676002)(26005)(6512007)(8936002)(478600001)(6486002)(966005)(64756008)(66446008)(66556008)(76116006)(66476007)(91956017)(2906002)(83380400001)(2616005)(122000001)(36756003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEIyWmtKUTM3ejdHcDVEU1AvSFNWZVoxbUN4b1hHZnJIUUtmb0ZaSXRZeWZM?=
 =?utf-8?B?bmI4UFg2T3VSVnU1QXY4Qlp0OGdhTGFTWFdvbW12cXZBYnovSzMzNGJ5cTBZ?=
 =?utf-8?B?bXNZT1ZrTEUrZ2lwY2Z1aXgrNXFJZDVyeDY2OWkxczV6VFJZdjlrR3F2ZkFH?=
 =?utf-8?B?amRad0o5RlNjRHFjdWx4ZGMraCtMbHYyeFUzZVJKZzZQQlBsZVhsYWx2Vi9U?=
 =?utf-8?B?SlRJcGNtbm40c1RrbGk3dkM5NGxyYlZjakZ1ZVpnUFR5NTZMRWttUk41cnhD?=
 =?utf-8?B?TmlOSy85K2dYV2tLNTFTTFp1VEY5aDJveW1sRUJJQkpLbW5zMHliM09ieVVK?=
 =?utf-8?B?eTVpYUtrRXovMnVsL1I4N3AySHVyU1gxTzJyQnFRUDY2ZDNteStDRXZ6Mmk1?=
 =?utf-8?B?RnA0SWZJUXJ2UVBlN1E1cUcyOVMrNGZhaGFkaDVoQmhBMUlLRVRWbkViRVBZ?=
 =?utf-8?B?WTFYL3NtbW1QWnhQcHlzSDNOeXI0WUd0aXFubGR5UDYycEh3U0pyUTBibHdr?=
 =?utf-8?B?TkkvNWZwTHVDVWVla1hjVzBaWjJ0eGo0VmdlQTY0cFcxcC8vVDYyS1N0Zm82?=
 =?utf-8?B?aHRUaFpYTWpsNkZqT1hnYjJsNHBoeHFuNEwzdFNrUGMxbTc2WStiSUpqVkxP?=
 =?utf-8?B?TngrMmU4cEkzTEpXMEJweU5oVzFWZzY4S3d2V2draEJxdXRIWmFMUmxYbFFa?=
 =?utf-8?B?TVJoaVRNQzNzZlpQUzRycllHaGxwYXlhbzEvaStCQktvRllzRXpqaDZiZ2sw?=
 =?utf-8?B?ZXk4cVNVWVQ4QlA0WHRkZDFGb1FCWkhOWWprbnhlaDRNY040K1NJSkZwbE0v?=
 =?utf-8?B?RlZxblFuaEJpalArU3hPbElKdU9GNDZGa3dnZ1JUaUUrZUlvNGIxMTVwRGhy?=
 =?utf-8?B?b090eW0xT1FwM3ZhcjFDYW1OU0ltQnVLcFBMVVhxbjB0eVJKbmsyTng0eThX?=
 =?utf-8?B?eFQxYXE0UnB3NjhGVWV0NWJMbU42MDVOQ3pEbXN2QU1nYkRheFBuR2NOK0tr?=
 =?utf-8?B?QXU0Yk9SRk5taVpmTUFhYWN2RWYwYW84V1dZdVkwWWMvN25UNU9JeWs2YmxM?=
 =?utf-8?B?N3JuaEZScnJPaU1aWjBHUE0rTkZ5YzZURE5CcFpZakx5dXFIVGtndDZPUU84?=
 =?utf-8?B?RTVYb0R5d2E5cmQrcGU2RCt0SWlGRWZSeUhTWktYWlNOMlYvRmduNGNnWHBq?=
 =?utf-8?B?RFJLc2VaZ3lhNjVXaVBXMFl4RFVTelJCSlhObzY4SEJBcHN4ekZhMzhOZHFt?=
 =?utf-8?B?WnMydE9TNG54ektnZFh6QlFNRkZUaEFvMFNoTnowb09JOW1YMm9ZWUR4Y2tz?=
 =?utf-8?B?a1BCWFVwc1R0SlZDeC9FTUlZaDFURjFUUHdlR0pPOFhMYzlScjlZNDI1L0NS?=
 =?utf-8?B?UVJUcFJYdWdpUE04WVp2dkR4em5VTHJuS2VHK09pTUdTV1JqeFR2bzBQVDI1?=
 =?utf-8?B?eVZWWFdzY1VuMnovb3EzcjFTb3dyYWlyRkY2QzdoWnpqTW9PdDVkNk1rN2JQ?=
 =?utf-8?B?eGFEV0RNMzJtZlU5VWt1TXI1d1VQdlZxak1OWW9kM0V0aFMydXBkUnpsR2dM?=
 =?utf-8?B?L3VsaExRRi9WVnNicTYxOFNLcFppT09tbmY1TWFxNkNiKzBHdXk1QzkwU2hK?=
 =?utf-8?B?NzVzQ09sYmJtT3JEZGdmamNEY3BaMytLdmhoWHM5UFZCc0pJekdWSTVJV3Zt?=
 =?utf-8?B?WmZ0ZFhXUFZvQ0hiQ21sWmw4ODRxbElGZU5vbzRSZ1h0a3BGNHV5RUx3NWNK?=
 =?utf-8?B?R3c0WFZ5OSszWFVLQm1CczhiODZyWnZwdnlpYk53Ni9YdzQ1ZUI0WXVOejBq?=
 =?utf-8?B?L1RzbGNiVjl2dXczZFlwMXBUS21KZ0twYnBHTHNIcjkrSlF2Z1RRbFNCcGhx?=
 =?utf-8?B?ZE40VnZQS0hWVWUzbFhQVWRoZk4zeThkZUdDZUNwdjBwRmwyby82TXpGd0ZK?=
 =?utf-8?B?dzJ2REJhVWowTVd1WnlrRCsyUmtCRzZVMGs0M1JtZWZRbkJkalpCbTFuL2No?=
 =?utf-8?B?OXdCalhiU1hHWmNQQ3JZei9BcVlnMWJhY01zQSt3ZWZNOW84WnhRNGx2alVO?=
 =?utf-8?B?RzZNczhoaHZ4cjBqUGhFOExUdkt2Nk9CMUlvbDFtVCtoRTFsZERVem5CSW02?=
 =?utf-8?B?bUNBb2VTdXRxVnpuaE5wK2FLSkR6YVlIMTFWMWZJTmR6bDJHWmlqVG5WZDFn?=
 =?utf-8?Q?5OW0aEIDWifO3Yt9LZDBVmM=3D?=
Content-ID: <1F8D0737C2A1884EB0CE72889C1713EC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aae0df-0278-4d2f-28ed-08db03ad025e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 17:03:00.6383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RCh0BeSy2k1OeUwdc2gFKrxV7Zi0U/pftmtqIiEN4vUSZ+q3wZff6d6/WSBZ5xrdKkfuW53oSZoOWnQVaL893kiILujH4xaeI3zDupGtnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_090311_128997_2027BD45 
X-CRM114-Status: GOOD (  30.56  )
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

Hi all,

Just touching base here.  Can I take it that things are in-hand, and
this patchset is moving into the kernel or is there something I need to
do at my end?

best regards
daire

On Wed, 2023-01-11 at 12:53 +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Changes since v2:
> - Replaced GENMASK(63,0) with GENMASK_ULL(63,0) to remove warning
> - Added patch to avoid warning on cast of argument to
> devm_add_action_or_reset()
> - Added patch to enable building driver as a module
> 
> Changes since v1:
> - Removed unused variables causing compile warnings
> - Removed incorrect Signed-off-by: tags
> - Capitalised msi and msi-x
> - Capitalised FIC and respelled busses to buses
> - Capitalised all comments
> - Renamed fabric inter connect to Fabric Interface Controller as per
> PolarFire SoC TRM
> 
> Microchip PolarFire SoC is a 64-bit device and has DDR starting at
> 0x80000000 and 0x1000000000. Its PCIe rootport is connected to the
> CPU
> Coreplex via an FPGA fabric. The AXI connections between the Coreplex
> and
> the fabric are 64-bit and the AXI connections between the fabric and
> the
> rootport are 32-bit.  For the CPU CorePlex to act as an AXI-Master to
> the
> PCIe devices and for the PCIe devices to act as bus masters to DDR at
> these
> base addresses, the fabric can be customised to add/remove offsets
> for bits
> 38-32 in each direction. These offsets, if present, vary with each
> customer's design.
> 
> To support this variety, the rootport driver must know how much
> address
> translation (both inbound and outbound) is performed by a particular
> customer design and how much address translation must be provided by
> the
> rootport.
> 
> This patchset contains a parent/child dma-ranges scheme suggested by
> Rob
> Herring. It creates an FPGA PCIe parent bus which wraps the PCIe
> rootport
> and implements a parsing scheme where the root port identifies what
> address
> translations are performed by the FPGA fabric parent bus, and what
> address translations must be done by the rootport itself.
> 
> See 
> https://lore.kernel.org/linux-pci/20220902142202.2437658-1-daire.mcnamara@microchip.com/
> for the relevant previous patch submission discussion.
> 
> It also re-partitions the probe() and init() functions as suggested
> by
> Bjorn Helgaas to make them more maintainable as the init() function
> had
> become too large.
> 
> It also contains some minor fixes and clean-ups that are pre-
> requisites:
> - to align register, offset, and mask names with the hardware
> documentation
>   and to have the register definitions appear in the same order as in
> the
>   hardware documentation;
> - to harvest the MSI information from the hardware configuration
> register
>   as these depend on the FPGA fabric design and can vary with
> different
>   customer designs;
> - to clean up interrupt initialisation to make it more maintainable;
> - to fix SEC and DED interrupt handling.
> 
> I expect Conor will take the dts patch via the soc tree once the PCIe
> parts
> of the series are accepted.
> 
> Conor Dooley (1):
>   riscv: dts: microchip: add parent ranges and dma-ranges for IKRD
>     v2022.09
> 
> Daire McNamara (10):
>   PCI: microchip: Correct the DED and SEC interrupt bit offsets
>   PCI: microchip: Remove cast warning for devm_add_action_or_reset()
> arg
>   PCI: microchip: enable building this driver as a module
>   PCI: microchip: Align register, offset, and mask names with hw docs
>   PCI: microchip: Enable event handlers to access bridge and ctrl
> ptrs
>   PCI: microchip: Clean up initialisation of interrupts
>   PCI: microchip: Gather MSI information from hardware config
> registers
>   PCI: microchip: Re-partition code between probe() and init()
>   PCI: microchip: Partition outbound address translation
>   PCI: microchip: Partition inbound address translation
> 
>  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  62 +-
>  drivers/pci/controller/Kconfig                |   2 +-
>  drivers/pci/controller/pcie-microchip-host.c  | 688 +++++++++++++---
> --
>  3 files changed, 533 insertions(+), 219 deletions(-)
> 
> 
> base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
