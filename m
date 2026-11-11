Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47DB606A324
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dl66LhmW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=hT9Kr6Xs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=btdJcTqIVzEf49mdWzVA+SUbk82vM+5gvcbds5svkLM=; b=Dl66LhmWekw0+MsYByfS4ExvId
	Hd9iK5JcV3gjdvdp0+Lc9FwmhC5i3SehHAtivrko0pkIM0kni9BYM60S4Lhub212e8TMs6bMAgiiR
	dlTioqB10i28Z9Tm117uMAaYnnPODCyJ6b3ZEex0zzbzO/Ev+UGmD4xKO8oL3jM1tu7GVZYuPn/Fg
	TOxArb0RFsdYXec+nAalvt1fxZLe7h3aiJ7/rWZEBRla1FFvp3i6TtVrkFLLTYoAeUYQ7A7Sodtsm
	BOW68jcUuzIQTzUHGRiV6vxgwhmlTXZiZfUXOFcD4K6lpF6Un2e78eIRn/VuWYfKxX8rWB7U2luLU
	b4DehQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZe-00000007SzN-0Zwc;
	Wed, 11 Nov 2026 19:01:34 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZY-00000007Su5-1gVl
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:01:32 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-67be1e468a8so2805226d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423687; x=1795028487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVyacmRdBOkB2N2YFKJvLgcn+V87gTIBQfflrVVKvU0=;
        b=hT9Kr6XsaPxK2FqIE8+ocM1mfdJGFx+aOMJobYa/0arg9nbBCi3WVlhYFLsP7e+57H
         SdERSHj0+p7ZGsrtksHFZ4GIRhE5s94JUgU3OA4XclFgeGk/GwORjrCfvsiCijkVGulK
         GcMFQWZ1kLpyZUvostBO0UxjNnQqnKKvbGWrkZbktJboVouz/C05uJf/d3GAj5eR64cU
         PqkkOVyM1iilD1l/L5mUucdT8Lr1zB9yvAa+kJRAfeHZASkmzHHJSdVwdJRJ7U5mz+Ea
         6VbBvQpL8zMSNGudcW0vN3w7w72UEBzfc3ZVhmGMEspaRDyQQD9ufq5DeInSSTCFPEP5
         1lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423687; x=1795028487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVyacmRdBOkB2N2YFKJvLgcn+V87gTIBQfflrVVKvU0=;
        b=dhgTog3u72ZcpTfJ9ZWNV5yxzj7pwKoCh4vZXMoqzyAUlhDwD7Zfx0D8Vc2jQ+4etF
         /uVWpQPDphtGEzfBsy9pK/YE7wZj8rxa3jHMkFhtsfV/sbQfQ3MmSs1f2GeCe6YeqFEH
         89imC6H6iEEElbP2WvXiETqnevoJMX/NofYfKdOEFbnG4EKL+Vl7Nf39tbTt0RT1OQV4
         Ch7qR06s//2CwJhMqDYb4Lrazi9do3O/sI4p3ceql0b6G9CjJB3+wOOy14tsJ0DYzngi
         Vt+jMiNVRO4xe5m2bhO/FT1ca0tbICodJbzr41sr6esFkRawOjOvHiXPqcISg0N1Fa/w
         Blyg==
X-Forwarded-Encrypted: i=1; AL+hErHSDcBOofTsGoYxM4XRdfEqeaeERahwUxl8OkpVKdhWFO/pupTzutPtndvbsJOGgqXNArupxkfz/in0oA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9eR4ErdTNU/Ei+fr8sYJNV5yEPxjEe0IIug3GhbfybPkNH6ena
	nlKFhM2llOYee1BWR2/B+HYQUEjCAhcgf0hOMGDVuFuy/0py+HgUsSHnIXYE2QxktPk=
X-Gm-Gg: AYBFou2QTeTcgCRozpeW93ue4tGa780OHbH6gegP9ieFAv27vAvBkOQXSpbECuzlSn3
	bql9jsaWOT8HbFaw9QhU+kg6VXgtLGj0gAJkleJf9ER+X9FW9/mW5yqT5oVHjwGDKnFDye3jOER
	7fYuE3A60tzqqS3wLQBEdttpH2ow16o1lbGm3TBFY0mzfYyDqv09Bv72CX8C+eLwJchzxQ1cTu+
	9A0FgkRApeDifSHZw6M04Oso50e+5ZAr9PmdkG36wwR5GTVKwyEBkLBayG6weXucTuGTbCX+dUf
	Ftm4JNl/exR8FVKW+scEeBEXpT2ZBYdHdr3ufMSL1DII0JJ/Fiofwon2ybuZtsQXtoWfIXy3Kdw
	65ZFPgOV8LKy9T505UxRd5VjQ8YUA5KrmeBgFEMFzimqb6/Damh9EVZjEXB7tcuU3KyfbB5Uhy5
	Kxc18hqgctPshwLQLG6WjhTPoh+1c3serNCpNuhy1bIzc2OwYLKTFk6axmKWiD3pp9yG0ZfeXXS
	rRrx4cFX91awwO6msAEz6BAAnC3vqAAtNs+Q2jvpNoBhvdXQb7OZYeuqlDZZU+YMZ0I8N8rsYE0
	MianjloyUnLbc+5rHqJUzsXnW9yQUFCphoeBV4Tlrjr16x3OLHHCFyJrw9emoSBK0CczZ4TPj3Y
	pHlP9Q/9CQAwzVPyIn5dAFFRL5D+tAxwPmHJtEShQwjRzr0Q=
X-Received: by 2002:a05:690e:140e:b0:679:9b73:bf9e with SMTP id 956f58d0204a3-67c67fa690fmr2275064d50.57.1794423686682;
        Wed, 11 Nov 2026 11:01:26 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:01:26 -0800 (PST)
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
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Guodong Xu <docular.xu@gmail.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Atish Patra <atishp@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Hui Wang <hui.wang@canonical.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Zong Li <zong.li@sifive.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rui Qi <qirui.001@bytedance.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v7 5/6] riscv: vector: optimize vstate operations
Date: Wed, 11 Nov 2026 12:43:27 -0600
Message-ID: <20261111184359.1239821-6-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111184359.1239821-1-tchiu@tenstorrent.com>
References: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110128_481656_DBE8984B 
X-CRM114-Status: GOOD (  23.21  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce the riscv_novstateopt to control the optimization of vector
state operations in the kernel space.

The optimization enables vector in kernel mode and bypasses vector
register nulling for user space on the syscall fast path when the boot
argument "riscv_novstateopt" is not set

Enabling this optimization yields the following performance benefits:
 - Cut 80 cycles latency for getpid on Ascalon.
 - 1.1% ~ 4.09% request throughput improvment on nginx workload with web
   serving size under 4KB

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v6:
 - upgrade it to use alternative and change default to enable the
   optimization
Changelog v5:
 - new patch since v5
---
 .../admin-guide/kernel-parameters.txt          | 13 +++++++++++++
 arch/riscv/include/asm/alternative-macros.h    |  6 ++++++
 arch/riscv/include/asm/alternative.h           |  3 ---
 arch/riscv/include/asm/cpufeature-macros.h     |  6 ++++--
 arch/riscv/include/asm/vector.h                | 16 +++++++++++++++-
 arch/riscv/kernel/cpufeature.c                 | 18 ++++++++++++++++++
 arch/riscv/kernel/entry.S                      | 15 +++++++++++++--
 arch/riscv/kernel/process.c                    |  3 +++
 arch/riscv/kernel/vector.c                     | 17 +++++++++++++++--
 9 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..e1146ee6ab1e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6722,6 +6722,19 @@ Kernel parameters
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
+			a 4.09% request throughput improvement for an nginx
+			workload serving a 2KB web page on a four-core
+			Ascalon-S.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL,EARLY]
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 629d884578da..45d9ae1e0aa8 100644
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
 #ifdef __ASSEMBLER__
 
 .macro ALT_ENTRY oldptr newptr vendor_id patch_id new_len
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 6be7b2b6ade9..bc2ecaa9125a 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -16,9 +16,6 @@
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
-#define PATCH_ID_CPUFEATURE_ID(p)		lower_16_bits(p)
-#define PATCH_ID_CPUFEATURE_VALUE(p)		upper_16_bits(p)
-
 #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
index adaf9e3fb25c..7bd900899bb0 100644
--- a/arch/riscv/include/asm/cpufeature-macros.h
+++ b/arch/riscv/include/asm/cpufeature-macros.h
@@ -45,14 +45,16 @@ static __always_inline bool __riscv_has_extension_unlikely(const unsigned long v
 
 static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+	int realext = PATCH_ID_CPUFEATURE_ID(ext);
+	compiletime_assert(realext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
 	return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
 }
 
 static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+	int realext = PATCH_ID_CPUFEATURE_ID(ext);
+	compiletime_assert(realext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
 	return __riscv_has_extension_likely(STANDARD_EXT, ext);
 }
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e83f9e0046a9..745ac3ca67b7 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -49,6 +49,7 @@
 	_res;								\
 })
 
+extern bool riscv_v_vstate_opt;
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -78,6 +79,11 @@ static __always_inline bool has_vector(void)
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE32X);
 }
 
+static __always_inline bool has_vstate_opt(void)
+{
+	return riscv_has_extension_likely((RISCV_CPUFEAT_VSTATEOPT << 16) | RISCV_ISA_EXT_ZVE32X);
+}
+
 static __always_inline bool has_xtheadvector_no_alternatives(void)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
@@ -122,6 +128,9 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs)
 
 static __always_inline void riscv_v_enable(void)
 {
+	if (has_vstate_opt())
+		return;
+
 	if (has_xtheadvector())
 		csr_set(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -130,6 +139,9 @@ static __always_inline void riscv_v_enable(void)
 
 static __always_inline void riscv_v_disable(void)
 {
+	if (has_vstate_opt())
+		return;
+
 	if (has_xtheadvector())
 		csr_clear(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -336,7 +348,8 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
-		riscv_v_vstate_set_restore(current, regs);
+		if (!has_vstate_opt())
+			riscv_v_vstate_set_restore(current, regs);
 		riscv_v_vstate_init(regs);
 	}
 }
@@ -422,6 +435,7 @@ struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
+static __always_inline bool has_vstate_opt(void) { return false; }
 static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
 static __always_inline bool has_xtheadvector_no_alternatives(void) { return false; }
 static __always_inline bool has_xtheadvector(void) { return false; }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..041f6a35fba3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1294,6 +1294,19 @@ void riscv_clear_hypervisor_csr(void)
 	csr_clear(CSR_HSTATUS, HSTATUS_HU);
 }
 
+/*
+ * Leaving Vector enabled while in the kernel relies on the vstate alternatives
+ * being patched in. It can be turned off on the command line to catch illegal
+ * use of Vector in kernel code.
+ */
+bool riscv_v_vstate_opt = true;
+static int __init riscv_novstateopt_setup(char *__unused)
+{
+	riscv_v_vstate_opt = false;
+	return 0;
+}
+early_param("riscv_novstateopt", riscv_novstateopt_setup);
+
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
  * the old instruction sequence with the new. These bits are broken into a
@@ -1322,6 +1335,11 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
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
index 628b85e3915a..bb4787711f2c 100644
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
index 34c1d498d1ca..27146b3fa738 100644
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
