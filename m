Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669FCC83F34
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwWFkp0bkBdCQahbJ/5NMAScZ9kt2PhQmbxu6L0XyqY=; b=gtjvVrK1yL6T8q
	Bm/zHJsKXdOSXjMteh3a/YdkTTNXj3MvTsbf410SG5cxhaY3LcYByYy94f9NfenzK6v2epg7rCXJ5
	crQT/0kclFwe3el1wDEZb2yXcNVJQyKJe2V5FZWtHEZnj6y2EebDLbS8Bh/loQA59ZXQKCmf5u5hs
	m4PWjh8TNwnSrTVmCp7+hOPeYRMGusQhqMY4fe8WaImGB4scSanoHF+6DxDcmWI8Ij/Ut2cSV+9Sv
	bXmUygYPOXD/LSNT69sb/094djNeLVCOY36AL7GFnTaZ0WJwQYZ08YMS9nFEiVNhhpgxZTjmCALRe
	Dsy8BAoktgH2R66sH+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGws-000000039ba-0F36;
	Tue, 22 Jul 2025 17:38:42 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwp-000000039ZN-1VNt
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 17:38:40 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so44221756d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753205918; x=1753810718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW4csVV0UWW4773SLdvTdDiMmcrFmADNMqZ78npo3qA=;
        b=C2WVfHpzmuIquTizuz6hHlUjVm/hV6jw5KcxGRUlpq3TTYDLprhWsdsOwM4HsGfTRS
         2ujqbOSAk58bgy25z7U3KNLQS7vt6I0nVIt0AtkgqtVZds8oLUe+CD9/Mompy2X5N2ED
         nIkhkBk5XPBOc35kt6kMfeAFa6kxsVR+Vd/rSJzaDnqSEsF79Z4yPho/s/SNLkQPQbCQ
         SCClah0JR8iDutnI/4bwknFd8ZT+LKNyOyrPSZ3lNvbDpLjqcn6//dZKIy4KouGcURTb
         rFjfte45VNnXE1LQdQFHdhOkCeCd8J0OhmxfrNABeLg94C/11feNxy29H0tw9qaTLB5U
         //mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205918; x=1753810718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KW4csVV0UWW4773SLdvTdDiMmcrFmADNMqZ78npo3qA=;
        b=h/wnH8+HcvIAvPOnSFH+AuKzN1esaTviPDXyedYicFM8FBaz3KKCvlMgwETNDkPYcO
         2Ab9I9ghBdG/tdjQXV92azYUf6bKJuISG5SbRIplwWwzvT2gF4pO4AeDbHfdpEO+Rsh4
         OK4+0fk7L8VZV94lDCTKWS84SXeKeU3CYEJybePxysLMlodHYasa90vec0X+TcObXtdw
         G/QIWViWpYYDmvFx1RgiuZAzJ1sROc4w26xdFYNIGGMiNDw+XSNIxJQtgpYIG5qQlIhA
         Hc6SKgN+n+qQU7TcYiQegQG/KPKuv/4gmqhkO/Ee4dfxMLzM2Wxe2jdrtuwoHY+Ewxm/
         yrlw==
X-Gm-Message-State: AOJu0Ywm9Sgfuojh1WRH9sAC7Zu8Wq8EfSFClUpfKgo3HSGWAlqs6NDt
	uU2BOz9WNRwJeALlYnDiiS3dlRHh+BzCllG/K72YXu/lhUfhTOZUIi6ymzbBE2nWWd30E+8flVG
	6bWkC
X-Gm-Gg: ASbGncuMqdiQb7DWaeZPmbASN6Hdn7lC2/EBdzfzytVztYSpS8afTsZfcr4LGsnxEZT
	IaJ/+USEWvO7pJjnARKTYT9ysPyhV7JfQ1wXH0YPKgVVq0VO/CBnqzptsCGrRq86IYaZs1Yb5Se
	X2UogVuQN3aQvRvm66D+xS+wZEKkQb7HZL7LU6cwk61rHzhjTzsmQJ9qBHFQ9rE6ouB/5jrenG0
	h13HdMn84owWyCiSPoEiyBP1ra6UIljz2Y1SoszCxWCmbDyP72SLXVLuT68H5XruUcr6SZDEXV3
	/3OtVe94wdO7IqXXZzur0Ey5sGXU3FBipTcya8KK6B18l5PjU5jGsQn9fqKs1Rv176JhuvLnwgo
	42wN1Za8ZId84yH/CNs4v8lZFTRiP/DXPI448ZmBQJksIuPh7KHFJP1dwQRrrb2ukCAdaTNnvXP
	yxbCgzulUbVD4=
X-Google-Smtp-Source: AGHT+IGBDrTWn4V/STPt6DOLmJtCWDCzg0HfHNyXs5XppmVHnd6/xaUauxoLwI7I4C+gvMI7ST37gQ==
X-Received: by 2002:a05:6214:62c:b0:6fd:61b6:3360 with SMTP id 6a1803df08f44-707004b3e11mr421686d6.5.1753205918060;
        Tue, 22 Jul 2025 10:38:38 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b783sm54184536d6.73.2025.07.22.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:38:37 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Evan Green <evan@rivosinc.com>,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [RFC PATCH 5/6] riscv: hw_breakpoint: Use icount for single stepping
Date: Tue, 22 Jul 2025 10:38:28 -0700
Message-ID: <20250722173829.984082-6-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722173829.984082-1-jesse@rivosinc.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_103839_405836_308BD2E6 
X-CRM114-Status: GOOD (  21.45  )
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

The Sdtrig RISC-V ISA extension does not have a resume flag for
returning to and executing the instruction at the breakpoint.
To avoid skipping the instruction or looping, it is necessary to remove
the hardware breakpoint and single step. Use the icount feature of
Sdtrig to accomplish this. Use icount as default with an option to allow
software-based single stepping when hardware or SBI does not have
icount functionality, as it may cause unwanted side effects when reading
the instruction from memory.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/Kconfig                | 11 +++++
 arch/riscv/kernel/hw_breakpoint.c | 81 +++++++++++++++++++++++++------
 2 files changed, 76 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95d3047cab10..bbde5e118470 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1105,6 +1105,17 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
+config HW_BREAKPOINT_COMPUTE_STEP
+	bool "Allow computing hardware breakpoint step address"
+	default n
+	depends on HAVE_HW_BREAKPOINT
+	help
+	  Select this option if hardware breakpoints are desired, but
+	  hardware or SBI does not have icount functionality. This may cause
+	  unwanted side affects when reading the instruction from memory.
+
+	  If unsure, say N.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on !XIP_KERNEL
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index 9e3a3b82d300..437fd82b9590 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -20,6 +20,7 @@
 #define DBTR_TDATA1_DMODE		BIT_UL(__riscv_xlen - 5)
 
 #define DBTR_TDATA1_TYPE_MCONTROL	(2UL << DBTR_TDATA1_TYPE_SHIFT)
+#define DBTR_TDATA1_TYPE_ICOUNT		(3UL << DBTR_TDATA1_TYPE_SHIFT)
 #define DBTR_TDATA1_TYPE_MCONTROL6	(6UL << DBTR_TDATA1_TYPE_SHIFT)
 
 #define DBTR_TDATA1_MCONTROL6_LOAD		BIT(0)
@@ -55,6 +56,14 @@
 #define DBTR_TDATA1_MCONTROL_SIZELO_64BIT	1
 #define DBTR_TDATA1_MCONTROL_SIZEHI_64BIT	1
 
+#define DBTR_TDATA1_ICOUNT_U			BIT(6)
+#define DBTR_TDATA1_ICOUNT_S			BIT(7)
+#define DBTR_TDATA1_ICOUNT_PENDING		BIT(8)
+#define DBTR_TDATA1_ICOUNT_M			BIT(9)
+#define DBTR_TDATA1_ICOUNT_COUNT_FIELD		GENMASK(23, 10)
+#define DBTR_TDATA1_ICOUNT_VU			BIT(25)
+#define DBTR_TDATA1_ICOUNT_VS			BIT(26)
+
 /* Registered per-cpu bp/wp */
 static DEFINE_PER_CPU(struct perf_event *, pcpu_hw_bp_events[RV_MAX_TRIGGERS]);
 static DEFINE_PER_CPU(unsigned long, ecall_lock_flags);
@@ -65,6 +74,7 @@ static DEFINE_PER_CPU(union sbi_dbtr_shmem_entry, sbi_dbtr_shmem);
 
 /* number of debug triggers on this cpu . */
 static int dbtr_total_num __ro_after_init;
+static bool have_icount __ro_after_init;
 static unsigned long dbtr_type __ro_after_init;
 static unsigned long dbtr_init __ro_after_init;
 
@@ -168,6 +178,7 @@ static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
 static void init_sbi_dbtr(void)
 {
 	struct sbiret ret;
+	unsigned long dbtr_count = 0;
 
 	/*
 	 * Called by hw_breakpoint_slots and arch_hw_breakpoint_init.
@@ -182,6 +193,25 @@ static void init_sbi_dbtr(void)
 		return;
 	}
 
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+		DBTR_TDATA1_TYPE_ICOUNT, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to detect icount triggers. error: %ld.\n",
+			__func__, ret.error);
+	} else if (!ret.value) {
+		if (IS_ENABLED(CONFIG_HW_BREAKPOINT_COMPUTE_STEP)) {
+			pr_warn("%s: No icount triggers available. "
+				"Falling-back to computing single step address.\n", __func__);
+		} else {
+			pr_err("%s: No icount triggers available.\n", __func__);
+			dbtr_total_num = 0;
+			return;
+		}
+	} else {
+		dbtr_count = ret.value;
+		have_icount = true;
+	}
+
 	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
 			DBTR_TDATA1_TYPE_MCONTROL6, 0, 0, 0, 0, 0);
 	if (ret.error) {
@@ -190,7 +220,7 @@ static void init_sbi_dbtr(void)
 	} else if (!ret.value) {
 		pr_warn("%s: No mcontrol6 triggers available.\n", __func__);
 	} else {
-		dbtr_total_num = ret.value;
+		dbtr_total_num = min_not_zero((unsigned long)ret.value, dbtr_count);
 		dbtr_type = DBTR_TDATA1_TYPE_MCONTROL6;
 		return;
 	}
@@ -205,7 +235,7 @@ static void init_sbi_dbtr(void)
 		pr_err("%s: No mcontrol triggers available.\n", __func__);
 		dbtr_total_num = 0;
 	} else {
-		dbtr_total_num = ret.value;
+		dbtr_total_num = min_not_zero((unsigned long)ret.value, dbtr_count);
 		dbtr_type = DBTR_TDATA1_TYPE_MCONTROL;
 	}
 }
@@ -344,6 +374,21 @@ static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,
 	return 0;
 }
 
+static int rv_init_icount_trigger(struct arch_hw_breakpoint *hw)
+{
+	unsigned long tdata1 = DBTR_TDATA1_TYPE_ICOUNT;
+
+	/* Step one instruction */
+	tdata1 |= FIELD_PREP(DBTR_TDATA1_ICOUNT_COUNT_FIELD, 1);
+
+	tdata1 |= DBTR_TDATA1_ICOUNT_U;
+
+	hw->tdata1 = tdata1;
+	hw->tdata2 = 0;
+
+	return 0;
+}
+
 int hw_breakpoint_arch_parse(struct perf_event *bp,
 			     const struct perf_event_attr *attr,
 			     struct arch_hw_breakpoint *hw)
@@ -389,24 +434,28 @@ static int setup_singlestep(struct perf_event *event, struct pt_regs *regs)
 	/* Remove breakpoint even if return error as not to loop */
 	arch_uninstall_hw_breakpoint(event);
 
-	ret = get_insn(regs, regs->epc, &insn);
-	if (ret < 0)
-		return ret;
+	if (have_icount) {
+		rv_init_icount_trigger(bp);
+	} else {
+		ret = get_insn(regs, regs->epc, &insn);
+		if (ret < 0)
+			return ret;
 
-	next_addr = get_step_address(regs, insn);
+		next_addr = get_step_address(regs, insn);
 
-	ret = get_insn(regs, next_addr, &insn);
-	if (ret < 0)
-		return ret;
+		ret = get_insn(regs, next_addr, &insn);
+		if (ret < 0)
+			return ret;
 
-	bp_insn.bp_type = HW_BREAKPOINT_X;
-	bp_insn.bp_addr = next_addr;
-	/* Get the size of the intruction */
-	bp_insn.bp_len = GET_INSN_LENGTH(insn);
+		bp_insn.bp_type = HW_BREAKPOINT_X;
+		bp_insn.bp_addr = next_addr;
+		/* Get the size of the intruction */
+		bp_insn.bp_len = GET_INSN_LENGTH(insn);
 
-	ret = hw_breakpoint_arch_parse(NULL, &bp_insn, bp);
-	if (ret)
-		return ret;
+		ret = hw_breakpoint_arch_parse(NULL, &bp_insn, bp);
+		if (ret)
+			return ret;
+	}
 
 	ret = arch_install_hw_breakpoint(event);
 	if (ret)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
