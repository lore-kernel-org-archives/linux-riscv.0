Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F01CC6B33
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49HoexpC4GNbVvzyJFG8xSo/521yi81mLlrlHtafeRs=; b=rfPLTKsDkwLDj5
	7CKFJRYrxb0IDHqx3k2sWD71MimFtwZvfAcRyLpVqcjxsnTH0wzRl0xm+RyvWzIcbJpWWYebNyVFQ
	9uVqCx8D/cHn1lQAOA30VbEYlWoe3jGPKgQ6IKH468fRISq4kn2SIy3ubtkvTdGmy6PzCBwI+JNXK
	h8W9gifG88BvSMMpvoNCZ/Fs0zh2gCT2mdOOw9L5LIckaByhm1aoh88Nd3cu/E6ng+nmvdyQH3oRc
	VkbGzdrHLhs4NQsD6FVGo5spJnNxm8DnliBMBQ4rK0LOAn3Ce5p++7S3vW9OyHv39jZrvAWZKKs5U
	UzxYfoqUKTujwqEekrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKzN-00000000ApY-3pLB;
	Thu, 15 Oct 2026 12:55:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKzG-00000000Ajy-0Pw6
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0gn0ipHnBnEnnuWNB3XyCR/eq/dBn2N7SSrrBn41Q04=; b=mkmsWTnzoqn7bdtbP6VG7+rJJ6
	NVFcbg2oAI8YCxzb/4y68on4wiT5mUnlqldVyK+zZhm7ebUWjW+oBUaV5L2Q2n0aCzIbarjQ4MYmr
	maQSEyDxm4edGW6H8TsfK0eg9elYEPlWqhLDuqx0CH2sFuc7pC/dG9F9V3OlBgzL1z+5+JqFR3HWs
	psex1uiR+8UoVteih2RWQRugqmGQarZjawmTHEgH7EKAnMwo8FUziJdIc+uCph69U/5+ePLH9rpoD
	Kcb19xLOQSXu88hYs1KZcjmjZeD2+NBxMhzJLEALU55UpwOHQGqzNsAlv7bsrnC47Vqar9ZEViOf2
	t/aY661Q==;
Received: from naesa04.arrow.com ([216.150.161.24])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHKzD-00000000NfG-0QDx
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 12:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2112; q=dns/txt;
  s=NAESA-Selector1; t=1792068907; x=1823604907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0gn0ipHnBnEnnuWNB3XyCR/eq/dBn2N7SSrrBn41Q04=;
  b=iiXe7ZRdnp3X7PCAA6dto9wKlMmRgTpFCvNd7ecEBywaFMKyhLZhDTGo
   P9Szr1G8iI7EXi3FcKt8a4EYDM3T8fh/o7a23vOyIlLTwxJrZwDSyMqDD
   bXaH7qq7zCnBSi2/Vn7+Os5ddCeec8bpFc76pMdiS4eLvEbbF9YOM2Kv5
   sZDgEqJFwKWcP6qArtDPzHhl4CHioDdDGhzFcBqKLCNGQCkQ+qjeNw9MU
   8SwcH2sVPA9YWQzNi4mQbvvpb8aFZz3fjHSU9PgG6qbvkK7pU6RpOjzjo
   p76aXOnpW70AwXWd/VlXAbLa0NiVVecY+/KkmGtSqTPZMZR7urSgrLPd0
   g==;
X-CSE-ConnectionGUID: argpiFZDRjew2GEbVOkeTg==
X-CSE-MsgGUID: DaObyZLSRPODZY5ODLoDlw==
X-IronPort-AV: E=Sophos;i="6.27,159,1787032800"; 
   d="scan'208";a="125039186"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 15 Oct 2026 06:55:04 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 15 Oct 2026 18:24:55 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 7/7] riscv: dts: eswin: add watchdog support
Date: Thu, 15 Oct 2026 18:24:54 +0530
Message-Id: <20261015125454.1381941-8-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Oct 2026 12:54:55.0359 (UTC) FILETIME=[607400F0:01DD5CA4]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_135507_584235_C38E58BC 
X-CRM114-Status: UNSURE (   8.22  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

EIC7700 have four DesignWare watchdog controllers that are
integrated to SoC.

The controllers use only SoC-internal register, interrupt, clock and
reset resources and have no board-level dependencies, so describe them
as available in the SoC DTSI.

Each watchdog counter is driven by its corresponding LSP APB clock.
The NOC_WDREF clock belongs to the separate NoC watchdog and is not
used by these controller instances.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c0aa91b357ff..ec58a3aaf582 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -265,6 +265,42 @@ syscon: syscon@50440000 {
 			};
 		};
 
+		wdt0: watchdog@50800000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50800000 0x0 0x4000>;
+			interrupts = <87>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT0>;
+		};
+
+		wdt1: watchdog@50804000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50804000 0x0 0x4000>;
+			interrupts = <88>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT1_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT1>;
+		};
+
+		wdt2: watchdog@50808000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x50808000 0x0 0x4000>;
+			interrupts = <89>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT2_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT2>;
+		};
+
+		wdt3: watchdog@5080c000 {
+			compatible = "snps,dw-wdt";
+			reg = <0x0 0x5080c000 0x0 0x4000>;
+			interrupts = <90>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT3_PCLK>;
+			clock-names = "tclk";
+			resets = <&reset EIC7700_RESET_WDT3>;
+		};
+
 		uart0: serial@50900000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x50900000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
