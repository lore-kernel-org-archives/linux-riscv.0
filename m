Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97DAC46CD4
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6DYWlC4H4z/k9eEG1ITRbaIeg75Y8SGMgBgUntad5Q=; b=o9K7vcNB9lSDbr
	eFCBgUg9juiyUE0FMpkMkyj0wg0TYGbNVXASQlxxUfDLIMNyKLBreXlijIPWE3l761HXQSPHB8u42
	D1Lnton/c6edH6Cc+Rra/djsFiFY5GsrPE3IU/YvNS1NFNxtf+7ZXXFvUrM84qERzkwg1vkNJOwxj
	22M/CFl1qQD4zLPi5iYSS/xWC/ZEkuW6DZ+u16PvfMnDFAeNsoci1gPIgJQ5yYB3BUybwGt6lreBx
	EAf8s2+hqPif5ztyMYxBc4MDh7vl3Llm4IEYxyd232Z+k/uB8jfuAyExCkYP/Nw/nXuENSOqeJYtp
	QLjIuF5lz9/rvTT3JUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwE-008Q1A-1Z;
	Sun, 17 Dec 2023 20:40:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExw9-008Pxg-1m
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:35 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55359dc0290so76863a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845632; x=1703450432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C9+m5vX7gcyxmg3o58CZNvyTEXIZyT+2uiierRNF4w=;
        b=P1ArK+ncDJd3akgq5AbPbJ1lI5iZhR4zMnlkcvggFdf19XdEre3zWH3Rv0pb7OoPXb
         0n/a9nHZB4dZkIXggSV4eVrnlMKE0E26hIVOIJqARlv7SW1ftnPQi2uauumXcxewi/9+
         F3x0WzCcpzNZwW9YCMTwo5wFxfyhGE1y9tcL1KZH7iAYQkxN9caCbgTbrlp8JHi2OOGX
         ErJomkbBzwW8tzwvS4J3P8406Q7f1Uh4m9x7PoCGB36JK7ZqurKXtQ2/y2TC32KXZAKD
         gtiKENFgM9C153zkH2o7Ihm2s7N3rlxqHPYl77GxOfFUjUIqds+UpUEoJsM9GgZZXzCy
         /g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845632; x=1703450432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C9+m5vX7gcyxmg3o58CZNvyTEXIZyT+2uiierRNF4w=;
        b=HyzGViOnrNfm8Qy07iqOyOrhlPkigyF8XyuZYLCiNnfLZ5NfYeSVTF1y+zz7NwtY76
         Ucxqy+4i6L5WLqxgUPY2P5VCTBy5Ms4GOv2SREH+Lgx9Z9Okd4efUj9a3T23SYqBM6CZ
         OJx1CMOQT5hT4uoEdhRdmiZWvLn0dVCRVGS4dw+436zuZQ/dRBryjddZFv7kAYscjGys
         Xi2QIVEeXG8gY80HOvuIAUVealxLtFz7O/YdH/f67IYik5CtIw6fVY+vlwiqD4yEe94g
         +WXwbIVKNSulORWTseWV5I8Oe+EzJrKz/L/VXSVF3PDw5MPRottJ1KTR7/cLYndTqq/w
         z5Mg==
X-Gm-Message-State: AOJu0YxAq5l+9iGE9qAgHPFJb61GO5kzmeB4MunsNfMKtG9r7ZfBg9wH
	zL26YzmSnrWn0MMHJadPXYUllg==
X-Google-Smtp-Source: AGHT+IEb5mXAsy/TcJRY+ESJBC2XjarrnzMd6USLhSGOvGSddsgFgaE+w41cFsUI7yalBL6uW3ZbrA==
X-Received: by 2002:a50:8712:0:b0:54c:aa1c:205e with SMTP id i18-20020a508712000000b0054caa1c205emr13974797edb.17.1702845631646;
        Sun, 17 Dec 2023 12:40:31 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id ev14-20020a056402540e00b005519a444a6asm5555289edb.71.2023.12.17.12.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:31 -0800 (PST)
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
	conor.dooley@microchip.com
Subject: [PATCH v3 03/13] RISC-V: paravirt: Implement steal-time support
Date: Sun, 17 Dec 2023 21:40:23 +0100
Message-ID: <20231217204019.36492-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124033_594282_C03122D4 
X-CRM114-Status: GOOD (  18.03  )
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
index 141dbcc36fa2..cc6a85432678 100644
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
