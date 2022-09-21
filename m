Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6A3C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8Ot7UO+b3CjpSdyb0cHDoCzDEhFUwfpj1zuuKmbce0=; b=wkGuKB5HnfLjsO
	AXZfgTWol0pcyy5YRks1v8zsV6sicLooairuuds/ufCvz6qeQ/Y2CA0NyrQWGmXDIN++A6kkCQIgN
	j/46FbsjfQVxgfidCnVj0GUMa4Yp/X/dmAsqf9omsFzC+BZxRKLeoBrMluqd6e2zyOKMhcPWWc3Da
	4dxybhB5ZZOYLvd4FMvDYLPO7Y9PiN8FvO7nFCcGNGvPKH2rWCnRb5XViqHiUKZO/so/HK9YqYMr5
	C0kVuOCoO2isSCOJ6VCEwDeXeOtYAzAsseUDzWcdsJ4iMJMl+UzhpZf6xY9RgWgGwflmDDUIzQ4hr
	8dIFBhYhZT1t7SAaNuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7aG-00ClYq-S3; Wed, 21 Sep 2022 21:48:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7aD-00ClV5-OF
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:48:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso154774pjm.5
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LT61xLA3xO8Cm0mngS+B9eObitluLVCYOP6BvnQtjLU=;
        b=KTbyz47q38rOvNH4MaSFOrps1Y9zCXQ6Q5/53AoIJm1skkxgugSIuwlert/lAleh50
         KvK8X42g6WNWey323t+KIBlDGBSiX+NAfIP5aAUfONFStURjNCuR33L1g1krNqS8f9KO
         IJp19kSHkgX78HqozbEi+07FKRDe3HS0DEb6wmgKKIJT5hQrnS34T7kP7VwkOZNUq3wg
         NvsuP3vWYb4dbYHcCDkRQ/hZG87FqeSM3JfnpkntZ5bbBEKDYYEqp+9tvRUWY0tQQ7qT
         UtgVhD8d2FYBmISbFP22uUgEi2cTPvHDeSXzFyQpKxIcvqP0GYDLJWQJrK1/1DPv+tHa
         WrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LT61xLA3xO8Cm0mngS+B9eObitluLVCYOP6BvnQtjLU=;
        b=H7qHkbZi3uV0Iek5VkxNvWVHLl5ZHy9sMiFFYcy+vIGO0ColFLXfanX3cKAE8iDbJx
         cPA+50Rak4pSs/Tig+Lc0rFKmsW1D/62mfbQGS2mKWEeAONrmd8h2mwEW9GB751celdQ
         NvpGks7TiTaOuPndqXpSGG+dYcDsif55SdZ1FucpPpLnbqsAbzRh5LfJEy6hbXjfaiRw
         E7+pitZiKL+A4LD/rUY4YMOfDUrZi0papqy6iApht35PLSEdHyx+UwbIIzw3P5k/uMCz
         rCDxwP0u2zi6PL+xkppraLLSFrbKFTpZHVyQ4uZ1hcCvMghW8fDvWjrgb1+t7LKdrRTK
         yhpQ==
X-Gm-Message-State: ACrzQf2VgaHoCff0Z0H4HlUKjVNVJffSAaGlAOQoa3FQxleGLVha1JmK
	SOFSrtGFpVsQKxkvr5ZS+aFlmQ==
X-Google-Smtp-Source: AMsMyM5g1Fe8zKJclCNS+r/j90c9oB56KnFADvTXlJfEuvTn9wcw9ZCKUbfSp58YveUPRAHaiZp9fA==
X-Received: by 2002:a17:902:e383:b0:176:9ee2:e099 with SMTP id g3-20020a170902e38300b001769ee2e099mr270156ple.44.1663796918852;
        Wed, 21 Sep 2022 14:48:38 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:48:38 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Guo Ren <guoren@kernel.org>,
	Chris Stillson <stillson@rivosinc.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Ruinland Tsai <ruinland.tsai@sifive.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Changbin Du <changbin.du@intel.com>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Colin Cross <ccross@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barret Rhoden <brho@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 06/17] riscv: Reset vector register
Date: Wed, 21 Sep 2022 14:43:48 -0700
Message-Id: <20220921214439.1491510-6-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_144841_798745_DF044B86 
X-CRM114-Status: GOOD (  15.02  )
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
