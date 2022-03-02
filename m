Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011AEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfkjpBXz1FLNBKzmaN9ELNZujLqVfUmdpZKFN9Op6f8=; b=UY2/YEFdQNnenQ
	5U1UQYCyUJt0zZj2G7jSpkt8ZYGgmICcJtYmeJ6IU4hzdw01sbqc8jiTW7JvkpdUm/yTIMbNG4/kr
	9UD7ypOelvmVUDseW5RqCQbRlXeyGvT3sfxONvZO4CXZjqM/G36Zvs0sfRRegcHg0bLG9DuREmn1P
	yCcWsynCVYKXpUkiW7zJVJa837hlS0heHYIHMuW5RkiUjnt9Z/Sy+9HnQadFY9z+XW/2eEIMP5gs9
	m7augsj6ha9kEU5niqN4QCGBXFCSUIXFBPoiScOWapPyzazc/4XGTCU3qSGqWrBgfwbFP/Ze3d+bE
	TEYBfDPZV+v0J0NH+Mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPOpk-002jig-VL; Wed, 02 Mar 2022 13:16:01 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPOph-002jgE-32
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 13:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646226956; x=1677762956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dkIzG+gz39I7ajS2/C1UdnD+kIBpO4hRlKc+NqSoXys=;
 b=oOuJf70/1/E3ZnP+iH+HuSsoy+AjncwmcgsDlEkm+Jv15QaHt3qFSQTC
 dBWJHHNkwjil+asS79tGI2gEOZB2+IRHBgSM8bvoithL0ErNmkw5AWC3s
 ICphUUjRMjxmj9nI+8sVxKmQVdmQx+hTyPGZpjyHlAYM5PYniz3pcWXBz
 t8ZkiVSuJcCdJmPyiOZuYWX/dU7+SXy7fVtJ9Fm1SD+fP+buUMfdDsg6/
 KgHm5NW/il6DbSRPOl61Q1rL5CPcb9gDma722g0U9X/jrJaMNKhZtOhZF
 quh62alWiAiCKu4EtTt9yEEMsP22Khe3RLK3DGjFIk32SKC9G9TLCGr8N A==;
X-IronPort-AV: E=Sophos;i="5.90,149,1643644800"; d="scan'208";a="306195806"
Received: from mail-dm6nam08lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2022 21:15:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeK3SZdQHZSBoM8yKDiWkDAv7crbChW5Ls63amoQWQn857ZPFRAfouo8NAT1k9VNiTnp7JGR1OK/NsUuYxfmW2Q7Nc7J0BEwwWL8SqPOF3a90BqqFc4Ufg8As+ANnP592yaL5a9dGhAQRkdiCkW49WFfkUANnO/i8T1ND0c/jrt6ssBj01lZwk5R1R1ohtQAsRlB/SGyxtWqzZ4p+olXGaB3Hc4uZFqYNCSDjRtzIEauXdN1gfxGmNuAD/ITpXcBWe+1Vz2AxkiUNHEX3MntTjVkSr+4/eUmx/CyzYhQZZhlY3E3ewyHx0VdNjDe1RUg4duNf9limNM89/H3EMltIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/8eE6ljOwYU4/Q9RqMJnpoDXzhzvPNHFFtkVOQzSk8=;
 b=McBBTs+vNpR5fASZF3gOjqJAf/l7eWVd87pem9AU04N+wJ92/cxkdNA8DEv/4neTgNb1Iavr7addp20vaBU+NFCWzFZDrjp9LvFOxQeUCVpbZ64QUMZ2XWm+F+wtzKYeJJ49vku2i3SxTF0yQfYEFvj2tI2/Hho0/OqBhlqOB2vUpo1g2Hav7qfecj4NwmbI0S8oavNwLKgFevnNMvaANVGVemIXSDqUNc4mDeBpxxzapD6V98UcqA+y3+Zw2gQTRDV7CGbeaAPlK+Ol6gb8l4QGJvBafFv8rxc2IYhZ5QgNl5t9YnTbgxQzh8DjT8K9Wr6BC/V0ITX3iLC79qv6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/8eE6ljOwYU4/Q9RqMJnpoDXzhzvPNHFFtkVOQzSk8=;
 b=m0lmW+Su1/k/NkTrb3ISOaJtc8y477kXuEwfehmLxnmRWGGo3iYmAeXHRVR7xxYFJM7r82k//Qgg6e96+7cGBZ8TSerHw0sVb/V6qGsEy3bdoYT722X9oScB0CEaeAVeoFR6aC8ldeVYn3vOQgmgCKnCQZdhnxvVS28uQAL5V6s=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by PH0PR04MB7608.namprd04.prod.outlook.com (2603:10b6:510:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 13:15:52 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 13:15:52 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
CC: "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
Thread-Topic: [PATCH v3 1/2] irqchip/sifive-plic: Improve naming scheme for
 per context offsets
Thread-Index: AQHYLjekMDDi1rNZXEqLw0DL6B6eVA==
Date: Wed, 2 Mar 2022 13:15:52 +0000
Message-ID: <20220302131544.3166154-2-Niklas.Cassel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 772f1846-5da2-48d7-ffc2-08d9fc4ec6e0
x-ms-traffictypediagnostic: PH0PR04MB7608:EE_
x-microsoft-antispam-prvs: <PH0PR04MB760800B05F29B31239761B3AF2039@PH0PR04MB7608.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYMpRsrU9j2kuLM3o4gUKR8eRv5ZRmnQhbV9FnkRScoSDOO9Fhegz3qAFRy5S54cFFrDBv1l0xfBPji3mqUhJMUgB8+M96HLPgmkFgDVrCvXn90cHrKlXak0YkXxlZeZMkX32yKNZdf4hA4X0OTKlEDhAiS1p2mBazEWWNL7utpJUnPqk8vIaCFaROMIeMvCuhfX0HfKLRqsutS917rsitQUcjgnPncXiBquaTv/s7KrdfHSN5NBuloFijpWMpvHvkZIdn1ZQVMmTMW4BTndWjVJSGCTbPN0N7i/kjpReZzJoF6q8Nq7BIILHOHbFK0zS9zOkJZRulERuEvWflXaMPNr7G82j7SagIy527lqisqWV3raXlsxgBMT8AAVZLt1dI0PXJtgG8DjQ8LTXochjxkOM25oZquPjtCORkooi32qJzYLkjVAX6kTuO8KF5HCVOltSZ3Lslx+TEhZwGbCAg+Wb+uVJp29cH/hA3SvAskdFXoaJC7fjX5CkcbHtFvUnOnlHfV3+5IB6qsatmEk/xbcNHSOuOcTZ00CpqxH85sgUKepcrwYf2ebTLL/+U4fI7k3DJCtJa33a8JpAkcbNgo47WTKsZpChgK3kP1PFkngMPLYcRrQHRauvHgT3VFYwHUrUqBIqicM5tZmYM9vKEjkys8VawSr1lloedWFHXNUiG8qMQM9FNGkrKEDcZ0tYyRK5Xmg6BPfeMCepYVfUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6512007)(38070700005)(2616005)(8936002)(186003)(91956017)(66476007)(1076003)(86362001)(8676002)(66946007)(76116006)(64756008)(5660300002)(4326008)(26005)(38100700002)(6506007)(316002)(66446008)(66556008)(122000001)(82960400001)(6486002)(71200400001)(508600001)(83380400001)(54906003)(110136005)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EBfNPCpo377RHX2+k5vO3UAZ1tthiW+zhWL8BlFPspYjN4G2OiYEoNlF2w?=
 =?iso-8859-1?Q?B3rCM18BEvRlhyNVxlaXSE+eDHmoHbFCwpRDjThfInaPzU0OLOzFzD5S+y?=
 =?iso-8859-1?Q?FK8LZDZiq+bUKR44Gu8dR9BIlW26JEf7M/kmS1yKZvVLj6vXj+6FjCNJVl?=
 =?iso-8859-1?Q?ABkFRey93dL1fC375/D8Gygi58hij9z3XDxGAODYD7uuRuxAUPcMoi1qnP?=
 =?iso-8859-1?Q?aTCGMjCiHFEW9o8FH6XA2cOhp9pgNyp7l03uTOyzUUNLiEvQvck72bwPd/?=
 =?iso-8859-1?Q?F2QOUVAUMZo4KTSY0vhHqCcAGyVB7CZwIshWuBm4tmO57geUTL/dqXfLJ9?=
 =?iso-8859-1?Q?Wqfdc/3yry7ON3uCQa8GBJXVRu2xPFX7JYDssSBTArMNJ/KIi2KmSP+jk9?=
 =?iso-8859-1?Q?PJmTzIWPGuUtVthYDqvDDhwe4T4VMv++z/UPyHK5aDAZHhV4G36hWPuPDJ?=
 =?iso-8859-1?Q?HAZx5Ejw+kq6Bb+CzLgiG5pIc9RVTlDAE/7Sw4PyQXWvmB4VBJtGEdVxjn?=
 =?iso-8859-1?Q?jsr226O/P4+qUmzKXz4p9sPivIMDmxyyT6zAbPceog6p5u/aN0Qeq6O6cW?=
 =?iso-8859-1?Q?TWcTS9W76exmZxaoLElDwpXki6a+5z0DVOe4pKNH1abQtxgcW5yb6NaKdD?=
 =?iso-8859-1?Q?w6AhZQ5sab+V9c6LAz+cgrMfvnx3P1lWk8VFQavVzFL1VJk3+hRZPvoJyX?=
 =?iso-8859-1?Q?DW6n3fQlFpUp98avKEd7uf0dtz66ZWfji3ZZLk9Bar3u277Rsj/3J3A3wP?=
 =?iso-8859-1?Q?AUWeZHouU4F2MUowZ3dFuxGpIaepKkdgK6lJdTJ3TOsP0VP49xZPCDoFWC?=
 =?iso-8859-1?Q?t1Je+YByOVov70hsBEsCiPKwkPshp/YYFbBUWUTZ19SI5FuTlZaTTiQS9Y?=
 =?iso-8859-1?Q?odhxF55PDKQS+owECXgutrJTIjf/U6wt/u04cCKEAxI+uUHHFKea3YA8bb?=
 =?iso-8859-1?Q?cHDIk6MHqm64wQ46XOlvceVyEiZ/nE53IcCRiLd3FtrGmrW3LaCPTq+pGv?=
 =?iso-8859-1?Q?P8Bd8b2Grtoc0PIbhZZrHdjpwyxEq4jPD17czi1aakF76jqafvXQcPXdTz?=
 =?iso-8859-1?Q?qWNsKTdJRVyKebPngmGYZ59jN4ArtwF29wRyv8Km8FIGOnCzSNUgMef7S1?=
 =?iso-8859-1?Q?PGkAqf/9pgW85JvdsUo+danB/Nd2hem6+6iu1j3aRjNaFyjhEcnwIGmJmX?=
 =?iso-8859-1?Q?ZkNOPIIxz7Rx0iTkWIvdAgxQx/qG11Ivpo6rJXTosq7Srp5nJRtSCQe7kg?=
 =?iso-8859-1?Q?1tVSNEHMl2RkfSpVWvZjiDizn12SUCLoaUYktGsrmvumRcQ24dYjpAFy6X?=
 =?iso-8859-1?Q?QzaAA5r2cGh8vY+UqGGzA3p/RzZFaOGto7tcLnv7BpBdP62l9J7sMIU1l4?=
 =?iso-8859-1?Q?q4g8mbLUfRWEWkPBHX5E8ru6MWouX+LdFllNivAgEtb3o0Cj+9hBYkEo8f?=
 =?iso-8859-1?Q?PnV6MKJPmP5GCtP1eu3xnpSK8FoYiRGyUEdNDeCtnemnRKTqLm6l+6E4Ia?=
 =?iso-8859-1?Q?yRpxZAZKgUTin/XUmcHpNUf/H0dEGdsKIS4JzWY6buzhY7bQYJ9MXh7Mvp?=
 =?iso-8859-1?Q?4VR7Y5Zum+k4/my9qS4p5TvZZxgwQP/15MzjMYXlk7d164V6vr0TUjFbbM?=
 =?iso-8859-1?Q?yIndR8rj9fTjpY9AR6liOGz69B4ZjMxBYKdA7KYMBMXIasJYrDj7YbAcFn?=
 =?iso-8859-1?Q?dYI+8uv02F2ct3QOA7Q=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772f1846-5da2-48d7-ffc2-08d9fc4ec6e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 13:15:52.2356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GFbV9b1V/pvoUHIaRuvT0FiyFJh0S1gtZtpI1pOMPJ3X7nbcaAzSuoUL0M8UXw4xbpvZlRq2ellHKxpOHpbdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_051557_175422_59DD9029 
X-CRM114-Status: GOOD (  16.61  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
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
