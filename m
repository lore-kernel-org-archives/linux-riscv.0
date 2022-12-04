Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D20C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vw6rxFXkvb7KkrFCt5YheC3l6E1NZ2XkeLL0XLS6bvc=; b=B5ZZofSvZfGWkr
	SDZhH3fkZBWp9COv/KVjFHgbyv7WVRlR4hnfzGnapaBnsDoY5jAhp846UicqodHLnYl/9GlaFwtBJ
	Lz2OdWr+rNJ1q6Rt2xzdVCyj28vzgKI9yUg5VnSsu/cvPO43fI3arh51yc1CrVRgoD1J7l1FrNz+T
	o+jXz7oGBqL1wPtDVNgHo+7bpMZizOHM0vmdzbQeI3+4IPx825FJBvr7nmaj7HEZXiF+wE6ejm8pd
	Ui98Zl9zJSTuvgmjI2NgmKj+ggHnUOHkS6x/ggiNo933o7agraL1TOuF2ub2qORhbZU1BGb9zJLCn
	58Et3CLyfsc3iFLH6ZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tIE-00A85L-EW; Sun, 04 Dec 2022 18:00:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEf-00A6kq-TB; Sun, 04 Dec 2022 17:57:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B81960EE0;
	Sun,  4 Dec 2022 17:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820BEC433D7;
	Sun,  4 Dec 2022 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176624;
	bh=JXzPxvFpWQXfBP14y0JZvUn34ik1sRVmrtRbscUXSzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7uERDpLmA51CeeeqseZ7VOvhDxV/BnNb89BObR8vFxipu3a7G9ACLphKz1DSAfE0
	 p55xdOiTuLzvwda+mzn/a25lku6qOXof1nFy4S7V/1oI+E6R0qHi2B+8MpRivnagjU
	 Ts4Jpc9lFdfNi93iAXEmcq16W9C5FXQMsKfUDDoCRQjqxBVS4pEpZBKqHTB7zQK8ci
	 DGPBKFKBhnCUe+GOuWkZASE600znmEI5XDrJppmIa6TSXx2teSFTut+vvis/DzalYp
	 hTNgyi7QO2Eyx3nPSmyCHH9zuddIWgo0L1LoN6mnPHnnjBE7UoaVWB70ArhcgLhFkH
	 wBq14VfW2mEZQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
Date: Mon,  5 Dec 2022 01:46:32 +0800
Message-Id: <20221204174632.3677-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095706_060575_961EA986 
X-CRM114-Status: GOOD (  11.19  )
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

All users have switched to riscv_has_extension_*, removed unused
definitions, vars and related setting code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/hwcap.h | 30 ------------------------------
 arch/riscv/kernel/cpufeature.c |  9 ---------
 2 files changed, 39 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e2d3f6df7701..be00a4337578 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -60,18 +60,6 @@ enum {
 
 extern unsigned long elf_hwcap;
 
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
@@ -79,24 +67,6 @@ struct riscv_isa_ext_data {
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
index adeac90b1d8e..3240a2915bf1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,9 +28,6 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
-DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
-EXPORT_SYMBOL(riscv_isa_ext_keys);
-
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -243,12 +240,6 @@ void __init riscv_fill_hwcap(void)
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
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
