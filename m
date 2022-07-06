Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF620C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7FZUXhHIgYr51sL6QIRFpBtFQQGJNxz2oqVZDO7vns=; b=NxDbQ+EEhM3jWw
	whOA/iAF7xTzW+0C+EZ9/DfB+gjkqYD8U0QhTKDtwJtNTh2bzKgocqOIoJB5/BHXp69krPqekbmRx
	VIIPy6MhpvCI20moXZzF05SJ2lDI2Cff/4HsgYmsW4r8QJKctloChobB69zXtM1Y7jdB6/OEVELLt
	dJKQzJzV35GE8JVALBL5ufrbHWDxjosGGWB4mIvCD4bvVuGiL5fBFF7d72XKl2w7j7koPIW9CPQb6
	GTxA5kB8fm+NOgXtjc6lc6vNRvq6T6bCtNpz0TKWkdO4WfAKr+Q4mD3IOfOTKul1a4HQr5TghrRpG
	qF87gPfFHj5MncJ+V45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zf6-0079Q3-9N; Wed, 06 Jul 2022 07:41:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zf2-0079P2-QH
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657093285; x=1688629285;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=ZgGEmvY8jRy3dusaT7tjhRAnhXccb6wXFqxo0E+dvfQ=;
  b=2mTkE3LG83USZNGwBk9fgn10UhYRLzlTGWEuLEKql2owFr6Bnh9m5C30
   RpNsGRhoWl2rS/Qt91H7ZdGIwNZlvzz1j3YLk8+UUhiTw24RpLZjHOgPl
   CBQH4k8S7tgFhk7PnkG8woLH/ltYI1+m3iI/FNFSiSb0wxwkKmK8sFHOp
   7ltTa4wwtn/ayAO+Mx7xu4IgyI9xEBMX8yHTSWbgd4mWQMHMKuGaPXXKT
   sprGNJMNVXWPpG58P/JUmPCmut1gNK69622r27ZaiP9J42OasOtLwF5EY
   nwA3yxe9GFmSQh2Eifc5xiOXwZyIvlvj/N2ErCa4N1fn5aX4MYIU30PP2
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="170962024"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 00:41:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 00:41:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 00:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Byl9k1QXjIiSw8Hy9eVQgRYbx8Py4wP1hlkvW58Cz3wn6jyAb+lvIg4MMYagLy6/3J0ofb0CDGnKuVrcsz4XO1vLbfiD/hvqrh/CNysIClrTVq4bozFXkasscnVDCNEC3c9sb4i0G494890OvWnaDnCgvQ1j2rqiyStihDvZKMwaBPsZYP1McDjWwfhoeps9glocBWW7KRjp6T6iWxtnreR5jeVGMSCkNvg3iovn1xvIDilq1bRyb8KuS4o6qUhYYjFlDKBYM30DuTipcDSuettwDRxrEbvUFSFwMNFzmp4cJhrfIr+furrl7EbLq5lEF0Ft2LO6X1hQrvylH2Ds0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgGEmvY8jRy3dusaT7tjhRAnhXccb6wXFqxo0E+dvfQ=;
 b=gzvVXQZ7FTeDnvI13CYrAeG1FaqQ5cE43gD60tzvEyc7NwmxoZDzPPosiFb8dIb8Z5+4a9aVi2YCesVF7F9BB16FXNTzuujSG+jvwq7NpQDnbNd7eofThp3NDMe7bHPm9clW2yoxOwoHsARb7k+1ZMr59SOCKVs9O2eAHbxthD21klxP9zY+7rsiPE5NvwYIc12/ewrDDIkGXtlABSKdQsjfxZ9m73DZsuVkytrceCpkF7eXw5c8JjbBiGzxhS5P/cCUpFlhp5qczai78v1frQW9SQfT1sZcOG4GV3TYONeP7NVqwGVl62PlxhtPapoDTmv7fOfFgBH8GqQdDDZjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgGEmvY8jRy3dusaT7tjhRAnhXccb6wXFqxo0E+dvfQ=;
 b=hkbgNzfZCT/4+36EV6adwjK7Pc5p9RhOZRP8v5unVB+1HgUjdJf/f86v3vi8FddmGZIuRE+hCXVjOZcaUrZ3PMgJ2ElICGoALVWsDnaAAZXX9nCDZQyO7AoZnfXtyFYVPnkuPPnmSdE0SM0ML4XoiZzCubsZy0lkFBSyG0NScxI=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by SN6PR11MB2893.namprd11.prod.outlook.com (2603:10b6:805:dc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:41:17 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 07:41:17 +0000
From: <Conor.Dooley@microchip.com>
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
	<ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Thread-Topic: [PATCH v6 2/2] MAINTAINERS: add the polarfire soc's i2c driver
Thread-Index: AQHYhULOa4hoyx+DnE+ut9i52jH8Cq1xB18AgAAFrAA=
Date: Wed, 6 Jul 2022 07:41:17 +0000
Message-ID: <0832f4e2-ae53-568d-91c9-2f76581d8860@microchip.com>
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <20220621074238.957177-2-conor.dooley@microchip.com>
 <YsU33mo+8MwmgPr4@shikoro>
In-Reply-To: <YsU33mo+8MwmgPr4@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c31574ff-f735-468b-a4fc-08da5f22e91d
x-ms-traffictypediagnostic: SN6PR11MB2893:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5ABueldbwnQw8GRIiYeIHl73g2s4+AxK3i1tphd/dilIKV9DCO8MQvLOWBxwLG/8hUNJl/Z0aYpi8ljksVUQ4nPmNalPwlOrYU0Jd4fJd2IjqcPRk43YCI60gYY47gmbA7cI+2n8HG+7tG45koEvGj//SGio0j25nU0fR3hF5xJkWDrLoyViBh6y0dYPtaKRt6k5LD2+KNB/uRe1Ad5MtTAkKxVvZcE9+D2BFGKE6j0LB4Gmk0nYAN5C9wTqz8tQzp40sx7tib0gJOm9ei9wkEkzquflatVBtfSlixTHBQZ/epjioLCyhbulDl7LNMD7lt3QRZVBafOe3rygZxGHlQV1kQ7+v9hImwe9jPDeW/xWHd6vMKSHJPY3SrKDT79iXVXQL6euUlKh05m2qIj66ab5uvL0G6PajRELtTU9nZ4coyi+dzEH6t2kf6RQb4tEBrmZ44hicP0DPX4Mb6dFjvEEDib/+HdZ3VuwoPkYgEb9io8hoiuiY4fIY/39Np7PtxASf1oB22PL7H13i+Rjx2VFhjixXhMQYT5H6ANvEORXZuld5amD2LvCrCymZDdW6czdSelvo7Awp9tJ48R5aRNccjcCoke2j8kSJP9Gt9TWm5GnTi8pYj47fVJcnrMv3Zz8d8Q1JZ3WchIQcO3e4q3IhhNDKw+qni2ciRREIev7sFI5SQeZ+btN2RrKnZbkRdPwalJImnovHnEy3BEzGhiwfAo/USNxVAIkWmO3OSEmvJNtu+XxAR5IaduXPuIclri4FV1G7rt2uufcquJ3M7IVmO4G57rcLMjAzRPW3ZBw4qNmqwMilyPAgU+xew+x1CHgG2oN+f1EvcOPU98bASE5GzaYKaXw6ThGHBQ6fl0/6pUI3jEJW9t6FLqvBlzwo+ORwMHkQlyWNZLJlmB0E/8ei5cj8YDT1pBeEhXX21w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(71200400001)(91956017)(26005)(6506007)(83380400001)(41300700001)(2906002)(38070700005)(110136005)(53546011)(316002)(36756003)(31686004)(6636002)(122000001)(38100700002)(966005)(6486002)(8936002)(31696002)(5660300002)(86362001)(2616005)(66556008)(478600001)(66946007)(6512007)(8676002)(64756008)(66446008)(66476007)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnZlQnNKSGRNcHVzcGlmTUFqMkVsditobmpyWVVkRlVlUDdqcy9zY2REdTFa?=
 =?utf-8?B?Q3R4bkx0a2NSei85Y0NVRk9wanVtcHhxZUpERHdYTlVRbW9IMmhoUThXVTg3?=
 =?utf-8?B?akMyQUJyU0FRWk8wSjg5OWVkREFpUnQxNVF6U2Q0Y0pCYld4OXR3Ymh2dmZO?=
 =?utf-8?B?WVNHUUlQcjFUWG5LYms2Z2NISXhhQkxYakxGNGE1b0pEVk9yUWJFWDJuMjBJ?=
 =?utf-8?B?OUhpalpqakZoZVFNdUZPTEVyKzdTbmFqbHFpUllOVlpkNVNHaFh3anpaSUdO?=
 =?utf-8?B?NEdpUmRMOEcyL0daMWlIdUdaWGp2ZXQySU1QYTQ3TlpxY2JCcHVacmdKUXdB?=
 =?utf-8?B?SkxPdTIrVW1ZNkxQY0V3VldMcGVzcnJFQ2ZNSmtkaHZDVjdnMThxZkdnQzVT?=
 =?utf-8?B?VDU5VVpEQWdPd2dIdENLNk4vdnI2aGM3VmJmdzQzSUR0eC9rYXZBK1kwYy9O?=
 =?utf-8?B?UXRKclpXQTZHdVNwaC80VHBicmJ1WmJGc2NaZ0FrSDlRY3lzRmYrN09kMWZ2?=
 =?utf-8?B?eU1LNGlBdUVuN211b2dqTXliZk5WMXhHdjR6ZXh5THdGYjk2UTgySzJuNjZH?=
 =?utf-8?B?NXlnOHBsRzc2bDVkUXZGdFI5Y3BRam5sNDAzT2pFbHlHOEFrV2ZEK3pFWFNG?=
 =?utf-8?B?d0Yzc3JRMHZXVnB6QWdnR2NMYVFid1E5WVFUWUtQVm9hLzY5MDBhZWZScmdJ?=
 =?utf-8?B?YzR6WDlFaWtyZTlsb1F3RjlGYnJUcnNjTzlNWnhveWFuMXNuSUlQNExMNWkw?=
 =?utf-8?B?QUlYYTg5ZTR1d3NrSGZXVVV4YVNJdjdwZVhnQ0VDTFZNNmNNNUV4YzJCd090?=
 =?utf-8?B?ZERDNFhlMEhnMjJaS2pqMDRZNXVOUmFYVXdyNzN6ank4VzZzNVYyWVRMWWVw?=
 =?utf-8?B?QmNkamE5dksxVTVBMFBuMkhPanJFdVZkV2ZvbHNaTjcxbW9OV3gxaXB0aklD?=
 =?utf-8?B?OVAvZWl4RlRlazQ1djlmbVlpY2orZHo5Y0hiSUpZU2pMTEU3MzRucGk1MVpl?=
 =?utf-8?B?aVV1N2p0UVpNaG01aU9xNHZHK1hCQllFbGZzUUVicnBlYnJGdmNFQk1QbndC?=
 =?utf-8?B?SFErLzkwYVRFSU5zM08zdXF4Smh2aDM0Rk9OVjNHU1M3ZVFzaDhuY2ZYdEx0?=
 =?utf-8?B?eCtBMlBEZzIxdUdsSTVMc3VGVmRiMlJaZURQLzduV1Z5UUliTzBad3QzblQy?=
 =?utf-8?B?Zy9oSk1Gcy81T2xGdWd3VjRqWkxRK2FSWlNiSGhzZVpGZ0lYK21MNndQVDR2?=
 =?utf-8?B?TE43dWhOdTN5Vm1mTjBiWW5yMkk3MUpNc1IwWDNkRXBhbllBdSsxRDFaTXdu?=
 =?utf-8?B?eVNUU1lHOHdnY3ZSN0EvMVQ0Z0xmMC8rNXIrYlRqZ0JnblovVmZtZC9HVGZU?=
 =?utf-8?B?Vkd4Q1dMbnN5VGIrZHJLYmJjWWkzY0J1Nk4xV1RnTE1nempDcUp5NlBxNk92?=
 =?utf-8?B?U3N5aTZNMmFudkpNeUlOQ0RhWHBMZFlQNFEyTjlURXRlaVk3RjBFZ3o0ZEYx?=
 =?utf-8?B?aXNtT1ZicVk2ai9tUkZLNU1vclVMa1BtVUFDOGV4dnhIOFBORXd5OWlwR1FJ?=
 =?utf-8?B?aTN5R0l1L2ZQZkd1QWEzZHpGSDE2bHRUTXpySmNaQUpVV1JBQW9yNzFnOVNE?=
 =?utf-8?B?bWMwMWlFOWFNT0VGcWpibXZ3Tk00dmhHeW93UDcvc2dlNndHYkJDVVYxazNw?=
 =?utf-8?B?U3g0aGJ5OTVtRElKYjdQNk9ZVVJIck5OSGxIOE1DSVpQNExxeXJCcnlDZW5G?=
 =?utf-8?B?RWJFWWk2TmZ4RndtMGFjSThUUXpDR2VmSXBMTG1uSEJsWC92K1dDWFJRWmR1?=
 =?utf-8?B?aDJJVU1ZZGlyUzd6R3NxQ09Xd3h1VkhpanZKc1pPeTlwU0dib1NORFpGRlhN?=
 =?utf-8?B?S1ZFNHZlRmRqQ1dzRlY3WUV4UE1aWk96eFlGODhFYTQvYlByUWZXbEg1Yjc2?=
 =?utf-8?B?RnJBMzVYZSsxR3RxckhxdHhHeGpQT1ZqK2dzUEhnSWtNWGpPVG9rdUQ2TU16?=
 =?utf-8?B?VS9PSVVCKzNUejc2bEl0OTNwTDVHWlJIcUpKc3Y4UnZUR0lxYU1mYzFINWJq?=
 =?utf-8?B?QmVHYTRydmMzbXFJenlHTm1QOHlxdHlMWnY3SkxlakJpT2dRSVBvS25WWGdX?=
 =?utf-8?Q?XNBDNN92smm1KV/m+b3mDlQDv?=
Content-ID: <D4156B342F94094CAE68E9254C6D16D0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31574ff-f735-468b-a4fc-08da5f22e91d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 07:41:17.0282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0os410wvYWlGAHPb5nM1nYSmSNn3Ca7srCNekyI0KcV7yipBI8pM1K5bLbU29vVgW/rl7KPYqo3yURp6F5piAvbI1Eo/DDHDbeVCD63stcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_004125_137737_6C2AFAB6 
X-CRM114-Status: GOOD (  18.14  )
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

On 06/07/2022 08:21, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Jun 21, 2022 at 08:42:39AM +0100, Conor Dooley wrote:
>> Add the newly added i2c controller driver to the existing entry for
>> PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> New in v6.
>> FYI: I have several maintainers updates in flight - usb, pwm, spi
>> of which some will be in 5.20 & clk/hwrng/pci that are likely to
>> go into 5.19-rcN.
> 
> Then, I'd suggest you collect all of them and send them as one patch at
> the end of the next merge window?

Hmm, couple of them have actually already gone in. I doubt the pwm will
make it but the others have. If this driver is cleaned up in time for
5.20, I'll rebase this patch after the first week of the mw & resubmit
with your Ack.
Thanks.

> 
> For that case:
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
