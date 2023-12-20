Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0868FC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIrdGhM+vfiotly56XbfhMVwfg715FH5klUoeXhu59U=; b=mRrMuhTyjsxC2t
	+fmKRWMvPY5ZSxAf3j74VrlVREIcOnFoKR7tEjRLRZKjk+9kWZtcYMXV/LBv6ndia3imYfUkubycL
	EcWd+vUt9z8dlE7zUfFPZNuzUWan7DeM0N8NRK1M9y2F0Fp55W8XvJT4LE//gq3J8OuRG6a7c2aLH
	PotgQ5RvdqcSUpvbhU9hFoQ96+BPn1gsGcqx3PzmEztE0oaJXmDVuD3QS5VnxM/HKdENKeB/kJhSB
	bYJI4eVQkegUTDmKIHQU+vbQRvPOSlYwyPP2G5sckCCcoUJYY0Cpp181c7p4Kz3XOj7SpBDby8EyX
	3b99plJ3ljmlSsYGNxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzy-000M6W-2H;
	Wed, 20 Dec 2023 16:00:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzo-000LrJ-0T
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so53980995e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088025; x=1703692825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWv1b2FFYWZhlrkz0rd4Y40mouV9jQQisf/jEYboQMg=;
        b=lne4Kz2aSVDkOU3i7lCERtRpQnJj6JX8XJh7lc2QDE+hA2Sk2nyRt63zRQGvydon5f
         r2z7TP97szQpsc5wKv6XdEN9ZAZ8OyYlngH9ZYePFPhZ1h4QhJ19F0RCy3h5d2v35VvD
         aQJduc3zK/pvsbBoaqJNROkf+5LNDf/nWknl5N1rAwyIFXMwMAQvX3fFDJRmIuobv85w
         gZKpRbHw0yC3hpxfM3MyqGHeq1RWvQBVLcfmbdS1psxe7FV1nKB1kXx/rRyg/vv/oiAO
         hWEw9T4Gqk4DLql/bezXzdx03L36BMUTM/usrEwnW2AAmgIwdtRQy3GgsOkxA4mAlprx
         gK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088025; x=1703692825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWv1b2FFYWZhlrkz0rd4Y40mouV9jQQisf/jEYboQMg=;
        b=eAmz0B27q0hpylOjR1W6hxNXr2GLL3HyVZT//ifkUfCXWbZdAfwSEyj8ut2I9uauwQ
         mPErnw7CHEoW/78+fjSuXZTQN418JfRza31Eo5nrYmX0IPbQ7txNhHbriId4BQpKn/mJ
         hhdLngiqBrRuZkFFZgKHUsBu2ZlYU/juu+Tzw4FIfoQHBhYWcCrYbvP7k1V73ibrskek
         oCOsWEnI92OGQtxmWZj/yzHuQunvn21jvSKYkStUlDbms3DORLEGPSH3hjr7mn3wO7RU
         7cNGudRUZXmRtsG7oxeSn56zV5wQk6GqG9UYP2TqjCJkTK0U1jX6DfyoWx5LzpsGPGfo
         aQmg==
X-Gm-Message-State: AOJu0YwbQr3cNsiJlKKqATNqjAw3jR29UsSTjUOxniFIiMftsF/JrDoG
	vZ/9TJEz+1klAoHZkfrSDjYmog==
X-Google-Smtp-Source: AGHT+IHVvI5ZqhZaeg4C46CXZ1+zhCNNhxSIuL3dAJlR2VQgnunKdikGdwK0omwckzUrn3x0Ub3amQ==
X-Received: by 2002:a05:600c:3105:b0:40c:7103:d9c9 with SMTP id g5-20020a05600c310500b0040c7103d9c9mr4994434wmo.115.1703088025717;
        Wed, 20 Dec 2023 08:00:25 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id c5-20020a05600c0a4500b0040c411da99csm7955710wmq.48.2023.12.20.08.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:25 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 03/13] RISC-V: paravirt: Implement steal-time support
Date: Wed, 20 Dec 2023 17:00:16 +0100
Message-ID: <20231220160012.40184-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080032_483052_A4F6F994 
X-CRM114-Status: GOOD (  18.37  )
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

When the SBI STA extension exists we can use it to implement
paravirt steal-time support. Fill in the empty pv-time functions
with an SBI STA implementation and add the Kconfig knobs allowing
it to be enabled.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig           | 19 +++++++++++
 arch/riscv/kernel/paravirt.c | 63 ++++++++++++++++++++++++++++++++++--
 2 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..b99fd8129edf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -724,6 +724,25 @@ config COMPAT
 
 	  If you want to execute 32-bit userspace applications, say Y.
 
+config PARAVIRT
+	bool "Enable paravirtualization code"
+	depends on RISCV_SBI
+	help
+	  This changes the kernel so it can modify itself when it is run
+	  under a hypervisor, potentially improving performance significantly
+	  over full virtualization.
+
+config PARAVIRT_TIME_ACCOUNTING
+	bool "Paravirtual steal time accounting"
+	depends on PARAVIRT
+	help
+	  Select this option to enable fine granularity task steal time
+	  accounting. Time spent executing other tasks in parallel with
+	  the current vCPU is discounted from the vCPU power. To account for
+	  that, there can be a small performance impact.
+
+	  If in doubt, say N here.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on MMU && 64BIT && !XIP_KERNEL
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 080c95d2a295..574733b2bbea 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -6,12 +6,21 @@
 #define pr_fmt(fmt) "riscv-pv: " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/compiler.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/jump_label.h>
+#include <linux/kconfig.h>
+#include <linux/kernel.h>
+#include <linux/percpu-defs.h>
 #include <linux/printk.h>
 #include <linux/static_call.h>
 #include <linux/types.h>
 
+#include <asm/barrier.h>
+#include <asm/page.h>
+#include <asm/sbi.h>
+
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
@@ -31,24 +40,72 @@ static int __init parse_no_stealacc(char *arg)
 
 early_param("no-steal-acc", parse_no_stealacc);
 
+DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
+
 static bool __init has_pv_steal_clock(void)
 {
+	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+	    sbi_probe_extension(SBI_EXT_STA) > 0) {
+		pr_info("SBI STA extension detected\n");
+		return true;
+	}
+
 	return false;
 }
 
-static int pv_time_cpu_online(unsigned int cpu)
+static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
+					unsigned long flags)
 {
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
+			lo, hi, flags, 0, 0, 0);
+	if (ret.error) {
+		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
+			pr_warn("Failed to disable steal-time shmem");
+		else
+			pr_warn("Failed to set steal-time shmem");
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
 	return 0;
 }
 
+static int pv_time_cpu_online(unsigned int cpu)
+{
+	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
+	phys_addr_t pa = __pa(st);
+	unsigned long lo = (unsigned long)pa;
+	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
+
+	return sbi_sta_steal_time_set_shmem(lo, hi, 0);
+}
+
 static int pv_time_cpu_down_prepare(unsigned int cpu)
 {
-	return 0;
+	return sbi_sta_steal_time_set_shmem(SBI_STA_SHMEM_DISABLE,
+					    SBI_STA_SHMEM_DISABLE, 0);
 }
 
 static u64 pv_time_steal_clock(int cpu)
 {
-	return 0;
+	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
+	u32 sequence;
+	u64 steal;
+
+	/*
+	 * Check the sequence field before and after reading the steal
+	 * field. Repeat the read if it is different or odd.
+	 */
+	do {
+		sequence = READ_ONCE(st->sequence);
+		virt_rmb();
+		steal = READ_ONCE(st->steal);
+		virt_rmb();
+	} while ((le32_to_cpu(sequence) & 1) ||
+		 sequence != READ_ONCE(st->sequence));
+
+	return le64_to_cpu(steal);
 }
 
 int __init pv_time_init(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
