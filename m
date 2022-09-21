Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A30C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8Ot7UO+b3CjpSdyb0cHDoCzDEhFUwfpj1zuuKmbce0=; b=x3tIsOUfmGAN2j
	IaQEmcKeRW9p19P3wEup0GvZRra5W4CKwPzB5IKSX1WjdF+lHNmEFtM8PppURCo4Fl0DJuy9bi28n
	+gjWo9k7vmFfQD7MQz2xaNSa4rM2sq/F/LvYGWUxOe58VJWWF9qxTU2uUZajLYo3fvIMVGqBgxlwf
	CneBMTiTS+H3OjrX5rdqBft1hbtQFuxYxRFuY3PrwdVGznXi3L1QzZHWv+/861ZR2a5XSc7DcqeI6
	lQLZbJZmyL8yZUmvPkpaj9HpKpMjRnWVlfhBca0ZpcQ6xCFYbUz8qaxUYUetVQppq6GC9JeA2UuYJ
	D2705LCPnnUIL1Iljw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6qk-00CdXx-1F; Wed, 21 Sep 2022 21:01:42 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gJ-00CUVq-JU
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id l65so6996993pfl.8
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LT61xLA3xO8Cm0mngS+B9eObitluLVCYOP6BvnQtjLU=;
        b=5H1orHOBA2UccZ0YdatDUREELodVTizpIrROsp/ZT+BxTqPunbHOz8EYghzuET7kMB
         EkfuAqp3MZ58jyFUUvxZxLH9Q8PfG/WGjdlwYV8HhdC1Tz+w/sL0G5h2+2MtXzS1iNRw
         erzBLXDRualK+lCMOJKaiKx8tyLlgFIDA/nXkEYOLMc7lldONnPTOS3A2G/vMpUVbDOu
         mRnGOj8813+WAPc4YDQvlJyM4DsbGMQ/nKUyT1bdi8h16fA9v6difLj7yb4XbX8qG8+o
         vdUVLh+T54ruItWTSPTa1QRMkgHLL+L8w6eNHXw1HDXzl5/Etw0T+jL/yrXas22moRug
         bdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LT61xLA3xO8Cm0mngS+B9eObitluLVCYOP6BvnQtjLU=;
        b=37yDa16a9a6oaAJiFCZvrhwLR76cut0MbNvLM09PDLivYOEtPNJIIDevWYaETfdxg8
         s1+4SGqsa3UdFNt04A9y3qKVP17xaWCrICGkAn8kOzwZJY1lTTLkwYuNt/fAL/4WniXH
         9irjR/5KIVQqp8yXpiGw6NdovN7xW2v8CFsCvUMVV1JJyUGq3ob3t1ZQNWDRTQ+x/bhP
         xnYdHDh3NDOYrYOti4FJ50VVfIf5JKVRiH9fR13TS1ezbRxeiqbTsRzeFxisaXReDwTo
         PlAkWQSotGL3tmUslwGeJ8jpUHsir5a/THWIa46N3/3LD/G02GApiu0X9TLVnkfkmdLV
         v7yw==
X-Gm-Message-State: ACrzQf3RNZzZCWe0/8xGAE43FYR6qaDeXgMJO2FFptONxmH9hj34FnyI
	31ZxqMo+516nApV8/Gx6YFEKfVc34x3gAw==
X-Google-Smtp-Source: AMsMyM6xeI/mQtCb5Sw9PmRiu8T35rm6WJwDvpFeCZBxt653bXazQ4Rp11OhF7kJRU87GgncqEYQlA==
X-Received: by 2002:a63:4f59:0:b0:439:3ca0:27f with SMTP id p25-20020a634f59000000b004393ca0027fmr26008122pgl.535.1663789609932;
        Wed, 21 Sep 2022 12:46:49 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:49 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 06/17] riscv: Reset vector register
Date: Wed, 21 Sep 2022 12:46:18 -0700
Message-Id: <20220921194629.1480202-7-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124651_665638_8CCED83D 
X-CRM114-Status: GOOD (  12.83  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Reset vector registers at boot-time and disable vector instructions
execution for kernel mode.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 35 +++++++++++++++++++++++++++++------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..1e9987376591 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,10 +77,10 @@ _save_context:
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU to detect illegal usage of floating point in kernel
-	 * space.
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS
+	li t0, SR_SUM | SR_FS | SR_VS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b865046e4dbb..2c81ca42ec4e 100644
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
+	li t0, SR_FS | SR_VS
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
+	li t0, SR_FS | SR_VS
 	csrc CSR_STATUS, t0
 
 #ifdef CONFIG_RISCV_BOOT_SPINWAIT
@@ -431,6 +431,29 @@ ENTRY(reset_regs)
 	csrw	fcsr, 0
 	/* note that the caller must clear SR_FS */
 #endif /* CONFIG_FPU */
+
+#ifdef CONFIG_VECTOR
+	csrr	t0, CSR_MISA
+	li	t1, COMPAT_HWCAP_ISA_V
+	and	t0, t0, t1
+	beqz	t0, .Lreset_regs_done
+
+	/*
+	 * Clear vector registers and reset vcsr
+	 * VLMAX has a defined value, VLEN is a constant,
+	 * and this form of vsetvli is defined to set vl to VLMAX.
+	 */
+	li	t1, SR_VS
+	csrs	CSR_STATUS, t1
+	csrs	CSR_VCSR, x0
+	vsetvli t1, x0, e8, m8, ta, ma
+	vmv.v.i v0, 0
+	vmv.v.i v8, 0
+	vmv.v.i v16, 0
+	vmv.v.i v24, 0
+	/* note that the caller must clear SR_VS */
+#endif /* CONFIG_VECTOR */
+
 .Lreset_regs_done:
 	ret
 END(reset_regs)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
