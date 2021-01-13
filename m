Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B06C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 09:15:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E388822D58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 09:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E388822D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=r5ESFk88hhKGZwVgThgcbhQ4BDYKM39ktu18IRafCXs=; b=vWjFUqAg7p5bcK7DyqLMj8748
	hvxLxGl5D3DLNBsVVCnbOeuteUGgr/PYGNOBsReCgzqdUzPLVjALNVY/u9frEcgip42kAwTx/iNII
	vgf1we9V1F5/toIiFj86TLJm4aesp1GOEgr54TUXIEdZ97wfGw4d9mKksbBQmJBGKiILkgxHdLkSP
	vVShTHmxqyiRRO46gEJGB2DyepVAxbG3MBkYa2DA1C9rq60CdmUPIiUQrIiL7DKr2k1YfyaaoR0SK
	KtSyNqMIED98vkzMW9t7nFmH4FyJCdfSHfiM5IAheJYvoN1Or3J7FP+EN/eTclzT0PASq6aq3q4tq
	YjqKsFVBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzcF8-0005vS-7v; Wed, 13 Jan 2021 09:15:06 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzcF3-0005tT-Gb
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 09:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610529451; x=1642065451;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=9FhE8JNsmXq5EDImfxgB1V9KUXRS1iGU3wyVDx3JeKQ=;
 b=LqMRS9AobD4YlS33+EYc+w4lToNHtQAY9xpAFnWbW37VIzriDIFHkIdI
 MU2lXZGk6uHVmiN+pXRoip391ilqejiDxZqeqfupFj2FVFY8lo3lEhtAH
 aanVu2e/K3d4LjAltY0x/7vAk4E+wO59BvSIBuaX30q1rRPMbyQl4J3bo
 LdSP8yhBEcd0sciExPbTpYvh2ZZomtZS8ox+S/c1qGVPq9J5k/68XcecZ
 BlX9nkiddPPnjYhDWf8DzwKOCO3hKEv2oCBg/mxt/Kyf1nr6t3sogH2dE
 91EE8VXuXFQPfQbuzYkreHoytzbaZqfKC5JEvxGFwGMuutnfQRJpOjv/3 A==;
IronPort-SDR: 2x0Jhdf3ECkAYpWKPqMOYazYQ0aPvzccKmgnQOSbdVPansciSF5LoIA1ghF3sNsBi6kWpW/iz9
 yapAApZFcBiDfrp4UOfCNNgIe6okKtbid3BP/t/1QayNYIy0EA4JeHu2C07wIBWF3ZxbydJCkj
 +n4wMoI19C7DCDLwsQ2qAt4l5/B/PqO4piKHoH++6c/EODuYlQxQZ/ss/1zzFwdV8N62JKzrRu
 SerFVwDubu9Yakst7QP8iLkZX2ksFqsNerH8fp5k30XQ4qaeFbsRF0LeM0ywd0nxBH1DzetO+y
 lQY=
X-IronPort-AV: E=Sophos;i="5.79,344,1602518400"; d="scan'208";a="261227395"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jan 2021 17:17:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbrqVbghJ0OOtw+ISyfN3w6rBlUxTb/2kw4F8D3pTkPG5Th8MHqdXCV9c1TesCzMQu98fTFoc9l68j5HRLE8B31Mz9yd8oNDC3HCXp+9VoPukluaPjwlISHp7KfZ1OEkPgnvFZIA7oniGFioASzM/GlgrRchhqfLeKgBMdKDe5FicxcP9M5dD087iOJ7uXKOdyyAmCNJLfStV4Hgla5cGFmAEQbFOrzN1AqgWl3aNa6nkaaYcVcpF2Olqiuj3fPxu0uhc8dQh79R3NzaGjT0+p+hnftOSoXQLcP/foLZU3PQUryiDCNT8KdebqhDqPgegd/2jbphcpS5jBAhflA5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CajsuMRQgfglv5tw0rwGhejvu9Px0m87/eP4X6EsakY=;
 b=INAZ3b4MJXt4LM/zBPOCZrtFb+0HYNmR8Xb8KH0X6jdCPXMyTd0RffnFc4vSN3X/Udf9l8UvCrjQ720h1pQpYK7i3M6ekrfUhGePElB0Zb/yOHBrUzDhjNIhENGmhiL1XjwEZFKn/DuXjlDukphZGBs/2VDsoTaS07xCqounZZUkWDk2VmZfu2vUvwAItcX4GE4SI6pwduNrnPOS8pkFiAl1FkCUlOF35WMxBVyP9Kqvorhldugo4Bl7AdyEnFE6FAdP17w0ayJ/ToawCfaA66fWvgguY1e/eM+ODmI55XQ8JqRXNw9A5Qro3eiO+xIdtminzdvenqBiycTBOUTWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CajsuMRQgfglv5tw0rwGhejvu9Px0m87/eP4X6EsakY=;
 b=a6pe1LoNMwK7qLF2WKg5n2m/gIpY2rHD71PWc4WPv6zi6qPB3hemJoXVOodgbRQ03Zkgm/HfrMUzeskyH3Mnf8imE1xbockoehkfUuOhHOez0J9Oe/cXauQ9D/x3YS84+qROt5g9BuL4sVJ9iIjGgghFCceCBVRYY6Wyw/PkwO4=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7015.namprd04.prod.outlook.com (2603:10b6:610:95::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Wed, 13 Jan
 2021 09:14:56 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%8]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 09:14:56 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW6H6jBxZahSfnlkqtd1vCx2d05w==
Date: Wed, 13 Jan 2021 09:14:56 +0000
Message-ID: <CH2PR04MB6522338950B5E95650374431E7A90@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
 <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:e53d:bea0:4863:19b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbb2ca3a-9cf3-45be-b503-08d8b7a3b1ee
x-ms-traffictypediagnostic: CH2PR04MB7015:
x-microsoft-antispam-prvs: <CH2PR04MB7015EF04D375226D4EC040DEE7A90@CH2PR04MB7015.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xuU6M87jxcwMLlYEni6hoIQDQ7+FtDyFeFGXZpoDQUjrrCB8eXam0ZnC/IfrsUZkRr4IWGZZm7y8On/Shk8RhVDMa/7unNS6d8Tz2aTlyB/gSj1M2qzFPVE6mVdRrxZTA6ZWsYy+kII1uE1cTLiDulZVsZMVcHYqT06hIczYO/zGz6CHoIaaBR4/cOdyytOtIZMmrkVKSxksQP6Hr6i+V/8KBNh6zj9qH0mO6ki01uAY5pBEufKBKDpHvoHiakWgHTWL9eXYehF2WaB57+43FSVAuivIcWdQ5/qWTFFkkmXmBWCkZfqw1eI1qJBsOTADNFMHquOAV8Via94dzQF+fDgfdoqdijFfW2u3uTr4wnOO5FuvJh3XUq19tO48x8x7O1pT+X0w/2zm9+NYqqS6ZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(71200400001)(7696005)(8676002)(30864003)(5660300002)(33656002)(86362001)(91956017)(66946007)(110136005)(55016002)(478600001)(2906002)(8936002)(66556008)(9686003)(6506007)(53546011)(83380400001)(66446008)(4326008)(316002)(64756008)(186003)(52536014)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iIJgMXOXRMKxf9l1B2+uLQ9hTcSiHhRqL8qrCpSc1mYPwnkdHlDN+kZDP+mN?=
 =?us-ascii?Q?85klP4zokWt5HEMo5Jt+2AQ63xeIrJ2FRKffadsdNelT3h7QkxdPimMY14wU?=
 =?us-ascii?Q?YSpXP6Zc+s1Bh2veHzrhKktME4meXILR5JQ701Pkleowrx6W88snCOhNNMOD?=
 =?us-ascii?Q?DlxnhtFfm4/quq7/fdv8tOTSYpSEIno7pQZ/7+oYXAByIrRTSu/VuMaQK6TG?=
 =?us-ascii?Q?K+1wSu9O5vSmjNZJxPYP3brL6sVeYjeZoybWoPU/Ap0UQsv2iGROruKcaG7l?=
 =?us-ascii?Q?KFdmcHJNcteXMQCFIDqja8dlHlipxKMK4cyYpULlNi98Cz5AC5gjopbeeiIX?=
 =?us-ascii?Q?UyOvKDsamyvvEODQSsqq7WhBavOdX36oiJFiPKwpNeSPhSx15NM59pTAGF9z?=
 =?us-ascii?Q?NcD/F1MUWLzllsLJWKQavfSey2mQmRUJyJqTVZd7HoyVf4WosTU/uC86E4ae?=
 =?us-ascii?Q?bdbGHTZUBc/ffkDLt81FFGJ2zMKR/34w4YIsSYkSnMC9nfOhDYBdRn/eOCSW?=
 =?us-ascii?Q?Sa4O9bcSO4/fEtvB5NN5rR+jmnoOT3Olc+kPdgeE6xQLAQdmtAiXIyMBZit9?=
 =?us-ascii?Q?i9P21oC5rGuj/n+mK4QW4xMxbZh7BTnNHkQQDKpE9unHn7hylBeDUm7Vge91?=
 =?us-ascii?Q?4S7rmGpjkPtqB81xjxPGVIlSgNs2ZNYXtIlWvbJ3idCBmbfF9QGhxSi1CVoy?=
 =?us-ascii?Q?/ZaddoFsLM1gCTCEJWBuVXEiRIfomlsLCtNNCXoNztbPZadyBSzMZHTc9m+6?=
 =?us-ascii?Q?3OoOU+Bl9nJ3umNirH06WBK/t96XSkWGN4cGqJAREEqJ1BsZ3lQSE0705MiP?=
 =?us-ascii?Q?w/mSPlRkpfYG6ax4yGotHk8p5z7Zrz5NHhhPWSox77OTPq81cwS8dE3htpiY?=
 =?us-ascii?Q?S/g41uTJiVuXFm+2QdRrq3xNAqY10cpFrW1N67X9M8I7LEv8S3+YWm3+ibxC?=
 =?us-ascii?Q?ZfjINQnXFUEYGbYc8+jykNrRlhwhKdYQeMy9LHBjoPn7I6PoQy8xeAoZKbEk?=
 =?us-ascii?Q?xLjI2S6u0b474IwYYiDPn+1bx/K4d2ha2qp13YRu9FJGp7d4sDCQa79EgsKl?=
 =?us-ascii?Q?9HXIAFiM?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb2ca3a-9cf3-45be-b503-08d8b7a3b1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 09:14:56.4692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IeZKLudEWkH3cUaEAywuHo6pwbuB9YySRe7lY3bUcn3cePSn8Egol/yeqH++LAMmQWsVGY8mCjA+JHpIAHSSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_041502_055318_1C6A3172 
X-CRM114-Status: GOOD (  25.24  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/13 17:25, Stephen Boyd wrote:
> Quoting Damien Le Moal (2021-01-11 17:02:38)
>> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
>> This new driver with the compatible string "canaan,k210-clk" implements
>> support for the full clock structure of the K210 SoC. Since it is
>> required for the correct operation of the SoC, this driver is
>> selected by default for compilation when the SOC_CANAAN option is
>> selected.
>>
>> With this change, the k210-sysctl driver is turned into a simple
>> platform driver which enables its power bus clock and triggers
>> populating its child nodes. This driver is also automatically selected
>> for compilation with the selection of SOC_CANAAN.
> 
> That's stated twice.
> 
>> The sysctl driver
>> retains the SOC early initialization code, but the implementation now
>> relies on the new function k210_clk_early_init() provided by the new
>> clk-k210 driver.
>>
>> The clock structure implemented and many of the coding ideas for the
>> driver come from the work by Sean Anderson on the K210 support for the
>> U-Boot project.
>>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: linux-clk@vger.kernel.org
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  MAINTAINERS                      |    1 +
>>  drivers/clk/Kconfig              |    8 +
>>  drivers/clk/Makefile             |    1 +
>>  drivers/clk/clk-k210.c           | 1005 ++++++++++++++++++++++++++++++
>>  drivers/soc/canaan/Kconfig       |   18 +-
>>  drivers/soc/canaan/Makefile      |    2 +-
>>  drivers/soc/canaan/k210-sysctl.c |  205 ++----
>>  include/soc/canaan/k210-sysctl.h |    2 +
>>  8 files changed, 1064 insertions(+), 178 deletions(-)
>>  create mode 100644 drivers/clk/clk-k210.c
> 
> I'm not sure how/if this can be merged through clk tree given that it
> deletes code from drivers/soc/
> 
> What's the merge strategy?

There is a patch preceding this one that renames drivers/soc/kendryte to
drivers/soc/canaan, so I don't think the patch will apply to your clock tree. Is
it OK if Palmer takes this one in the riscv tree ?

[...]
>> +/**
>> + * struct k210_clk - Driver data
>> + * @regs: system controller registers start address
>> + * @clk_lock: clock setting spinlock
>> + * @plls: SoC PLLs descriptors
>> + * @aclk: ACLK clock
>> + * @clks: All other clocks
>> + * @parents: array of pointers to clocks used as parents for muxed clocks.
>> + * @clk_data: clock specifier translation for all clocks
>> + */
>> +struct k210_clk {
>> +       void __iomem                    *regs;
>> +       spinlock_t                      clk_lock;
>> +       struct k210_pll                 plls[K210_PLL_NUM];
>> +       struct clk_hw                   aclk;
>> +       struct clk_hw                   clks[K210_NUM_CLKS];
>> +       const struct clk_hw             *parents[K210_PARENT_NUM_CLKS];
>> +       struct clk_hw_onecell_data      *clk_data;
>> +};
>> +
>> +static struct k210_clk *kcl;
> 
> Please remove this and get to it from the clk hw structure.

OK.

> 
>> +
>> +/*
>> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
>> + */
>> +static void k210_aclk_set_selector(u8 sel)
>> +{
>> +       u32 reg = readl(kcl->regs + K210_SYSCTL_SEL0);
>> +
>> +       if (sel)
>> +               reg |= K210_ACLK_SEL;
>> +       else
>> +               reg &= K210_ACLK_SEL;
>> +       writel(reg, kcl->regs + K210_SYSCTL_SEL0);
>> +}
>> +
>> +static void k210_init_pll(struct k210_pll *pll, enum k210_pll_id id,
>> +                         void __iomem *base)
>> +{
>> +       pll->id = id;
>> +       pll->lock = base + K210_SYSCTL_PLL_LOCK;
>> +       pll->reg = base + k210_plls_cfg[id].reg;
>> +       pll->lock_shift = k210_plls_cfg[id].lock_shift;
>> +       pll->lock_width = k210_plls_cfg[id].lock_width;
>> +}
>> +
>> +static void k210_pll_wait_for_lock(struct k210_pll *pll)
>> +{
>> +       u32 reg, mask = GENMASK(pll->lock_shift + pll->lock_width - 1,
>> +                               pll->lock_shift);
>> +
>> +       while (true) {
> 
> Any timeout here? Otherwise this is an infinite loop if the hardware
> misbehaves.

No timeout from the hardware for sure. I can add one in the loop here. However,
since this is used super early in the code when there is no possibility yet of
getting real time, the timeout needs to be a limit on the number of iteration
for the loop. That limit will be super arbitrary at best... But definitely, that
will avoid an infinite loop.

> 
>> +               reg = readl(pll->lock);
>> +               if ((reg & mask) == mask)
>> +                       break;
>> +
>> +               reg |= BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
>> +               writel(reg, pll->lock);
>> +       }
>> +}
>> +
>> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
>> +{
>> +       u32 reg = readl(pll->reg);
>> +       u32 mask = K210_PLL_PWRD | K210_PLL_EN;
>> +
>> +       if (reg & K210_PLL_RESET)
>> +               return false;
>> +
>> +       return (reg & mask) == mask;
>> +}
>> +
>> +static void k210_pll_enable_hw(struct k210_pll *pll)
>> +{
>> +       struct k210_pll_cfg *pll_cfg = &k210_plls_cfg[pll->id];
>> +       unsigned long flags;
>> +       u32 reg;
>> +
>> +       spin_lock_irqsave(&kcl->clk_lock, flags);
>> +
>> +       if (k210_pll_hw_is_enabled(pll))
>> +               goto unlock;
>> +
>> +       /*
>> +        * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cores and
>> +        * SRAM running.
>> +        */
>> +       if (pll->id == K210_PLL0)
>> +               k210_aclk_set_selector(0);
>> +
>> +       /* Set PLL factors */
>> +       reg = readl(pll->reg);
>> +       reg &= ~GENMASK(19, 0);
>> +       reg |= FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
>> +       reg |= FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
>> +       reg |= FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
>> +       reg |= FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
>> +       reg |= K210_PLL_PWRD;
>> +       writel(reg, pll->reg);
>> +
>> +       /*
>> +        * Reset the PLL: ensure reset is low before asserting it.
>> +        * The magic NOPs come from the Kendryte reference SDK.
>> +        */
>> +       reg &= ~K210_PLL_RESET;
>> +       writel(reg, pll->reg);
>> +       reg |= K210_PLL_RESET;
>> +       writel(reg, pll->reg);
>> +       nop();
>> +       nop();
>> +       reg &= ~K210_PLL_RESET;
>> +       writel(reg, pll->reg);
>> +
>> +       k210_pll_wait_for_lock(pll);
>> +
>> +       reg &= ~K210_PLL_BYPASS;
>> +       reg |= K210_PLL_EN;
>> +       writel(reg, pll->reg);
>> +
>> +       if (pll->id == K210_PLL0)
>> +               k210_aclk_set_selector(1);
>> +
>> +unlock:
>> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
>> +}
>> +
>> +static void k210_pll_disable_hw(struct k210_pll *pll)
>> +{
>> +       unsigned long flags;
>> +       u32 reg;
>> +
>> +       /*
>> +        * Bypassing before powering off is important so child clocks do not
>> +        * stop working. This is especially important for pll0, the indirect
>> +        * parent of the cpu clock.
>> +        */
>> +       spin_lock_irqsave(&kcl->clk_lock, flags);
>> +       reg = readl(pll->reg);
>> +       reg |= K210_PLL_BYPASS;
>> +       writel(reg, pll->reg);
>> +
>> +       reg &= ~K210_PLL_PWRD;
>> +       reg &= ~K210_PLL_EN;
>> +       writel(reg, pll->reg);
>> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
>> +}
>> +
>> +static int k210_pll_enable(struct clk_hw *hw)
>> +{
>> +       k210_pll_enable_hw(to_k210_pll(hw));
>> +
>> +       return 0;
>> +}
>> +
>> +static void k210_pll_disable(struct clk_hw *hw)
>> +{
>> +       k210_pll_disable_hw(to_k210_pll(hw));
> 
> Why the extra wrapper? Inline k210_pll_disable_hw() here? Same for
> enable.

k210_pll_disable_hw() is used in k210_clk_early_init() when there is not yet any
clk_hw struct available (only the reg iomap). Hence this lower level function to
avoid repeating the code.

> 
>> +}
>> +
>> +static int k210_pll_is_enabled(struct clk_hw *hw)
>> +{
>> +       return k210_pll_hw_is_enabled(to_k210_pll(hw));
> 
> Same comment.

k210_pll_hw_is_enabled() is also used in k210_pll_enable_hw(). I can remove
k210_pll_enable_hw() and code it as k210_pll_enable(). I wanted to be symmetric
with the enable/disable/is_enabled ops though, so I added k210_pll_enable_hw()
despite it not being really needed. I can remove it.

[...]
>> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
>> +{
>> +       struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
>> +       unsigned long flags;
>> +       u32 reg;
>> +
>> +       if (!kclk->mux_reg) {
>> +               if (WARN_ON(index != 0))
> 
> Why would this ever happen? Seems like we don't want to allow different
> parents? But then why allow set_parent to be called?

Arg. Yes. If mux_reg is not set, then this is not a muxed clock. So we don't
need set_parent(). Will fix that.

[...]
>> +static inline struct clk_hw *k210_register_critical_clk(int id,
>> +                                       enum k210_parent_idx parent_idx)
>> +{
>> +       return k210_register_clk(id, parent_idx, 1, CLK_IS_CRITICAL);
> 
> Why critical? Please add a comment. Or that is lower down? Maybe move
> that comment up to this inline function instead.

There is a comment in k210_clk_init() where all calls to
k210_register_critical_clk() are grouped together. It says:

/*
 * Critical clocks: there are no consumers of the SRAM clocks,
 * including the AI clock for the third SRAM bank. The CPU clock
 * is only referenced by the uarths serial device and so would be
 * disabled if the serial console is disabled. Mark all these clocks
 * as critical so that they are never disabled by the core clock
 * management.
 */

I could remove the SRAM and AI clocks controlling the 3 memory banks, however,
they are handy to have around since the CPU clock can be changed on this board
but doing so requires that the SRAM and AI clocks also be reconfigured to have a
frequency that is a divisor of the CPU clock. Otherwise, the board hangs...
The CPU clock frequency adjustment is not in yet and is for later.

> 
>> +}
>> +
>> +static inline struct clk_hw *k210_register_child(int id,
>> +                                       enum k210_parent_idx parent_idx)
>> +{
>> +       return k210_register_clk(id, parent_idx, 1, 0);
>> +}
>> +
>> +static inline struct clk_hw *k210_register_in0_child(int id)
>> +{
>> +       return k210_register_child(id, K210_PARENT_IN0);
>> +}
>> +
>> +static inline struct clk_hw *k210_register_pll0_child(int id)
>> +{
>> +       return k210_register_child(id, K210_PARENT_PLL0);
>> +}
>> +
>> +static inline struct clk_hw *k210_register_pll2_child(int id)
>> +{
>> +       return k210_register_child(id, K210_PARENT_PLL2);
>> +}
>> +
>> +static inline struct clk_hw *k210_register_aclk_child(int id)
>> +{
>> +       return k210_register_child(id, K210_PARENT_ACLK);
>> +}
>> +
>> +static inline struct clk_hw *k210_register_apb0_child(int id)
>> +{
>> +       return k210_register_child(id, K210_PARENT_APB0);
>> +}
>> +
>> +static inline struct clk_hw *k210_register_apb1_child(int id)
>> +{
>> +       return k210_register_child(id, K210_PARENT_APB1);
>> +}
>> +
>> +static void __init k210_clk_init(struct device_node *np)
>> +{
>> +       struct device_node *sysctl_np;
>> +       struct clk_hw **hws;
>> +       struct clk *in0;
>> +       int i, ret;
>> +
>> +       kcl = kzalloc(sizeof(*kcl), GFP_KERNEL);
>> +       if (!kcl)
>> +               return;
>> +
>> +       kcl->clk_data = kzalloc(struct_size(kcl->clk_data, hws, K210_NUM_CLKS),
>> +                               GFP_KERNEL);
>> +       if (!kcl->clk_data)
>> +               return;
>> +
>> +       sysctl_np = of_get_parent(np);
>> +       kcl->regs = of_iomap(sysctl_np, 0);
>> +       of_node_put(sysctl_np);
>> +       if (!kcl->regs) {
>> +               pr_err("%pOFP: failed to map registers\n", np);
>> +               return;
>> +       }
>> +
>> +       spin_lock_init(&kcl->clk_lock);
>> +       kcl->clk_data->num = K210_NUM_CLKS;
>> +       hws = kcl->clk_data->hws;
>> +       for (i = 0; i < K210_NUM_CLKS; i++)
>> +               hws[i] = ERR_PTR(-EPROBE_DEFER);
>> +
>> +       /* Get the system base fixed-rate 26MHz oscillator clock */
>> +       in0 = of_clk_get(np, 0);
>> +       if (IS_ERR(in0)) {
>> +               pr_err("%pOFP: failed to get base fixed-rate oscillator\n", np);
>> +               return;
>> +       }
>> +       kcl->parents[K210_PARENT_IN0] = __clk_get_hw(in0);
> 
> This shouldn't be necessary. Specify the DT node index in the
> parent_data structure instead.

I am not sure I understand what you mean here. There are multiple possible
parents. And only IN0 has a DT node. The parents array is used for all muxed
clocks since they all have the same first 2 parents (IN0 and PLL0). See the
comment in k210_register_mux_clk(). I thought this was a clean way of setting
things up without a parent array for each mux clock.

> 
>> +
>> +       ret = k210_register_plls(np);
>> +       if (ret)
>> +               return;
>> +
>> +       ret = k210_register_aclk(np);
>> +       if (ret)
>> +               return;
>> +
>> +       /*
>> +        * Critical clocks: there are no consumers of the SRAM clocks,
>> +        * including the AI clock for the third SRAM bank. The CPU clock
>> +        * is only referenced by the uarths serial device and so would be
>> +        * disabled if the serial console is disabled. Mark all these clocks
>> +        * as critical so that they are never disabled by the core clock
>> +        * management.
>> +        */
>> +       hws[K210_CLK_CPU] =
>> +               k210_register_critical_clk(K210_CLK_CPU, K210_PARENT_ACLK);
>> +       hws[K210_CLK_SRAM0] =
>> +               k210_register_critical_clk(K210_CLK_SRAM0, K210_PARENT_ACLK);
>> +       hws[K210_CLK_SRAM1] =
>> +               k210_register_critical_clk(K210_CLK_SRAM1, K210_PARENT_ACLK);
>> +       hws[K210_CLK_AI] =
>> +                k210_register_critical_clk(K210_CLK_AI, K210_PARENT_PLL1);
>> +
>> +       /* Clocks with aclk as source */
>> +       hws[K210_CLK_DMA] = k210_register_aclk_child(K210_CLK_DMA);
>> +       hws[K210_CLK_FFT] = k210_register_aclk_child(K210_CLK_FFT);
>> +       hws[K210_CLK_ROM] = k210_register_aclk_child(K210_CLK_ROM);
>> +       hws[K210_CLK_DVP] = k210_register_aclk_child(K210_CLK_DVP);
>> +       hws[K210_CLK_APB0] = k210_register_aclk_child(K210_CLK_APB0);
>> +       hws[K210_CLK_APB1] = k210_register_aclk_child(K210_CLK_APB1);
>> +       hws[K210_CLK_APB2] = k210_register_aclk_child(K210_CLK_APB2);
>> +
>> +       /* Clocks with PLL0 as source */
>> +       hws[K210_CLK_SPI0] = k210_register_pll0_child(K210_CLK_SPI0);
>> +       hws[K210_CLK_SPI1] = k210_register_pll0_child(K210_CLK_SPI1);
>> +       hws[K210_CLK_SPI2] = k210_register_pll0_child(K210_CLK_SPI2);
>> +       hws[K210_CLK_I2C0] = k210_register_pll0_child(K210_CLK_I2C0);
>> +       hws[K210_CLK_I2C1] = k210_register_pll0_child(K210_CLK_I2C1);
>> +       hws[K210_CLK_I2C2] = k210_register_pll0_child(K210_CLK_I2C2);
>> +
>> +       /* Clocks with PLL2 as source */
>> +       hws[K210_CLK_I2S0] = k210_register_pll2_child(K210_CLK_I2S0);
>> +       hws[K210_CLK_I2S1] = k210_register_pll2_child(K210_CLK_I2S1);
>> +       hws[K210_CLK_I2S2] = k210_register_pll2_child(K210_CLK_I2S2);
>> +       hws[K210_CLK_I2S0_M] = k210_register_pll2_child(K210_CLK_I2S0_M);
>> +       hws[K210_CLK_I2S1_M] = k210_register_pll2_child(K210_CLK_I2S1_M);
>> +       hws[K210_CLK_I2S2_M] = k210_register_pll2_child(K210_CLK_I2S2_M);
>> +
>> +       /* Clocks with IN0 as source */
>> +       hws[K210_CLK_WDT0] = k210_register_in0_child(K210_CLK_WDT0);
>> +       hws[K210_CLK_WDT1] = k210_register_in0_child(K210_CLK_WDT1);
>> +       hws[K210_CLK_RTC] = k210_register_in0_child(K210_CLK_RTC);
>> +
>> +       /* Clocks with APB0 as source */
>> +       kcl->parents[K210_PARENT_APB0] = hws[K210_CLK_APB0];
>> +       hws[K210_CLK_GPIO] = k210_register_apb0_child(K210_CLK_GPIO);
>> +       hws[K210_CLK_UART1] = k210_register_apb0_child(K210_CLK_UART1);
>> +       hws[K210_CLK_UART2] = k210_register_apb0_child(K210_CLK_UART2);
>> +       hws[K210_CLK_UART3] = k210_register_apb0_child(K210_CLK_UART3);
>> +       hws[K210_CLK_FPIOA] = k210_register_apb0_child(K210_CLK_FPIOA);
>> +       hws[K210_CLK_SHA] = k210_register_apb0_child(K210_CLK_SHA);
>> +
>> +       /* Clocks with APB1 as source */
>> +       kcl->parents[K210_PARENT_APB1] = hws[K210_CLK_APB1];
>> +       hws[K210_CLK_AES] = k210_register_apb1_child(K210_CLK_AES);
>> +       hws[K210_CLK_OTP] = k210_register_apb1_child(K210_CLK_OTP);
>> +
>> +       /* Mux clocks with in0 or pll0 as source */
>> +       hws[K210_CLK_SPI3] = k210_register_mux_clk(K210_CLK_SPI3);
>> +       hws[K210_CLK_TIMER0] = k210_register_mux_clk(K210_CLK_TIMER0);
>> +       hws[K210_CLK_TIMER1] = k210_register_mux_clk(K210_CLK_TIMER1);
>> +       hws[K210_CLK_TIMER2] = k210_register_mux_clk(K210_CLK_TIMER2);
>> +
>> +       for (i = 0; i < K210_NUM_CLKS; i++) {
>> +               if (IS_ERR(hws[i])) {
>> +                       pr_err("%pOFP: register clock %s failed %ld\n",
>> +                              np, k210_clks[i].name, PTR_ERR(hws[i]));
>> +                       return;
>> +               }
>> +       }
>> +
>> +       ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->clk_data);
>> +       if (ret) {
>> +               pr_err("%pOFP: add clock provider failed %d\n", np, ret);
>> +               return;
>> +       }
>> +
>> +       pr_info("%pOFP: CPU running at %lu MHz\n",
>> +               np, clk_hw_get_rate(hws[K210_CLK_CPU]) / 1000000);
>> +}
>> +
>> +CLK_OF_DECLARE(k210_clk, "canaan,k210-clk", k210_clk_init);
>> +
>> +/*
>> + * Enable PLL1 to be able to use the AI SRAM.
>> + */
>> +void __init k210_clk_early_init(void __iomem *regs)
> 
> Is it impossible to put this into the bootloader? Does riscv have some
> boot constraints or requirements that say memory should be working
> before the kernel starts? Otherwise this is depressing that we have to
> enable clks to get memory to work early like this.

Given the very low amount of memory on this board (8MB total), booting it
without a boot loader, with the board startup directly jumping to kernel start
at address 0x800000000, is more efficient. Sean added U-boot support but using
the board without it with a builtin DTB is far easier and does not mandate using
the SD card.

For this particular phase of the initialization, this has nothing to do with
RISC-V. This is specific to this board where the third 2MB SRAM bank is by
default off when the board powers-up. This bank is by default reserved for the
SoC KPU which is an AI acceleration engine. This memory can however be
referenced and used as general purpose by the CPU, but it has to be turned on
first using PLL1. Turning it on super early is needed as the DT is moved toward
the end of the address space when it is parsed early in the startup code.

> 
>> +{
>> +       struct k210_pll pll1;
>> +
>> +       /* Make sure ACLK selector is set to PLL0 */
>> +       k210_aclk_set_selector(1);
>> +
>> +       /* Startup PLL1 to enable the aisram bank for general memory use */
>> +       k210_init_pll(&pll1, K210_PLL1, regs);
>> +       k210_pll_enable_hw(&pll1);
>> +}
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
