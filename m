Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECD7C3DA78
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTjbiek42gN7CxbyHFJMeNy1tIlUKnCujoLoR5PtTPE=; b=yWHFyQ9kPWJG9M
	xL80o84eEyoShusicimc0MSAJ55p20X3YhP24Psgkhx1OKsx0JxIyBVTEMwDrw11klbvmXp0PfCww
	PPPk+/qVWM1dGzi8BE7UpN6kV/AZneqR3FC3au+YyvdmkDMNEDhFjP2rr7mGlTm89m0nhmuHc7+Db
	m9WR8sFjjP3rNXPEY0QnCkTvo4TtH4O4Prhv7usQVFPPD+sgId3rjQCZm5MbWnOmHu6u6gwJBmuUF
	nsVJKImPJ4kxBCO/xpbPg4rVtxDbxkNIZs2CN4QG2rkYQB3+Pm6S+RkegiLCRC7XTSvUGij0bYftS
	xWdRxYev96pYy0ckLQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5RU-007cQC-2x; Sun, 15 Jan 2023 16:01:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5RJ-007cDB-0d; Sun, 15 Jan 2023 16:00:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1FECCCE0B90;
	Sun, 15 Jan 2023 16:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F87C433F1;
	Sun, 15 Jan 2023 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798453;
	bh=TdI6Dgn+yLIDZFmkCYe2dfL1K4Yhy6WJ5jrJ5rQfYsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VquzErEtrY+FHcb/87JDVvGBcYvgm0x9FOctzQu2X+I/goJjv46V75xDhq/DbpuLG
	 FXB39KEI/Hspwy2bYd9tMSmCyeyFrlHUWCXWwp8QI/c0hpIOYPfRzDAl4g9udqDvWj
	 GyMel+81vlabnmVeUOvRbi90899ScfOQNo+9AUaK09DxtS852sCtw2R1Ac7X8zlVZb
	 Al/kQVyozuQQrKqK8foSq7R4kPX7vkNF5WCMksCbWyat18Cg5vKYXrmgkK0YdV05D2
	 DICA4Pz9rMu2oWxB6J43gvG7DoVMlzlNuyPAUZLvfYR5oNw1MWh4piqyTX8B50ruqt
	 of+cZFu2SnGuw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
Date: Sun, 15 Jan 2023 23:49:53 +0800
Message-Id: <20230115154953.831-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080057_499928_65326AAC 
X-CRM114-Status: GOOD (  11.38  )
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

All users have switched to riscv_has_extension_*, remove unused
definitions, vars and related setting code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/hwcap.h | 31 -------------------------------
 arch/riscv/kernel/cpufeature.c |  9 ---------
 2 files changed, 40 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 1767a9ce1a04..e3749bee5c24 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -60,19 +60,6 @@ enum {
 
 extern unsigned long elf_hwcap;
 
-
-/*
- * This enum represents the logical ID for each RISC-V ISA extension static
- * keys. We can use static key to optimize code path if some ISA extensions
- * are available.
- */
-enum riscv_isa_ext_key {
-	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
-	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
-	RISCV_ISA_EXT_KEY_SVINVAL,
-	RISCV_ISA_EXT_KEY_MAX,
-};
-
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
@@ -80,24 +67,6 @@ struct riscv_isa_ext_data {
 	unsigned int isa_ext_id;
 };
 
-extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
-
-static __always_inline int riscv_isa_ext2key(int num)
-{
-	switch (num) {
-	case RISCV_ISA_EXT_f:
-		return RISCV_ISA_EXT_KEY_FPU;
-	case RISCV_ISA_EXT_d:
-		return RISCV_ISA_EXT_KEY_FPU;
-	case RISCV_ISA_EXT_ZIHINTPAUSE:
-		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
-	case RISCV_ISA_EXT_SVINVAL:
-		return RISCV_ISA_EXT_KEY_SVINVAL;
-	default:
-		return -EINVAL;
-	}
-}
-
 static __always_inline bool
 riscv_has_extension_likely(const unsigned long ext)
 {
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 50cfbbbecaa7..636dabfd35d0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -29,9 +29,6 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
-DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
-EXPORT_SYMBOL(riscv_isa_ext_keys);
-
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -266,12 +263,6 @@ void __init riscv_fill_hwcap(void)
 		if (elf_hwcap & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ELF capabilities %s\n", print_str);
-
-	for_each_set_bit(i, riscv_isa, RISCV_ISA_EXT_MAX) {
-		j = riscv_isa_ext2key(i);
-		if (j >= 0)
-			static_branch_enable(&riscv_isa_ext_keys[j]);
-	}
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
