Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772F6C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ubgCYH4s52PLkpTTdl9EPZWfDf4PCZt3zvRR9HzauM=; b=bRm6sQeE3yNq7R
	A6ShuCxGoPkfZINi8//RKZSThiLh7yq9phyjyksRElTUVhOObH72FRyUcIEpsNeaynyUA6GRKve0c
	HiqtNNM0o7NyoeZs2hIihpQx3JbRZmAIje8HjI0j3XZEz6yg4hCD8nP4SHhiLgULSlWKBSHD5jG+1
	j7vRL+IybR7Bzl/DXgRI8rM+d+oznuNohG+Ekx2M+QGugkUxcosQM6owPc02JBwu8Mb2qI2SToBLt
	BAGCKd0P1hMry3c/aJwaFjRBaqwYrKzE2LnFqbYN8akOAaxP4UI35VoPSGpS7GuixafQIL28uFSi8
	zUMlXGgRECrS+X+lLqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP646-0002gp-Gd; Tue, 01 Mar 2022 17:13:34 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP641-0002f8-9U
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 17:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646154809; x=1677690809;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GzADZl6p4v5Bf+eIe7eZ6Wyz0K5c/f15GPFCDvdLy4o=;
 b=AfA+Qf+mpbUJHj4XRJ1jVJU/QeS4jdp5KZSpdyHcVIZ1BqTgXBoFvarJ
 KBqFKjqeyqKDPLTLM+427/NjZFRQfqbBHlkIpEXhsGbe9cC7odv+OQqYf
 KADoKls4gBtgwOK76ygsqxGV66va8NMR+TO4PC0VwFwUFOgI02McapMW4
 ivCY6hb2+XcqydiJqMNFk0GLuXAhztRe6v8B45ozAf1Pp+Dd9vFev0T/U
 KfxoVNmNIjrWkfcMNfij2CxBq1t8B0uHHesFyJJTJvI9+U1kX7g+K0apc
 4py1cfxRiw27/11N1sR7O2yMyufya9aBq17M6eBWSO/dy4EYj3Wqt8jmn g==;
X-IronPort-AV: E=Sophos;i="5.90,146,1643644800"; d="scan'208";a="306119290"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2022 01:13:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7EvmomishoRsJbrDdCbSQVJFmushJKbgZxM6waXRI52628YyjQVY2oY60PFOpPC3TjtVc3gFRJdgzwzQhuch2w66rzIU+5jf0y0rTTYAETNb6cmI8uuDJun6Ri1kSChMzo7br41QRZQTPNAlT/ZQimuVgemgfh+QAEYAZW+jQhXCYlk0FfpRiFLVD6FsvLRxZPpsOzSNlcC5SBgjqa49A3iFuB1SkOGjynVUy759kuWm1TWyXbfN/IlyESXqjPrOQVyz7+j4Z+ZCck3qHqxjCSYodVvkaS45LR4qw369WizDlt6t2m5DWhUIZZgWk/SJPH+bFzhErT+hmnIW1NpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h74C725stXlxTMmXvA6oNubmhl23hNClZbhBHcDOcHg=;
 b=KDKhJ+kEFvJ8qmOru3+L2/MpqvTLkyshkartRtFfbi+58aXWPtf76F1xcsbi+mXD1lQCkcvb7vYoMGeRPjkZgc4J3kKjE6RKi5UmdsC4UJ/8Ft/0TOlMOlCLj/zciFAXg1WXJwLWRR4bj6Zo+w/T99GjFFMpoPqMTkBpCsjBitDN6DcUY47fKKBnKUNrlPRc5EboZo5szHFJlRr1beHqqd7c/S6FMS+p7IOudGYnbGB2ewW1QipeyJIsJRzl9fTgxGrCxUF9yCQV7ADv3UetAhW3s0WiTjCwS6+iiLvlYWFnvp/zp0iXXpRGQ2SjJx+GbV34rrOsZUDIviwY/F6SLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h74C725stXlxTMmXvA6oNubmhl23hNClZbhBHcDOcHg=;
 b=PeqayjUaq+UpLs7nF8FfdAu0WI0uqZcnNeZ7H+JSvpZQEi326kN2I/7qHdlKJ0Lsls4QnkZm1UOjVyJbcxAuLSkNTxvZ6gFDIJwf2s2Qn2cvYJLbGVktPTqvB2jQ+ONxAeWcafW98y/arNXgYim70m6wfGzvCrO7Wud1Zg+icz4=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BL0PR04MB4609.namprd04.prod.outlook.com (2603:10b6:208:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 17:13:23 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 17:13:23 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
CC: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
Thread-Topic: [PATCH v2 1/2] irqchip/sifive-plic: Improve naming scheme for
 per context offsets
Thread-Index: AQHYLY+oImNLeC6HTEyrbPuiRdyJ/g==
Date: Tue, 1 Mar 2022 17:13:23 +0000
Message-ID: <20220301171317.3109161-2-Niklas.Cassel@wdc.com>
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
x-ms-office365-filtering-correlation-id: c17829df-452e-4b6a-0585-08d9fba6caf9
x-ms-traffictypediagnostic: BL0PR04MB4609:EE_
x-microsoft-antispam-prvs: <BL0PR04MB4609B1BBB6B0A1FB30C508D6F2029@BL0PR04MB4609.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s5TJ5RW7/CEdIPtO0gYekVBlQFK14m0x0nUj3DoBeQ4XRuz/RkjNIz+QubI9IpfxYSM+0bajQD5R3SEFxNbn6G5xmghUu9CyRqKZmi4mGPmBJLL2xXTm7w8aYM9YmisJHn8pWHh/iLEgmiqgpH1vn7Wyv6n2cgWO6sbTv7YqZPXM/B3ZhclAFXWEAogOlwdyXmiTz4N3c9Zfrwc+0HtpQTpCXVpGCi03Yo3+EFUZ76DOY/Ws2oO+WkNw8k2YAJn0xflf3tIl04iPtMrKwMUWcKAk0PY9iU/w+N/j/uMQmsHMA957BMo/5GfV+6bZMEQUs/UHQalGf85PE0dnFkuykbW4/jaZ0f+2NgdnKw/Fht1NT02aSR3Ib/1s1ili10Z2YPYJBIuzeXY5XlG4HquhlepRisRef/KOoXPsmr6MXrslLKa/P6aPyWNfg4S4L9qBINpAjtXO8AHkS2PgDs7DFhZ1rqEnXtAEltFnHxuZXKCXNbjzQoJKLYgNxbiJpVrI56qA7vj3PBabfq2a2hBb3ykt0UNALoSXXWOy3bxYAzehZUN1w8RB/Yve7ge71VAclsZUbak16WVAvAY4Ds728t1lePLUL8XMt47I1QeSzjC2wNVlx7UX34FGVfLIQlVL9r5vTjCVQU1RXad390oYBdVftfFVztJzbayegJ+brD6g8H+Py3a9oMltd822PxE8wIW9SWHYRcrMZ7T52LG/Ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38070700005)(5660300002)(316002)(1076003)(86362001)(8676002)(64756008)(66476007)(66556008)(76116006)(66946007)(2616005)(4326008)(38100700002)(91956017)(2906002)(186003)(26005)(66446008)(36756003)(82960400001)(6506007)(6486002)(8936002)(71200400001)(122000001)(508600001)(110136005)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IY1U7TFInvzhN7qsSTcalYPzD3EXpPy3obMcd+IBKeBjlsJBA/Mu5S20Pr?=
 =?iso-8859-1?Q?7PIjN+Mu3MWxtHGAPX6Tfl37hmxFVSfuVWgN8TNNuBQzHNSsQDSrYljgRX?=
 =?iso-8859-1?Q?WtUwr8zeaNamYTjOfHsGldG3sFFc8LjPDJYAH9T97ispEYo+WHDRcRbPrn?=
 =?iso-8859-1?Q?ov2AS2TQfzkKRA7GB3MsEILUzEg0f7OIOFxakzPs2vZJPuSr0/ai/Jnpcp?=
 =?iso-8859-1?Q?geOGxEu8lROcttZaFtSmDA3qq6b9R5C3A5RRWJeUjxPTINhQl2yiTdXej9?=
 =?iso-8859-1?Q?k2TAHkAQkACnvFT45S7MpdJlrON9wIur8GPut0N5fsVN1/43Q45QrV2Imk?=
 =?iso-8859-1?Q?EH2XeEl4UG6c2W4Sv8+kmL/aLnJ/vsHE9llkDd06xSTp7dxr4/z5/LBGUA?=
 =?iso-8859-1?Q?l2PMrVzl1Hd6WOKHDq2gnjMGJRkDSlxndxC2WqmOqV3OyTHsJhRilAQIGQ?=
 =?iso-8859-1?Q?JkDJD3vQtmsAEOKTcd0lJxouW2hyStVq2lFckFo0cdI2zhsquAtrXyrdJw?=
 =?iso-8859-1?Q?eRt1aATGZqaQDgyPcxClEmf3L5y+O7HHR+ljob56Zt8hx/l7TUzrIIb8RL?=
 =?iso-8859-1?Q?oz/6T4erLA6eSX1rbMLsPwD9hyvK5abv8sEkhF8OqEO4DpdMQ3H3R7mByU?=
 =?iso-8859-1?Q?WBmh4T3dNr6CYkCEOIbGl9MEXNg44xdzV6feHh1T6ks4PjxvGKvvGqP8oJ?=
 =?iso-8859-1?Q?Yn5oy0BfTYfc1hxMfMmlD/NwNzEoWeyi+X2oAh7Atewp2bGxsaH/e8ICLq?=
 =?iso-8859-1?Q?Qd0vzmdiYFk08wuUVFBW8wr5Njwyni1tkgAp3leWTamx7BPQ7dwGzcmhso?=
 =?iso-8859-1?Q?BlXAfQYesfg1IKbgQZUNWuMiO4rhoj7Y58df3gmCQ1gwU4MxcJi6KayP5w?=
 =?iso-8859-1?Q?9EK1dafXvCDmZr4KhvV500gGnAByOjQefIIWixgvogBsJH4iIF0lZCIGHw?=
 =?iso-8859-1?Q?oVYdohzAn+K/zHKKHyZ5/PWuU17x3B/+Dl0XkOb1go8NuQ55tL7WAB1Bt4?=
 =?iso-8859-1?Q?ZHUzlSxCOLin4Akr9ZT3DCJVZAoqcuR6D6CiNMAG/hoYLo6G8tGEZcofx7?=
 =?iso-8859-1?Q?Z82iHufXxqM3ihRwvspiHhqCV1otvp8ZI+/RKVuMfRrhcPRJgWtQmkMfjE?=
 =?iso-8859-1?Q?3/kQJyjjc23Sq9zkdJR1dyPsHJYFtoarYld7sg1e/De5mUG5/7xno/UtWN?=
 =?iso-8859-1?Q?16aEzuw/Qe7htOH2xFcu3VO2/JBEaelzHkIhd+gwDda3buKYPqmOJBxgbL?=
 =?iso-8859-1?Q?ddiEd1zCXaVXNYQpgrT7kF7IlBQ0uBWYZtI/GQWOe3pMB8CSuDHymPJOLe?=
 =?iso-8859-1?Q?5HsxmAzcBUUfnur0OeDytJH3+OoAh1k5pSIMI3WrBs6xMsoezGZEwqomgZ?=
 =?iso-8859-1?Q?OZYRbA1czzLHTcdAh+FgdzoXVdDabCr6Jww6ed5a6U4EpbMZVNpYTCrW1N?=
 =?iso-8859-1?Q?guiKKrDUTRxZiWUbR2oqlzWe7VhlF6mCMv9snm/oZPl4cmFQ4Gsy4enytH?=
 =?iso-8859-1?Q?TDtleERLbGpyj0dwjcVhWKe+rGeBJcWN00K+R7CMGIaXIEHz2QnNhvc0/O?=
 =?iso-8859-1?Q?PbfAtulMOPVpndqyO0koVmagultAjxieHZdzJWRm0r8p/t+kmlTCl/fxbz?=
 =?iso-8859-1?Q?yvtSPBxCy8BLgf9YMVT6yKNV5C6oq/Et1T9CHjGQ15qqQ4+csol1ibB+x1?=
 =?iso-8859-1?Q?LbPay1D/h3fxJuEAgvJ11ORSfKcn1Y17cARTqGDJ?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17829df-452e-4b6a-0585-08d9fba6caf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 17:13:23.5909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQIHluLybtlSDYMJ27z0dorHZ8MLH8Wsmt2DvCPNzi7oEunahS/eiZCgsr7khu6anlVveQNK+kmZeO8YholaNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_091329_366857_602392B6 
X-CRM114-Status: GOOD (  15.90  )
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

The PLIC supports a fixed number of contexts (15872).
Each context has fixed register offsets in PLIC.

The number of contexts that we need to initialize depends on the privilege
modes supported by each hart. Therefore, this mapping between PLIC context
registers to hart privilege modes is platform specific, and is currently
supplied via device tree.

For example, canaan,k210 has the following mapping:
Context0: hart0 M-mode
Context1: hart0 S-mode
Context2: hart1 M-mode
Context3: hart1 S-mode

While sifive,fu540 has the following mapping:
Context0: hart0 M-mode
Context1: hart1 M-mode
Context2: hart1 S-mode

Because the number of contexts per hart is not fixed, the names
ENABLE_PER_HART and CONTEXT_PER_HART for the register offsets are quite
confusing and might mislead the reader to think that these are fixed
register offsets per hart.

Rename the offsets to more clearly highlight that these are per PLIC
context and not per hart.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 drivers/irqchip/irq-sifive-plic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 09cc98266d30..fc9da94eb816 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -44,8 +44,8 @@
  * Each hart context has a vector of interrupt enable bits associated with it.
  * There's one bit for each interrupt source.
  */
-#define ENABLE_BASE			0x2000
-#define     ENABLE_PER_HART		0x80
+#define CONTEXT_ENABLE_BASE		0x2000
+#define     CONTEXT_ENABLE_SIZE		0x80
 
 /*
  * Each hart context has a set of control registers associated with it.  Right
@@ -53,7 +53,7 @@
  * take an interrupt, and a register to claim interrupts.
  */
 #define CONTEXT_BASE			0x200000
-#define     CONTEXT_PER_HART		0x1000
+#define     CONTEXT_SIZE		0x1000
 #define     CONTEXT_THRESHOLD		0x00
 #define     CONTEXT_CLAIM		0x04
 
@@ -361,11 +361,11 @@ static int __init plic_init(struct device_node *node,
 
 		cpumask_set_cpu(cpu, &priv->lmask);
 		handler->present = true;
-		handler->hart_base =
-			priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
+		handler->hart_base = priv->regs + CONTEXT_BASE +
+			i * CONTEXT_SIZE;
 		raw_spin_lock_init(&handler->enable_lock);
-		handler->enable_base =
-			priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
+		handler->enable_base = priv->regs + CONTEXT_ENABLE_BASE +
+			i * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
