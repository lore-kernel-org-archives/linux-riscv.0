Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A7BC48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 19:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAlgieNhFcnFZuNJBewC+3kjYh7/yykOjrMAILilXzI=; b=wZmFse8VUa6Qn5
	bS+InWzyxUOIXCmeVSEO8F/tE+Y1gJ7AZ2INgxSGV+cFT8MHEDvcY1no0IGVZokwl+teEdqD2hI3v
	ASUBPwMoLh/JffPcMwyrf0xiEIbg5KaDQvYhwdnZDxStHX8LJs6260nnBxauXysF3z2ssmKkTspxV
	MU9EWNJ8xh4JukiVl10Mc6BzURzcEo7LR91J+3unvHvUfUc5r9kJ8XsuNypX61RxqJOSTrFGrVVZT
	ycglf4q2o/MARueUBhyf23957ubVAF2ZuCabDTwTUjBKs7HVp6pLweFYESP+B1A8JkShIKiBTkDjQ
	ImbswiIrl2UhDnuCQobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY9x1-0000000Eko1-147H;
	Thu, 08 Feb 2024 19:20:47 +0000
Received: from mail-tycjpn01on20601.outbound.protection.outlook.com ([2a01:111:f403:2019::601] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY9wy-0000000EkmP-1FRM
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 19:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0kF1MCD9pz3Rlwo2oxesC9mVUAf2nHYCP49hJBC1+f0v+KA1R/RSUdiW+Ci8K9tmFd2rk9OVN9xvTsbGqW636f/4Ys1V1pXTWeLfiRul/TBwzgiPa1soHzPtdki8EClbpZxepi933Idj34msLh6eVT+wiYvmciXrdhWfF+w91ftQ2GJF+1imJUd42GTowXQ0QsB6LHOLGHazilLwG41GfYDdpYs/q5sJzrGhMhjwZIy25YwrIJKcsmuSpyzySO6y+4OIp/GWQN6ghvegJuMBjgZCPt17thKnstg0zwbJgIwXsJJDttlPtuDMGJR5Rf1cw5/k7HKd927hoPMDbbymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hTeE8MK7T39NEGq3WF72E07Lz5Om6cbZzHKyL0WF40=;
 b=ek8ap8gmfGfjEt8PBZxslbSTlbbhqQ/835mpdHiFjx0/wOjwPD7vNQVkYpRHqg2llF2V5MBgQKxyoTa4Ta+HD4Q6XaJ5rv9juSiKNKNKVcb76I7DYoBxhFo3teYNvgpu728Zfj0Oq+RjO+wDXbAqPzgnkMr+hpGRwXJ24unt8xObQLKTSKOZ8gpLU5DkfWLtVXgOIrjVMVrOBqZYHdyQjxN8CY3vsPG/ZGzFVVF8Xp7cryvW7uc7acQzvMZ9itZJsAF6s2oqt4o8BGcV2U5xBkZa3W+76ca2dg5sYaZ8lEc8kQoZycBT1BAbfJ1hsStnKo4c8McUlssMzntjcVvOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hTeE8MK7T39NEGq3WF72E07Lz5Om6cbZzHKyL0WF40=;
 b=ogz3deaz102LVfo9O1hCZ0zFzI6hT4e90CrGvVWkdc2UaYVd1VdRxNl11FRTKhRr6fG7vWTt8pZI6aj6XkhQs04otcq30EFHVZqJPQpRBL742CI5tjrXoEfE2GNyKrFImLJRBr+Ah7NnF/n3bM2jEqbpReUaVmrx5sFwfLX2Hx4=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY3PR01MB11722.jpnprd01.prod.outlook.com
 (2603:1096:400:3dc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 19:20:28 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.039; Thu, 8 Feb 2024
 19:20:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
 IDs
Thread-Topic: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
 domain IDs
Thread-Index: AQHaWox93XkHXchpTkaSnTQ6Ok/3vrEAgGfQgAAWUICAAAlS4IAACXEAgAAoXKA=
Date: Thu, 8 Feb 2024 19:20:28 +0000
Message-ID: <TYCPR01MB11269015C92AA327DC6BFA76586442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269DEA9261CA594EECC949686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
 <TYCPR01MB112698AB206332D13105C064186442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
In-Reply-To: <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY3PR01MB11722:EE_
x-ms-office365-filtering-correlation-id: 08629697-b2c1-4c70-56d8-08dc28db02a1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ihMVtHX7/A3k3dya1JDNSt+vYT1wf/+/Qh0awk0EQnAvWwqZH0L+lnRVL0dw7c65QpYjjDRMgN4HeoGP0UUZaKRsgKxWUrB8qOe2V/3vFmDprTo4ba17m010eDpX1a/v/iO6URBg9jQsVsh1fS2It75v/TEO3FzKbeTu/A8l0kYBSOJW5QSZE+sYZ0S6VzgQLjbzcSv4nts2/hndXJFlLngGQZoC//Moif6S63UZ8NCxK4yu1U63INbO/byhSA0W7YUg/E1BnAnKDTMXdt8lVmKbB0Sl3ekX6AV5ztfFFjpLeyX+7BkainZYV5WRUZgHwhHZVshXwoKAfBGH8800gOF7TQwvNVy5aQOSMsnotrqZY3BfQM9OxrTQ+yF8Z8lTKrCrUMgekEdABJxxXF+WGXBWexfd4rmFse41oZ34gtmp6JYClLT09G1DshUzYHM0MjlOpV10dmapChYh+SKNGfLG5FiniMT7hOUGzAwv04nG/Fx9F4PCc4aa6f1W+ZQeNaCsaEd2Y7RiXOizFD4yBlCbOXqPuGtralIvHdnTTh9nq0Zr6/Zqvn01g6QZixdaYMsoTKjNxXQpaaBmRLb5hoInc6Rcj9OOx7foBif2DhXkvW2MHpeyBZVKRuX5HCIw+adTc6RPOHUwxZpSmsP7rQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(55016003)(316002)(7416002)(5660300002)(2906002)(66556008)(66946007)(8936002)(66476007)(4326008)(52536014)(8676002)(83380400001)(38100700002)(66446008)(33656002)(64756008)(921011)(110136005)(122000001)(71200400001)(54906003)(76116006)(7696005)(6506007)(53546011)(9686003)(38070700009)(107886003)(41300700001)(55236004)(26005)(478600001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3BMcnd6QU5ieFNmQzVTL2pucGlYdXFXY0F2WnkvclR4TEVLTmV2dEFkeHds?=
 =?utf-8?B?dzViY2lDcUhkbFB6bTlBM2hBWVhXV1pRZW92V1hyYzhtSGxUQk9oa1pjK3Nl?=
 =?utf-8?B?cVdGcXJJUXVReDE4R3RlR2lPQ1RGcWhiYnh3UklhNEYzb2EwV3M5TnNkbXk0?=
 =?utf-8?B?a0poUmhJbEE2WjhPUElEdXpOK0hxZmcxcmJhcWQ4eTZBTkg1TDdjenlJN2NW?=
 =?utf-8?B?K1VKWnlsemt3RWJDMmNrWUtMRnlROFJEckw5c0NJb3FKWWtsSG43Ny9WRWpo?=
 =?utf-8?B?T3pVRmNtMzFYalZTbVFHeXFNN3pDTFp6dzJLMVNVdURjMzErcVFYSHRKZnc0?=
 =?utf-8?B?RVRrL2U3YmFPSWFnNlIzSk1mRXdBMElmMmVVU3JpZTB5bmpXQTVzb1IvZUVR?=
 =?utf-8?B?TUt6TWtKSThUWEorMTh3RTRzSlFPMENBL2JQK1pQbHQvRlhiQ1M3bnFucjVn?=
 =?utf-8?B?QmpEK3NYWnNMSjh2RXZEcE43WlZUaU1EZTRPTWV1K04xaUlzUmtyUjRiMEVM?=
 =?utf-8?B?SFJBV2hQYXNUYlJpaUJtWEs0cGJhQWE1VGU2d3BVUmo5Smlsem1sZGVVS1dU?=
 =?utf-8?B?dk40dnFnRjdIRERoUG9pVXVWdXI4OEtNVEJhbC9KNHZIMU5uSUYrY2p0VWNN?=
 =?utf-8?B?dDJudUkvQ2dUMkROWG1RS3RETTdsUndkN2lyb2dTT2RndW11M0UyWEZVRWQ2?=
 =?utf-8?B?R2tHRlRTbEZ6dXVHemppaVorRkR2d0JpbG9MYkx2a0VSWmRTSFdOazEwems4?=
 =?utf-8?B?Z3lScVF1bnpYMzNyOXlFNUozZzBCanJrL2Q3dnE3dVN0em5hbHBVcDhGREJQ?=
 =?utf-8?B?OS9GNDNzZEMxRnFlN0RaVFV1UjhJZnN5Q3JIcVcyMlprb0ZOUERMNmQzK3Na?=
 =?utf-8?B?WXpwSEtYcVl4YzgweldTM3hJNDh4VmFmZFRLODY5OS9RdVh4Vi9FZlNvVzZY?=
 =?utf-8?B?M2lMbVhpRk5UOXF6ZnYrbGwyeTVnWW5vTk54MWNHNjU0dXhKZmJUUkMwKzNW?=
 =?utf-8?B?a0ZycUhsQUIxMXhjaHRVOGtYdjc2RGF0ektRdlV4WFlwTytNMllWa3hIR04z?=
 =?utf-8?B?cmw1cnNPQ3Z2VHBHaE9VVUZ0QkZ1Z2grT1hTczhZQVQ4NWlHbk00RGlQMlJC?=
 =?utf-8?B?TmhwR2R5dEh0TWNTUlJpbnhQeis3RUhwWmkzV2Q2VkxCeWMxMjErZnhyM0Ix?=
 =?utf-8?B?VkcvTE9uY2dCekd3T3dHNzVGUXllbnZIaTJoQWkxd2lMV2txVGhCbzc3Rnp2?=
 =?utf-8?B?SUt3bHZYbm9IUS9LUkNQVWxLeGZvcHpIS2k5UFZUcFlhU2JpUzNTazhzSVZN?=
 =?utf-8?B?UmJrOFdOanNoTlJGN1pxbWtjOTFNVWwzcysvem13SlFnYndiaUZyT2trNmFh?=
 =?utf-8?B?TnNUVGlEK0lGWURPNGRuUmUwSWZHTURhQXkva3VEL1JHMlYxdjUwQnFZTmEv?=
 =?utf-8?B?YnRDUXJuVlNtcFQzcStvU3Zsb0RBQlVhQ2ZJazh1Zk0wU1N5aVFxS3lTVFIx?=
 =?utf-8?B?aTJSQ2RoQmlzWVArdHV4cVM0QVlNaVpmbFN1Y3pTMndIMXM4SzdOL3laM0ZB?=
 =?utf-8?B?OHc5eUtSb1JCQldlNEo5Tmk5SHloNTdqNjh4eU9PamRwNU44QWJ3bnhsbHpU?=
 =?utf-8?B?ZVRJQmYxMWVUVnhib0l3bEJ4UVRQeXdkUDJ3TXF1cSttQmE3aVIrM1NGWWth?=
 =?utf-8?B?d0lNUnBWYnJ3RHFJc2ZTaXd2RUlkUUJMVzV2NE1PeXFkVm5QclIrT3g2T1lC?=
 =?utf-8?B?TTNVTXYycVBIQUNBTC9NeEk0TFdxWkZUaDVmMFV5RTc1V2pXaEdWc1l1N2tJ?=
 =?utf-8?B?ME43MVRkN1IzY1UxanRYejlnYXVsODFVOXNrcmhMVlh6VnZSbmRqTXphRlpy?=
 =?utf-8?B?QllXNEJCY29PSnM5Y3JqMEFaK1FReEJEb0ZVeDVQWlcxRjJxYytsMnpHWloz?=
 =?utf-8?B?OWt0MVpJTFZkbGhuZ0MrSHM2RWVJNXNiMk9YTlR0VjZDa0NhWkNhWmdBTm9E?=
 =?utf-8?B?VXMwaWdvR3U1UmJzNFZ2RStrZnl4ZC8rZHRDUG04WnFKSTE4Z0tlWjZtTzN6?=
 =?utf-8?B?RVZYbXQwaVdYZm9QaVlKYU9KZ1lyK0lmdk0zZ1dDME0xL2NPOVBiclo2RzBi?=
 =?utf-8?B?b2ZVdUl5aG1Kd0xSaEZ0dWRSYjU3RUtzK2lpYWEzR0RBcHBBSytRV0ZhajV2?=
 =?utf-8?B?QlE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08629697-b2c1-4c70-56d8-08dc28db02a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 19:20:28.6424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4fa70p3qpWRAV1IFvvPeoQjpQE1jz/Zt1/H8VuX0RszzQQE9bT9nmEREUsiMLUPQoH0oApQjdtJU0XK+aNAv3NzxWPYPqmyvyqSNX1M568=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_112045_119326_874DCCB2 
X-CRM114-Status: GOOD (  15.72  )
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



> -----Original Message-----
> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> Sent: Thursday, February 8, 2024 4:53 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>; geert+renesas@glider.be;
> mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
> magnus.damm@gmail.com; paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>
> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
> domain IDs
> 
> 
> 
> On 08.02.2024 18:28, Biju Das wrote:
> >
> >
> >> -----Original Message-----
> >> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >> Sent: Thursday, February 8, 2024 3:46 PM
> >> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >> power domain IDs
> >>
> >> Hi, Biju,
> >>
> >> On 08.02.2024 16:30, Biju Das wrote:
> >>> Hi Claudiu,
> >>>
> >>> Thanks for the patch.
> >>>
> >>>> -----Original Message-----
> >>>> From: Claudiu <claudiu.beznea@tuxon.dev>
> >>>> Sent: Thursday, February 8, 2024 12:43 PM
> >>>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
> >>>> domain IDs
> >>>>
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>> ---
> >>>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
> >>>> +++++++++++++++++++++++
> >>>>  1 file changed, 48 insertions(+)
> >>>>
> >>>> diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h
> >>>> b/include/dt- bindings/clock/r9a07g043-cpg.h index
> >>>> 77cde8effdc7..eabfeec7ac37
> >>>> 100644
> >>>> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
> >>>> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
> >>>> @@ -200,5 +200,53 @@
> >>>>  #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
> >>>>  #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
> >>>>
> >>>> +/* Power domain IDs. */
> >>>> +#define R9A07G043_PD_ALWAYS_ON		0
> >>>> +#define R9A07G043_PD_GIC		1
> >>>> +#define R9A07G043_PD_IA55		2
> >>>> +#define R9A07G043_PD_MHU		3
> >>>> +#define R9A07G043_PD_CORESIGHT		4
> >>>> +#define R9A07G043_PD_SYC		5
> >>>> +#define R9A07G043_PD_DMAC		6
> >>>> +#define R9A07G043_PD_GTM0		7
> >>>> +#define R9A07G043_PD_GTM1		8
> >>>> +#define R9A07G043_PD_GTM2		9
> >>>> +#define R9A07G043_PD_MTU		10
> >>>> +#define R9A07G043_PD_POE3		11
> >>>> +#define R9A07G043_PD_WDT0		12
> >>>> +#define R9A07G043_PD_SPI		13
> >>>> +#define R9A07G043_PD_SDHI0		14
> >>>> +#define R9A07G043_PD_SDHI1		15
> >>>> +#define R9A07G043_PD_ISU		16
> >>>> +#define R9A07G043_PD_CRU		17
> >>>> +#define R9A07G043_PD_LCDC		18
> >>>> +#define R9A07G043_PD_SSI0		19
> >>>> +#define R9A07G043_PD_SSI1		20
> >>>> +#define R9A07G043_PD_SSI2		21
> >>>> +#define R9A07G043_PD_SSI3		22
> >>>> +#define R9A07G043_PD_SRC		23
> >>>> +#define R9A07G043_PD_USB0		24
> >>>> +#define R9A07G043_PD_USB1		25
> >>>> +#define R9A07G043_PD_USB_PHY		26
> >>>> +#define R9A07G043_PD_ETHER0		27
> >>>> +#define R9A07G043_PD_ETHER1		28
> >>>> +#define R9A07G043_PD_I2C0		29
> >>>> +#define R9A07G043_PD_I2C1		30
> >>>> +#define R9A07G043_PD_I2C2		31
> >>>> +#define R9A07G043_PD_I2C3		32
> >>>> +#define R9A07G043_PD_SCIF0		33
> >>>> +#define R9A07G043_PD_SCIF1		34
> >>>> +#define R9A07G043_PD_SCIF2		35
> >>>> +#define R9A07G043_PD_SCIF3		36
> >>>> +#define R9A07G043_PD_SCIF4		37
> >>>> +#define R9A07G043_PD_SCI0		38
> >>>> +#define R9A07G043_PD_SCI1		39
> >>>> +#define R9A07G043_PD_IRDA		40
> >>>> +#define R9A07G043_PD_RSPI0		41
> >>>> +#define R9A07G043_PD_RSPI1		42
> >>>> +#define R9A07G043_PD_RSPI2		43
> >>>> +#define R9A07G043_PD_CANFD		44
> >>>> +#define R9A07G043_PD_ADC		45
> >>>> +#define R9A07G043_PD_TSU		46
> >>>
> >>> Not sure from "Table 42.3 Registers for Module Standby Mode"
> >>>
> >>> Power domain ID has to be based on CPG_BUS_***_MSTOP or
> >>> CPG_CLKON_*** As former reduces number of IDs??
> >>
> >> If I understand correctly your point here, you want me to describe PM
> >> domain in DT with something like:
> >>
> >> power-domains = <&cpg CPG_BUS_X_MSTOP>;
> >
> > MSTOP bits are distinct for each IP.
> >
> > <&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9
> >
> > 2=MTU IP
> >
> > 4= GPT
> >
> > etc...
> >
> > Is it something work??
> 
> It might work. But:
> 
> - you have to consider that some IPs have more than one MSTOP bit, thus,
> do
>   we want to uniquely identify these with all MSTOP bits (thus the 2nd
> cell
>   being a bitmask) or only one is enough?

We can have an encoding in that case 8:16 24 bit entries

> - some HW blocks (e.g. OTFDE_DDR) have no MSTOP bits associated (as of my
>   current research), so, only PWRDN

Why do we want to add power domain support for DDR?

> - some HW blocks have both MSTOP and PWRDN

That will be an array right?

> - if future hardware implementation will spread the MSTOP bits for one IP
>   to more than one register then this proposal will not work

That will be an array right?

Cheers,
Biju
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
