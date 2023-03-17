Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977BC6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJhADsC1A7yz2o0gWd6IMUefRyxf1BIN1PJnhmIGT2Y=; b=Noj8mFBLahRiLT
	tpz5uApQ96Pp32807mFWMHcqlN8aSqrvg+fHZij99sQZBoPI/SbnTmUdbFM7JhslgbDsC2SqbWuMV
	+61xzuUg5hiGxhAF4tqhM9nf4V/oHiyH5CYYTY0/0KtYCd9YCtruSy4CYT4K8ly0FuVCXKgWVOseo
	GKEaGo6DbMElN0ECaGfG7QCK0TolykvpjFyVUj555ZgYV8Q1CDCACjsYb9LpEmuQryMk5ieY8EKjC
	jv2PC06CdwhvoXxgNUF7P+F98PFL/9XF/g2jvpnbs7S/WOLdfbDzXPOOqUBWymm6Y3HYo7IIKtRq+
	D2ICqdOU0EF8v6B34XRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OT-0025EM-2I;
	Fri, 17 Mar 2023 11:37:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OP-0025Ca-2z
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:37:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id j13so4785103pjd.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053025;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dHPvpP6H9JYLtPqTW/BeWDrK0Nn6vwGeB+P7ioLAq8=;
        b=Kc4wxRmpL0/HdJIJfP+fnPUzVQss5Yv9r4VMGL/CQp5ukoeI8wufU6ACdtfKwm305s
         Rj0qIHElh6z+nsVM6JqeIk70Khvuh2z5mbxNWaYeQncf6IlqqnjwHEoflNPRA2vDN8wY
         8P2N/T+/DiNSNXNOxA+0c8NuK7MmDASSg10boXZ0Vu8lUpKcxHOgY/0u7yf4lm1DkuQH
         rJvGeEYI1qmVRoGWeCt1Ju1JpyBQ50sDxNLzCQ72IFFdI+JO5G0XOQ38/youABGYc8Bo
         L6X/AViIQf6RLJjZeYy8y90F8lJbpirMezeyIY48vJcjiEkboZgYfaII7ANhdFT38Jak
         wuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053025;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dHPvpP6H9JYLtPqTW/BeWDrK0Nn6vwGeB+P7ioLAq8=;
        b=CayjqINkmdQFmQyhHNVDQ2D5wD4LXois67MaJNkLyr73rbiFlSoky7FCJWJpooGHZS
         vDTuS9aZjdXVs7v1N0M4oypiJHrKATw8cWNeginp+LphJMoTQErXsZuYj8G+HQ1tqUL+
         S7wzWiYKfjedT3C+VywZcVDERhF/UUqUatExgns/ikEeiJgmqGlk29xRghwlfXuanwjZ
         uqQsUM6Hbbl1/lLf0AM1nBTgYD/G8yteqD37l8hCahJm67am/r2l4G0BsaOp5DEuvcCb
         F3HH1/E8NZgZtwqvupgFe8pH9WVy0dqdecIygfWALOTxFpYA79lLohknDii1FEqfgTAc
         AdyA==
X-Gm-Message-State: AO0yUKVpnscd+XB6GdFFL76WhdC/kOvBH4j1ejlZEMb0i62amOgD4kvl
	tIvjNAedLph5JulkEaToUZMDidPdMJRrngy2WMO/Gupr5vh+1VEXa5+ELljItrgZhjjEB+Ka5hl
	o4cUv8jv8C3wt1w52vdWH/9q96Rt20bgSEflMQ/xkaj0EK4AkvRkzCOacVYtclIiu1/nHXxLf7u
	TuCJi817tyN13J
X-Google-Smtp-Source: AK7set+OOPPoQyGLOK+cynFouK3pY18HP8glSjxPqxTcfimLt+8DpivryQrgjm43FnUIXTi2hTVHow==
X-Received: by 2002:a17:90b:1b11:b0:23e:aba4:21e2 with SMTP id nu17-20020a17090b1b1100b0023eaba421e2mr8211915pjb.37.1679053024960;
        Fri, 17 Mar 2023 04:37:04 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:37:04 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH -next v15 08/19] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Fri, 17 Mar 2023 11:35:27 +0000
Message-Id: <20230317113538.10878-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043705_960999_A281D6E4 
X-CRM114-Status: GOOD (  11.14  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Add vector state context struct to be added later in thread_struct. And
prepare low-level helper functions to save/restore vector contexts.

This include Vector Regfile and CSRs holding dynamic configuration state
(vstart, vl, vtype, vcsr). The Vec Register width could be implementation
defined, but same for all processes, so that is saved separately.

This is not yet wired into final thread_struct - will be done when
__switch_to actually starts doing this in later patches.

Given the variable (and potentially large) size of regfile, they are
saved in dynamically allocated memory, pointed to by datap pointer in
__riscv_v_ext_state.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/vector.h      | 97 ++++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/ptrace.h | 17 +++++
 2 files changed, 114 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 18448e24d77b..c7143b7d64d1 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -10,8 +10,10 @@
 
 #ifdef CONFIG_RISCV_ISA_V
 
+#include <linux/stringify.h>
 #include <asm/hwcap.h>
 #include <asm/csr.h>
+#include <asm/asm.h>
 
 extern unsigned long riscv_v_vsize;
 void riscv_v_setup_vsize(void);
@@ -21,6 +23,26 @@ static __always_inline bool has_vector(void)
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
+static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~SR_VS) | SR_VS_CLEAN;
+}
+
+static inline void riscv_v_vstate_off(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;
+}
+
+static inline void riscv_v_vstate_on(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~SR_VS) | SR_VS_INITIAL;
+}
+
+static inline bool riscv_v_vstate_query(struct pt_regs *regs)
+{
+	return (regs->status & SR_VS) != 0;
+}
+
 static __always_inline void riscv_v_enable(void)
 {
 	csr_set(CSR_SSTATUS, SR_VS);
@@ -31,11 +53,86 @@ static __always_inline void riscv_v_disable(void)
 	csr_clear(CSR_SSTATUS, SR_VS);
 }
 
+static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
+{
+	asm volatile (
+		"csrr	%0, " __stringify(CSR_VSTART) "\n\t"
+		"csrr	%1, " __stringify(CSR_VTYPE) "\n\t"
+		"csrr	%2, " __stringify(CSR_VL) "\n\t"
+		"csrr	%3, " __stringify(CSR_VCSR) "\n\t"
+		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl),
+		  "=r" (dest->vcsr) : :);
+}
+
+static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src)
+{
+	asm volatile (
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvl	 x0, %2, %1\n\t"
+		".option pop\n\t"
+		"csrw	" __stringify(CSR_VSTART) ", %0\n\t"
+		"csrw	" __stringify(CSR_VCSR) ", %3\n\t"
+		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
+		    "r" (src->vcsr) :);
+}
+
+static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
+					 void *datap)
+{
+	unsigned long vl;
+
+	riscv_v_enable();
+	__vstate_csr_save(save_to);
+	asm volatile (
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
+		"vse8.v		v0, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vse8.v		v8, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vse8.v		v16, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vse8.v		v24, (%1)\n\t"
+		".option pop\n\t"
+		: "=&r" (vl) : "r" (datap) : "memory");
+	riscv_v_disable();
+}
+
+static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
+					    void *datap)
+{
+	unsigned long vl;
+
+	riscv_v_enable();
+	asm volatile (
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
+		"vle8.v		v0, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vle8.v		v8, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vle8.v		v16, (%1)\n\t"
+		"add		%1, %1, %0\n\t"
+		"vle8.v		v24, (%1)\n\t"
+		".option pop\n\t"
+		: "=&r" (vl) : "r" (datap) : "memory");
+	__vstate_csr_restore(restore_from);
+	riscv_v_disable();
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
+struct pt_regs;
+
 static __always_inline bool has_vector(void) { return false; }
+static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_setup_vsize()	 		do {} while (0)
+#define riscv_v_vstate_off(regs)		do {} while (0)
+#define riscv_v_vstate_on(regs)			do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c..586786d023c4 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -77,6 +77,23 @@ union __riscv_fp_state {
 	struct __riscv_q_ext_state q;
 };
 
+struct __riscv_v_ext_state {
+	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
+	unsigned long vcsr;
+	void *datap;
+	/*
+	 * In signal handler, datap will be set a correct user stack offset
+	 * and vector registers will be copied to the address of datap
+	 * pointer.
+	 *
+	 * In ptrace syscall, datap will be set to zero and the vector
+	 * registers will be copied to the address right after this
+	 * structure.
+	 */
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
