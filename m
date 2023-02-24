Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07494C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnFAGHxlPl3ydYVB5NN7Y0tZVX4yPsEO9UOd+l64Uq0=; b=JVVRqy+bLXy1UR
	CBXM/YmKP/+9U9fWVI7YY3wsiI5ZfZCQi6EsjJ1GgBSAoyS/3co1LiBCD0lgIcalbNvVfEMDCGGrn
	tFlSFV9K0wbD0N2XumDLqIRenukKmFYfaiDAogkgWfOWfwbBd+mJ+truMHyDDMe1D1KPCNBaMl6Vl
	8s2OizmQYH/xBL/O1uTaIWuIo7XSZafTqm4Z/smcVkxieHIiFK14ohIbaM2vNDtmbUzzj1UnPRcws
	uFziXjlHufSGTxFUIYlA2tbPnj5JfCUm7PxYZu39sEbPmb33SQv8pMe6Ki5qUTnCbr4skAa2P6eZU
	kzg6cS//CQC0sx6xp7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSj-003Dew-Iv; Fri, 24 Feb 2023 17:02:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSg-003DbZ-CB
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:02:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id k21-20020a17090aaa1500b002376652e160so3421234pjq.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oeU1EzgQZPviUx8x1M7BAweIqWoiI9GPVL7R1I1QzEM=;
        b=mCv4sAOXa6oisDiWg8GBB0kENtNWNon7JU+fper8v5+3Jca7jjEYPtzqjo+GDcKTRe
         dKQWOL/12E3JIHbfMwmwsjVqTzcMkbdGG0tU2mJCvYQhmq2qZtul4aVJpiv9vTjB2CEG
         s2tX/NYrLjyVC7gK5UbMStg2KZWL7aa4Th2HZJgW6NBSord4riefsGbIYHn2TtO11swN
         gpFObbkXYjqCIwmOjipi67WxH6YeSk5gFZRxq4VLihFHoq1RXGxXpVyTI0MwPSBGb/Wc
         j16z5G28M6/5z1avj7DaB5K928ZA9BM+KnG83aMj2BQffJAhGslMpHuHFemuhEJgOv/N
         5HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeU1EzgQZPviUx8x1M7BAweIqWoiI9GPVL7R1I1QzEM=;
        b=YTY7RuPIYdryP8dMM2bcOC+4+ZTbHMJ/FNHnNZ/kji5QMXge+xhiJ5zPih2jgEfMlq
         k1Je6T/WAcR5DdNsTsuix8fGf/ykFYT/+K8DNOV73FNzUH5B1Ndm463FF0yDyFPnhGAp
         ZFm47V3cgUHjdMaIBQJCbMPUmh8hJ4HvaLcqK5BE/2hLf9jxPULdpideaBT/SDCcNQ1v
         CC4mHWUJl1Z1vLt9c6mVnWf7XEH/w44WVFezFvqfTin6Ng2FHLSf3hlpY72HSvnLYvUv
         lWBUhssOducYr8lfOr9QJZdj9J958fpLv8EOnY2Qky4J1V61I67UQICPq/WUNy5bygng
         zyaA==
X-Gm-Message-State: AO0yUKWRqdfUDJaFXQXhevOhUbp8B6gNsxCOLNL+qI88WP1ZyrdDkVt3
	bYj9/+EX6IzURk0TVWfFUAAe/cMOBquui9izi5LrnEJM797pmKOsKzUZfRHrZgMqJa7J5ikAx9k
	6F3Pov7dAGI6YtPENqy+0983Y91e/Gv2SjeimmJ/Gfcd8Wehai5bUb0tYA+RPid5MySm5qHHnsu
	w0sar/vZimRw==
X-Google-Smtp-Source: AK7set82aDGPKd/oN7NmcHtGanjLX/28ckwBJ2M7mKySEAYrKIk1lgwMUdj//Im6eaBTyENN/Kiv2w==
X-Received: by 2002:a17:902:c950:b0:19a:b44b:cca6 with SMTP id i16-20020a170902c95000b0019ab44bcca6mr19680763pla.24.1677258141591;
        Fri, 24 Feb 2023 09:02:21 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:02:20 -0800 (PST)
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
Subject: [PATCH -next v14 08/19] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Fri, 24 Feb 2023 17:01:07 +0000
Message-Id: <20230224170118.16766-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090222_426126_03358186 
X-CRM114-Status: GOOD (  11.41  )
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
[vineetg: merged bits from 2 different patches]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
[andy.chiu: use inline asm to save/restore context, remove asm vaiant]
---
 arch/riscv/include/asm/vector.h      | 84 ++++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/ptrace.h | 17 ++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 692d3ee2d2d3..9c025f2efdc3 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -12,6 +12,9 @@
 
 #include <asm/hwcap.h>
 #include <asm/csr.h>
+#include <asm/asm.h>
+
+#define CSR_STR(x) __ASM_STR(x)
 
 extern unsigned long riscv_v_vsize;
 void riscv_v_setup_vsize(void);
@@ -21,6 +24,26 @@ static __always_inline bool has_vector(void)
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
+static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
+}
+
+static inline void riscv_v_vstate_off(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;
+}
+
+static inline void riscv_v_vstate_on(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~(SR_VS)) | SR_VS_INITIAL;
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
@@ -31,11 +54,72 @@ static __always_inline void riscv_v_disable(void)
 	csr_clear(CSR_SSTATUS, SR_VS);
 }
 
+static __always_inline void __vstate_csr_save(struct __riscv_v_ext_state *dest)
+{
+	asm volatile (
+		"csrr	%0, " CSR_STR(CSR_VSTART) "\n\t"
+		"csrr	%1, " CSR_STR(CSR_VTYPE) "\n\t"
+		"csrr	%2, " CSR_STR(CSR_VL) "\n\t"
+		"csrr	%3, " CSR_STR(CSR_VCSR) "\n\t"
+		: "=r" (dest->vstart), "=r" (dest->vtype), "=r" (dest->vl),
+		  "=r" (dest->vcsr) : :);
+}
+
+static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src)
+{
+	asm volatile (
+		"vsetvl	 x0, %2, %1\n\t"
+		"csrw	" CSR_STR(CSR_VSTART) ", %0\n\t"
+		"csrw	" CSR_STR(CSR_VCSR) ", %3\n\t"
+		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
+		    "r" (src->vcsr) :);
+}
+
+static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to, void *datap)
+{
+	riscv_v_enable();
+	__vstate_csr_save(save_to);
+	asm volatile (
+		"vsetvli	t4, x0, e8, m8, ta, ma\n\t"
+		"vse8.v		v0, (%0)\n\t"
+		"add		%0, %0, t4\n\t"
+		"vse8.v		v8, (%0)\n\t"
+		"add		%0, %0, t4\n\t"
+		"vse8.v		v16, (%0)\n\t"
+		"add		%0, %0, t4\n\t"
+		"vse8.v		v24, (%0)\n\t"
+		: : "r" (datap) : "t4", "memory");
+	riscv_v_disable();
+}
+
+static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
+				    void *datap)
+{
+	riscv_v_enable();
+	asm volatile (
+		"vsetvli	t4, x0, e8, m8, ta, ma\n\t"
+		"vle8.v		v0, (%0)\n\t"
+		"add		%0, %0, t4\n\t"
+		"vle8.v		v8, (%0)\n\t"
+		"add		%0, %0, t4\n\t"
+		"vle8.v		v16, (%0)\n\t"
+		"add		%0, %0, t4\n\t"
+		"vle8.v		v24, (%0)\n\t"
+		: : "r" (datap) : "t4");
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
 #define riscv_v_setup_vsize()	 do {} while (0)
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
