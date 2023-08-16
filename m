Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C3C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDi7AwEdDRzqDVTDoo2qFjNQChdq3BANRHtQ1THd3rM=; b=qRVaRFLhB0enLv
	T0TkEN+oJPoOp82J8H2PVktbqlSGUIcMkV9Af40c0dVQfAQcXrvGPADj1uhDfOTNaFJGAmGffj8it
	0trd5KU5E7l2+q4Vo7EWSk8g20FQSPFAWuwgsi5IdIKK37BMsBBcwrdIIrNZ1Mozj1IDz3BJdAsnX
	7tiVvpd2kQMN5Tfiu8JVmyhNV9823BV5NYY9esg4wy7HHFqDI/A+O7ZRmEfK9u7gDuCA9/G/p8cTo
	4lGE/ulkmzEsN6kqe2FrNEO678hOtFIkwQDp/OzIuDKLhn0m5uM8iO2Kk2rFqAEqHSG8nO9HKUHTW
	uEH2N4BLWk9wJieA+7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIre-004Xt3-2P;
	Wed, 16 Aug 2023 15:55:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIrc-004XsJ-0b
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 15:55:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68878ca7ca0so1032684b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 08:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692201311; x=1692806111;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQ4kaKngZ8ECzn3hVs4WNQc79FgE7L6VluRTCVlanGw=;
        b=RuBxo3ZMkUF9dLjxfs+pVaR1RjjuYNCnH58mdTsd6wjqHWJUBWIc3dnJDd7NNKw3Y4
         UiTylGyIlfvtviFwPxZad/V3X2gH7ll2lkaP0GDK8AiJ0kLk8HmR9BPLFFRNhPGFdms3
         1T71URsHXh5XfiJ9zyxeB0lwblperv7M3ZAv13ZAaE6EbnadoP8d0BsfelEFrQHviSeJ
         ypNwsnQlI9etFhequ1gqrbRkA5exIb4TEBGNugr06IjEB86RTqjhx4paob4rMO6YQ7m+
         D6tCresFFf8b00HX6utSWbCQGFL/zpFMVs9MDGUqXy+P8vm88y4lzKZLNzClw/lv/QXt
         0bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692201311; x=1692806111;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ4kaKngZ8ECzn3hVs4WNQc79FgE7L6VluRTCVlanGw=;
        b=Gk6wbjp2Fol5xzMfxvQ2vVKkT7IQaXSAyOYnHHYwtYNogOyVxi8A3vAmFEkL8SWPI8
         69DQ7N0Ej/LKHkTjEgHWvOP97mZO59fzrNO2CvLGtjnJu0sG4ZYPZhwz3zS6fnBpeAGI
         LBTeCmlEZcL6LMIayI56Qdxbk83fbF1O/NVR/dAebWAOTPAoSWGYb1P+XOpNn1um6Kpn
         0wr5mean9ZcfQ8BzkjUaftNKlXX1njUxTMTgChuTbC/QIEeEIoy1a1AngZ54Ofm29oCf
         A0QivHfFwOF+CxOnU+xnxIGDojYAqah6fJS1TUt15Yjn12ZqHtdXjlrMS5XjfT+Tqsuy
         HhWA==
X-Gm-Message-State: AOJu0YxYdplt+jkP0QfxT4BmNTVi4bjO3D1Lg6GMdJxbgrNQgFx+iDRo
	QYRxE5T9bdJ7Rb2GhsJ9KUd8NqCdkZynQrJWmPnjQFsT4obxOkzK6RoCnZ5t3tSeui9kp5UG2dd
	OWgbE2PCZa/8SNqcZ73QcK9I50PIYGJ/UPyz/Uo9lomr1pUIac4I5OzqQZ5mK3Uz4Ca9TIkC07T
	GxyrdoOMyGAtZM
X-Google-Smtp-Source: AGHT+IFPDZSMupLyosryebr+GAWaSWty+GPNlppOHtN8gjH4hmhuQ8BmoExDnZlnxMZTaV3yTkklkw==
X-Received: by 2002:a05:6a20:7d82:b0:13d:ea25:9656 with SMTP id v2-20020a056a207d8200b0013dea259656mr2715632pzj.60.1692201311165;
        Wed, 16 Aug 2023 08:55:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b00565dd935938sm3025891pgo.85.2023.08.16.08.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 08:55:10 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	conor.dooley@microchip.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Rolf Eike Beer <eb@emlix.com>,
	Baruch Siach <baruch@tkos.co.il>
Subject: [v1, 1/3] RISC-V: Remove ptrace support for vectors
Date: Wed, 16 Aug 2023 15:54:48 +0000
Message-Id: <20230816155450.26200-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230816155450.26200-1-andy.chiu@sifive.com>
References: <20230816155450.26200-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_085516_264402_DECDB114 
X-CRM114-Status: GOOD (  15.10  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

We've found two bugs here: NT_RISCV_VECTOR steps on NT_RISCV_CSR (which
is only for embedded), and we don't have vlenb in the core dumps.  Given
that we've have a pair of bugs croup up as part of the GDB review we've
probably got other issues, so let's just cut this for 6.5 and get it
right.

Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/ptrace.c | 69 --------------------------------------
 include/uapi/linux/elf.h   |  1 -
 2 files changed, 70 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 1d572cf3140f..487303e3ef22 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -25,9 +25,6 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
-#ifdef CONFIG_RISCV_ISA_V
-	REGSET_V,
-#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -84,61 +81,6 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
-#ifdef CONFIG_RISCV_ISA_V
-static int riscv_vr_get(struct task_struct *target,
-			const struct user_regset *regset,
-			struct membuf to)
-{
-	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
-
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
-		return -EINVAL;
-
-	/*
-	 * Ensure the vector registers have been saved to the memory before
-	 * copying them to membuf.
-	 */
-	if (target == current)
-		riscv_v_vstate_save(current, task_pt_regs(current));
-
-	/* Copy vector header from vstate. */
-	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
-	membuf_zero(&to, sizeof(vstate->datap));
-
-	/* Copy all the vector registers from vstate. */
-	return membuf_write(&to, vstate->datap, riscv_v_vsize);
-}
-
-static int riscv_vr_set(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			const void *kbuf, const void __user *ubuf)
-{
-	int ret, size;
-	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
-
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
-		return -EINVAL;
-
-	/* Copy rest of the vstate except datap */
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
-				 offsetof(struct __riscv_v_ext_state, datap));
-	if (unlikely(ret))
-		return ret;
-
-	/* Skip copy datap. */
-	size = sizeof(vstate->datap);
-	count -= size;
-	ubuf += size;
-
-	/* Copy all the vector registers. */
-	pos = 0;
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
-				 0, riscv_v_vsize);
-	return ret;
-}
-#endif
-
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -158,17 +100,6 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_fpr_set,
 	},
 #endif
-#ifdef CONFIG_RISCV_ISA_V
-	[REGSET_V] = {
-		.core_note_type = NT_RISCV_VECTOR,
-		.align = 16,
-		.n = ((32 * RISCV_MAX_VLENB) +
-		      sizeof(struct __riscv_v_ext_state)) / sizeof(__u32),
-		.size = sizeof(__u32),
-		.regset_get = riscv_vr_get,
-		.set = riscv_vr_set,
-	},
-#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 0c8cf359ea5b..e0e159138331 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -443,7 +443,6 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
-#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
