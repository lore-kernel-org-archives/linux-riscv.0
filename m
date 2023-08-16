Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B062FC04A6A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uu1n/S9Uyxqm/pJq5aUb34XEydgwuQjGzlo6GuW0ggo=; b=eyZeenkRuD5Da2
	NjkdSba8WHw2Eb3mhp28Hxry4tGVehMCkVPn3A5pOFia3ffDpHcIpcejGo1r3ltrGPFjv5h8KaZZK
	v0J7kjHvnb93p1TH1GeFatBOxby3dd+gf+wuhb8Qo0K2bKt+k08gwuLp390O1QU9c06BqdYXD4HTu
	4xmnDCZEhHcI0AgY+jIQt2sdyO62bdBhL0GipCjsZ4orUo7eXHrmoQHhf8wX7n9PL7U/wXORqbp3e
	lp5L9RVcn8iJDOBa8temHN2K8QOWg78qXtsYWRQUk5lj2RN3Fi2jhzbRwUJ4D/qaWEDjrcejItVGn
	pMibmxqp6qKKE6XDILog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIrm-004Xux-2E;
	Wed, 16 Aug 2023 15:55:26 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIrj-004Xtj-32
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 15:55:25 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1ba5cda3530so5106117fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692201321; x=1692806121;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3cgH30exg6X4/6K0g5b0RhKiqYvWo/dWSVLFrHEhRI=;
        b=STbKxf/qGSNcFpEe/vqljSrn4reWmOj/mlgqQGR5PmUz2bCvQttTXxBlezownJP4mD
         ipct3eX8pybYL6PHHJhxibeWuXz8xRZh39Mzacg3cD5+iXp7kVUW7y+7e9Om8r5UwBIb
         aGq2bJjHYtKAoEejTRNmrPLezfGb47Huc40OmsIPBixJZ3VEL3qrR2ZgRGQTlNCuK7fh
         4NsUOqXfQj/YIHNspTgxj2lAuydwwbSGg0uW6ZrjcUEgGqD7cbhPo5bBjxkuGsBxj/6U
         3qxSNl1qpzHjvjB64f24wDFwjYH6OFF7QUjZEaNmkXuttuPORbvR5ecoNCLhCIiGzCeU
         IyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692201321; x=1692806121;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3cgH30exg6X4/6K0g5b0RhKiqYvWo/dWSVLFrHEhRI=;
        b=ga9rwKJUfNNCla89tD3y+HaaiEOCufdnaUhDtF6SFvcOMgFWEiTet1JSlViUbWhWm7
         0Ar9E99URzLApR+B4R6vq3G8JyMUgj5KyCLTEkzaYlIJVmrOu4sNjImcsA9OQq1ahgC0
         BjTGR6XhJ40wrnzXy5lJsTFfkVGuJ3tmpNbRI6nnu1icy0VRxVNB8YjkFJtoctC3yBKd
         4K51eQXzg5hcI5atGVBLGNOiYB4UHXCvTqNxtUp1Kd8aUhVm3CU8snl9p32BqAWb7gP0
         fJiFMT93qWuILVkLhUxayfi2jX4jKHS5zJ5UgafMJW+SCbnomHh8wAx49YRzbInP8jQN
         HI1A==
X-Gm-Message-State: AOJu0YwIMnO+mJk/f8SZnQFgtVQFPR/UhuMUCIY9cvt9Y9RtLnIK5jHJ
	aWatisLdyFcWc+yD6DvLbAiLkScWjQfrXpLgXBNaQbQh8qx0Fbs7Y0HNlSori9sB0VKJOKSZpRg
	yiXLyHHi+hUfZZlgmsB2T0O8V2zHZJiqDULaTqBIYB55c4bYpUWyrDEq/S/k4J7Am503Y4sZa7i
	Xf6fzISAKZRfea
X-Google-Smtp-Source: AGHT+IGFW0J0RktQY/h0eUWthiS9RlzSWZAW+pl8qGl2gtrVB6ikQxVQ+BKeg/nTN8DwWe+FnYw2gw==
X-Received: by 2002:a05:6870:e2c9:b0:1c5:56f:ac08 with SMTP id w9-20020a056870e2c900b001c5056fac08mr2716185oad.12.1692201321210;
        Wed, 16 Aug 2023 08:55:21 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b00565dd935938sm3025891pgo.85.2023.08.16.08.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 08:55:20 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	conor.dooley@microchip.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Russell Currey <ruscur@russell.cc>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Rolf Eike Beer <eb@emlix.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [v1, 3/3] RISC-V: Add ptrace support for vectors
Date: Wed, 16 Aug 2023 15:54:50 +0000
Message-Id: <20230816155450.26200-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230816155450.26200-1-andy.chiu@sifive.com>
References: <20230816155450.26200-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_085523_982523_9736B045 
X-CRM114-Status: GOOD (  19.00  )
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

Since gdb does not directly include the note description header in
Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
conflicts.

Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Hey Palmer, it is possible to merge this into the [1/3] patch so it
looks prettier. Or, please tell me which one would you prefer if a
respin is needed, thanks!

 arch/riscv/kernel/ptrace.c | 69 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h   |  2 ++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 487303e3ef22..1d572cf3140f 100644
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
@@ -81,6 +84,61 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_ISA_V
+static int riscv_vr_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
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
+	/* Copy vector header from vstate. */
+	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
+	membuf_zero(&to, sizeof(vstate->datap));
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
+
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -EINVAL;
+
+	/* Copy rest of the vstate except datap */
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
+				 offsetof(struct __riscv_v_ext_state, datap));
+	if (unlikely(ret))
+		return ret;
+
+	/* Skip copy datap. */
+	size = sizeof(vstate->datap);
+	count -= size;
+	ubuf += size;
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
@@ -100,6 +158,17 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_fpr_set,
 	},
 #endif
+#ifdef CONFIG_RISCV_ISA_V
+	[REGSET_V] = {
+		.core_note_type = NT_RISCV_VECTOR,
+		.align = 16,
+		.n = ((32 * RISCV_MAX_VLENB) +
+		      sizeof(struct __riscv_v_ext_state)) / sizeof(__u32),
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
