Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B4CC982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+A2jUSS54MiT1VEmI2AQsIB3CUy2q3NzTdRczVbO8U=; b=GR2CkzyeiW9IiO
	rnbZT2QhvzFdkhdTnXJ6yIICOJOGqoB3/RqTzltA5yjZCRyicMjAV5CbZubKyvk3yhkVPcnvvdLf9
	KXT+0clCw8KwFRZaZiYlihar65qXvhQMgSVxAoPmyu6ZEwFOJaF/RXzha3vsxAU9BnFboT34IW3ZH
	Jl8KXC5N3T3Ho7pBtE5patX7Q6AiiBPbkQxwZlBmr0Z+y0KZG7XejO4B4f13Jcss22HHKCgKLfOjU
	xY15ufoPpyJ1pRNO1eLDcwLQX0hYzDRqXvT2H3u7iBdoUs+C3DTLjeBuPgINn0JeNPmmlAxKU8RVh
	wi8qA6i+zP0UFw388BiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWz-0000000Fazy-2Iab;
	Fri, 18 Sep 2026 21:54:05 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWw-0000000FawI-0W14
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 21:54:04 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43ac8d1fso9526197b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 14:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768441; x=1790373241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oD/MlcX/QYjDVcdYmRV+KU1dYTn+oF/u+TXErdbiLr0=;
        b=FvjUuob0DRseVL1GLqlCSLf+cBB4rqo85pnKw9gggf327cjLfBvGTXI2rDoJw+Ihxm
         EAsLN1ZblqA2b1hT4d7EMA5xQb2Rl1jK/VOAOA3oRjc/k2kYECN+fxQZU4hGpXvz8U58
         POefDUPQped7YHV1Ta2WlHfAJZfxHfAYvyv+dO2u9jxrfALcmt/nUlZejw8odS/kgA98
         xFdjot5ZQqT0yknKPvJzQY/H+EOKQul75fchkg34GLOkB23rLGtF0Vtahv25TM54TjrY
         6Ide51L68BopLxnowGSofVeBhruaGwR4Tzqmgts31keJ9jbqksfnsQ1WzqwD79gIE5pv
         hJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768441; x=1790373241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oD/MlcX/QYjDVcdYmRV+KU1dYTn+oF/u+TXErdbiLr0=;
        b=nKswUnWRVjePjzO3VsEMYDIBdoSIL653Wu2XbEBLyyK9rmZd2qpLdZEwEHlfjLuVND
         +4XeTRjz+Dkh+hDMkb2RA0Vrb25Wbj0T1/Vgt7/WIHhvqcyMWaEqVZ8lZvnhrM3Q6768
         nMCWKDFqXLRzEchBuKdBLoGY/6BGhgcxSVfDYyCtBi5RVj3soeOgCamVoc9DhGX2NBS9
         8BP7rUGbBeJKQkXKAHhJ4JkZt+np2aFKmivQ38gVb1aEqczTX+8IYwOXxtWC7Wlf4Cxu
         Pm85tuMeUWVMczWvkisJTztniQN0WGiHmmReC8k9rKiP3NUpaWCtGwmBpGfDnepZ+gjs
         DZRg==
X-Forwarded-Encrypted: i=1; AKwUvByVM9Rb343Lu3o1uNE3F4/0kqBegjMxCs5qqnK5uXnTH64uZQH611N6LOtjs9GNCNbTMc89LWmCR/vgGw==@lists.infradead.org
X-Gm-Message-State: AFuF++mxe9/1wD1zr7FYFBZBdmsy+luOjqdBwsT+oafaK6bb3kOXPex7
	7hyURsQ/PgE/xg30/U7ICyB+7Rlflgxp12P3nTH5HYkKLD4uDOuGj8ImVJ47RFICekE=
X-Gm-Gg: AYBFou24JdzRKw6wbpbPNmUPhbqriwMe7oOSTcXLsA2bQuQpBppzP05K1TF2n2G7AG8
	GEF1NGYS6qk3Vm/8UgDLfIOm6eRi07aDgC6evmmi/J+3+FpHpsJnQ0T6lAvwj8zQE+nHnIGcS8g
	j7SdsMHgobG0R8B+r8YuABnywWgz/8TCPE2re79/Z+3C47qhiQNuiw2Qip56WIVrzOIOdRWDS8R
	XvsX5LfDbDM03oaZtLFlWKsFrPoAhX2nYYwIq+8PtJoGbRwVJfQf8UNILugv8IzWXg02y/n+AEv
	Eak5qcnyegYuvjOuO9qzRF5SxdnVggEVCS+dh1asDPx8F+qG2JNAn7cBBfZ+OK7FixrzIF/f2ji
	8EMs+UW4V4XS0eOIfjOUFzUAqBtDWNio10Ea+I0ev9owAefLm5agBHSSC7cGfOgotUSeYNCwghq
	+TdZLKDQo9TM1/TmZx4q4FM6mV/7YaHBqTGLbynePlUIWMGV+EJvZbRDQ9jxAkvfUifxoPoN6gR
	q8/f6fcbU9CrcjoNfFrdM8siLBDS6rxdhC8
X-Received: by 2002:a05:690c:e1dc:10b0:893:ff7e:8242 with SMTP id 00721157ae682-8973227c6cdmr10542027b3.8.1789768441108;
        Fri, 18 Sep 2026 14:54:01 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:54:00 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Jeff Layton <jlayton@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Guodong Xu <guodong@riscstar.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Atish Patra <atishp@rivosinc.com>,
	Hui Wang <hui.wang@canonical.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rui Qi <qirui.001@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v6 8/8] riscv: vector: optimize vstate operations
Date: Fri, 18 Sep 2026 16:51:22 -0500
Message-ID: <20260918215154.2481482-9-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_145402_204904_3FE09D81 
X-CRM114-Status: GOOD (  26.75  )
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

Introduce the riscv_novstateopt to control the optimization of vector
state operations in the kernel space.

The optimization enables vector in kernel mode and bypasses vector
register nulling for user space on the syscall fast path when the boot
argument "riscv_novstateopt" is not set

Enabling this optimization yields the following performance benefits:
 - Cut 80 cycles latency for getpid on Ascalon.
 - Up to 2.9% request throughput improvement on an nginx workload on a
   four-core Ascalon-S.
      86B      1KB      2KB      4KB      8KB     16KB     32KB
    +0.33%*  -0.23%   +2.88%*  +2.19%*  +1.02%   +1.14%   +1.40%*

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v6:
 - upgrade it to use alternative and change default to enable the
   optimization
 - refresh the nginx numbers for the alternative-based implementation
Changelog v5:
 - new patch since v5
---
 .../admin-guide/kernel-parameters.txt         | 13 +++++++++++++
 arch/riscv/include/asm/alternative-macros.h   |  6 ++++++
 arch/riscv/include/asm/alternative.h          |  3 ---
 arch/riscv/include/asm/cpufeature-macros.h    | 12 ++++++++----
 arch/riscv/include/asm/vector.h               | 19 ++++++++++++++++++-
 arch/riscv/kernel/cpufeature.c                | 19 +++++++++++++++++++
 arch/riscv/kernel/entry.S                     | 15 +++++++++++++--
 arch/riscv/kernel/process.c                   |  3 +++
 arch/riscv/kernel/vector.c                    | 17 +++++++++++++++--
 9 files changed, 95 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4a12805a50ba..798175c902eb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6700,6 +6700,19 @@ Kernel parameters
 		fcfi	Disable user forward CFI ABI to userspace even if the
 			landing pad extension is available.
 
+	riscv_novstateopt [RISCV,EARLY]
+			Disable the vector state optimization. By default the
+			kernel keeps Vector enabled while running in kernel
+			space, rather than toggling sstatus.VS on every use of
+			the kernel-mode vector, and skips nulling the vector
+			registers for user space. Pass this option to restore the
+			conservative behavior, which catches illegal use of
+			Vector in kernel code. The optimization roughly cuts
+			30 ns of getpid() latency on a Blackhole x280 and gives
+			a 2.9% request throughput improvement for an nginx
+			workload serving a 2KB web page on a four-core
+			Ascalon-S.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL,EARLY]
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 9619bd5c8eba..f6997c77e29a 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -2,6 +2,12 @@
 #ifndef __ASM_ALTERNATIVE_MACROS_H
 #define __ASM_ALTERNATIVE_MACROS_H
 
+#include <linux/wordpart.h>
+#define PATCH_ID_CPUFEATURE_ID(p)		lower_16_bits(p)
+#define PATCH_ID_CPUFEATURE_VALUE(p)		upper_16_bits(p)
+
+#define RISCV_CPUFEAT_VSTATEOPT	0x1
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 
 #ifdef __ASSEMBLER__
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 8407d1d535b8..4a50a8601985 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -18,9 +18,6 @@
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
-#define PATCH_ID_CPUFEATURE_ID(p)		lower_16_bits(p)
-#define PATCH_ID_CPUFEATURE_VALUE(p)		upper_16_bits(p)
-
 #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
index a8103edbf51f..46ef64932a1c 100644
--- a/arch/riscv/include/asm/cpufeature-macros.h
+++ b/arch/riscv/include/asm/cpufeature-macros.h
@@ -45,22 +45,26 @@ static __always_inline bool __riscv_has_extension_unlikely(const unsigned long v
 
 static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+	int realext = PATCH_ID_CPUFEATURE_ID(ext);
+
+	compiletime_assert(realext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
 	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
 		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
 
-	return __riscv_isa_extension_available(NULL, ext);
+	return __riscv_isa_extension_available(NULL, realext);
 }
 
 static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+	int realext = PATCH_ID_CPUFEATURE_ID(ext);
+
+	compiletime_assert(realext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
 	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
 		return __riscv_has_extension_likely(STANDARD_EXT, ext);
 
-	return __riscv_isa_extension_available(NULL, ext);
+	return __riscv_isa_extension_available(NULL, realext);
 }
 
 #endif /* _ASM_CPUFEATURE_MACROS_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 1cc37d40cf79..b227a8252fa9 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -49,6 +49,7 @@
 	_res;								\
 })
 
+extern bool riscv_v_vstate_opt;
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -78,6 +79,14 @@ static __always_inline bool has_vector(void)
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE32X);
 }
 
+static __always_inline bool has_vstate_opt(void)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return riscv_has_extension_likely((RISCV_CPUFEAT_VSTATEOPT << 16) | RISCV_ISA_EXT_ZVE32X);
+	else
+		return false;
+}
+
 static __always_inline bool has_xtheadvector_no_alternatives(void)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
@@ -122,6 +131,9 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs)
 
 static __always_inline void riscv_v_enable(void)
 {
+	if (has_vstate_opt())
+		return;
+
 	if (has_xtheadvector())
 		csr_set(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -130,6 +142,9 @@ static __always_inline void riscv_v_enable(void)
 
 static __always_inline void riscv_v_disable(void)
 {
+	if (has_vstate_opt())
+		return;
+
 	if (has_xtheadvector())
 		csr_clear(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -335,7 +350,8 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
-		riscv_v_vstate_set_restore(current, regs);
+		if (!has_vstate_opt())
+			riscv_v_vstate_set_restore(current, regs);
 		riscv_v_vstate_init(regs);
 	}
 }
@@ -421,6 +437,7 @@ struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
+static __always_inline bool has_vstate_opt(void) { return false; }
 static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
 static __always_inline bool has_xtheadvector_no_alternatives(void) { return false; }
 static __always_inline bool has_xtheadvector(void) { return false; }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d2ec96843456..90a0b745611e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1217,6 +1217,20 @@ void __init riscv_user_isa_enable(void)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
+/*
+ * Leaving Vector enabled while in the kernel requires the vstate alternatives
+ * to be patched in, so the optimization is only available when alternatives
+ * are built. It can be turned off on the command line to catch illegal use of
+ * Vector in kernel code.
+ */
+bool riscv_v_vstate_opt = IS_ENABLED(CONFIG_RISCV_ALTERNATIVE);
+static int __init riscv_novstateopt_setup(char *__unused)
+{
+	riscv_v_vstate_opt = false;
+	return 0;
+}
+early_param("riscv_novstateopt", riscv_novstateopt_setup);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
@@ -1246,6 +1260,11 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
 		 * then the alternative cannot be applied.
 		 */
 		return riscv_cboz_block_size <= (1U << value);
+	case RISCV_ISA_EXT_ZVE32X:
+		if (value == RISCV_CPUFEAT_VSTATEOPT)
+			return riscv_v_vstate_opt;
+
+		return true;
 	}
 
 	return false;
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d799c4e56f80..d9d6b4f87670 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -6,6 +6,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/stringify.h>
 
 #include <asm/alternative-macros.h>
 #include <asm/asm.h>
@@ -175,10 +176,13 @@ SYM_CODE_START(handle_exception)
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * Disable the FPU to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS
+	ALTERNATIVE(__stringify(ori t0, t0, SR_VS), "nop", 0,
+		    (RISCV_CPUFEAT_VSTATEOPT << 16) | RISCV_ISA_EXT_ZVE32X,
+		    CONFIG_RISCV_ISA_V)
 #ifdef CONFIG_64BIT
 	li t1, SR_ELP
 	or t0, t0, t1
@@ -186,6 +190,13 @@ SYM_CODE_START(handle_exception)
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
+	ALTERNATIVE("j .Lskip_v_enable", __stringify(andi t0, s1, SR_VS), 0,
+		    (RISCV_CPUFEAT_VSTATEOPT << 16) | RISCV_ISA_EXT_ZVE32X,
+		    CONFIG_RISCV_ISA_V)
+	bnez t0, .Lskip_v_enable
+	li a0, SR_VS_INITIAL
+	csrs CSR_STATUS, a0
+.Lskip_v_enable:
 	save_userssp s2, s1
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..5c127855be54 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -258,6 +258,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
+		if (has_vstate_opt())
+			riscv_v_vstate_init(childregs);
+
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6fd541f5d5cb..eec9deff8da7 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -12,6 +12,7 @@
 #include <linux/prctl.h>
 
 #include <asm/thread_info.h>
+#include <asm/cpufeature.h>
 #include <asm/processor.h>
 #include <asm/insn.h>
 #include <asm/vector.h>
@@ -69,6 +70,16 @@ void riscv_v_ucontext_save(struct task_struct *tsk)
 int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
+	bool v_always_on = false;
+
+	/*
+	 * has_vstate_opt() cannot be used here if called from riscv_fill_hwcap(), before
+	 * apply_boot_alternatives(),
+	 */
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZVE32X) && riscv_v_vstate_opt) {
+		v_always_on = true;
+		csr_set(CSR_SSTATUS, SR_VS_INITIAL);
+	}
 
 	/*
 	 * There are 32 vector registers with vlenb length.
@@ -81,9 +92,11 @@ int riscv_v_setup_vsize(void)
 		return 0;
 	}
 
-	riscv_v_enable();
+	if (!v_always_on)
+		riscv_v_enable();
 	this_vsize = csr_read(CSR_VLENB) * 32;
-	riscv_v_disable();
+	if (!v_always_on)
+		riscv_v_disable();
 
 	if (!riscv_v_vsize) {
 		riscv_v_vsize = this_vsize;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
