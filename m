Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0293EC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X67IgVrcvtEJLblHothJsUFy7T/wzc5sKEH+QBaYKi0=; b=pXYcRTXvnK4WH6
	Hxy0Pwapf4eoOI/kRzVNXvGNsk9zEI2qWUCgrjr1soM9/a7h+CgfCQYsvKQ1EyTjquhoofEf0r3Hm
	f90I5iNkD8x/ojxyOnFvMMFBtGrhYbAH7bvwZLv0JFWjZMLUtYCIB59WcXy3nRxqxyfAX4mCr+DRp
	kdkajTcVFCZMY/tJSg2Vxs4cIhBRk9OTV8CX0ncX3X+sohcVBGhcQ9UmRiTaR+S8FiVzURI1rF7FR
	pd7WbbYxU8AiKYFyOBl4EpeNdUUgq82vvxOy4mGExBXN9MLhy/598LIi1GjOCwmVcU+gEdvOpuodM
	r7xTxspb3sKwjAAMzTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsnkt-001bcz-Pu; Sun, 22 May 2022 15:44:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsnkq-001bbq-Rn
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 15:44:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19BC060FF8;
 Sun, 22 May 2022 15:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A75C385AA;
 Sun, 22 May 2022 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653234267;
 bh=issCkMCtvgjOFJMYrAwxjLaKfTsyPKtkpaH6yaHo3nk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q9C/FMqIswh924to3Qp7jaIljZnpLaaKeYqsqusO7vhazCSSbw37NUGB8LKP4PPQX
 ZK8ILwCXjCulprCDNzK151akWkrgxu/EXjiDxR3WbHklzh95mZ9eRilFL4hP5Qi/rf
 +XUd0XcDaKl851xKXpDXTcY6vOpuJ8+M1YH7+87AgHfrK7TUoBKVp1svjEVBhrdm4B
 BdSDgg03pB8l/9bKYCj+dhYrYGLtc+uGi8YauAj2hJeiUphJxcqPemqyOSJ43yo1Er
 hEoUb/gJCT3CPX1hT6R8XwmXClC1M6Ccvz6KpkFtwzN7NfnTQdXVc6tnFdbZpti+FD
 sJeu+F5e8pPpQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: introduce unified static key mechanism for ISA
 extensions
Date: Sun, 22 May 2022 23:35:42 +0800
Message-Id: <20220522153543.2656-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220522153543.2656-1-jszhang@kernel.org>
References: <20220522153543.2656-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_084429_017286_51D0FBC4 
X-CRM114-Status: GOOD (  17.40  )
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
kernel Image style, we need to check whether the feature is supported
or not. If the check sits at hot code path, then performance will be
impacted a lot. static key can be used to solve the issue. In the past,
FPU support has been converted to use static key mechanism. I believe
we will have similar cases in the future.

This patch tries to add an unified mechanism to use static keys for
some ISA extensions by implementing an array of default-false static keys
and enabling them when detected.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/hwcap.h | 25 +++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c |  7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0734e42f74f2..d3e113fe7366 100644
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
@@ -62,6 +73,20 @@ struct riscv_isa_ext_data {
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
