Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437F1C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUKfl90MK16M309s/ldWNGdVyVc/Hpcg6mB3ZQMa694=; b=ZG6F7smtQ/KgSx
	8wu+U1Dz/+7+8onXNImaxyoroiHcBJaOa7bibTuEEjuxRfUy8PrJ+i8Zth7cep4jswE6ju5hU3YvT
	yfopmN0T/QoxmJU11fsPQXzWJ+GGlTRFVquE55ZWi2GJEa72TBHJ+jbkZ8Kxqioa53gYz1y5JMWAT
	ndYalKmZLgOVq+5z2dICUeaf0A5zzLeDDl9jERmBSom6DgE+jjDuVabLypZozTBY/de2GEOOK9wST
	8+q3wxcvLvt9GDoJ0EzOF2CAeXbThF+7CBjlF422GVjvoHwcLUokqPb5ADKZKEy3dEtknBlQyBYKj
	QmIE5RCtZksPAAXDx4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTA-003Dx4-IX; Fri, 24 Feb 2023 17:02:52 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbT7-003Due-Ao
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:02:51 +0000
Received: by mail-pj1-x1029.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso3372121pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+ktzSBzWBlJTBXe2t4kNMhyRTMebke2LjylJDfEW1M=;
        b=U7ArKcI8EA64iuMsRfvLdvN899TQbUeBPIONmH5TPfZP9eZhFusFSCuXi3sGWNGEd4
         5SQEOSK5T3dtrWuqhEDWlv5pPj55I2dQ5h+S5a5rQ5aKhF/zOfVXoqmFOmdEG2WSAA5R
         EZGh99cnd4AVkrX0yVvMTDI+xKwJ4KfyWJdWIAjbWlIyGmbONmyo50yivZX5wU0coeX2
         CEjGhIsqpb5UNiX6CQw6rdbI5JIDqv+OkUaaYl3exTVXCepfaEUFdF+2E/4avrEUfBp9
         6+fB7AyGP1yAUW2cqCWswTRp97K2mZyx3wOxAnv+QnvkOOjr6ktKkLzdso7cvFqQINCX
         H84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+ktzSBzWBlJTBXe2t4kNMhyRTMebke2LjylJDfEW1M=;
        b=zWtjCxF+8OGkNs3GFDIB0izRAb371WUZjB8wkx3NPESLzQYe2OQnuyjH3anu3ENukx
         3jNK/DY7n2jKq4k7NLdm2Yvo6BS/V9NKbCRSkuaasjeEJyIa14LA0Sd9FkTum+x1u/7w
         GqIEfliwnxqWg1O9FXNf08qGypgNEc7kXce3PH//p5MEp+hD2Y9YirTF4kE7gJ5nY8Rh
         T/R5TFTeHXVd3GippUyo4D0/brghbL/pCkIrr2QZ7XOAr4IEkhwhxiLWEHFipBWKShkP
         wWXHic976RjOkW8Su3SjBgV2bIUfQb1X32yF6V/G+6YmJ8iKxQyaebDPoIh4zG+MiXM7
         OlZQ==
X-Gm-Message-State: AO0yUKWS0CF3jitd9CnrYZ9D2TJ/ug4EiatRSkebhve7+t2wzbMqQZkC
	hkutbXNtMuA9q4PuEuA527Qntu+7qi7ryUVjDKTmw6lhYoro2xEh9gfIjcQjBi4R1rG/5DcGruW
	5uzoSvuFMZHhFKEotOoJ6lAh+/g+vJxuJznYOs9aZchzHTz/ZeOtIfOOXIy4PLJ68o/Urt9+jIq
	7gh9ZWKjZUog==
X-Google-Smtp-Source: AK7set80zewt/ZysWjYp5vJhVBdEJ7dqiJCs+0d/Q5Lxos6RBTiwinrLKF85McCYiokK8i4Uls+JQw==
X-Received: by 2002:a17:902:d488:b0:19c:1433:5fae with SMTP id c8-20020a170902d48800b0019c14335faemr19716479plg.2.1677258168503;
        Fri, 24 Feb 2023 09:02:48 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:02:47 -0800 (PST)
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
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Rolf Eike Beer <eb@emlix.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH -next v14 11/19] riscv: Add ptrace vector support
Date: Fri, 24 Feb 2023 17:01:10 +0000
Message-Id: <20230224170118.16766-12-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090249_386592_FBF4CCAC 
X-CRM114-Status: GOOD (  20.64  )
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

This patch adds ptrace support for riscv vector. The vector registers will
be saved in datap pointer of __riscv_v_ext_state. This pointer will be set
right after the __riscv_v_ext_state data structure then it will be put in
ubuf for ptrace system call to get or set. It will check if the datap got
from ubuf is set to the correct address or not when the ptrace system call
is trying to set the vector registers.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/uapi/asm/ptrace.h |  7 +++
 arch/riscv/kernel/ptrace.c           | 71 ++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 79 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 586786d023c4..e8d127ec5cf7 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -94,6 +94,13 @@ struct __riscv_v_ext_state {
 	 */
 };
 
+/*
+ * According to spec: The number of bits in a single vector register,
+ * VLEN >= ELEN, which must be a power of 2, and must be no greater than
+ * 2^16 = 65536bits = 8192bytes
+ */
+#define RISCV_MAX_VLENB (8192)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2ae8280ae475..3c0e01d7f8fb 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -7,6 +7,7 @@
  * Copied from arch/tile/kernel/ptrace.c
  */
 
+#include <asm/vector.h>
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
@@ -27,6 +28,9 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
+#ifdef CONFIG_RISCV_ISA_V
+	REGSET_V,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -83,6 +87,62 @@ static int riscv_fpr_set(struct task_struct *target,
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
+	/*
+	 * Ensure the vector registers have been saved to the memory before
+	 * copying them to membuf.
+	 */
+	if (target == current)
+		riscv_v_vstate_save(current, task_pt_regs(current));
+
+	/* Copy vector header from vstate. */
+	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
+	membuf_zero(&to, sizeof(void *));
+#if __riscv_xlen == 32
+	membuf_zero(&to, sizeof(__u32));
+#endif
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
@@ -102,6 +162,17 @@ static const struct user_regset riscv_user_regset[] = {
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
index 4c6a8fa5e7ed..eeb65ccb5550 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -439,6 +439,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
