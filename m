Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD81EC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3NujfmAGZkQD1PRIK1+YC8H6Kh3rHtqpc1PE+FIz2M=; b=nxz1vsDRCzqyCU
	npNadXJfIYTtPj03RVVkWCxqBe+kFs+32NMrg9fX4IqtXOGH4LE3B29DSSEQ15l6/PtMxC9WRAzAe
	s3QTmT7RRDWNYXKPFJjzVxeyLAoLw7D03JPRGs+zPYguL6/Z6hk+JK95jrEm+ZDzUpIo6AZ5LDUbq
	NeMnfPjgj6XuWyZEnLp8xYLa4WvxYnWs0fKFKFvbfLoeJSOVLLbkWaB7COg7g8vDdLmS53teDBmhL
	CI7i+lZVTiq7SrSM4I+es9xp1Qe3TS/T8abLNxY1Jq+ZoX+8GRn67mz9bVcM2kU78MW2R39SyD1Fo
	niPtTXga5AKC/dYDLAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpBa-000Ter-KM; Sat, 28 Jan 2023 17:40:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpBM-000TOg-Ba; Sat, 28 Jan 2023 17:40:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E269B80B78;
	Sat, 28 Jan 2023 17:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C84C4339C;
	Sat, 28 Jan 2023 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927602;
	bh=v9v2YuI2MYmPy9J7ATNdpGXQZhVb8633CvAOR8a31S8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qlBKhqtf5QnrY9lDWy5hF/HXhdnsfuUqtlThv0vc6GDpSPGkMqzvCvhDNxY6VtUbS
	 9wnz1v/qzkfH/fhAeH+PRTrxlcz5ciscoVSlfPAo5cJJR3ygyitX7JCdum7FAoZMVI
	 sL4i7gFhHUMoxePKr7X7/0NFRKJVcY0ApHh+xz3g3vfWMYNBcBRzo3L8v7iUsY/zhZ
	 RevokyFvxg76211KfiYLfIugOZSCxARqNlIXvMvzJW6WDhck9Iju2UXjsZ+usl8Chl
	 5LeGbGBS0KEerO0qpLjg44HLa27lPslYi5DfO7jaAxKcQRdckISqx+tJkMvZOK13xi
	 WPK8g4UPR/rvQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v5 13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
Date: Sun, 29 Jan 2023 01:28:56 +0800
Message-Id: <20230128172856.3814-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_094004_721788_989C5E29 
X-CRM114-Status: GOOD (  11.15  )
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
 arch/riscv/include/asm/hwcap.h | 32 --------------------------------
 arch/riscv/kernel/cpufeature.c |  9 ---------
 2 files changed, 41 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 411ef0fb5c4b..7936ae6f7bdf 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -61,20 +61,6 @@ enum {
 
 extern unsigned long elf_hwcap;
 
-
-/*
- * This enum represents the logical ID for each RISC-V ISA extension static
- * keys. We can use static key to optimize code path if some ISA extensions
- * are available.
- * Entries are sorted alphabetically.
- */
-enum riscv_isa_ext_key {
-	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
-	RISCV_ISA_EXT_KEY_SVINVAL,
-	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
-	RISCV_ISA_EXT_KEY_MAX,
-};
-
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
@@ -82,24 +68,6 @@ struct riscv_isa_ext_data {
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
-	case RISCV_ISA_EXT_SVINVAL:
-		return RISCV_ISA_EXT_KEY_SVINVAL;
-	case RISCV_ISA_EXT_ZIHINTPAUSE:
-		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
-	default:
-		return -EINVAL;
-	}
-}
-
 static __always_inline bool
 riscv_has_extension_likely(const unsigned long ext)
 {
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 18ea518f9e68..a4f737bc7530 100644
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
@@ -267,12 +264,6 @@ void __init riscv_fill_hwcap(void)
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
