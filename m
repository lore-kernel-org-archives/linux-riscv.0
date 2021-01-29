Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7CDC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 04:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57EC164DFA
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 04:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57EC164DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=RKQHtcEHVYzv3uCnCb4Mnwu7ntuxpJiO5tlrRHHoZdE=; b=tEFWcwtPp3C4J5lV/iruqTQY4
	VQ6ODJQddlmRRfrdIGMOFiWexyWZryvIfmNZfUzUv0txN93p0BQ36u+IDa+HQMx0EKWDV2VxUexPG
	CTpXaxsrPWDl4kxunRNjnkuDWK7t/BFPOThMx2JJloWiniC0BIt+0Sknewh+/9u0Q/RzkVLWX1tpF
	anAjWqZiZIJ0xesgEFPgPxBqhXb3hwQkcrmbG9chcywWL1SL48wImrg2QQad3P28axtcn9ptQnVou
	4wwVDALj3vtcB8d71GlkYFvll7m6UUNtOAWI/CD4iQGZrlr+oTLlYy7/qTy/g2uwWylnO4GIBkyit
	AN533fcQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5L7M-0004Vw-2x; Fri, 29 Jan 2021 04:10:44 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5L7I-0004Va-JM
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 04:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611893440; x=1643429440;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=urs1FaxsRuQl2irJnpqRorF6XzIQp6AFCnTgADLGOlY=;
 b=BZaiSKOS+FnPIG2zDoSv+O3riX6aH8cN0KT3IPMzwwRldgkwD79Uueja
 5sE1uRLMfbThr6mZ2vVxLWpg6hoOZm/Wu9LDrxghas3T6BnJZeKIcZCMX
 4NSBsxZpS26oR5xkMXjf32IGODz+BsKUzjToHgqm81mKV5cTokw31TeTJ
 3DUOqhFlM4lrQC7aQKMB8GLA6FYVRuRmjT0EkOofcW5bEnbPlxdQcR7EB
 RScJBVR0jnoypHP+d3BaXIK4OUqYBpFYiKD6KVV2L/p0/TKK1H6GLIwjG
 OOTH8mVI13LfLppX2MWxcrOn5UR+zh+gzZzdgqm+IgZJ6Bsy+E76HFleD Q==;
IronPort-SDR: deIIppE7MUFrUjMj3WoXgXe4jzOrXSGavY4kHjOu5KVJ6Zcn2oON2WXUV8ngzYzddyyLwYtyQ7
 RZaXXpG3dDWvDdfVFBb4ZzAvEsUS2Ky5CfNa1oGFo9rXOmJCCrIIrgAF1FFyXmTJthuvAFtd4E
 ++7WTKlzaoBk7M4Hj9AqNUTKBpt1DaIQ/yjsWW99Td4Z0T7dYDjBTBYPtuX952hrnqf7AiEsZe
 UOIYrt8qYsUBYrdatCr4YKB5eeC5y2grd6N6PeMNBqt/T4f4kf75vXWvkKdLP4sOZwKB8x2hXx
 eOE=
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; d="scan'208";a="163050398"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jan 2021 12:10:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnraYitsNVRbozp7J2aLc9AjK207LQjUPnyVfHiWT+ruWXCJCFD8wmKdKzsrw1XrMvHy4QQSxKaUzE5JvyT67NhrMXaD+sZsqNCIgiHQRJiJz2PVn5b1ctCqzqgmCnqedthS0tB6XYOOwDNAm3r38KBdFMzEchGRvmcAlUtQkDmrwOhKCXDpps7NhW/UkBRIAMrmsTuvGYZobBc8TkMfDb5Aj9temqw7n6eUE+Q7D5LsuW6zAGBostIEhqJ6gkzNnLsPLOBFP5TR5o3X6cYlZtkwd2WJx/rbbQd0VEkEF2BsT6ETA0CqN5PWoRXtmmP4X0/dviISR/x9JTv3jsTjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urs1FaxsRuQl2irJnpqRorF6XzIQp6AFCnTgADLGOlY=;
 b=dVMWMS1aHa8VMEgj1/SpyHHnHVMimK6RNQS+87R7HUPnvfmzoQ6Ev72JpVII0HS/bBNjn+qeG9/0iy/4mdwAL2jUrMJYkh2z+OURP3JroJ7UcSztIiG9MOHxKtJVShWR2Qz/jH3epQ9AoMXHnV7ILpwQuMK7uRqVD9YF8TGYaDIbLmrwwkDSpHL8nyGsZm93TlhdQdHX1erXV9wpw0oZgqSObgqeL9sVbWyzKX8DRdJj/ZKNiW6YKLKQ1MctA0i3wygkA0sGoN3wL0o+sbDKjmOKQARcud2kW3Xcu/KnfGnk99OqpgCum/2OTsgeXn4JnhJHrAwavYjn7dh5Xo2vRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urs1FaxsRuQl2irJnpqRorF6XzIQp6AFCnTgADLGOlY=;
 b=ul3b2/a2nLvsanKOZaAUnmRtVbJe1EhlDLkkwC7IO4Ya0lHehOIbVfthxGuFghN8m25BQaKLqMlMY4wjYmHijWRxFp/HNj8sYYFyvY7t9HNovRVZZAwHBkAdU0uE+94AmXLUUyQ0uRUvlsOVTxOUXs42DPw1qEN+tDsQYAqF+c0=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6757.namprd04.prod.outlook.com (2603:10b6:610:98::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Fri, 29 Jan
 2021 04:10:38 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::c55b:77e5:fa05:3db0]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::c55b:77e5:fa05:3db0%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 04:10:38 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW7T4M5lVOShVlf0aMYmOIexNLQQ==
Date: Fri, 29 Jan 2021 04:10:37 +0000
Message-ID: <CH2PR04MB65228C86A901D28C8E95B0D3E7B99@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
 <20210118020244.103451-2-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:ac6f:3863:44b0:5059]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9bac7f6c-3d67-4416-ca29-08d8c40bd599
x-ms-traffictypediagnostic: CH2PR04MB6757:
x-microsoft-antispam-prvs: <CH2PR04MB6757CE3D745C29CCC6BA1D37E7B99@CH2PR04MB6757.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S4oFzfsDY2izEGC/0lfKYiY5foSdAFYwCUDzpwWcEzExUh4dhavuI9enOZIK2l4frUt8k13KH7ro0+GXbnW5X+O3AnjF0PO4Igyub+BU3RAE01I1zxqsSQ94pi88h1KCIoWRQeQ7h1mKdJpdpRgxEALf7rqigm4f5bcrAF/qW49HOeyz8FaUYY5v1IdB/T4xNrtFMEubTlH2VZy6dFCKdvxgS/Qca3d6lG7CQAKU2iqVln84YlQs7C2NfKQdmVFH5Kj3U2eqs+ua42WJEJhvR95umZapr9ZBQeKkQEmTGHH2tl9LcZJR+Fk1OgAUTQYmlPjpo0mL5CC3aD+jDWht3+BhBzOUM2LLbV1B/AMasNntHjjAxNHBJ3G72mQTSVi0EEhXPm1ADFWFXUIJVDeKf+m+danxZTo8KxE6MB4prn5jqA6oBCqOIMWKcNwmKNop0nGs+Ty+6zwhZa3F9SvSlKR2lMDBYUN7zdQ2OeWpLQ6Lleo8X1giHQdVTG788sEb9OBtRFjrkW0EHDlBWuoocg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(110136005)(478600001)(53546011)(8936002)(8676002)(83380400001)(71200400001)(33656002)(66946007)(9686003)(66556008)(66446008)(86362001)(2906002)(7696005)(6506007)(4326008)(55016002)(66476007)(54906003)(91956017)(5660300002)(186003)(76116006)(52536014)(316002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hCR9fNgO9o98Meu/fJo+SJr6IJ3BuQnTAx9txSco5cxE640uaIIXiS89rOE1?=
 =?us-ascii?Q?EUX5Rrd0denI6WJpeE6r/GZsif8uJGio/QzA/RSzIX+YQlD6epQhwSC49akM?=
 =?us-ascii?Q?SbGDqPHaQ9dseCbXFtOcjNEbRGfU07XALAQkYtz4aKzwVVbX+CNayVcow/UM?=
 =?us-ascii?Q?iEipgqlB/jxZ+y7oX/4b+Oc+87XCiWwylcHguoRWbkjB5bqNAH1pplPTNYWC?=
 =?us-ascii?Q?IN5/MyobjUjbAjkoYoQpq6OWLrC0DBqqOW+fkiPx0rsiAIrAe6Ko4UJYNPky?=
 =?us-ascii?Q?14DKRS3ZxuRzQjP6gyS5qz//sC6ryEK/9bCdhHA9jg9YW63c3biLsIVSsOyN?=
 =?us-ascii?Q?lHH0sVKYvVE73jfMpRZcQ1lQEUrgE+crkxPkG3yxYTLudxPwgVz7GIhZagMU?=
 =?us-ascii?Q?szJrtNeKfgCMs86clmi+3drxcvnBxRYFV32qnzFaMxpj/FTI7Lhr3OjHqG/W?=
 =?us-ascii?Q?ZNgr1gtdXZ329RozuN2CLInW5Bl1glE5uFsAqTLy0BF+As0vKHwuzjhWkfxn?=
 =?us-ascii?Q?XR6hUs7VNFGtJLdBqVdVuGwLUiA6t2mStagqeB7L3BjVA7UXkBaQFWwG+itQ?=
 =?us-ascii?Q?tfFlsf2E+gvpCwC2WqrgMWO0TICxlhlwkrjHb4hUcj9lgnnN+rlHQBagHo0d?=
 =?us-ascii?Q?iW2ZM8/xSMDFT4PUCpqG4IVnmVsTUyLbbsSpGCbJU3SyPfybM+dVLXQyXSmm?=
 =?us-ascii?Q?4aVUbe1LyEP0d0Td3tGajrI/OnYAqySaqX5tBiFoiQG1RJ0VTtyY0cIFkihZ?=
 =?us-ascii?Q?9v1sG/eaJ2mZbIacl+ufB6C66hZs9QZU26IvFz+N+9hrgExfeAvhIEQL2EmC?=
 =?us-ascii?Q?2vs1wopsYK6T8gKrmFKBMwAnfz1AydaeGnbs9F8dnbMdKH6wE7Bm8rX+IGEX?=
 =?us-ascii?Q?zhE5/jD/h6bJa4HcH/BTdlnNtjn3AO8l22Zbqd51sffy/tS1PQptLObqA+hp?=
 =?us-ascii?Q?EjBZbjUpxIn4LowwgJkJCZBYBO5eU0OapCIwm1pP5ap96xkb1434XDFhDv1G?=
 =?us-ascii?Q?XX/FXGRZhd5bMFccmjcNPq3D9qEL8C92r9pf/93DGcZEVbKNsXX7vc9ytD5H?=
 =?us-ascii?Q?l2j/iDpZ4FpXUr2jCzK7TGedtsyuBT986kAt6fBFWgxq0n1vc0+ft7AoFT7r?=
 =?us-ascii?Q?d7dxR3e+RtJJ3JLLOwpORU0vRVVToknhOQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bac7f6c-3d67-4416-ca29-08d8c40bd599
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 04:10:37.9618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eWOEnaa1UUKvixE1lGXOF5BpVF6jvx7O0mWlS4BCbUKjzEERsYc0WXAqos67B8S2KKVky5Yqax20PS65N9TKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_231041_050331_C9BCA361 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/18 11:03, Damien Le Moal wrote:
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
> This new driver with the compatible string "canaan,k210-clk" implements
> support for the full clock structure of the K210 SoC. Since it is
> required for the correct operation of the SoC, this driver is
> selected by default for compilation when the SOC_CANAAN option is
> selected.
> 
> With this change, the k210-sysctl driver is turned into a simple
> platform driver which enables its power bus clock and triggers
> populating its child nodes. The sysctl driver retains the SOC early
> initialization code, but the implementation now relies on the new
> function k210_clk_early_init() provided by the new clk-k210 driver.
> 
> The clock structure implemented and many of the coding ideas for the
> driver come from the work by Sean Anderson on the K210 support for the
> U-Boot project.

Hi Stephen,

Could you please review this patch ? I really would like this series queued up
for 5.12 so that the K210 support is finally completed. And this patch is
mandatory for this to happen.

Thanks !

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
