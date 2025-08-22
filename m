Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD4FCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0FGY9pLInMiK3YYanDLuHKWztKr96sIWdNYhNsnbp4=; b=fRY9bVEcyHypDL
	VSq44nO1fHSPZLQwSgYnxlT7NRCZpN54L84D39t0XywpV6uvP/ta4SHT/yYRq5nq9H796V/LxIGUu
	Hwy/bkXuViMlCWuUkCjGCwTVCqMa7aPe2PvgrX5RqRUJPFq5NlbH8FhHBZ6saQYwj9hWalqvp32Uj
	LeDtCjgvtiEgn+C8HyKErDd9W2J3UMtNc3VNzQi2zSEquyLmhdMAwpHoE6FjFxTxcELwkCXezLnse
	DHjewH+n7qOuVTAlZfYDzrLAW7GaltrR7X4b4KVd0zkzFECS1PmCZ+w3FnZHhPZA83Hp/KGaBTNmi
	FO5HT3R2H3iRPULY1mMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwX-00000004DVh-2W2m;
	Sat, 23 Aug 2025 06:41:37 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrP-00000003GF1-0HVV
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:47:33 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4b134a5b217so25798311cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755884850; x=1756489650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pk2Is3iINvVBYx1tiVmoatjTI6H0OmVzvfALLTxnFA=;
        b=crs2ZPE1p4FSmG5QEDvhdQlhnqB1oF1cP8whLU7+0QK0jZBeB7cacvCXFmk8b//Et1
         gIlZlz9OOsumImliFevYZIVhWe0Qq8MGN8z6Sme+fvzwfYYi762tYp0b4JUktGZbl1jl
         5d6fQIRH+vxp2/UjkeMJsq6+HrOY8CZOQyt1bAFr2v+awRD3EID0t+RLwUr2eK1qKhkK
         TeoVeEy11IXSaQcEnDEZJ2jct343jYd2M/v7gsHTbYaUHRgHW+Qxe/e33FiZKNDD4Hz2
         6LQ9nKyfXuO/m1a8/irNgQofjMHPSigkZKpd61n2BoxKLFNP8FhKhn18Kahl8r8M4n7E
         R/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884850; x=1756489650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pk2Is3iINvVBYx1tiVmoatjTI6H0OmVzvfALLTxnFA=;
        b=RRdCM3oiMQObh/PcXu7caHByyNT3GrYtjqspWByGmFavl7vQ23nETW8SvBLEZlDwig
         xlo4RIISOxJo1Cx6gQK6Hvn5jrwxE+5MA3DmZWQjNYxLB8GBJOuNqlt2DDopTzWDfSh2
         o/g5AblqnOrySD4nsFFKVUi//5KeQy5M83qh5vxSC6rsittm8RJxGSJX5USNfXY01MsV
         4NgCXQdmowUsedPkE6Nwz6A4CSVxc3QLVbe9NR71zbDBfWUUnxuvrDEA4yo2Y88Gnrty
         ARDJC0Kuyv9uUFeFnfdUHFArqsQ1aFG5BiLGmDphECzz2Z6BtiYqMmYtiWnI/ZaKboL7
         fPkA==
X-Gm-Message-State: AOJu0YxSmfDtAffwyp+xCQYPZG/iOEFDcB/oM6J4n7MK6NALlEgodpXw
	o57JsHGzn+9BdHqHmTJ8I9wGIS17rsihJsh5KltnH8um/ZMLyhRmxf8Y0iZn4N5uywqeeYrcHHW
	OEoq9
X-Gm-Gg: ASbGncvyX4fpfIzG/YaERv4KKItqQD3JsMRymk+CMAJhQKIPgY/eGuFuNGY9y8t2Mvm
	kFq0ZB5+yLamXaBHmRtNPcz7B8v1xErY/3SCGxwgnfqGkOauqYS5uVCJctsuv8YdsWd1+XLcHtc
	Eg5Y3Me8lxxuRm/NhuddclcSjIg1XlhGHhtC8/ZYfujSQVW5uXe8QG7k+Irjwe2ouLj1BY4/w/h
	x8fzKDi+0qIvsOk4Z2GgS+0TAx88KEXqmPAfGqjMuumG7q9vi42pf43GTsMRRslAmMWWf+4uyED
	kNgIbeLZfcMo4bqlpzdpn3j17ONYNC7zN4swP7idEGTFq9NxNrE0+1UKil5TOul3K+0UiL2P28W
	DDAHntUNx/nU/TnGb77kvF3iWvcpWB//YfBka4OP2jHLzjmEB/BPIOMJ4RpjJlbg6GRWD4HHT6H
	JbKm0BFQ==
X-Google-Smtp-Source: AGHT+IG4XIPTeocHGG5I3A7e0qgtcyCqA4EPCtUSBsRUkC4IO4uwiAhBHdemo1KZUiyuqkEmO9OVJQ==
X-Received: by 2002:ac8:5d47:0:b0:4b0:7620:7351 with SMTP id d75a77b69052e-4b2aaa0545amr58372551cf.13.1755884849786;
        Fri, 22 Aug 2025 10:47:29 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e6023asm3121361cf.53.2025.08.22.10.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:47:29 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 5/8] riscv: hw_breakpoint: Use icount for single stepping
Date: Fri, 22 Aug 2025 10:47:12 -0700
Message-ID: <20250822174715.1269138-6-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822174715.1269138-1-jesse@rivosinc.com>
References: <20250822174715.1269138-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104731_111555_3872FBF9 
X-CRM114-Status: GOOD (  29.75  )
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
OpenSBI implementation of sbi_debug_read_triggers does not return the
updated CSR values. There needs to be a check for working
sbi_debug_read_triggers before this works.

https://lists.riscv.org/g/tech-prs/message/1476

RFC -> V1:
 - Add dbtr_mode to rv_init_icount_trigger
 - Add icount_triggered to check which breakpoint was triggered
 - Fix typo: s/affects/effects
 - Move HW_BREAKPOINT_COMPUTE_STEP to Platform type
V1 -> V2:
 - Remove HW_BREAKPOINT_COMPUTE_STEP kconfig option
---
 arch/riscv/kernel/hw_breakpoint.c | 173 ++++++++++++++++++++++++++----
 1 file changed, 155 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index 3f96e744a711..f12306247436 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -20,6 +20,7 @@
 #define DBTR_TDATA1_DMODE		BIT_UL(__riscv_xlen - 5)
 
 #define DBTR_TDATA1_TYPE_MCONTROL	(2UL << DBTR_TDATA1_TYPE_SHIFT)
+#define DBTR_TDATA1_TYPE_ICOUNT		(3UL << DBTR_TDATA1_TYPE_SHIFT)
 #define DBTR_TDATA1_TYPE_MCONTROL6	(6UL << DBTR_TDATA1_TYPE_SHIFT)
 
 #define DBTR_TDATA1_MCONTROL6_LOAD		BIT(0)
@@ -62,6 +63,14 @@
 	(FIELD_PREP(DBTR_TDATA1_MCONTROL_SIZELO_FIELD, lo) | \
 	 FIELD_PREP(DBTR_TDATA1_MCONTROL_SIZEHI_FIELD, hi))
 
+#define DBTR_TDATA1_ICOUNT_U			BIT(6)
+#define DBTR_TDATA1_ICOUNT_S			BIT(7)
+#define DBTR_TDATA1_ICOUNT_PENDING		BIT(8)
+#define DBTR_TDATA1_ICOUNT_M			BIT(9)
+#define DBTR_TDATA1_ICOUNT_COUNT_FIELD		GENMASK(23, 10)
+#define DBTR_TDATA1_ICOUNT_VU			BIT(25)
+#define DBTR_TDATA1_ICOUNT_VS			BIT(26)
+
 enum dbtr_mode {
 	DBTR_MODE_U = 0,
 	DBTR_MODE_S,
@@ -79,6 +88,7 @@ static DEFINE_PER_CPU(union sbi_dbtr_shmem_entry, sbi_dbtr_shmem);
 
 /* number of debug triggers on this cpu . */
 static int dbtr_total_num __ro_after_init;
+static bool have_icount __ro_after_init;
 static unsigned long dbtr_type __ro_after_init;
 static unsigned long dbtr_init __ro_after_init;
 
@@ -129,6 +139,7 @@ static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
 static void init_sbi_dbtr(void)
 {
 	struct sbiret ret;
+	unsigned long dbtr_count = 0;
 
 	/*
 	 * Called by hw_breakpoint_slots and arch_hw_breakpoint_init.
@@ -143,6 +154,19 @@ static void init_sbi_dbtr(void)
 		return;
 	}
 
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+		DBTR_TDATA1_TYPE_ICOUNT, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to detect icount triggers. error: %ld.\n",
+			__func__, ret.error);
+	} else if (!ret.value) {
+		pr_warn("%s: No icount triggers available. "
+			"Falling-back to computing single step address.\n", __func__);
+	} else {
+		dbtr_count = ret.value;
+		have_icount = true;
+	}
+
 	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
 			DBTR_TDATA1_TYPE_MCONTROL6, 0, 0, 0, 0, 0);
 	if (ret.error) {
@@ -151,7 +175,7 @@ static void init_sbi_dbtr(void)
 	} else if (!ret.value) {
 		pr_warn("%s: No mcontrol6 triggers available.\n", __func__);
 	} else {
-		dbtr_total_num = ret.value;
+		dbtr_total_num = min_not_zero((unsigned long)ret.value, dbtr_count);
 		dbtr_type = DBTR_TDATA1_TYPE_MCONTROL6;
 		return;
 	}
@@ -166,7 +190,7 @@ static void init_sbi_dbtr(void)
 		pr_err("%s: No mcontrol triggers available.\n", __func__);
 		dbtr_total_num = 0;
 	} else {
-		dbtr_total_num = ret.value;
+		dbtr_total_num = min_not_zero((unsigned long)ret.value, dbtr_count);
 		dbtr_type = DBTR_TDATA1_TYPE_MCONTROL;
 	}
 }
@@ -320,6 +344,36 @@ static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,
 	return 0;
 }
 
+static int rv_init_icount_trigger(struct arch_hw_breakpoint *hw, enum dbtr_mode mode)
+{
+	unsigned long tdata1 = DBTR_TDATA1_TYPE_ICOUNT;
+
+	/* Step one instruction */
+	tdata1 |= FIELD_PREP(DBTR_TDATA1_ICOUNT_COUNT_FIELD, 1);
+
+	switch (mode) {
+	case DBTR_MODE_U:
+		tdata1 |= DBTR_TDATA1_ICOUNT_U;
+		break;
+	case DBTR_MODE_S:
+		tdata1 |= DBTR_TDATA1_ICOUNT_S;
+		break;
+	case DBTR_MODE_VS:
+		tdata1 |= DBTR_TDATA1_ICOUNT_VS;
+		break;
+	case DBTR_MODE_VU:
+		tdata1 |= DBTR_TDATA1_ICOUNT_VU;
+		break;
+	default:
+		return -EINVAL;
+	}
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
@@ -372,24 +426,28 @@ static int setup_singlestep(struct perf_event *event, struct pt_regs *regs)
 	/* Remove breakpoint even if return error as not to loop */
 	arch_uninstall_hw_breakpoint(event);
 
-	ret = get_insn_nofault(regs, regs->epc, &insn);
-	if (ret < 0)
-		return ret;
+	if (have_icount) {
+		rv_init_icount_trigger(bp, DBTR_MODE_U);
+	} else {
+		ret = get_insn_nofault(regs, regs->epc, &insn);
+		if (ret < 0)
+			return ret;
 
-	next_addr = get_step_address(regs, insn);
+		next_addr = get_step_address(regs, insn);
 
-	ret = get_insn_nofault(regs, next_addr, &insn);
-	if (ret < 0)
-		return ret;
+		ret = get_insn_nofault(regs, next_addr, &insn);
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
@@ -400,6 +458,79 @@ static int setup_singlestep(struct perf_event *event, struct pt_regs *regs)
 	return 0;
 }
 
+/**
+ * icount_triggered - Check if event's icount was triggered.
+ * @event: Perf event to check
+ *
+ * Check the given perf event's icount breakpoint was triggered.
+ *
+ * Returns:	1 if icount was triggered.
+ *		0 if icount was not triggered.
+ *		negative on failure.
+ */
+static int icount_triggered(struct perf_event *event)
+{
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(&sbi_dbtr_shmem);
+	struct sbiret ret;
+	struct perf_event **slot;
+	unsigned long tdata1;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("%s: Breakpoint not installed.\n", __func__);
+		return -ENOENT;
+	}
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
+			i, 1, 0, 0, 0, 0);
+	tdata1 = shmem->data.tdata1;
+
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+	if (ret.error) {
+		pr_warn("%s: failed to read trigger. error: %ld\n", __func__, ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	/*
+	 * The RISC-V Debug Specification
+	 * Tim Newsome, Paul Donahue (Ventana Micro Systems)
+	 * Version 1.0, Revised 2025-02-21: Ratified
+	 * 5.7.13. Instruction Count (icount, at 0x7a1)
+	 * When count is 1 and the trigger matches, then pending becomes set.
+	 * In addition count will become 0 unless it is hard-wired to 1.
+	 * When pending is set, the trigger fires just before any further
+	 * instructions are executed in a mode where the trigger is enabled.
+	 * As the trigger fires, pending is cleared. In addition, if count is
+	 * hard-wired to 1 then m, s, u, vs, and vu are all cleared.
+	 */
+	if (FIELD_GET(DBTR_TDATA1_ICOUNT_COUNT_FIELD, tdata1) == 0)
+		return 1;
+
+	if (FIELD_GET(DBTR_TDATA1_ICOUNT_COUNT_FIELD, tdata1) != 1)
+		return 0;
+
+	if (tdata1 & DBTR_TDATA1_ICOUNT_U)
+		return 0;
+	if (tdata1 & DBTR_TDATA1_ICOUNT_S)
+		return 0;
+	if (tdata1 & DBTR_TDATA1_ICOUNT_VU)
+		return 0;
+	if (tdata1 & DBTR_TDATA1_ICOUNT_VU)
+		return 0;
+	return 1;
+}
+
 /*
  * HW Breakpoint/watchpoint handler
  */
@@ -460,7 +591,10 @@ static int hw_breakpoint_handler(struct pt_regs *regs)
 
 		if (bp->in_callback) {
 			expecting_callback = true;
-			if (regs->epc != bp->next_addr) {
+			if (have_icount) {
+				if (icount_triggered(event) != 1)
+					continue;
+			} else if (regs->epc != bp->next_addr) {
 				continue;
 			}
 
@@ -477,7 +611,10 @@ static int hw_breakpoint_handler(struct pt_regs *regs)
 
 	}
 
-	if (expecting_callback) {
+	if (expecting_callback && have_icount) {
+		pr_err("%s: in_callback was set, but icount was not triggered, epc (%lx).\n",
+		       __func__, regs->epc);
+	} else if (expecting_callback) {
 		pr_err("%s: in_callback was set, but epc (%lx) was not at next address(%lx).\n",
 		       __func__, regs->epc, bp->next_addr);
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
