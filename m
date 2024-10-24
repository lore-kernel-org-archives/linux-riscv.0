Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B186ACE8E6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySc7AYwpHOnzUaOnI0iqeAdTnpfAXIud0fuhDdUemUA=; b=unqR9BzZgl5xcd
	WSPt0wlulNgYy5zMnKMwvZZElQ5J+qaVfh5GM3OuITU40UMwrxuoMRA63hFP6yqMoD7TOpba4bJno
	86DveQ8F8kPYD5AvjWt5ETP29q6yb8nUjc43qZMu2Xyng9qCnRpKEk5Ewd9bZettbtyrT9jXFO2hm
	tgysSKswux51X9KPluG41D4arkO4Rae7fin9oetGB39WaLXPk797iUc3IRqHCV7jMEL0CNQRpPELu
	EIdtem4W/26hbsknRZCnXQd9US0QzIXhy1oHEK/EQB3SUxLrksC7frjd/i6DNBDYL1tOJcR8SLLwA
	Ei+VLaZcjWOdACnS5kYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x7k-00000000MxI-3TLR;
	Thu, 24 Oct 2024 12:39:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x35-00000000M0f-0LHe
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 12:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9D0E5C5EF8;
	Thu, 24 Oct 2024 12:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0377C4CECC;
	Thu, 24 Oct 2024 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729773282;
	bh=wSLCfX8wndX+rlS9G+CmOUl2Cwte9stfmakvhsfLyUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iJptutNj5MijtBI9tMs3A1CwAXFGnS8Xtq7G5VnIKvaBVZDYSyyo2PBRt6smOgNwP
	 1RcfX/Kmt8V2Nn/jpLk3AKIqsMB5XelikZMqVSwAcJlCEroRR3M+8jMODx6T62/cLc
	 DVFW5KTylQDIS29154ZuSUYCC/JVORfVJT7VvQg7s/G5VT6DRPK9M2TXxNJ7PvteF4
	 sN2BpJ89g6xCjKw2d52dprCAKOmAQS/ggUyMsNmKTLzKwRZqnXiBBmDXU20/bMm780
	 MVu4xpa7ZZfEzwE8r7rOQEk7M08YoLhcCl53/Hs0VeDOoTvqNVB6JcGKaL1hQkrHDv
	 JXxx5eYtZdqyw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] RISC-V: add f & d extension validation checks
Date: Thu, 24 Oct 2024 13:34:30 +0100
Message-ID: <20241024-only-crepe-64267d0eebe1@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024-fanning-enrage-bcc39f8ed47d@spud>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2981; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UvTI7yQ4XDO7pBfMOp39hyEWkU6sqFWGVmdNeuF8vEc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlSdldvG/5Z/lq47UnO8or4cNXwyGtqPHNaZoXnf9iUN n21otXbjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkXxrDHw537uJ5H1jc//9k utO/bov9ceNitVvn7u2p41zyo61HL5Dhf5WNs8AxESdemY+rLqkJim26lJqhqnVA7OiOq18V7/1 fwgUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053443_234567_BB8A0295 
X-CRM114-Status: GOOD (  14.35  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Using Clement's new validation callbacks, support checking that
dependencies have been satisfied for the floating point extensions.

The check for "d" might be slightly confusingly shorter than that of "f",
despite "d" depending on "f". This is because the requirement that a
hart supporting double precision must also support single precision,
should be validated by dt-bindings etc, not the kernel but lack of
support for single precision only is a limitation of the kernel.

Since vector will now be disabled proactively, there's no need to clear
the bit in elf_hwcap in riscv_fill_hwcap() any longer.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 36 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 020b19edee2e8..1326049d2ac3b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -101,6 +101,29 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
+		pr_warn_once("This kernel does not support systems with F but not D\n");
+		return -EINVAL;
+	}
+
+	if (!IS_ENABLED(CONFIG_FPU))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_ext_d_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_FPU))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data *data,
 				     const unsigned long *isa_bitmap)
 {
@@ -350,8 +373,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
 	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
 	__RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
-	__RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
-	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
@@ -910,15 +933,6 @@ void __init riscv_fill_hwcap(void)
 		}
 	}
 
-	/*
-	 * We don't support systems with F but without D, so mask those out
-	 * here.
-	 */
-	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-		pr_info("This kernel does not support systems with F but not D\n");
-		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
-	}
-
 	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZVE32X)) {
 		/*
 		 * This cannot fail when called on the boot hart
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
