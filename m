Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6297C47090
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 21:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIGet1kWrrJoYbM9DsSKVkN698/0B5h3iq3x9ZmH+vM=; b=n7wREfnWDw2hpa
	MgW/MkkNjtFrbCagnOXZnXKCnc9CGyeFREJVR8ldv2LWXKbhxXS13JcND/3S+uF5F0TXgHTtLOGUd
	pOzuh5w9VjPac0lLIbKrRrJMjj0TlncjmUc1QGBXJGycZ7zPqqjZXcqVKgTJvM0Dlb9rsaHrhrvk/
	PHky3Gb7PJKXe7VINnlf6nTpIGJmn2xIMJyaGTE/AwaT6dha2/amQ8pLRrjUFlknIS1x4GkazQwJx
	JIx/uk7Ds5IjJzUhiivWihWas9WiLY5Pq84WOMuJYqOGwSx7WOb/JfTxX4TufMuVBRDeO0HT3fOO5
	qv9tob23830V6SFRn9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aUA-005UVU-B2; Sat, 03 Dec 2022 21:55:50 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aU5-005USz-U3
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 21:55:47 +0000
Received: by mail-lf1-x12a.google.com with SMTP id s8so12748914lfc.8
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=es7xLc06pLPAiKIE3C/C4jDOq3WzNjj3WS73rT+yieg=;
        b=WUz5MDgJhvaERjfZC+tUq2A6P1kro0MdwnYNEOCu8bhtQHAxRIuIVf2Qw6R97JAUyB
         OimbC1+LvjQiMBu5UXCi0okJDLI+LKj4/h/74Fh/NL2rKe1nlEHfsj3mnK4md8ZfJtrW
         HJ0FPhdLr6StEyRtoUxkkRYU/rCdnXm/byZfVawDedx8ksGLC3X7XQpvyD0BskPnZLzF
         zZ5bq1Bsqts9pqGwcVJsaGnMsxQYhm6+UvXsfMXw+FUbGLl8RLPAQVmfrpPgvLza2Bxw
         4Sn5tWfiM8wEhjZ2wt3c2JqQTxt/bt7Ok3K5CMkAgrQ6V4Tdt7RITlH5/FqMtR4hb4Y9
         pRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=es7xLc06pLPAiKIE3C/C4jDOq3WzNjj3WS73rT+yieg=;
        b=Ut9/KJrgWj3URmPix8lP9aF6EigLsyszlafiT6OxhMGpHMNA9rnZmPjwtVE1pN9or4
         4u5V83B1NlxHrDHS1oEZsdcIINKW5Aku0vPWb05VH5S0c3s1ZLkRix1JgPxox5/9hrBn
         naIUBmTF2rFRfMuXr/83jHDPOSwDii0s9gBVA/0npAsg/lntQwf7IvjlzUJVkWdsjPw2
         fr8HaPaYnT9yS7PEEdHnY0xGgAU7iZ3T5Y8UI5DgfBKByE8pzmg6b7pAzcHI79fFL1kA
         AFRG+fKQJUn1MhHoaoOtmiDG7Ugk+gwHE1AHd+lDEYoCbREAoF440wdAKY1C3clIbkUl
         /qZQ==
X-Gm-Message-State: ANoB5plb85eN+HzIqu+SVANkAHvnNdHTBz6j9dzmvo7TzVv40e2kM8Qg
	2pBP4Co35vTP75GRpxQgYiNcLRiK8AB3iQ==
X-Google-Smtp-Source: AA0mqf6K+xJP1aLqULlWh2dRLWkiAReMId3vyCf4nL9r0SDOrDaDanDP2oNXhfBBF7NIc4sxt5tzLA==
X-Received: by 2002:a19:430f:0:b0:4b4:f088:2b4a with SMTP id q15-20020a19430f000000b004b4f0882b4amr15376656lfa.300.1670104541652;
        Sat, 03 Dec 2022 13:55:41 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id j2-20020a056512344200b004b4f2a30e6csm1537002lfr.0.2022.12.03.13.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 13:55:41 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH RFC v2 3/3] riscv: hw-breakpoints: add more trigger controls
Date: Sun,  4 Dec 2022 00:55:35 +0300
Message-Id: <20221203215535.208948-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203215535.208948-1-geomatsi@gmail.com>
References: <20221203215535.208948-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_135546_003856_E1199694 
X-CRM114-Status: GOOD (  19.79  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

RISC-V SBI Debug Trigger extension proposal defines multiple functions
to control debug triggers. The pair of install/uninstall functions was
enough to implement ptrace interface for user-space debug. This patch
implements kernel wrappers for start/update/stop SBI functions. The
intended users of these control wrappers are kgdb and kernel modules
that make use of kernel-wide hardware breakpoints and watchpoints.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 arch/riscv/include/asm/hw_breakpoint.h |  15 ++++
 arch/riscv/kernel/hw_breakpoint.c      | 116 ++++++++++++++++++++++++-
 2 files changed, 127 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
index 5bb3b55cd464..afc59f8e034e 100644
--- a/arch/riscv/include/asm/hw_breakpoint.h
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -137,6 +137,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 				    unsigned long val, void *data);
 
+void arch_enable_hw_breakpoint(struct perf_event *bp);
+void arch_update_hw_breakpoint(struct perf_event *bp);
+void arch_disable_hw_breakpoint(struct perf_event *bp);
 int arch_install_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
@@ -153,5 +156,17 @@ static inline void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
 {
 }
 
+void arch_enable_hw_breakpoint(struct perf_event *bp)
+{
+}
+
+void arch_update_hw_breakpoint(struct perf_event *bp)
+{
+}
+
+void arch_disable_hw_breakpoint(struct perf_event *bp)
+{
+}
+
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 #endif /* __RISCV_HW_BREAKPOINT_H */
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index 8eddf512cd03..ca7df02830c2 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -2,6 +2,7 @@
 
 #include <linux/hw_breakpoint.h>
 #include <linux/perf_event.h>
+#include <linux/spinlock.h>
 #include <linux/percpu.h>
 #include <linux/kdebug.h>
 
@@ -9,6 +10,8 @@
 
 /* bps/wps currently set on each debug trigger for each cpu */
 static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM_MAX]);
+static DEFINE_PER_CPU(unsigned long, msg_lock_flags);
+static DEFINE_PER_CPU(raw_spinlock_t, msg_lock);
 
 static struct sbi_dbtr_data_msg __percpu *sbi_xmit;
 static struct sbi_dbtr_id_msg __percpu *sbi_recv;
@@ -318,6 +321,10 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	struct perf_event **slot;
 	unsigned long idx;
 	struct sbiret ret;
+	int err = 0;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&msg_lock),
+			  *this_cpu_ptr(&msg_lock_flags));
 
 	xmit->tdata1 = cpu_to_lle(info->trig_data1.value);
 	xmit->tdata2 = cpu_to_lle(info->trig_data2);
@@ -328,25 +335,31 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 			0, 0, 0);
 	if (ret.error) {
 		pr_warn("%s: failed to install trigger\n", __func__);
-		return -EIO;
+		err = -EIO;
+		goto done;
 	}
 
 	idx = lle_to_cpu(recv->idx);
 
 	if (idx >= dbtr_total_num) {
 		pr_warn("%s: invalid trigger index %lu\n", __func__, idx);
-		return -EINVAL;
+		err = -EINVAL;
+		goto done;
 	}
 
 	slot = this_cpu_ptr(&bp_per_reg[idx]);
 	if (*slot) {
 		pr_warn("%s: slot %lu is in use\n", __func__, idx);
-		return -EBUSY;
+		err = -EBUSY;
+		goto done;
 	}
 
 	*slot = bp;
 
-	return 0;
+done:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&msg_lock),
+			       *this_cpu_ptr(&msg_lock_flags));
+	return err;
 }
 
 /* atomic: counter->ctx->lock is held */
@@ -375,6 +388,96 @@ void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 		pr_warn("%s: failed to uninstall trigger %d\n", __func__, i);
 }
 
+void arch_enable_hw_breakpoint(struct perf_event *bp)
+{
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&bp_per_reg[i]);
+
+		if (*slot == bp)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("%s: unknown breakpoint\n", __func__);
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_ENABLE,
+			i, 1, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to install trigger %d\n", __func__, i);
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(arch_enable_hw_breakpoint);
+
+void arch_update_hw_breakpoint(struct perf_event *bp)
+{
+	struct arch_hw_breakpoint *info = counter_arch_bp(bp);
+	struct sbi_dbtr_data_msg *xmit = this_cpu_ptr(sbi_xmit);
+	struct perf_event **slot;
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&bp_per_reg[i]);
+
+		if (*slot == bp)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("%s: unknown breakpoint\n", __func__);
+		return;
+	}
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&msg_lock),
+			  *this_cpu_ptr(&msg_lock_flags));
+
+	xmit->tdata1 = cpu_to_lle(info->trig_data1.value);
+	xmit->tdata2 = cpu_to_lle(info->trig_data2);
+	xmit->tdata3 = cpu_to_lle(info->trig_data3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_UPDATE,
+			i, 1, __pa(xmit) >> 4,
+			0, 0, 0);
+	if (ret.error)
+		pr_warn("%s: failed to update trigger %d\n", __func__, i);
+
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&msg_lock),
+			       *this_cpu_ptr(&msg_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_update_hw_breakpoint);
+
+void arch_disable_hw_breakpoint(struct perf_event *bp)
+{
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&bp_per_reg[i]);
+
+		if (*slot == bp)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("%s: unknown breakpoint\n", __func__);
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_DISABLE,
+			i, 1, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to uninstall trigger %d\n", __func__, i);
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
+
 void hw_breakpoint_pmu_read(struct perf_event *bp)
 {
 }
@@ -406,6 +509,8 @@ void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
 
 static int __init arch_hw_breakpoint_init(void)
 {
+	unsigned int cpu;
+
 	sbi_xmit = __alloc_percpu(sizeof(*sbi_xmit), SZ_16);
 	if (!sbi_xmit) {
 		pr_warn("failed to allocate SBI xmit message buffer\n");
@@ -418,6 +523,9 @@ static int __init arch_hw_breakpoint_init(void)
 		return -ENOMEM;
 	}
 
+	for_each_possible_cpu(cpu)
+		raw_spin_lock_init(&per_cpu(msg_lock, cpu));
+
 	if (!dbtr_init)
 		arch_hw_breakpoint_init_sbi();
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
