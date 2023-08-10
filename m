Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB9C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TpWmVLWkU31sbo08aRCYWQFC2P+sE5wJiMTHSQsJ/2M=; b=bE+CIMW9WiTVyw
	uw6UKi76jKXR0E7bRjkyRV71KNlDaRDzg9KkBD3watQeVvbGLD9XA8WCakOIO/NVfjl995+IMn5yO
	GPAeD9uUrdzfoJdQGJHzjfsk3g6rXpCV/CBr1vTml3w1XxU69ws1PmSi65Tvsk6jq/MPm3jilcanr
	ntxuqCNJBEwi5YLATrtBFbQZJOeqI2n5tNa1V1M2vXMq287ZQ/ZqpaXKoUxn5OYxFa3rsDaIcS7Pd
	a5zZsEomjISQ4df0IFW/TAgCSdI64COhE/tkjI/4tWT/PlsNO01Kb3s30PqBiKLFNLcl6Em3PEJFH
	krEILV1xd9ha3afQ3aMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUDW7-008mfr-0U;
	Thu, 10 Aug 2023 21:48:27 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUDW3-008mfB-0B
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 21:48:24 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686f0d66652so1237608b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691704101; x=1692308901;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=mrSpOpCWz9xCNAam7vvx+viJY/N7l2A1OylBBOICnK8=;
        b=sFqtHCasR8vsldRoL8FS+sqK46Dp+Ohs2tNx04HoDMqJI+BBy6kLuN189JbtFF/l/1
         KWeYRk+0Oc20w5q+KfECLBdpkijjrokFbvVsBuyVzalJPynclnAtM0Gqs2iKipgTG3uf
         rkh5ZSPxEpoRr+9MOtIJONKLYDS4jRh1NxZenKPScTwdjF5YYBtxcEATDAikNDzfl+St
         jRMD0Rwvg6EWk/5NDjDoFSM3TddjGB48n9QXwbii138DYTFd/ZpkM25EmHCyEkUpssqC
         ogChsDqPZ5/AOB/qg3PTvQ9rlWmvBnu89h+cAs2HtEFfcG70TD6LIgPIlSVGukTivuPf
         6GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691704101; x=1692308901;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrSpOpCWz9xCNAam7vvx+viJY/N7l2A1OylBBOICnK8=;
        b=PUFQLbP5US4IIgN43vvwsCAlDm31n1bcA4ijtlbUAXYGJblXHuAV7QOMzE8qoDy7/8
         mDbY3djHRV7A9pbKATpn+9pdumyf9cdGiOGtPUvrvvBaGq9hiY61yTGFKdfihUbgP2JF
         DBkGuGTQ90VlFr0HAg16UxKQNE6HPrZSOLHP5dINMgIvE0bmm8Dpr0CfzkPIEaRW6Cv5
         H4g+CpQ2owyuc5kzfwaa4e3LsuulS/McrKiSghLYKTB2DoLrHN/nf04HzIqK2rXpKQeN
         UYCEHPK5xoNsEeXL+PhGiG39L+tTWckbTLisw33Q8N/tveuyMUNpyZ77+681Y5RNDD7E
         bGNA==
X-Gm-Message-State: AOJu0YwTVnU1JKWIG5NY3dKqh1uuV3lOmFNDSHGabjwwhtQYZdSfxn7b
	gXA0dkoTQu0txeTPMpg7WC8AAw==
X-Google-Smtp-Source: AGHT+IF1vh7Au58Ixukn7e+amv1tzAWXWu9LRKq2JOaM2QYPQcePmRD27n42cX64/5Vacp/KjNchtw==
X-Received: by 2002:a05:6a21:35c8:b0:13f:bc16:c360 with SMTP id ba8-20020a056a2135c800b0013fbc16c360mr224444pzc.32.1691704100858;
        Thu, 10 Aug 2023 14:48:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v8-20020aa78088000000b0068790c41ca2sm1983083pff.27.2023.08.10.14.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 14:48:20 -0700 (PDT)
Subject: [PATCH] RISC-V: Remove ptrace support for vectors
Date: Thu, 10 Aug 2023 14:48:10 -0700
Message-ID: <20230810214810.21905-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, andy.chiu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_144823_145867_9BD79419 
X-CRM114-Status: GOOD (  15.17  )
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

We've found two bugs here: NT_RISCV_VECTOR steps on NT_RISCV_CSR (which
is only for embedded), and we don't have vlenb in the core dumps.  Given
that we've have a pair of bugs croup up as part of the GDB review we've
probably got other issues, so let's just cut this for 6.5 and get it
right.

Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
