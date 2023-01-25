Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA5FC54EAA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLpNN3tSV/RXOFAx/JIfaeHJru6l1UlfmF7G6plWFHY=; b=IeI3tTh4Ur2kJh
	EoEsXWRX8iNOKwdHInig1XEyuO7rssCR+udC5vBoTfuVzh4+N0r9zUVTkNBeudalI+QdHAiF4GkET
	kEjAbZvfeXQBa3rVPYYyghM9I0ezdzhjiOMlZAYGgRpbGcvnZGlQsGMUuldrWN1TLiYKW6tfDjt3F
	a/CD9nsCIGZO3p1g385y0DM7Ct/SotTnU98IZOgjFmp/WuEs1nQlc0zlfyc+Bfirko+WMD1BtvcmC
	2oBoD9uMSXWOVS4WWmyygO0s8rSFm9kM4RihNGxt2G/2w45aF2gC3UDoVES8wuITB3e884ptE1t6c
	Hm2frnymktrsTxlxtuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeq-007VS3-Ef; Wed, 25 Jan 2023 14:21:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgem-007VP4-MH
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:21:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id m11so6833872pji.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I461UKwYCe7oejg8aaYPXuzSkV6F30l8yLoOf3ygkB4=;
        b=GRH57D0ezoBm1KqgDbbchAl29975AdJ/YorG7T/Y+oqaHevLcKrumc0dSFs5fvoOV0
         oJL+h3Cwvhf3ubtD+9X8Q3sSIBReq5cBe8ZwkpoSD0cn70BWPAGyB/5vFyH3elErczq8
         c280iYEpMAq1nPIaL791oCsKQURE6LAksfrFZaT+tHQFMxPUR2hbqPrltZg0SeDeFIez
         GUIwni9KlRpNXV633W/i2gh83wZuV23oIQ8geAFf1zvU36roWe70cOiDmwy7veD9y+DJ
         2R8q5bTbYoH2QE7dR1iW2D8FCzkc2EqzwlSCHNkP/ie8wJPj/8rI0EtZRviJu+wW2tOr
         KCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I461UKwYCe7oejg8aaYPXuzSkV6F30l8yLoOf3ygkB4=;
        b=ffQ+CqAw+8VuR7XR3XtUVmVZbkJ/fPEC7KO9ephWTAZQzbclnlj8LUOaJRgdWxDbik
         XD3Hf7bggbwzZRbFHVYGnRXPOp+wl43Gq+qcithbHtQet3bkFVKdjjs8Fu8FPXmUzn6f
         QygrhG4PTCSD34iXlgEZch0td7PXcienuznLSbZRSvyuSgGPwcEaoED2+p1dCiZmMNI1
         iBFupaDLiEQsICbFhA7vpslMhKAW+aN5tlvvmLpBo87pgZV7BUOzZqPMpZXQyXgf+aeH
         ZEDTeINXOxQyubQWC0Qb6g9aeJWMn45QmUFG1n+aRZAXq9Nk0IC5Kz++117LP/AEmTUT
         jRuw==
X-Gm-Message-State: AFqh2kpdUOrVtw00ZDRJJG70yrvn0Y/NFoSUufjDYydFSIDy9w5t6dES
	Zj7gnMTvy72uqiOlghofMhSi7fWqvpVg/NeSSopeG0EKfjyoKbIQDMZMNcmIk8Ld1KeJ2yQiT6Y
	oL2sjuuqGVUuJ6vIvuFgCTRPM4gCqyAiMzl5H3cbwHq1RzEOF2l6yW2cmpiXZ1qbw6JVlbKcoN7
	hkHaq6DKIr5g==
X-Google-Smtp-Source: AMrXdXsg/AKY+8+tJy6lpshr2gM1GnesjhZ5ahV28D5bSSWPggmjdVSd4FdK6DGZJxoO0A1xfv4YFw==
X-Received: by 2002:a05:6a21:3296:b0:b8:8961:b169 with SMTP id yt22-20020a056a21329600b000b88961b169mr45638126pzb.25.1674656502980;
        Wed, 25 Jan 2023 06:21:42 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:42 -0800 (PST)
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
Subject: [PATCH -next v13 08/19] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Wed, 25 Jan 2023 14:20:45 +0000
Message-Id: <20230125142056.18356-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062144_736462_5EBABBA0 
X-CRM114-Status: GOOD (  11.81  )
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
__riscv_v_state.

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
index 16cb4a1c1230..842a859609b5 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -12,6 +12,9 @@
 
 #include <asm/hwcap.h>
 #include <asm/csr.h>
+#include <asm/asm.h>
+
+#define CSR_STR(x) __ASM_STR(x)
 
 extern unsigned long riscv_vsize;
 
@@ -20,6 +23,26 @@ static __always_inline bool has_vector(void)
 	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTOR]);
 }
 
+static inline void __vstate_clean(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
+}
+
+static inline void vstate_off(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;
+}
+
+static inline void vstate_on(struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~(SR_VS)) | SR_VS_INITIAL;
+}
+
+static inline bool vstate_query(struct pt_regs *regs)
+{
+	return (regs->status & SR_VS) != 0;
+}
+
 static __always_inline void rvv_enable(void)
 {
 	csr_set(CSR_SSTATUS, SR_VS);
@@ -30,10 +53,71 @@ static __always_inline void rvv_disable(void)
 	csr_clear(CSR_SSTATUS, SR_VS);
 }
 
+static __always_inline void __vstate_csr_save(struct __riscv_v_state *dest)
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
+static __always_inline void __vstate_csr_restore(struct __riscv_v_state *src)
+{
+	asm volatile (
+		"vsetvl	 x0, %2, %1\n\t"
+		"csrw	" CSR_STR(CSR_VSTART) ", %0\n\t"
+		"csrw	" CSR_STR(CSR_VCSR) ", %3\n\t"
+		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
+		    "r" (src->vcsr) :);
+}
+
+static inline void __vstate_save(struct __riscv_v_state *save_to, void *datap)
+{
+	rvv_enable();
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
+	rvv_disable();
+}
+
+static inline void __vstate_restore(struct __riscv_v_state *restore_from,
+				    void *datap)
+{
+	rvv_enable();
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
+	rvv_disable();
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
+struct pt_regs;
+
 static __always_inline bool has_vector(void) { return false; }
+static inline bool vstate_query(struct pt_regs *regs) { return false; }
 #define riscv_vsize (0)
+#define vstate_off(regs)		do {} while (0)
+#define vstate_on(regs)			do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c..6ee1ca2edfa7 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -77,6 +77,23 @@ union __riscv_fp_state {
 	struct __riscv_q_ext_state q;
 };
 
+struct __riscv_v_state {
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
