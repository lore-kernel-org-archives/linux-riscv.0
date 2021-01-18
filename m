Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CDDC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 08:14:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0C32231F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 08:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0C32231F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=eZpMzasRCFAc2/nOFSFDUKbnAc7JCiBCWHXdh+evgjA=; b=g7lUBhMMWIRY8kGemAo+1WmUb
	PtU9sIsyj6flXYTwI1djarhUh+IbxX5m0do2ZEVeqCiOKa7GHWc/7D3LH/ZeYeTUOY+KSJTs3SeAB
	epfWEj40yCEwsMIZEnOrB6x78HffoV9T4aL4epEcRdua3xuk8lnDRJGolfxRpmjhpVQrSKlx2UVe0
	R5UdAnhE1kBKdwYg+qtF1cG8iuN2gA+utXi76/D3OgTwIIZdYcXqCFwotSuCYn0hcnLbnX2G9B6nK
	ySi4YOI3AetUgsLfl+eDhgWgeVw46MoAE0zQRYjvoZn0kLccMWTgWWIr8j6DmfzviL8BzHE6yDSzM
	+ANfv2lNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Pg9-0007FP-5x; Mon, 18 Jan 2021 08:14:25 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Pg4-0007Eq-Nn
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 08:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610957660; x=1642493660;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=xeJPN7LqhDBsQtFnPKLuj8HZsiy88vbhCPW2qrQMVT4=;
 b=TOXjT/bDYb03jO/7jOHx1tjnBZ73dW/r8X2r5yi4Pvx2bom3sB3BlwF5
 vSD7iFXBXZ2NJGyFm6kL5u9hY3vzzhBI08Rs0IE58ROV/SiliKgwBZ2oF
 zISih6v24XA7SQXZZwuAq6UTWrdZ64ZD3ZiVsVPVB+LbI8lsAEda1rR1x
 9Bypyplj2imblahJ3E3v/rnR/4FwARLtyqiYyt48ZnLADO6/asuNG5FEg
 wu9Wqeof70PTO7PGy5n6iFGd5vNKpdy6wvVGbhTx/rRN6+Wn3DFy0ypTg
 tdEGu3EzQ6fM3rUzQmbyjdJdiPAi0zDIOKRKK3q0unxnkohmgK/gkz3mh Q==;
IronPort-SDR: u5kMwhAwezodptAveODuXpSwlq9lMGKQzPpEt7ir1KsJ59Xr+zF/bU8Ypje4r6Li8tHXZ33bQk
 u/mWZmu2aO0H3KTxSihKeaYf205556OjbsysOUANUtWj9Jf8EHWvnnuTS6OX0k7zFZJSjIpzY0
 V6cGhMxPcLicAg8MJtrawmZA/v42i3IRg2lUWpI+kBPrVP5GZVYnmAfQmNPYOeNFdSqR4RmhUK
 lqbh3n7oicPZkBL37Mi0BtixkBHSJuwtkLqd99OBfzuEB0I9OfTLuJ4sgPkVhg+JBazxi3vtRw
 dkY=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157683490"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 16:14:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/zh9CxL//c3PDhZ9DUEUKzPqon9ciU55YKDUwzXduq20ToP+NnV9D3k04faNba2402B+OzmGGXJXzoeAQEtck6bb+LrwntVr+2s2VP737aOx/+T2Nn19LHIYOowICyqYxnmBFeYuoiEDvWTOIWJHfAmV/ZapUdF2uM7qvy2Zfes235MDv+EJHQqDYx0jpUCWSOjfearsRV7LMcyaCdxnGuuQS7k459fOSTchC/Vw9l2Fgac/QraDDl77Sh2ejC7bE65vX6zyFowoU4goDnbJm1HUEPR+5rLVWqWpEsoi14vo/xXF0C09azDOrtPxZEKtpwqspAWndyOuZCm+s5i5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEkzk8tP3KzjAB+HDroIRbhIoTx3LGAGXSDx+9wKcWY=;
 b=TKF716S1sOOIzFM4Dgdi+zfG1QZc2PHEpPxxsFeIL4K3PJI0A6m0xeX4aVnAgKOK3PaqqcPNcxqD2R2sy64kqbOd4HpqhNvr/s1/86FhKzwa2vXSUNUiZQ9HP0TGfwmAcxDZebiWVpcAs5hfVxKPr8DoMh3HEqzh/ulAp/jfAI+uOzEeEzc+jJzZYnzji7/UPxRfFVHyXMhGupOIAWQo0WC79Uu1zMHoaqwT5MsyNjie/God6tD696iV7M5p9cIXAI30CFJ8190122EjeeUHD7s7BPhFoOg4r5Jmr1OYwEqhrPKLfX1j3pdHtzZcQatjN0gMDCd1LbGn8kDtmyJ4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEkzk8tP3KzjAB+HDroIRbhIoTx3LGAGXSDx+9wKcWY=;
 b=MFvF5Sf1/II5dqphKFHKBRYpUxTB26kjt0ZbjcajwTuidkCpExVApEn68pER0jMqKmOqEqCsuB4DievMN4sj1cifV9yUx3TxZRYmbLO/PTxkMGCQ8bEG8cuh0tXnSexHZN7leSP8SyHMaH1uON+miYpBrsybCN1y4ArLlJrNeeA=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6415.namprd04.prod.outlook.com (2603:10b6:208:1a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 08:14:16 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 08:14:16 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v13 00/17] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v13 00/17] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW7T4HpuGDB8amz0SX+PbM0kQlKg==
Date: Mon, 18 Jan 2021 08:14:16 +0000
Message-ID: <BL0PR04MB6514083197F4A03D737FE5E1E7A40@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
 <CAMuHMdWZTRb2FtREftr5yBo-3nFEjpMXCjHQTE6rd0vuJAHQ-A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:65ee:945c:c1cd:2690]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 363303bb-f481-4b9b-989f-08d8bb890c26
x-ms-traffictypediagnostic: MN2PR04MB6415:
x-microsoft-antispam-prvs: <MN2PR04MB6415D24DD49AB87D6D19981FE7A40@MN2PR04MB6415.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: If38+2JI1iRhOln8MLqgbw3KlcDNvkFP821sAd6qNhdCLRhWC4gRt4DpoH+qlecAP3V3VW1OEcIxte7hQj1MG60zT97aOourc1yTc+7P99qMc7F0xmhOa0QFVohWV6FJSBjmde3q9nE0u63W8i5Q+NR0eRYjYgtbMaEqJwsgX7JbPBnGTejVJzmyyls+Hr6LamQVF4zbY/nIXM5ceAouKa+AkFa899XTzPFr7e2uOPH7rTI6UwnMOqbmQHvVMpXQM2YqeSuJBJbioK4C3y5H+78Ryy5XmveMG0t3SfrL7UARoq/Tn1PRYrZIHh9PzBuJKeLOwDczxLlL1BWYH2VTdwLfZv2OlpQoIPdtqboQHSMd88/WEJYrOoU8iduSKdbZUIV3ReXuFoyvr3/ZDaTjh9c0AqgJk1pRTRahSuQW/DGwa4ksjpAfATjYNXR0f76Q9C9wzjZlRVF93E1B82PcHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(91956017)(52536014)(5660300002)(478600001)(55016002)(4744005)(186003)(9686003)(76116006)(64756008)(66946007)(66446008)(8936002)(66476007)(66556008)(2906002)(53546011)(7696005)(4326008)(316002)(6506007)(8676002)(71200400001)(6916009)(86362001)(54906003)(33656002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?10hVOShSDkVnwYaFKOIAHCqFRL0SA2ft3aXsktCeUFO5/GlomFo1JHgWIvGm?=
 =?us-ascii?Q?ilcw4daL9M9q8gWLNKjwuc3dTx1ZeUx4imRFGFKRjHiWqc5iVMamc04T/Qs6?=
 =?us-ascii?Q?+gBZApd6w5rMHe1VvtmxTVpC0kip6vrq90ohtEMivSvKv0mxpbtx0bnm53i0?=
 =?us-ascii?Q?wtdUfh6h4CUvj2qnEZsxFbDljWGzunpxq/l97lku8Z4MAWg3bi3ox9BqI8gB?=
 =?us-ascii?Q?8GwLySGcok6Ohqw1c85AT1joDRYyFWQ0jHhZ9QqYIhv0/RjEJRsbfohjmITr?=
 =?us-ascii?Q?M9aelxtqGNpv4N5f6CPkbvcmAV5CBdAAToTHVqn3ZKvYF/hXEWNpoQaQhuSX?=
 =?us-ascii?Q?cFI6cTduw+QkW+cCX8PaPRWn5KGZoQkCe7P2gJra3uarGZTG8fRggicK2aBd?=
 =?us-ascii?Q?VLyRKtb1hbldjkUS8EkBkFqEtZvVzbIQ2nUUw4iGrVgUs/CWT67ibgfOxBCu?=
 =?us-ascii?Q?1V25uFBFZkSrZjIQ29Y1/6wxmEzgEzQLy2fasKpprbKONRGWB2Bum2SGCGmn?=
 =?us-ascii?Q?v5CljXgln81H1K/WWpC88fsngFRp0pk2VwcRk8ZDhQxDZW3nvzPd78jyL58l?=
 =?us-ascii?Q?19F5vsuyRHHSxZBA/89ltmASYYwvqkGIpcsrR15mGDfOcsUy7RW4EM4C7X++?=
 =?us-ascii?Q?ju0R2doM+tfQk+hnOhLHq6LlJ8V5ZO7WyWTnPwNJVbZOMGNbiqbS/rQqk1xZ?=
 =?us-ascii?Q?eQuftxlShD27VKn706hZ1ac2QrstNP2c5Z37+4Wo3NGwMhaQRHNVwR/ORXwr?=
 =?us-ascii?Q?hFQZY7fgT3uF6fLOKQSjGmZVdTbScvaCd3H/z/3LzqBUbEmw57rpqlhmixVY?=
 =?us-ascii?Q?bZRXlrts/wFCB8GuxAnME5qejEXqU8NKVfnulP635XCCfKNYZh/CTFXLbHiA?=
 =?us-ascii?Q?k8oi9eKT+SEhvdfEht4Sdmm5XNVK4maVLPriURXrVBVvYGJAXta3HCuT0xi/?=
 =?us-ascii?Q?kZvnzrDfCFY4KcbL5bBlNkLfEPZFxzEl9oaF4UCCyhcNDvcZPZ7d4L+FOtAI?=
 =?us-ascii?Q?y8+yYN9v9o045sqr4dL3mD3BlsDi+6dxoJ0ZRWKGYEDuDDlUH5YvsrT1QvtW?=
 =?us-ascii?Q?9KQfRpZ9?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363303bb-f481-4b9b-989f-08d8bb890c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 08:14:16.0858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6544nu2K273ONeIMFFuKITt/nMOE7eQqOtBK0qIk7k3SughVfTw5xsIMiAlkF116Yy54y4WlT0LZ1PWDCbzHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_031421_091226_14E3FAD8 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/18 17:12, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Mon, Jan 18, 2021 at 3:05 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>> This series of patches improves support for boards based on the Canaan
>> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
>> already included in the kernel. These patches complete it, enabling
>> support for most peripherals present on the SoC as well as introducing
>> device trees for the various K210 boards available on the market today
>> from SiPeed and Kendryte.
> 
> Thanks for your series!
> 
>> A tree with all patches applied is available here:
>> https://github.com/damien-lemoal/linux, k210-sysctl-v26 branch.
> 
> I think you forgot to push?

Ooops. Yes, I did forget :( I only pushed to my internal git server.
Will push to github in a few minutes.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
