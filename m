Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6475AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HF1Jk3hd813NBQOSFVi0A2fLI2Ljtl+OJWnOsll8cho=; b=KrXMUn6QVHLxz1
	XeofvnC2P0DydyS2aGXOH4uRif/fyvXrS6TL4yOSHhKjxRJp3Wvs1etFFEH5webaYyTeX3fy6n7JI
	Oo31GMRsvr98LR4euOdzbkT+q4nXTPHbkSiE/ELHlZP9wYvXkBVxHbWCVi82okIDN33BM1Jk71UIa
	X7N1L2YO5TUVz4MX+wfLjhlC0iKENSqnW0y8Y5ay+GbZtVSGXVZQhr8a0WdZj7ctus4TZMgp+FjzT
	mmB5Oh8dtFh8NMVME2XrXnl3m2WQQcXgJ3v4ACpCGzgVSPYVxlLjBK0ExFCl0jjruNfkQWsflwof1
	8AWDtxLtArlwctRPDAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPOpn-002jjo-BN; Wed, 02 Mar 2022 13:16:03 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPOpg-002jgY-OX
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 13:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646226956; x=1677762956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oKlZHsktz4KR1alb360gIot1ZgcsJry8n73LJk6cQhw=;
 b=IxL+Nl4c/Dawlo0LquKMs6nhbu4Rhd7proTDyoDcmcUF9nMBsJP5Tfmb
 U6MrszO/Ga9+u9wA8wcIrZJ8k5mrPhGrvUWQrSlW5/LXnVlc50BOZDIOg
 wl9M2oKdDy9ioOSs4qX5B3CjWJM5D7fYUQW9gV/YgEtsRd1ZP1IojaWf/
 vikR5t4xRP0H2yZEb+uuY9+lr2Zl4V5jouoSkZ8eGREqTrK5IpPHZGG/T
 NQSksQ17DwwWN+rrPyUXIeoIrF4KYLXcZl9dZNqEuHxRTtU01F/vVqmHO
 wbEiOpcfGN3JXjPamRW22fHlKeCjAUIX5JHeAzXLhUQvzaRMJ78Ho9sr/ w==;
X-IronPort-AV: E=Sophos;i="5.90,149,1643644800"; d="scan'208";a="306195809"
Received: from mail-dm6nam08lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2022 21:15:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU1yzBp+rPRr40LbS0YLPFKySK/oMFFymejjWVs7LUiREvVurwFZzmy70Tv5Z5DYxfnk7E5tHUeA9L+nWx2m0PpVqsFy/j6SwOXWdIDLagZBthNuaKnyVDA4pRdOF1iBCzRkFV9O/x7i0+v9+8GuJ/FIffxr4zhCZjf+M+NTL+f9xgMEtt2S7e8fijz03JxSluTpB/9KCiMQDTsTkrQJYGC0gPRX8u+I7iiI2yccc843Wdo4Zguin5uUxx2gX2sIRrYPj9caJMdeeOTidaoFI9EVcxJbbxAQ9csAnlz/UK/iJN3QIJB5KY5b0tl5nBHGJh+9X5c/q3H9E3lLNG7IoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZwlcpTi73E8q+4QP/2zV6eWE+w0HT2Y1ynQWje6o0Y=;
 b=GhXHVf6yUbXnYpfxAcXvqmxRH5k2r4kt7+96C6YbrBPYXPa2X76jvWKYEOMnK1K5beEAUeJXAJ+fK0H7GrE+qkdp6px868PXmKzPcrZiIGoZ4J5lT0UbODNTKCd09rKyJA2L8mJrRUCHGfG0VnpxVryDKFfO/koCciTCT9Oa6zIbbNLRGBn6ARQHIMV7/74WgX/Fgnx9grtkKcZ91r7RMOUVfEt4P0Ptg2RpsrmjxOHVOJ0nn+czZKya1zN/6LF+2KE76zkKVHEec50UxJ4bECa8zTJ/aGwN3cynidKpSNthr80nn+ftdv4QMHJ6jukGdTXbtUju1+Zlo1mDg4waEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZwlcpTi73E8q+4QP/2zV6eWE+w0HT2Y1ynQWje6o0Y=;
 b=IO3i6xaeJjlKLosBmFF+8KbqsdUtyoNsLR4SEQqrihgOmFwSxELh2MdRvqy/8KVJOh39/KToRgMYg12+Ig0jQPXTdAuNAfLT9tnalHA/Xt9ERmA4PMrKfGEorcHOZZn+tAqOO2PIu0qjejrRxBgpg88qXBDU7zXlc/PLXQq1m+o=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by PH0PR04MB7608.namprd04.prod.outlook.com (2603:10b6:510:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 13:15:53 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 13:15:53 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 2/2] irqchip/sifive-plic: Disable S-mode IRQs if running in
 M-mode
Thread-Topic: [PATCH v3 2/2] irqchip/sifive-plic: Disable S-mode IRQs if
 running in M-mode
Thread-Index: AQHYLjekNsSkyfVTzUeR6TkdNsQAEQ==
Date: Wed, 2 Mar 2022 13:15:53 +0000
Message-ID: <20220302131544.3166154-3-Niklas.Cassel@wdc.com>
References: <20220302131544.3166154-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220302131544.3166154-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05185c33-3410-4daf-8748-08d9fc4ec766
x-ms-traffictypediagnostic: PH0PR04MB7608:EE_
x-microsoft-antispam-prvs: <PH0PR04MB7608477C9566ED53332DB5A2F2039@PH0PR04MB7608.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4M3rSDWliFpDxbEmlI7O8T72PSXri/q9VL4WzbCeBRcNjVpxJFBc9e51nRVvOKTj+pZAJeCJN/PnX5ZLde03w576kkKWaDXYSh/ONRAEC6NIkEGRm4RwEZwaqAbFMn0HI7Gpbrbo0tblUJIlpBYIhXGSjFxbde4hZCNkh29dbSHrIcgHXSFaB30jcLv5il1FIb0DfeMsW3Ve18R1KhYZjlYvzA/VTaoPoY6BsUXAPdyovoFO/v56KnQA4yYmjVsRXqEf8Pn7Z8r+2y7S7LgR6DPtIBI4n4pQ0KDUOqn05BQSMrtllv7U2PSh6PWqCBuij0gi5/lA1PkS/FnMaE0gkUTQb8POy3GNVxlGD3WAIeLAix6IGP96RngSCpP2fKnt83vvzakxfkqwr2m0r6UbCCTeWnX3hwB2EQNa1WUDNBVjn9dZitZRjFq+3jih44gvFTIBssgfwdKHCeAmQWxhNWpnaPv981MjgKxARuEiyOYboqDwQglkKG84S//nzf3SYtVVh0CHPObzBTSP0AD+b6vI7OKq9FW2JHb7Qq0Prhyx0fc2R6OGXIXKUUtqhZbM0HuG7GGUz42ybSkwY3hmiDm/yZJxGoalPjCpVAtJllAD3PDDoMTiaRMD9haBBUefSVVg3RipdRPMSOIplvssIYZdcgOBzqMBldaS6AGDLTf/nUFbht5nT+xYJIqagTVQOVNV2xBq1yo+KdBpiji7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6512007)(38070700005)(2616005)(8936002)(186003)(91956017)(66476007)(1076003)(86362001)(8676002)(66946007)(76116006)(64756008)(5660300002)(4326008)(26005)(38100700002)(6506007)(316002)(66446008)(66556008)(122000001)(82960400001)(6486002)(71200400001)(508600001)(83380400001)(54906003)(110136005)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5+jPGedW7XiHjnFo+1qu+gW0dgr+adMogFb7ovqP7Kmxm0ktVCevpUBuy1?=
 =?iso-8859-1?Q?+C/uyxmZRJeapEvQo2LkqFoCCDS8m8W4Loy1dcxbci2DdwKVrUrefP4Jq0?=
 =?iso-8859-1?Q?1LV+y/oVXZemknqDRRfkBwZHblDgYtQCE/PV+CcmHC+3BylOvI+2egduKp?=
 =?iso-8859-1?Q?fI5xVpuysCdCwlaz55MeNlnqAyG1Vrf6s4xjfoPToZYAw67DqKUujlp3xs?=
 =?iso-8859-1?Q?Lq/ofwNng/SJ/v7WxY46Y4kxy6B0XMq6PBSi8bo9VL4L+mf9uq3lTvCfTa?=
 =?iso-8859-1?Q?blZb3SJuNMKSqjZ87zTPipl9vMB3O0d22W2LEQ2CawBSSvDdaRoIUpbf24?=
 =?iso-8859-1?Q?QGq1Yc5xEraekVy5aMH/CpaNcrFi/F2tusz2616EoAx/YgTtLNzODzJf1l?=
 =?iso-8859-1?Q?HpYysctizpXAC+aYFzNX3v2Ckji4Jw43fJbEQmdbwwPtiqcap0w4zb0VDe?=
 =?iso-8859-1?Q?ai3S/8Y1DXVO3mZ4vDNYRD/0LlAiK9wQfE/qDJ4oFMA6CIIN7qva0s0Zfb?=
 =?iso-8859-1?Q?G9HHS2asbIWkSxYPDEcq3tE1qempLEEbgs1qYyHyJxhrLd2NUG6gLkx5Y4?=
 =?iso-8859-1?Q?3pPwzaK594q8JrgjXmL9JY7Rs7SQumn/1rJZHMFoernNxHi6/jpYyMDJEx?=
 =?iso-8859-1?Q?vWqIdiUBW1fj6r5gOiZCXmRTrNUeiecb/ZSj0YUPmurHUU2OQrYrewddlb?=
 =?iso-8859-1?Q?m+AIO9fkV0f86bQa4mSgS4chzt2yFrUNj7B9nQQGUe+f0+0aGg8otsit+9?=
 =?iso-8859-1?Q?ConMDgZfsKPWYYZaDoklT71+ihwtiyWY6Fm1BPJUKDZ0Ygb5RIZnvAX57e?=
 =?iso-8859-1?Q?LHlkuaZbuo5HRRTr6o9K/jWrMdeSxZL/iviJ3j1udcmUmXdBYgrAZsFJGv?=
 =?iso-8859-1?Q?9GonbNSxT4UWRz8ceQMN7hymy1+f1z7IGX/UdRVR9CeybP5RsK35u61SPf?=
 =?iso-8859-1?Q?Ny2G+OkSUwo7bZ3OtCiDM7lWHNgNxkT7WSbYT03ySBVGbvWKaObZRZ1FMA?=
 =?iso-8859-1?Q?VIhndk8ar8QQ6yIDh4TZlXvhefXT9NiXWlf02k0HTUQwcvPOCEj7YdTFDa?=
 =?iso-8859-1?Q?Rou1YGyW0Z2nzE0CbvZt2enc+kFyIqBX8K6thJJVXa9OLrtyfgQaPmn4Wg?=
 =?iso-8859-1?Q?gwAQpdsv+Um0q2WemBbhut+BYsArghhLkcVulIKEajlnDwdYhNDn58+7EO?=
 =?iso-8859-1?Q?/h57zStbWA/LzLZ/69+T01DQAtKBGppcL+AQEXjnPnV2BbHQoMRSNTLJnt?=
 =?iso-8859-1?Q?AeSzuZj/AkVlvrK08BKdVrRST39eUHwk9Rgq+3b0B0dW27ZIk5v3jja4yr?=
 =?iso-8859-1?Q?BfmVoj5Ts7cVbmhc+0vVQRoE4cXOBInAol4W4LFyH9f18eA1M27yyJgCUf?=
 =?iso-8859-1?Q?iffSZn5JoZbEUVuY05DHbmAuzDs1CyI+x2fNiVdGGQiDZN+hjoMkyIOj07?=
 =?iso-8859-1?Q?rEgLJgpffw5AUYIeaGaHi1PlvEtOaO8NHS60ZUveigmXlLGbxg4pLJlZfl?=
 =?iso-8859-1?Q?Q2D/yosvdASYkU7VtVN6NnKVyEpcB4yzwY5g8ITYgAlkq29yhXupKHO0sr?=
 =?iso-8859-1?Q?o5uVZSmpIy0ug3z/d0eOGJVniPPob3e6g4/biTYEl2jn+NFiI9d6NHrhCE?=
 =?iso-8859-1?Q?ztKP9WV1qFQT2ICzS9dIviwcxstEGybjwadaDRJ8wF+7X+41G52p6AT005?=
 =?iso-8859-1?Q?fFAmvUhXsP/2MF1kG3M=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05185c33-3410-4daf-8748-08d9fc4ec766
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 13:15:53.1163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/yvco6CAPC13KOLfkI0u5dJHhtzghggdZdUADTvZKZQX1Y9+ColYg4Fyb6CNN7NcqXp0ZiE+HW1jTcJgArmag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_051556_925658_EB441654 
X-CRM114-Status: GOOD (  18.58  )
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

From: Niklas Cassel <niklas.cassel@wdc.com>

When detecting a context for a privilege mode different from the current
running privilege mode, we simply skip to the next context register.

This means that we never clear the S-mode enable bits when running in
M-mode.

On canaan k210, a bunch of S-mode interrupts are enabled by the bootrom.
These S-mode specific interrupts should never trigger, since we never set
the mie.SEIE bit in the parent interrupt controller (riscv-intc).

However, we will be able to see the mip.SEIE bit set as pending.

This isn't a good default when CONFIG_RISCV_M_MODE is set, since in that
case we will never enter a lower privilege mode (e.g. S-mode).

Let's clear the S-mode enable bits when running the kernel in M-mode, such
that we won't have a interrupt pending bit set, which we will never clear.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index fc9da94eb816..bb87e4c3b88e 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -81,17 +81,21 @@ static int plic_parent_irq __ro_after_init;
 static bool plic_cpuhp_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
-static inline void plic_toggle(struct plic_handler *handler,
-				int hwirq, int enable)
+static void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)
 {
-	u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
+	u32 __iomem *reg = enable_base + (hwirq / 32) * sizeof(u32);
 	u32 hwirq_mask = 1 << (hwirq % 32);
 
-	raw_spin_lock(&handler->enable_lock);
 	if (enable)
 		writel(readl(reg) | hwirq_mask, reg);
 	else
 		writel(readl(reg) & ~hwirq_mask, reg);
+}
+
+static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
+{
+	raw_spin_lock(&handler->enable_lock);
+	__plic_toggle(handler->enable_base, hwirq, enable);
 	raw_spin_unlock(&handler->enable_lock);
 }
 
@@ -324,8 +328,18 @@ static int __init plic_init(struct device_node *node,
 		 * Skip contexts other than external interrupts for our
 		 * privilege level.
 		 */
-		if (parent.args[0] != RV_IRQ_EXT)
+		if (parent.args[0] != RV_IRQ_EXT) {
+			/* Disable S-mode enable bits if running in M-mode. */
+			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
+				void __iomem *enable_base = priv->regs +
+					CONTEXT_ENABLE_BASE +
+					i * CONTEXT_ENABLE_SIZE;
+
+				for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
+					__plic_toggle(enable_base, hwirq, 0);
+			}
 			continue;
+		}
 
 		hartid = riscv_of_parent_hartid(parent.np);
 		if (hartid < 0) {
-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
