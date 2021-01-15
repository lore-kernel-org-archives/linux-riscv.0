Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69D9C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:56:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E20F239EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E20F239EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zesJnP8KdVnv+qsHGi7t6Zt1ieiYsOsMnQk9/Ff21io=; b=ws2P8+DBHx1UkhYlDhOsPLNPt
	iY9xQ+r5xt1FqcpoYXJk6ifSnwiLAKKIouLsfsvhainZStv7I28A2EjJWq5Qb8Jz+2jvXaNhpmK9w
	nrBgrPNJdGvC/PY4xVuT3SqOV0E6aMRVuMAipOvB8i7meInXKvuVp0F4CAV74U+35cApp7PmtXD46
	qVOpkuZOc4szDwEQd75Bib09wX/NXCnBK7HVHf7e42OB2XFzP211QCmgXlAk45W+9VJOiE+V/lRQg
	vBcRzIMg/XkSg8SLaqaHlBaHEK//90HgQJE4d93PnHTk1z8bUiPFWkX71XCCmX+Z7bx7tH8psMAf7
	LViTIieJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0I5l-0004EP-6d; Fri, 15 Jan 2021 05:56:13 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0I5j-0004E0-2a
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 05:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610690171; x=1642226171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FDgLXQWeXd8ac10D0MQyMqnLUpwNs/QiTvK/ja9ck0s=;
 b=mHE8f7V1vN5+4TiQLtirbxsTYXhzj5Aj3eaJVrHj0WzkFqkFdphUBgj+
 tUUNJ0rH2fHGRrGNHIF5JP2swETO7JuhcrYqHrdC3ieeXU6hWotGMgSUk
 ut2HP/ibhO4t9CtVfyInu9SC81hRcsp+IHUiQO9RFtWEJogunA8OqZG8O
 CLLC/8IyV0Etyjn6/mOst1vJhCKDadBdQ8LJJ1tPw3XGfjbF08ltymQQK
 aVBbv/YHbuGRujCT0+3RMfxW4qklsrYExFRQFU9W7uFj1YGFAHTBhPNx0
 UqmOF8LasMclcuvLrORRVyovOXmzKeJ3A3zhgvCZIA1ODFjz8ABM+8Rin w==;
IronPort-SDR: 046cwDdhIRUszqT8xBbmneirwh7vyL/+uDvKCnnbYo0k9kc/RKWW/06MQgej1udJt1LGLq1/6f
 32aMwoOGiEw2USjks3FPn6NOjgbb2QttpFRq8WDjGYB3m/vymAFbyoYSZ3JCtcWUVpDG95HjPZ
 E7Xg5c7JvdJw8C3pQCSHC2Gq8mTdZgYzSVN0qfBMt/dXUN18EAjXnS9M7DsgX3GWqnTXuwUXc0
 Uvh/rBduaTM9TFyDz6jnQDoVBshsNZAw7omGL8ZVyTUCoD/p/wOId+ZDlLPpPQ6pkgV8oWJ0Cm
 Tqg=
X-IronPort-AV: E=Sophos;i="5.79,348,1602518400"; d="scan'208";a="158661208"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 13:56:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/ol4rT/RLccyaCPuh3m0RUj5v708b/uN3Hpx8MoAZZ6s26ij9pMQAQN25WV4i+V57dH4P785tDaewp4yrIlBvgHIkdYyqZo/6KJ9nsvv00SGXtE8ArbS1ZGXLDw+V/cJwjzCwAtzfF8NaG71V5tJ3wV/GhCggr2M+YZoEkBM9FMwi+i6H5t+1hrkADMJvVmqW8poXwmdrnUDASg0k4eGahsVvT7oSR1HS8ect6mNIdTlMkY5kP3ozj5B7aXIEnawQ/P7/aWkTzLNWfma3fPaJixgLF20a2C0OdbjOmDWyNIRpVvpQVAFWNQmSTvI7r6WcGPay7eR5bme7eZxBFyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgLXQWeXd8ac10D0MQyMqnLUpwNs/QiTvK/ja9ck0s=;
 b=KQRwVbOId/H7US27BNQxwyLGYk3XX57xLbDiuikE2Cwitb8ib+gappg0FuRTPn90l698vIUm8NvrCvhvb0Udn4MikRZEAUMmkGcS/kE9DFBxQS5JaY9pYuWomEl88RLtvqARQiYKem1HgN9cP6Ynod/y6G3wSejuncT9WuORaf9rHxjv7CSz6dCea14aSSNl0ly+cSjv9dWj5VNpChcRFcYXbf87Gzzw1KxLlU2qbgB5IuQlnCLxHV5zHYVH5vxkQukZqfUAAUCLhkd3Z2tN5ibcOX+ovWgz94hb+WuBUZVjdP/NnnRHFDNdmJzUYzmB/2iXjQ6OoP4NwQQfNhlx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgLXQWeXd8ac10D0MQyMqnLUpwNs/QiTvK/ja9ck0s=;
 b=grY1FcMzPnjrBc2XAlatQ/6Y1KDDkwstbuUibL3TWBhktXmG9UcgXkpyMqKvrK/TGxj9rzCE6TS4KihgVyO3VBq7IJ+AwZEz1UcLRTXTbFfFH55Z5Rx21Gvys6+aD93F1NYj5TEMWgyHmvOEEYTdDgsFZddZl+j51bm8q+3s4xI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6976.namprd04.prod.outlook.com (2603:10b6:208:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 05:56:05 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 05:56:05 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW6H4ffzJIz+L53U2eOGwbaV2KdaonyfYAgABrRIA=
Date: Fri, 15 Jan 2021 05:56:04 +0000
Message-ID: <7a150ba26b8feba41d05ba9b2c802b8da2a67a98.camel@wdc.com>
References: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
In-Reply-To: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bdf9339c-e865-4a9c-53fd-08d8b91a3f00
x-ms-traffictypediagnostic: MN2PR04MB6976:
x-microsoft-antispam-prvs: <MN2PR04MB6976AE984E169DE60A0A18AEE7A70@MN2PR04MB6976.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tRcv4yXCJp1xnv0476C9302Bg/aUm/YuJmyWFFpnIlEF4Q+D+1uXcaZQ5xf7fnEeh3vZAYSukKcHfSpPWjF5BqMUChOtKz0LJ0CKHKImP1lMijOj2Drqngjm1eWW8hdN+bMl8W4nnatWjBne7fCl5NsTWem8r88HOOYVi7AxHfQic54uiNKjc+J8s1q8GkNXvmdg5s3+KCqGSkCKuPkkjAfKd7NalEnRVB5e8/m72+dlE1XGI6eswL754pmCS/yhgsNydi909GX8k0qIa8A9T7cas8ldl2d6iuREUM5ITGLVQtLMGPRZy+kkkXHlDV+TcSkBiIGIfw8fB+N9aACspC8KyD4slUEv/zLkK4ipHSG0+QEQHWaymw2c6Kx0yy5ReXru0UFESy0iWrLeDSzgaEvhNErsZM81pEmm3ScUrp+UM/Z68po+ZGvg/+hxEe2g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(2906002)(6916009)(15650500001)(83380400001)(186003)(54906003)(86362001)(6486002)(316002)(71200400001)(8936002)(6512007)(36756003)(6506007)(2616005)(5660300002)(91956017)(76116006)(66446008)(4326008)(66476007)(64756008)(66556008)(478600001)(66946007)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eW1jY09wdUZFRUxMRVpVa3NhdFQ4Kys3ZEJrRFZVcjljZjhhQ2RQWFVsaHFV?=
 =?utf-8?B?RkRwZzE0ME9CY3oybzA4YkVCQkFJVjcyb0RDMS9wYnI1aUZqTGhKVjZwb0x3?=
 =?utf-8?B?a1JQZ3E4cGtPcURhSExJVUo5a24yeWFjcmxISGgyT05Lc1AvV29tR2ZYOGNQ?=
 =?utf-8?B?aG1UYjJ4U3c3bUlyeVVKKytyWTJwdXM0cEJac1c0dWJmRkJQMGZwWElOcml5?=
 =?utf-8?B?ZURNdVI2Q1ptZFJiMUp0SllpRnByOHR4V2R2OUNZT1N4cFpPVWxWSWFiZE1Q?=
 =?utf-8?B?cjdRaDZ0MHUwc21qazJIdy9INVpjenZBTW56b3N5WkxQY3lyM3o0N0xndDVY?=
 =?utf-8?B?SjlWK2lQRXBlR250SFF5Q1N4OHZ1bEVJREphN0Nmem14WCtzcTNPbGhsR01T?=
 =?utf-8?B?NUxlRUlPQjBIQmNXZll2RGl1eWtXYUtlS04rT2xCN1JJNkM2ajRSZ0F0LzUv?=
 =?utf-8?B?ZDdZU05GOFcwMmd5YjFTQmNZVWhpRGFYdHlMTFh6ekFJV1p6YUdJL1MyQXhF?=
 =?utf-8?B?K0NLeVo3blUvWm1lU09SZ1VmM0RSd21TOVN6MGhSSTVtdjdxR0RJME5iZ0JK?=
 =?utf-8?B?SzJ2YzBHZ0tPWWxRM3FkalYyZi8rN2VuVU1zRHA4TFRBQVFyRVFSQVp5SVVs?=
 =?utf-8?B?R0NzM21XaUNTdXNZTkdjWGJJVzR2Ulc2R2lLbzBxUGRHQlZGUFNvaFFOUi9s?=
 =?utf-8?B?WHdEWFExVE5MMWxUWmJwdEduUEpoVEtxT1JzeXF2ZU14Vk1laFFaRVg3cW5s?=
 =?utf-8?B?V3Fza2YyN1MxSnlFZ1lCMXZMTThRWWFIcHE1L3ROZmlYVGFHbnE5ZVhTbTVL?=
 =?utf-8?B?TjMwZ21IR1dCaTFqVm9qd1NDQTVRVzdSeXdZanlrK3AwMEY3Z1RlM0FUd25Q?=
 =?utf-8?B?Y0dpak5KWEtMWjh0TXkwV0xIbExTeE5Wc3FyTWJaVklhTkU2QjBkSzRNcEY4?=
 =?utf-8?B?RUNKRXZISGxjdzJoaXo4NjEwc1MyOStoN1IrN0RUNXhXTVNtcm5zNTRUb1hv?=
 =?utf-8?B?ZEVITVZrYllPNHY1RGJpaDBYaWMrUTNneEVQYUJjNXhpUjBQS0NNYkIyaXJ6?=
 =?utf-8?B?eWJRN2c1anJ2UnpOQVo4MTVQTE5oM3hsUll0K1pyNHFmNVhCVWkvcUQxQytD?=
 =?utf-8?B?Mm5tZEc5V0hLUmhramZCdGM2UWdFb1o3TXJnM0VmT1UzcEltUGRzUFNMaGlq?=
 =?utf-8?B?NnRGYjN5L3djMUExNk4yek50SUVrOSt5Z0tvYldIMXhXUzdkOHB5ZmZnNXAy?=
 =?utf-8?B?ZmxvaEhBaURVTnZqaWRleCtIZHNPZUd1ckJ0RWFoZXVmamJzdW5ZQjkzcFZF?=
 =?utf-8?B?VUFSL0VBempYSzFXOEFMMmFDb3d4TGZ6UmFibTRydENIN1l0VzgwU0VtSWha?=
 =?utf-8?B?ZWU5bjg3SjJMbEg1MGgyY2RvTlpMVWNpWGNtWDZjNnF2ZzJSVE8zK3MyREYw?=
 =?utf-8?Q?NM5mgyAR?=
x-ms-exchange-transport-forked: True
Content-ID: <B9A36D82C5B2B543B85DD0E1AC2DF7D2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf9339c-e865-4a9c-53fd-08d8b91a3f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 05:56:04.8825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlNc5XyOCWrLEe8ZQ9O7z1S2vnYsohfcC4BJZyaDDAKdCs+ps+QqZ6Mj0kWCPlqdkLEsIg3ArdWznR4Yy/HEAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_005611_382155_56E672CC 
X-CRM114-Status: GOOD (  31.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIxLTAxLTE0IGF0IDE1OjMyIC0wODAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToN
Cj4gT24gTW9uLCAxMSBKYW4gMjAyMSAxNjo1ODo0MSBQU1QgKC0wODAwKSwgRGFtaWVuIExlIE1v
YWwgd3JvdGU6DQo+ID4gVXBkYXRlIHRoZSBDYW5hYW4gS2VuZHJ5dGUgSzIxMCBiYXNlIGRldmlj
ZSB0cmVlIGsyMTAuZHRzaSB0byBkZWZpbmUNCj4gPiBhbGwgcGVyaXBoZXJhbHMgb2YgdGhlIFNv
QywgdGhlaXIgY2xvY2tzIGFuZCByZXNldCBsaW5lcy4gVGhlIGRldmljZQ0KPiA+IHRyZWUgZmls
ZSBrMjEwLmR0cyBpcyByZW5hbWVkIHRvIGsyMTBfZ2VuZXJpYy5kdHMgYW5kIGJlY29tZXMgdGhl
DQo+ID4gZGVmYXVsdCB2YWx1ZSBzZWxlY3Rpb24gb2YgdGhlIFNPQ19DQU5BQU5fSzIxMF9EVEJf
QlVJTFRJTl9TT1VSQ0UNCj4gPiBjb25maWd1cmF0aW9uIG9wdGlvbi4gTm8gZGV2aWNlIGJlc2lk
ZSB0aGUgc2VyaWFsIGNvbnNvbGUgaXMgZGVmaW5lZCBieQ0KPiA+IHRoaXMgZGV2aWNlIHRyZWUu
IFRoaXMgbWFrZXMgdGhpcyBnZW5lcmljIGRldmljZSB0cmVlIHN1aXRhYmxlIGZvciB1c2UNCj4g
PiB3aXRoIGEgYnVpbHRpbiBpbml0cmFtZnMgd2l0aCBhbGwga25vd24gSzIxMCBiYXNlZCBib2Fy
ZHMuDQo+ID4gDQo+ID4gVGhlc2UgY2hhbmdlcyByZXN1bHQgaW4gdGhlIEsyMTBfQ0xLX0FDTEsg
Y2xvY2sgSUQgdG8gYmUgdW51c2VkIGFuZA0KPiA+IHJlbW92ZWQgZnJvbSB0aGUgZHQtYmluZGlu
Z3MgazIxMC1jbGsuaCBoZWFkZXIgZmlsZS4NCj4gPiANCj4gPiBNb3N0IHVwZGF0ZXMgdG8gdGhl
IGsyMTAuZHRzaSBmaWxlIGNvbWUgZnJvbSBTZWFuIEFuZGVyc29uJ3Mgd29yayBvbg0KPiA+IFUt
Qm9vdCBzdXBwb3J0IGZvciB0aGUgSzIxMC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW1p
ZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPg0KPiA+IC0tLQ0KPiA+IMKgYXJjaC9yaXNjdi9L
Y29uZmlnLnNvY3MgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiA+IMKgYXJjaC9yaXNj
di9ib290L2R0cy9jYW5hYW4vazIxMC5kdHMgICAgICAgICB8ICAyMyAtDQo+ID4gwqBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kgICAgICAgIHwgNTUxICsrKysrKysrKysrKysr
KysrKystDQo+ID4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwX2dlbmVyaWMuZHRz
IHwgIDQ2ICsrDQo+ID4gwqBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2syMTAtY2xrLmggICAg
ICAgIHwgICAxIC0NCj4gPiDCoDUgZmlsZXMgY2hhbmdlZCwgNTczIGluc2VydGlvbnMoKyksIDUw
IGRlbGV0aW9ucygtKQ0KPiA+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9k
dHMvY2FuYWFuL2syMTAuZHRzDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9i
b290L2R0cy9jYW5hYW4vazIxMF9nZW5lcmljLmR0cw0KPiANCj4gW1NuaXBwaW5nIHRoaXMgdG8g
dGhlIHJlbGV2YW50IGJpdHMsIGluIGNhc2UgeW91IG1pc3NlZCBpdCBiZWZvcmUuXQ0KPiANCj4g
PiBAQCAtODEsNDAgKzEwNyw1MTUgQEAgaW4wOiBvc2NpbGxhdG9yIHsNCj4gPiDCoAlzb2Mgew0K
PiA+IMKgCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiDCoAkJI3NpemUtY2VsbHMgPSA8MT47
DQo+ID4gLQkJY29tcGF0aWJsZSA9ICJrZW5kcnl0ZSxrMjEwLXNvYyIsICJzaW1wbGUtYnVzIjsN
Cj4gPiArCQljb21wYXRpYmxlID0gImNhbmFhbixrMjEwLXNvYyIsICJzaW1wbGUtYnVzIjsNCj4g
PiDCoAkJcmFuZ2VzOw0KPiA+IMKgCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljMD47DQo+ID4g
DQo+ID4gLQkJc3lzY3RsOiBzeXNjdGxANTA0NDAwMDAgew0KPiA+IC0JCQljb21wYXRpYmxlID0g
ImtlbmRyeXRlLGsyMTAtc3lzY3RsIiwgInNpbXBsZS1tZmQiOw0KPiA+IC0JCQlyZWcgPSA8MHg1
MDQ0MDAwMCAweDEwMDA+Ow0KPiA+IC0JCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKwkJZGVi
dWcwOiBkZWJ1Z0AwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJjYW5hYW4sazIxMC1kZWJ1ZyIs
ICJyaXNjdixkZWJ1ZyI7DQo+IA0KPiBJJ20gc3RpbGwgZ2V0dGluZyBsb3RzIG9mIHdhcm5pbmdz
IGFib3V0IHVuZG9jdW1lbnRlZCBEVCBjb21wYXRpYmxlIHN0cmluZ3MNCj4gZnJvbSBjaGVjcGF0
Y2guICBTb21lIG9mIHRoZW0gbWlnaHQgYmUgaW4gZmxpZ2h0LCBidXQgSSBkb24ndCBzZWUgbWFu
eSBvZiB0aGVtDQo+IChpbmNsdWRpbmcgYm90aCBvZiB0aGVzZSBkZWJ1ZyBvbmVzKSBoYXZpbmcg
YmVlbiBkZWZpbmVkIGFueXdoZXJlLiAgV2Ugd2VudA0KPiB0aHJvdWdoIGEgd2hvbGUgcHJvY2Vz
cyB0byBzb3J0IG91dCB0aGUgU2lGaXZlIERUIG5hbWluZyBjb252ZW50aW9ucywgSSBkb24ndA0K
PiB3YW50IHRvIGp1c3QgY2lyY3VtdmVudCB0aGF0IGZvciB0aGUgQ2FuYWFuIHN0dWZmIGJ5IG1l
cmdpbmcgaXQgYXMtaXMuDQoNCkkgZml4ZWQgYWxsIHdhcm5pbmdzIGdlbmVyYXRlZCBieSBtYWtl
IGR0YnNfY2hlY2suIE5vdGhpbmcgc2hvd3MgdXAgbm93Lg0KSSByZW1vdmVkIG1vc3Qgb2YgdGhl
ICJjYW5hYW4sazIxMC14eHgiIGNvbXBhdGlibGUgc3RyaW5ncyBmb3Igbm9kZXMgdGhhdCBoYXZl
DQphIHdlbGwgZGVmaW5lZCBkcml2ZXIsIGFjY29yZGluZyB0byB0aGUgZHJpdmVyIGJpbmRpbmcg
ZG9jcyAodGhhdCBpcyB0aGUgc2FtZQ0KYXMgb3RoZXIgYm9hcmRzL1NvQyB3aGljaCBkbyBub3Qg
YWRkIGFuIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZykuIFRoYXQNCmlzIG9ubHkgZm9y
IHRoZSBJUCBibG9ja3MgdGhhdCBkbyBub3QgbmVlZCBhIHNwZWNpZmljIHR3ZWFrL3F1aXJrLiBU
aGUNCkRlc2lnbldhcmUgU1BJIGlzIHRoZSBleGNlcHRpb24sIGJ1dCB0aGF0IG9uZSBpcyBhbHJl
YWR5IGRvY3VtZW50ZWQuIEZvciB0aGUNCm9uZXMgSSBkaWQgbm90IHJlbW92ZSwgSSBhZGRlZCBk
b2N1bWVudGF0aW9uIChlLmcuIGJvYXJkcyB1bmRlcg0KcmlzY3YvY2FuYWFuLnlhbWwpLiBJIGFs
c28gZml4ZWQgc2V2ZXJhbCBub2RlcyBhbmQgc2V2ZXJhbCBleGlzdGluZyB5YW1sIGZpbGVzLg0K
RS5nLiBUaGUgc2lmaXZlIGdwaW8gcmVxdWlyZXMgYSBjbG9ja3MgcHJvcGVydHkgYnV0IHRoZSBL
MjEwIHNpZml2ZSBncGlvIGRvZXMNCm5vdCBoYXZlIGFueSBzb2Z0d2FyZSBjb250cm9sbGFibGUg
Y2xvY2sgZGVmaW5lZC4gU28gZm9yIHRoYXQgb25lLCB0aGVyZSBpcyBhDQpjYW5uYW4sazIxMC1n
cGlvaHMgY29tcGF0aWJsZSBzdHJpbmcgYWRkZWQgYW5kIHRoZSBjbG9ja3MgcHJvcGVydHkgaXMg
bWFkZQ0Kb3B0aW9uYWwgaWYgdGhhdCBzdHJpbmcgaXMgdXNlZC4NCg0KV2hhdCByZW1haW5zIGlz
IHNvbWUgY2hlY2twYXRjaC5wbCB3YXJuaW5ncyBhYm91dCB1bmRvY3VtZW50ZWQgY29tcGF0aWJs
ZQ0Kc3RyaW5ncyBmb3IgdGhlIGRpc2FibGVkIG5vZGVzIHRoYXQgaGF2ZSBubyBMaW51eCBkcml2
ZXIuIEJ1dCBJIGFtIG5vdCByZW1vdmluZw0KdGhlc2UuDQoNCkZpbmlzaGluZyBwb2xpc2hpbmcg
dGhlIGNsb2NrIGRyaXZlciBhbmQgcmV0ZXN0aW5nIG5vdy4gSSB3aWxsIHNvb24gc2VuZCB2MTIN
CndpdGggdGhlc2UgZml4ZXMuDQoNCg0KLS0gDQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdp
dGFsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
