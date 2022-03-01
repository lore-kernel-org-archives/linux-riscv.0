Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EC7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GA3JqslyuVQwaggWmpGIfSua3QDlByw9vPhBloCMJ6Q=; b=bC2DYc6MOQKpqX
	QU5D385auyhbyX8CiGJblQkd97Zrpz7OwrsK5FSJwFhFZJzpjt12OGlQQdz3Yl9B8hBFot+hyJCrg
	r3urXWjlxAAhvPDCZx9szZq2pCTTeaHvk+zx/xQTaKNIJwzuFLvU2bcRhAhmsMFixYFE3I/j8+N6A
	QtYr+/S5IkBFfWn/j0fClt60mT/iRG7MUXDLItaK2HUQr+4tVdjncbCkYaP6QBmVR1mnMV7kVncPx
	zNoMQJ9uUJ2xEINRkDuDH+7NWGqWzkr6ALiDctqDPUGc/0Q7NNd6yUeOaRG3FV2oqZ4IYh+wUt51O
	/+hGrA1CFncJKlGrlULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP648-0002hI-Gu; Tue, 01 Mar 2022 17:13:36 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP642-0002ep-7B
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 17:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646154810; x=1677690810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tfzN7oTAmYVK/hpSPlWAVIp/oqysaDmXcq8K4pkwVUI=;
 b=CguT2jT/w/xPRTbDrf1++Ab80UG40mHYvGJ4YNguM2OI3Vf9vxmu32Su
 EKmDLYq2lggShZOuzs6TQFBkSC+giv6yQdZSUO7pKdIl1nAryzOSQH9pS
 JOcUT470Q28mkU4aLaxMavVA6ewBpwPE/C7JGLKVcV6Xtsuy92laxtY9s
 h+Zo2ww+DupUhFoeQusnCvE0JlxwTmnQbBLuYr2uR9u0SjDkKt+OK6pAy
 CN6JmpVM3YbJxesKRO7nXZVUTvo4PY4Yvu7w4XwCoXQD49K+mhDS30APr
 HDJqtHLUrLpzr/jHKqAdAnIPvuSgBTa6gW18PwvV9X5PrBLQAjk3PPYPS Q==;
X-IronPort-AV: E=Sophos;i="5.90,146,1643644800"; d="scan'208";a="306119293"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2022 01:13:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7RkQyyk4dRhej39Tio0F+Cl652etX8pnX5Li77Y/np+rgbDqXTGOkHNU8zyJ+SsRrMenEUbLBLmCz7612eCm0Gf07cIGzZDs5JwEIZhROn7FeNzNwwTa/F7/YzCAgEDE5HpR48BNmfB6PY1AWkV9gVJIb1Ah2h7TydbpZH9PqfZ+oPpQ44zM7UUMRfwfRTjrm8mBGnAuCZ9AxZJXLrnJyU9+/ZqWrRl70ZB+h/09x78D3hDYQSr6OZbO9/WHILjJO7CspoqkkfjjQdhzGd8FuqyPLsqCSGft9fWm4MnGt0e762QPz0nQC3RqKMYCdgla+udVsxo849r+xREL2oF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RFpE8GDkKfm4Weh+zZi1WXIfi7bO1hHF6tcYpZUKYM=;
 b=gz5F8RCRIIgZv/IHlcMzmPUkKijOkVV61QhcbvCQ2SIiLXGJFd2Lpq8HSIFGi5FKzNKl0jnjPBzgzbdb4LP/ewN0Z+W88O1yx7pgrxdFX1rqtO1+b/tDsTuQi8+Vl4FyXpSdcIm7RLhpOqo1R6uCcuh//+YrCqVfuhZrgFcKLJ3N/egJC9M85jC0MaovIEeiDCkUAAG7tGPk1RyH12HYPHkr/Wzke8fcGUR/y2G93qnXhi7bVz9IuTFyVlBz0dsvEYvhVxfYuw57NqpRP8GIQcF2bMmd88MCHZ7Qe6/nJj+jzKa0l4LiSeVYcLZm8OESw4kKous9ceC9bdip/S0BqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RFpE8GDkKfm4Weh+zZi1WXIfi7bO1hHF6tcYpZUKYM=;
 b=JmSSUmGS0zkCGpNIZqRE4VwdE0/jLcGS2NOGdn+xFlwYfthTGBEAo+GhgIseNupxYD8PhuEXsKOIGEzXS+BLvmiX8gG6NNALjhdxpkaZMXfBYi9LrbyoQU4hUWnFe0FlP4yNRngDzHmMlXatgMoBUzQ1TfErJ7hc5j4e6QcXU5Y=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BL0PR04MB4609.namprd04.prod.outlook.com (2603:10b6:208:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 17:13:24 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 17:13:24 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 2/2] irqchip/sifive-plic: Disable S-mode IRQs if running in
 M-mode
Thread-Topic: [PATCH v2 2/2] irqchip/sifive-plic: Disable S-mode IRQs if
 running in M-mode
Thread-Index: AQHYLY+o0lzIitWgkUOxiY0NzN0p8g==
Date: Tue, 1 Mar 2022 17:13:24 +0000
Message-ID: <20220301171317.3109161-3-Niklas.Cassel@wdc.com>
References: <20220301171317.3109161-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301171317.3109161-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92efcfca-fb79-42e4-9763-08d9fba6cb72
x-ms-traffictypediagnostic: BL0PR04MB4609:EE_
x-microsoft-antispam-prvs: <BL0PR04MB4609320C9E6179950684B41BF2029@BL0PR04MB4609.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ESFAvP7wxGT07PLR9chV7kpRzI6vTnpP/J6wGLCP1u09m6AixYGsa7PGcNpOWZlL7GG7O+xapmxZynVKY81dcbTgjW+PIb4oO82+zrrVcn4O++yD+i0xBx0aENEcanAxrrLZj+JdUxl7ToCTLt1ET3MTjohizQOJRu1e/omRh0A9gtfC/uDVAKPNLa+dUE+dIaKBUDGjIM15o/pXim5RAOshWbcwwyn6JrTWfWbm1liMMcezKCVY4TAjBFhBma2yngp7fMulojeVQB7DOLtr/PAsBHFmv8U2AThhckZdjMO5tGeqeZzSePhD0QnRxeT8Y9MPYWq1JYEPWbvM85+Gal3D1GeCw3CpXfX+RU5SCM2ruDPFA/PADfxuj8UsXdEEi3WcUzHqXPrGV9LjRbS3GO4wDNSKbN2tgyVQwGg1YBHAC1UKEuOVQ68VAfdfes2Ettv5r4V7Uqxqb/FebHcTZilxF6EouMag2cKebeODptJKT9jDMlykmum6lOjeHGQduusqYlGfPcjrqk0QCaoFej2cjr4aSmmuFmPq3/L2crp6RHBb87lSRKFd5DL98CAqJ/R6Xz5AVLtTvWV7pn9IanQRP8nRLUPwTSCC1Z8cNk/zZKsm67urjIYP8d/iKR55fwpvoeFSOAtDnz2jHeu1e5suq6MIWb2Z/6SkILJzhh3fEC+qSc4+AnhXbZaLlQ12xGx66KUOmsgAkyXY6TUyTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38070700005)(5660300002)(316002)(1076003)(86362001)(8676002)(64756008)(66476007)(66556008)(76116006)(66946007)(2616005)(4326008)(38100700002)(91956017)(2906002)(186003)(26005)(66446008)(36756003)(82960400001)(6506007)(6486002)(8936002)(71200400001)(122000001)(508600001)(110136005)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?npfrx48yG6dT6MrUUDHu4qYEBL+izqhM+fYkT8HizT84Z0NHm/ytu8OvwV?=
 =?iso-8859-1?Q?7TL3HtpMVFbQoapTKpHkm9ogSRWSD7xobU3Zkj9tK1Si/rakQJUjnAg+/D?=
 =?iso-8859-1?Q?pKh1Ov2hksJVZkKuPVKGUWKeHRlqAjuYaXHcZ8Kl//iDn7JY0lmzu0a7Wb?=
 =?iso-8859-1?Q?XntfsTKUDDISL4NoNEywfNF37A3blnrhilUzJcvwTrJl89NzuRivLjZndm?=
 =?iso-8859-1?Q?4eEhUIr/DR+iGEJ30DcUWx0d8G0+Cx0R4AHoOJgfT4nJQpWlTjZ4h1FYqA?=
 =?iso-8859-1?Q?68fmkFuINNyUtDrhjWNwWgW2xZiCVK8MCyelHP3DsKwhElRY0prFJm+aym?=
 =?iso-8859-1?Q?hPgnYlfAa4F/8tQJtagQEQgWbmNhvEi70716K0Lfd1vck6bi+ANLV3XFhq?=
 =?iso-8859-1?Q?zphyjtED0ld4bGW1svThkHTD1KOVC0rsW69NxLDFdFmZyD3nt3DYbCUwhz?=
 =?iso-8859-1?Q?au/NSDaz3tF1SrwTiKJRXWnk+7usNPvyoPGvOCe8dhgj1D1o9GMnGRdwDK?=
 =?iso-8859-1?Q?n8Enh1yHFiLNq1KnBpzIYSHi3Mq5tiscmIc2qccbcV3iMrYCt6Ht59AJMW?=
 =?iso-8859-1?Q?C7B0ReoSuM9ZnobX3IQk2EB3DoSe5nCM8rohid9lQViz0EJIptltT/szj8?=
 =?iso-8859-1?Q?xtXBYVC54zhyw+7qokb/aCkVTVbiYVzAxkkGi2PFHi2V88RJTxMNf6FlzL?=
 =?iso-8859-1?Q?IG1qHCu9zKTNb23Rp209T8F9aHKBIuHK6o3BfUNDXxuGTwUAyFWdGV8+2x?=
 =?iso-8859-1?Q?faoIL/N/3GjIwU0hcuT9gUpUdcy/l1q7SpFEgYAMqf8sUHLRrccYis5mEI?=
 =?iso-8859-1?Q?uAeLLp0JM0zT5AhiYiqsuZQNTBNuuZlufTLpYjMnPXythTGGgwYmGPGO/S?=
 =?iso-8859-1?Q?pE3rwE2XF0qslDBnoiXdvIeolKYt6fDe+In118x72CtzkmT8ILKQ2/xQUv?=
 =?iso-8859-1?Q?G61AIkO/WrvxrdT8zh24PGjVJOq/0WBfTTacm2VVJqFZrfNxBhMVWvJU4E?=
 =?iso-8859-1?Q?xZ+2MHKaQwOhrgLD5aUf+dEuwMANJ8ZbQLkGTnBgCBNnWQ7MiVC2Ih701I?=
 =?iso-8859-1?Q?aefq4rmsPYMzzSQlkgKI5q0UGwvFCotUQULqpoGsy9u7DuyCDkbwep0tFl?=
 =?iso-8859-1?Q?1kxvqA8AJnMXWQ8AqT117aAFkRF/vWw8LSYQNHpf433l/UBlv+XGXqcFQK?=
 =?iso-8859-1?Q?oHEShkr2poEPohETaINKr5F+j3SHX3B40Z913XdtMqahe8UXmdHvRIPTna?=
 =?iso-8859-1?Q?yfVSi0hKSe1rorcYBeK2sgQBKWC7PIc15P1IvyxQw4J4Ea0QAwlJTyFdiL?=
 =?iso-8859-1?Q?qWI2tiuXNwOxBiYsDkyeP1WQ0PGndQvCyTmwEJJ6FQ2fkR5o+rpKhajqBN?=
 =?iso-8859-1?Q?4HQOYngiJ0tU4wci5sNpN7YcPdPn1hK3nhl3WKOGXQFdpaUcXW89duBNXh?=
 =?iso-8859-1?Q?hNXO4nJh+59SOiOJU2miuKhXPIdNMUhkysonKWTR+6gTpyrev1Fxh6uHkr?=
 =?iso-8859-1?Q?bWYzGlD3og+eMtQTt2Rqa5ShOiA6MJNAXvkYiqBc7RZufQetm3E88T9r6Y?=
 =?iso-8859-1?Q?vKkUw0kcHuo298mkhVtQszUB58K7VjLEU8bKHjhSCpsadwhdquIjrhIvfs?=
 =?iso-8859-1?Q?Np6DAbZLi++HazW3hvvLbEEMC+UTAhD4P661iYTIBHJERvK8x6GTqZ8B67?=
 =?iso-8859-1?Q?OCrRiXJFUxNSKer9ueGv+g0/cqgAIcpvupWv0pJu?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92efcfca-fb79-42e4-9763-08d9fba6cb72
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 17:13:24.4657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9EHydCQM91OfNjIhRf+Q3F6roXyueSpdMYE8k5pF40QWAEraHzCYrkrYPNv0k+Bw5NPAXLrkfgoKcCWmQrxEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_091330_298294_5F40D61D 
X-CRM114-Status: GOOD (  17.87  )
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
---
 drivers/irqchip/irq-sifive-plic.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index fc9da94eb816..e6193d66c0ae 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -81,17 +81,23 @@ static int plic_parent_irq __ro_after_init;
 static bool plic_cpuhp_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
-static inline void plic_toggle(struct plic_handler *handler,
-				int hwirq, int enable)
+static inline void __plic_toggle(void __iomem *enable_base,
+				 int hwirq, int enable)
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
+static inline void plic_toggle(struct plic_handler *handler,
+			       int hwirq, int enable)
+{
+	raw_spin_lock(&handler->enable_lock);
+	__plic_toggle(handler->enable_base, hwirq, enable);
 	raw_spin_unlock(&handler->enable_lock);
 }
 
@@ -324,8 +330,18 @@ static int __init plic_init(struct device_node *node,
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
