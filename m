Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF344C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=579Epq6mWkqwXn95OQuiT1mXyQ1c3I0KpC/m6PFI2MQ=; b=kdS9OqcNOsvFuV
	jMo/sLje+XzDlPYpLFs99zlFM+YWT4fpd8zAdvgxemvJ53jnnfwxYEELvAlWdMNkBU70fg7XB3BdU
	FtyOH5XsAe3L9DGa3jtA3z6p41fyXIKgA6d4eYKwyB6oBrKrD+2x/c1046gtvk8vASLCfU1dqkrSc
	saXoeN7QBL1o4npoiilTUlhfrNEOSozP6EM9Y8XkCX/X+bp6sFHifQMBsmVDBbcfDenA3tJbO04MU
	UttJ6koJmdQ3tku8p80KDMPNWI4SHSXUPVKpuj51YfiM3kLUGkMr5UnDokxzX9ja92+OxTzBp84Nm
	iScnaW9T+MMRZNYUQ2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojL6h-00EqpB-6w; Fri, 14 Oct 2022 13:52:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojL6V-00Eqlb-V8; Fri, 14 Oct 2022 13:52:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53F0061B44;
	Fri, 14 Oct 2022 13:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96D6C433B5;
	Fri, 14 Oct 2022 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755519;
	bh=aw7b8s6lfuANwvZSIKkLapzc1cdGYtXBKsSB/Xbc17A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftZxPgAF9NjF2cgIdGfhSDBIz3VqAGnfDLn+fJX+8pDnZjvEBkvBHqo0cWZAzdkLe
	 7HTJQYtdLXZS8KKQ/EWqWSY4wm55Ovd/9ZEyWCiQBHhucyEUa8GcPA46gApiUwIR5t
	 GWA8LdkjJm5rW/1H1XojMPzOnacMFkxj1D2D416DAl6/sHse4L38RV2WAmz+Rgk62u
	 h2DrZrWJ+GUxDvz2XzkERaOc59UrNiQgNE9gjULm08sx8VcmNozOEDK+9vk4RFyUqQ
	 0GZTKQ9eqhFZiyoxjj9q1UxJ6sw6dljFcbiQvJcNF3sUN+R9o2kbYrAGGgzgzI7Iz7
	 gItsYu6lf0m8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	atishp@atishpatra.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 06/11] perf: RISC-V: throttle perf events
Date: Fri, 14 Oct 2022 09:51:32 -0400
Message-Id: <20221014135139.2109024-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135139.2109024-1-sashal@kernel.org>
References: <20221014135139.2109024-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_065200_067097_A7A46A6A 
X-CRM114-Status: GOOD (  11.03  )
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

[ Upstream commit 096b52fd2bb4996fd68d22b3b7ad21a1296db9d3 ]

Call perf_sample_event_took() to report time spent in overflow
interrupts. Perf core uses these measurements to throttle
perf events properly.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Link: https://lore.kernel.org/r/20220830155306.301714-4-geomatsi@gmail.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8de4ca2fef21..88e326c5f63b 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -18,6 +18,7 @@
 #include <linux/of_irq.h>
 #include <linux/of.h>
 #include <linux/cpu_pm.h>
+#include <linux/sched/clock.h>
 
 #include <asm/sbi.h>
 #include <asm/hwcap.h>
@@ -567,6 +568,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	unsigned long overflow;
 	unsigned long overflowed_ctrs = 0;
 	struct cpu_hw_events *cpu_hw_evt = dev;
+	u64 start_clock = sched_clock();
 
 	if (WARN_ON_ONCE(!cpu_hw_evt))
 		return IRQ_NONE;
@@ -635,7 +637,9 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			perf_event_overflow(event, &data, regs);
 		}
 	}
+
 	pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
+	perf_sample_event_took(sched_clock() - start_clock);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
