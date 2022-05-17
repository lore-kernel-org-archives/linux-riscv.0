Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00657C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 18:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sdj1EYgyTqHgzs9InUKmalp/letJTEWZf+5thf9uMow=; b=4TyuO5eisRiRJj
	LrakSbtTeQ6p3JD5hw8fsDrIYZiIONdd/p3fiL2y/X6KqnGM7c6lG9uXXD1XpbUYLcalr0LxKYVXs
	4LKuczUcWtMvEPIHa5yK7XCW8vVjCWP83kgz94VoG2pZQ1T5CY4v7XYHH9rg04x+iStx11hp15GJx
	/vEdR8zo/qLzrAbs92cpWDeiAAY23RgbmnztmrhsBE7lDb4A7E+9CJ9lc4lK+m08s5+5owXN02aDH
	oMfgR5O4ShyIZg5Zo6yQJRwaOUx4nBY3ME9loU4ELb3wsLAi3W8+uTrMRtAzKtO9U/9qFtrGaYPZn
	XWJOCO33LBReH8O0l/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr2K6-00FRNm-Cn; Tue, 17 May 2022 18:53:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr2K1-00FRLc-Dt
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 18:53:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 137E8B8182C;
 Tue, 17 May 2022 18:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F7DC34100;
 Tue, 17 May 2022 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652813606;
 bh=dnCj5fK++GgdQ8csI96h261BD331upzx62aLFlRC9oQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RmQHQF18aya6HZQ75G73Wl33laz3G0XFVKaZ0ZYhqQahUkPoK3/Zc4/XXxgqu+QvS
 Be9Hn/drP12qRV7vXnR//oqUlViZREAcvTP9vh+0JWcFaEVCfyHQNAgoC/0j1OozW1
 9Idv1ej2KBxd1pTSwdjHdeFDQyeQlAHDj6lGa6SrCqd8S0jS771sz1Mx6hRXWtVc+q
 G6f06vyf48MGtRV6RVRs7/CErmruOTb0OLq6IGym2I31SSyBsthGj19pMt3FIh+GkN
 x8FjGCyqO0jKR8rUEIUmLzIH4CM1oLMKM0GWvUkyvfscTl+c3WQS6O2tdhZ+EFj17/
 15PTM+S0BdNJg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: introduce unified static key mechanism for ISA
 extensions
Date: Wed, 18 May 2022 02:44:52 +0800
Message-Id: <20220517184453.3558-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220517184453.3558-1-jszhang@kernel.org>
References: <20220517184453.3558-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_115329_806079_A8C57DD6 
X-CRM114-Status: GOOD (  18.47  )
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

Currently, riscv has several extensions which may not be supported on
all riscv platforms, for example, FPU and so on. To support unified
kernel Image style, we need to check whether the feature is suportted
or not. If the check sits at hot code path, then performance will be
impacted a lot. static key can be used to solve the issue. In the past
FPU support has been converted to use static key mechanism. I believe
we will have similar cases in the future.

this patch tries to add an unified mechanism to use static keys for
some ISA extensions by implementing an array of default-false static keys
and enabling them when detected.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/hwcap.h | 40 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c |  7 ++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0734e42f74f2..b0433d2b880d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -12,6 +12,7 @@
 #include <uapi/asm/hwcap.h>
 
 #ifndef __ASSEMBLY__
+#include <linux/jump_label.h>
 /*
  * This yields a mask that user programs can use to figure out what
  * instruction set this cpu supports.
@@ -55,6 +56,16 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
+/*
+ * This enum represents the logical ID for each RISC-V ISA extension static
+ * keys. We can use static key to optimize code path if some ISA extensions
+ * are available.
+ */
+enum riscv_isa_ext_key {
+	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
+	RISCV_ISA_EXT_KEY_MAX,
+};
+
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
@@ -62,6 +73,35 @@ struct riscv_isa_ext_data {
 	unsigned int isa_ext_id;
 };
 
+extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
+
+static __always_inline int riscv_isa_ext2key(int num)
+{
+	switch (num) {
+	case RISCV_ISA_EXT_f:
+		return RISCV_ISA_EXT_KEY_FPU;
+	case RISCV_ISA_EXT_d:
+		return RISCV_ISA_EXT_KEY_FPU;
+	default:
+		return -EINVAL;
+	}
+}
+
+/*
+ * @num must be a compile-time constant.
+ */
+static __always_inline bool riscv_isa_have_key_extension(int num)
+{
+	if (RISCV_ISA_EXT_ID_MAX <= num)
+		return false;
+
+	num = riscv_isa_ext2key(num);
+	if (RISCV_ISA_EXT_KEY_MAX <= num || num < 0)
+		return false;
+
+	return static_branch_likely(&riscv_isa_ext_keys[num]);
+}
+
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
 #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..89f886b35357 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -24,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 #ifdef CONFIG_FPU
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
+__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
+EXPORT_SYMBOL(riscv_isa_ext_keys);
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -232,6 +234,11 @@ void __init riscv_fill_hwcap(void)
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ELF capabilities %s\n", print_str);
 
+	for_each_set_bit(i, riscv_isa, RISCV_ISA_EXT_MAX) {
+		j = riscv_isa_ext2key(i);
+		if (j >= 0)
+			static_branch_enable(&riscv_isa_ext_keys[j]);
+	}
 #ifdef CONFIG_FPU
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
 		static_branch_enable(&cpu_hwcap_fpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
