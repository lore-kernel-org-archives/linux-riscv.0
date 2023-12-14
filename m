Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EC4C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRBySzakkPDRhidfT7ygY5HaIFUH9+DIT45ZGlsl/WU=; b=rIderSVFhHvUAg
	nHIwhNH7Yk1Z77aquoiKQjFIUvflVDlfCzikc1YKkBoEBzwWhOXKfuzYTPNQiD17PVR4SjOwTgW8n
	OBfQ0t3gKV23LS8ehsERB5P9CMMbPhoNujiftrDimvkp+3JzrearS+dIqcbPqhk+1YEsIKxe2Ul7z
	PpjLPVccxrqecF8ARo08nrjAMzka98hJ1OjgIRk0M3vxQRCagOJa8/XwRdNTq7EQDAnYuL7+/uiB8
	7WIPBl/g0q5DYV/CS+MNVk5BLX4BfXfAf2groSmZ0D2smH0/ofeO5eJOyiLf0O9jioLv9nGvEjhUD
	NH9bpk7/MQNg0XjtSYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilB-00HRMN-0V;
	Thu, 14 Dec 2023 10:16:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDil6-00HRHk-2i
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33646500f1aso508257f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548958; x=1703153758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDFKjtkEUBXvnuN4CRr8+YcMZn89qdhvuFwTlW15tEo=;
        b=c7W0U2w+e2SbM7ztMgkkh6SW0ONnhefF7UDCoMLTZiRj4z7oMXF5qaEcsto4BdPSDm
         IiYTIl9txPZdbAKc9NegDuY+ita37m2H7tUq9Fg11qXHs5naDaoK3RzaJkPqopv5iQte
         dZF46FBj1wVonP0MG818Vd/rCPco4OmMIFmPbWUwC/4cJZwBuqCrC0+l7jZznbnd1SOh
         N3yrUiJmv5U/AlHv4e3PGjkbQilCbQjZzJF6vm+s7ppkqeJbLNXsWMpGPCWIGkHmg8OB
         6xFZhX1Uth22tMDP6UP3U1e6fWw0GpJ4aaqG57AiX4APxYgf9tqgcUHG28Nmhj1WbPwJ
         lffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548958; x=1703153758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDFKjtkEUBXvnuN4CRr8+YcMZn89qdhvuFwTlW15tEo=;
        b=ORfp7OnBS0zIAMrfgnYNBhu50M2T96lBSTEp9AA8xJvOsmHxSH1T67dPt3xmD7V1+W
         c+h3nuRSx0ujjN/c848QGUkGNK4HpPuNdyGnd2AL6O9dbxQ+HT23vBHHq5d/EkUHNi5l
         PS7US8+9sdghy8RBnPgIthNQXvdA3Qsx50gkXbvMDJYkdG+KezG//Rf4uA0RZWIjx5ZN
         jOVGnKXXjTeGPicN+mIeRTtPeqjYcKyqfkJJVU0hb9tJjae3D3LC+yoEreziilp00OOO
         P+PvsXLX55qHnnWSWQobFS2htRbU7tROO9adLVLk5ULE3WKdToUDYynVPYofvI3rITep
         4t1w==
X-Gm-Message-State: AOJu0YyKCYdtYKLsdS9mZhKZNiTmNEiZjbfC4YAOibpWW4x1+LK0tuGr
	0Fng1I+EvbaGEgIt43USmWW+Wg==
X-Google-Smtp-Source: AGHT+IGp5Rd3G1mgW2O3vK3x6v4ws/oY3mSDmogD/aXwkyD9KfbxZIOuMClxn+rbdPkn05lnyYl5Qg==
X-Received: by 2002:adf:ecc2:0:b0:333:2fd2:3c0d with SMTP id s2-20020adfecc2000000b003332fd23c0dmr3732444wro.198.1702548958139;
        Thu, 14 Dec 2023 02:15:58 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b00333404e9935sm15526269wrx.54.2023.12.14.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:15:57 -0800 (PST)
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
Subject: [PATCH v2 03/13] RISC-V: paravirt: Implement steal-time support
Date: Thu, 14 Dec 2023 11:15:55 +0100
Message-ID: <20231214101552.100721-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021600_899192_29BAA2C5 
X-CRM114-Status: GOOD (  18.83  )
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
 arch/riscv/Kconfig           | 19 ++++++++++
 arch/riscv/kernel/paravirt.c | 67 ++++++++++++++++++++++++++++++++++--
 2 files changed, 83 insertions(+), 3 deletions(-)

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
index 141dbcc36fa2..b09dfd81bcd2 100644
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
 
@@ -31,24 +40,76 @@ static int __init parse_no_stealacc(char *arg)
 
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
+	if (IS_ENABLED(CONFIG_32BIT)) {
+		/*
+		 * Check the sequence field before and after reading the steal
+		 * field. Repeat the read if it is different or odd.
+		 */
+		do {
+			sequence = READ_ONCE(st->sequence);
+			virt_rmb();
+			steal = READ_ONCE(st->steal);
+			virt_rmb();
+		} while ((le32_to_cpu(sequence) & 1) ||
+			 sequence != READ_ONCE(st->sequence));
+	} else {
+		steal = READ_ONCE(st->steal);
+	}
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
