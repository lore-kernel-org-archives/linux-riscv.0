Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8414BC88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TifNLpr3RrTDBsaEFPT87rPvShowuY2G5/U2vBgmTeI=; b=szishzLPV7ljaO
	1QPJyaZvZxDxLxYG5VmtstUZgDdlDddzJ/aqDtSoV4inQjGEaYOhd3zfzNfUUyUAQECJ03Zhr1Mzj
	UYm2wLurvpBk+OLQZuzRfgBId7jkQwQ04GAarwRscjj32Qbj3XclyB2YvmD6frGv2SI7POOH6MzIv
	RaffAIKNwC+3z2vPYjRW/Fw1uVpk3dflxhyPv3Mkjh0842AyXoWtzL46tAy7rkywcW2T1MgajDCvs
	QIeUn7ecxI5ha0bbqd+qY8t6ulBtaWIvSdDqoe47yJ8mp0GlNiaIAv2xa1woSUIY93muQ3BCP8jAZ
	7bmO8RpsWxtPKRBHKJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F1I-0000000BukL-0mIN;
	Thu, 17 Sep 2026 16:31:32 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F1F-0000000Buiv-3nd5
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 16:31:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789662673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lI7xMM7oeI5QArXfSL/hnCeQEbm5vEI5mLg9moxopL3ljz9jF9FOrqpg1LeqoKGR/b0UIbmx6GOO3otW2IjeA/k6mgKfNlxd8VoOymwmuxMdsfWZLSS0fE1VzevGKL79edfzLdry3ANMYKl5XTKIZil37E+lapr7en/v3duNj4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662673; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=; 
	b=GgdX5EVGncL8+tdOuLvhUZtvPw7yT92xn/cAFjtz6H1SC6dQrZG1a/jPc0wUXKl0WV0sfk1twbHqh8oMt1gusAoyxWCl20Vjo0tQd1kOS8E95PtNSVAGISBwTgABNYuLGQsYqETXBuk7RMfvXsh8fUBi1vlQUictgVxWnKQ0OiM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662673;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DbZb7rgl/7w1w4tb13GdbjXjUAAevHFVnXZh+5Ul2mc=;
	b=nEZHgWWsaJtsyur+5fl+JWlP5hcMk7jVKqqFoMUTSuyiCmCdMhN01r0kT//vEcv8
	SUxpvCENOElhx89NBVH3W2P0lbUDGIKvTxatnFpYzjzEucq53XUFUdEscBRCcH0lDZ0
	cWDSOKeLXJwXmhGk8IV+f20R0u4pATmVZ4WqHEB8=
Received: by smtp.zohomail.com with SMTPS id 1789662670954111.87388827889936;
	Thu, 17 Sep 2026 09:31:10 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:37 +0800
Subject: [PATCH v3 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=h8aJIH7hyzSaiZSkDnw2JIZGmRG2/AZ362IquoczBB8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiPb1TLomq2Zwa8+84j1zGaYd7jrL5my1lc3tSLm8p
 1sE58mtHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAEzE4CLDX7Fmb7+W7tNz1rF/
 VJJoP+TcsCLy7qbzV8TUitcuO9K1Worhn4KlSfrTac3/qxRWScVpMjuuFOBetsBmuvvzDXsWpiT
 u4QcA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_093129_994467_79175A45 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Add a match entry for the spacemit,k3-aclint-sswi compatible. The K3
SSWI device requires no special handling and can use the existing
generic ACLINT SSWI initialization function.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/irqchip/irq-aclint-sswi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..d3ef2cd3b5c5 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
 }
 IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
 IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
+IRQCHIP_DECLARE(spacemit_k3_sswi, "spacemit,k3-aclint-sswi", generic_aclint_sswi_early_probe);
 
 /* THEAD variant */
 #define THEAD_C9XX_CSR_SXSTATUS			0x5c0

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
