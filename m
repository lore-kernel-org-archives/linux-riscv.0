Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2266CC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdXZ5+zte1XpAiQJQMa52XSjn0CEX4m8cL1wov7+8og=; b=MJOyMVbqsnQPmA
	EYBuFAMggPmYDYTkeqXKuPrVjaJJHEWKNUCZ+XVHn9AetyuaaE77qZmVhGdQ3tqYjYvp4PZbaF0fW
	zrxaFQc8uHZ1Ni2BOF2l7sYqwXMrWTxPaDzOiXYQPf6mYT6BDa8+gTVfdhAOwQyjuuBkTtMfo+mAV
	mFXZZeR/mlTwR4+09ERxdqFkEd2xeQlzw9x8ihlPbMK1y6hmXwSATs/8HZRPNukSH8CrtqE7pS8CU
	2wi20beizL7B7LZbBELuyfZFgJGF6M06rXF2FS2CO+eKbeplEV5M1LiAiWTo3FncuIFW/8XFb+9tI
	MDdPFk2S4nPwV97i9bXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJe-00Fyrg-0s;
	Mon, 05 Jun 2023 15:40:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJb-00FyoQ-0t
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:40:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b00ecabdf2so45873545ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979613; x=1688571613;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FRXZE7cUr4vJpRYfnGIy+KdEpJQsKyQubDyjJds5WmA=;
        b=KXDBMuXNRHN6JZLLghcXJyvyn1zh00oaVAe1p59PxzuFAYdYJ8f27/TP1uvAINptqH
         nlcYcAkf+nJGFg9F+LyYqP0Ymo2Lij+XAmL0HH+Cqp92M6UdeXErSfZ7PYKmP7rYsaA6
         7GQoibFMEo+e9BZCqbS77OBneeYePiXGgsN12CiPPQCRazNM4xoQ/iFocSjGVEZmK4M7
         tkZUw2BhKyzNhLADu9McrKQmlX9tJTB5AleLiuKcPRH3GudtLqADDazxwOcVuo1Jex4Q
         B2gRWXR2EXEvHqK1khlKXmReI3jvkYgACmQxyQZlHagbbk77z2fEM87K1RP76tszm8cl
         cXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979613; x=1688571613;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRXZE7cUr4vJpRYfnGIy+KdEpJQsKyQubDyjJds5WmA=;
        b=ajN1/n16AAwmOPZmiBFpfZzbpiske+dYOHVxz86XGbIxNK1ie603GeeJBHjN0f67o2
         5z14M7gEsdDioYh9XtTHfZwX7o2ga1T/2MXOnzxNnPmcUrQLaS1UZnccY0lpv1E+XPCn
         kl82l1TRflSMGKe3gJaDqs605Ek8l1PzVWjBknSD+K/H4TmhI/xrOwpTsDXsZgqkFmJ4
         lBSPYQvWiDe01XFddv62UL2vzBmMtT9EDQdTMXShUuE0iTJkgvrXPaUixRXTv7wKgRj+
         fLO865UxNcKOMBlyGoj/+wGK1uy4ZAi8ifQ0t9pL8HENdI1NKeKBfij8FvfyCb2Ru1B+
         Hfaw==
X-Gm-Message-State: AC+VfDz87raVMfyw7oOVL32+Nn1Sis4pv0VTEXMDbNFmRDG7x28N3U61
	Keens3jfxv/aabfeBpp0+YGlRA5JH546UlvPpFml2qwMLpDq8oIGgCMdfVHRYEGqiRvnTpOnUm2
	zZL2hbZPECVopsuk+QPGzK6nqnhMi9J0vgJUbInBP8mXnvno/MCPJdRqfDiFo6Go3GNykU+seeo
	i3jlNSbNkmryv4wFc=
X-Google-Smtp-Source: ACHHUZ4j8vLA1CQX4UCgLtGjbolr0/w7QSNG9j2AAzYc8zViCUwWht91Jm831ibcZIARgx8zaguymA==
X-Received: by 2002:a17:902:d506:b0:1b1:9233:bbf5 with SMTP id b6-20020a170902d50600b001b19233bbf5mr10010498plg.57.1685979613098;
        Mon, 05 Jun 2023 08:40:13 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:40:12 -0700 (PDT)
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
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v21 06/27] riscv: Disable Vector Instructions for kernel itself
Date: Mon,  5 Jun 2023 11:07:03 +0000
Message-Id: <20230605110724.21391-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084015_313504_A5C8FB1F 
X-CRM114-Status: GOOD (  11.70  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Disable vector instructions execution for kernel mode at its entrances.
This helps find illegal uses of vector in the kernel space, which is
similar to the fpu.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changelog V19:
 - Add description in commit msg (Heiko's suggestion on v17)
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3fbb100bc9e4..e9ae284a55c1 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -48,10 +48,10 @@ _save_context:
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU to detect illegal usage of floating point in kernel
-	 * space.
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS
+	li t0, SR_SUM | SR_FS_VS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3fd6a4bd9c3e..e16bb2185d55 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -140,10 +140,10 @@ secondary_start_sbi:
 	.option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 	/* Set trap vector to spin forever to help debug */
@@ -234,10 +234,10 @@ pmp_done:
 .option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 #ifdef CONFIG_RISCV_BOOT_SPINWAIT
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
