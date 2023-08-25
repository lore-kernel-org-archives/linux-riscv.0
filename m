Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3927C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 05:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hIrlO6ZNVx8K7/tnll34zCo0fEGRJUoIPYdiGPMPriE=; b=H5T+qC5hU8ECRF
	KuMc90gxkAaaKd1nRoJu8AaLExfjz/TcCRTdEFtlO686p63FiVjJVLic5d2+XFg/ETMbdjZq4kVwn
	2N6KzK+uAQFOG5aY9vHZPzOtaZJowkOGThUD6SS0ld4xUyzj5LqXDCuE6OAV2t8Uc0C1O6OWy0grJ
	pfu+jiaQgtIiYbI7XKD9P7d3c+PXBcFM4pUNZS2gG+V2W1kBVqkACKHHcmITfx+DYV07KUS/L7PP6
	EtyYLRkkcLGs6crHUdEXqUX891TGXoQeM2+9srafdwrv/WHjO1C3wDsoc8cd1OfaNovoc8s1nb8nI
	ReQ0QhUXvF83r61iitWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZOyh-004KEG-0o;
	Fri, 25 Aug 2023 05:03:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZOye-004KDb-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 05:03:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c0bae4da38so4441675ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 22:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692939798; x=1693544598;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IrnlFXo+HgZZpneINrNiyVna8NABNhzo7CK6/H6UdU=;
        b=Fk0UlJoPqfofifjfW2MYjjSZ9gLzulQC4Bqec7yt04MEGfJ5wdc/43RC9Kj/bAPpcl
         HB+XZXwFE8XTMr1118AX8T5fJgytfCEKqT9AsddKtjPtYqg7dhkYet16PcLFkCudDSQN
         q+fm68havlfTYfaVwjA0yp3TubyhyLGHWgKTL1X4yyY5mEx4L5USBYKcWXOtz8I/zI3a
         UCfexZbOFHCo/EJWDt39XUAc+QPnaQm2zU/svVleiG+/wd3ms42XKejZ2y80ySE0KVpC
         hYEXB77e8If3RSdXfDUa9v2JKOEOPnjHQsqSBDm03tLmVQ664AB+PJRRXuTZZ5UTHRTt
         ZKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692939798; x=1693544598;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IrnlFXo+HgZZpneINrNiyVna8NABNhzo7CK6/H6UdU=;
        b=XEe07sU/Wi0iVApaI7HHn6eibmEV/xcgXhE2Maz7XIum+puq0LV4cUBi4AhP1QAEPI
         lDfYPPMGECWe9Ip/fLovZPyOSNKhLKkeF8gNfEZKXaad8G8J8flmChbXBJTNzyc0KbUh
         a0w6F+xoy5c11otRAb5doYul+CKfguyDYVagvoJNHDrytBWUxoSp3lecTkKcsVcVqX/q
         hSTbVXEo+UsS8fnZ5BmUI45UaQvFYTk98tZyhZk1xeRUUQnWaU3SJJMaGa8P09MXzXzz
         lzMmI4PDxHLuDe+SpvUMJoq3VQJPYYQhCcvl/D9VovuG6ilfhJEyYZ+Cd9OOCim0neiK
         s6rg==
X-Gm-Message-State: AOJu0Yw4EElQhfmdRMXDdUVcO6mNGGEpg1Q6KcKaK59fWG0pzZ4tBCrj
	cUI77hAbcnFttah7QDRhHDG6o8tAe9f2+Go7uQ9q94o7IPuVr+LZlHh65mZ2c5d4gwdouaRxC9m
	PXQr4/3Wt/PL18l5ucq//4d1Y/aAuAQaVLBcHJKtU1mYiNavBPSoXxhT72xnbfyKEorJaRvtdSO
	r7u9/IjRmvl21R
X-Google-Smtp-Source: AGHT+IFNxqGurr2XiY9L8sGFACP1sGlATwzPhWH4cqU4eHVsbXsISkqMMEQ3/jSQxkmmj2F0w6pQQg==
X-Received: by 2002:a17:902:f681:b0:1bc:56c3:ebb6 with SMTP id l1-20020a170902f68100b001bc56c3ebb6mr26714099plg.8.1692939797915;
        Thu, 24 Aug 2023 22:03:17 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id ix7-20020a170902f80700b001ae0a4b1d3fsm138355plb.153.2023.08.24.22.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 22:03:17 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	20230816155450.26200-4-andy.chiu@sifive.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Baruch Siach <baruch@tkos.co.il>,
	Rolf Eike Beer <eb@emlix.com>
Subject: [v2] RISC-V: Add ptrace support for vectors
Date: Fri, 25 Aug 2023 05:02:46 +0000
Message-Id: <20230825050248.32681-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_220320_558716_13A095CD 
X-CRM114-Status: GOOD (  22.06  )
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

This patch add back the ptrace support with the following fix:
 - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
   conflicting with gdb's NT_RISCV_CSR.
 - Use struct __riscv_v_regset_state to handle ptrace requests

Since gdb does not directly include the note description header in
Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
conflicts.

Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog V2:
 - Remove [1/3], [2/3] from v1 as they have been merged
 - Define a new struct __riscv_v_regset_state for ptrace API to prevent
   dealing with extra datap space in userspace (Maciej).

 arch/riscv/include/uapi/asm/ptrace.h | 13 +++--
 arch/riscv/kernel/ptrace.c           | 79 ++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  2 +
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 283800130614..575e95bb1bc3 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -103,13 +103,18 @@ struct __riscv_v_ext_state {
 	 * In signal handler, datap will be set a correct user stack offset
 	 * and vector registers will be copied to the address of datap
 	 * pointer.
-	 *
-	 * In ptrace syscall, datap will be set to zero and the vector
-	 * registers will be copied to the address right after this
-	 * structure.
 	 */
 };
 
+struct __riscv_v_regset_state {
+	unsigned long vstart;
+	unsigned long vl;
+	unsigned long vtype;
+	unsigned long vcsr;
+	unsigned long vlenb;
+	char vreg[];
+};
+
 /*
  * According to spec: The number of bits in a single vector register,
  * VLEN >= ELEN, which must be a power of 2, and must be no greater than
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 487303e3ef22..9a87e5d490b5 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -25,6 +25,9 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
+#ifdef CONFIG_RISCV_ISA_V
+	REGSET_V,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -81,6 +84,71 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_ISA_V
+static int riscv_vr_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
+	struct __riscv_v_regset_state ptrace_vstate;
+
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -EINVAL;
+
+	/*
+	 * Ensure the vector registers have been saved to the memory before
+	 * copying them to membuf.
+	 */
+	if (target == current)
+		riscv_v_vstate_save(current, task_pt_regs(current));
+
+	ptrace_vstate.vstart = vstate->vstart;
+	ptrace_vstate.vl = vstate->vl;
+	ptrace_vstate.vtype = vstate->vtype;
+	ptrace_vstate.vcsr = vstate->vcsr;
+	ptrace_vstate.vlenb = vstate->vlenb;
+
+	/* Copy vector header from vstate. */
+	membuf_write(&to, &ptrace_vstate, sizeof(struct __riscv_v_regset_state));
+
+	/* Copy all the vector registers from vstate. */
+	return membuf_write(&to, vstate->datap, riscv_v_vsize);
+}
+
+static int riscv_vr_set(struct task_struct *target,
+			const struct user_regset *regset,
+			unsigned int pos, unsigned int count,
+			const void *kbuf, const void __user *ubuf)
+{
+	int ret, size;
+	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
+	struct __riscv_v_regset_state ptrace_vstate;
+
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -EINVAL;
+
+	/* Copy rest of the vstate except datap */
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
+				 sizeof(struct __riscv_v_regset_state));
+	if (unlikely(ret))
+		return ret;
+
+	if (vstate->vlenb != ptrace_vstate.vlenb)
+		return -EINVAL;
+
+	vstate->vstart = ptrace_vstate.vstart;
+	vstate->vl = ptrace_vstate.vl;
+	vstate->vtype = ptrace_vstate.vtype;
+	vstate->vcsr = ptrace_vstate.vcsr;
+
+	/* Copy all the vector registers. */
+	pos = 0;
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
+				 0, riscv_v_vsize);
+	return ret;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -100,6 +168,17 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_fpr_set,
 	},
 #endif
+#ifdef CONFIG_RISCV_ISA_V
+	[REGSET_V] = {
+		.core_note_type = NT_RISCV_VECTOR,
+		.align = 16,
+		.n = ((32 * RISCV_MAX_VLENB) +
+		      sizeof(struct __riscv_v_regset_state)) / sizeof(__u32),
+		.size = sizeof(__u32),
+		.regset_get = riscv_vr_get,
+		.set = riscv_vr_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index e0e159138331..20e285fdbc46 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -443,6 +443,8 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
+#define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
