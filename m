Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F043C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyTEbMSXgpZ/EB3fEtCljweO+UNHAEW1X+IY11xMQ2E=; b=NRhxzp4p1f8JVz
	R0JGJdEGtrJlYVYJ/UHYGgMn08zpLqWfiYDMS0DYn/TMUrfjJvt8jgMoR7lXFp0k6cFp0pTwa89TZ
	Wop3HptiDYdtU9tGkCeOQe2ocHi9tYo+pKt3nreRBY+7WlPS0/L9nqL/unXnTjUE8HAhBvOWEnWOe
	bQay3mvprsKsTzj3ndHt/zTpyuSDtg12757J+C42+qVDDVWoXmmxOiAHbQjPYPQcNp13wAy0RAgsG
	BVqivKiF3gVlDhcOoips5COy7Q9BGqlH8OAdaq4Khqj6s/PnegXsm1rWubyLNk6Q4KADACMyzJceS
	wcOYEnDef70JPtO1fMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIN-00G1KE-1L;
	Mon, 17 Apr 2023 11:45:19 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBf-00Fkid-0L
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:23 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f725so2925534a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727653; x=1684319653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0XFqfS1dX6VIRcfYjDK7dr/EM0wCg2sQEuqDR9aIm0=;
        b=SK6im/Yqulvu5AszctClvR3j9YvoyaqQ1FTnIZ3bcCUhpIA4w8k0tUwdsuVG7VLzyT
         ylkeQqWoit4DChnpAbotH3ZkH29WZcV+m8dh4TLefFQmT+1ETIODv666Ol45opgeKjvQ
         KSAEN/Sx0cus/+eK7BdeseBoYmU/061sbiLnCH2AgGtUYEBPSHgDCMpxjOtP8NnmchIt
         7UockYehe/VmcKE9BBECSfjYt3EeLc768Y2IsdMN56y29IU7oPy/vqWi7zBjW5zWIzdA
         8knGyRE+fgUNu9VLp8dR51/jy8VmM5JeZJN6x0R4yFwF1T/nywmnTKZyyLD/XZXLPWZ/
         60FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727653; x=1684319653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0XFqfS1dX6VIRcfYjDK7dr/EM0wCg2sQEuqDR9aIm0=;
        b=GxYe2EhL8HOLjE24jOL1svyjUQckKdJP5GlKu0Rcqait3y6O1M0VCY41sKQ1TAtxRS
         PmaQKcJyGdlfoJbB+Y1OJsxrG28WRqytZAGfAMpu9ZTIHPHoYLX79TTMd6+0S8x0MoJp
         QaSrr0VJF8wq2UAkyAXvOcXhEi+q/CXlM0s9RHlABDs9DjN4EqjvWYCrNJXi9V9UQbGm
         DeuwmI0ct7tQggKkEzBLooUNdkCw9oWOCiqbW+UWZ5sB1DkfXL6T1E46g0cRcOSO6GhZ
         wq5aFrBnwJG8fAQLKT5edKPhAuFfY+ZCo/LvfzcZQoZfvWwL+q+E6F8e0Tq6bHy5B2wF
         JzpA==
X-Gm-Message-State: AAQBX9fWjhUXLTTB3USXDj6IydfxjNI9vdQELeLfZLEgakR9NpM9fgAe
	2hgtZfjBrK7i3tTOR0Zz4wSJCQ==
X-Google-Smtp-Source: AKy350YFro/cHf3pAMJkWzFN8DpsaoBLQZFqAzEJfMwn33iCkE3dFU2P7O5Qtocgcr1cuyEv7NmzDg==
X-Received: by 2002:a05:6402:12c4:b0:504:b64d:759c with SMTP id k4-20020a05640212c400b00504b64d759cmr13570310edx.35.1681727652989;
        Mon, 17 Apr 2023 03:34:12 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id v29-20020a50d59d000000b004bf999f8e57sm5781316edi.19.2023.04.17.03.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:12 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Date: Mon, 17 Apr 2023 12:33:51 +0200
Message-Id: <20230417103402.798596-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033419_179568_4BF1DC24 
X-CRM114-Status: GOOD (  13.63  )
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
with an SBI STA implementation.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 56 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 141dbcc36fa2..5f8d96b919e4 100644
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
 
@@ -31,24 +40,65 @@ static int __init parse_no_stealacc(char *arg)
 
 early_param("no-steal-acc", parse_no_stealacc);
 
+DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
+
 static bool __init has_pv_steal_clock(void)
 {
+	if (sbi_probe_extension(SBI_EXT_STA) > 0) {
+		pr_info("SBI STA extension detected\n");
+		return true;
+	}
+
 	return false;
 }
 
-static int pv_time_cpu_online(unsigned int cpu)
+static int sbi_sta_set_steal_time_shmem(unsigned long lo, unsigned long hi,
+					unsigned long flags)
 {
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_SET_STEAL_TIME_SHMEM,
+			lo, hi, flags, 0, 0, 0);
+	if (ret.error) {
+		if (lo == -1 && hi == -1)
+			pr_warn("Failed to disable steal-time shmem");
+		else
+			pr_warn("Failed to set steal-time shmem");
+		return -ENOMEM;
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
+	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
+}
+
 static int pv_time_cpu_down_prepare(unsigned int cpu)
 {
-	return 0;
+	return sbi_sta_set_steal_time_shmem(-1, -1, 0);
 }
 
 static u64 pv_time_steal_clock(int cpu)
 {
-	return 0;
+	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
+	u32 sequence;
+	u64 steal;
+
+	do {
+		sequence = st->sequence;
+		virt_rmb();
+		steal = st->steal;
+		virt_rmb();
+	} while ((sequence & 1) || (sequence != st->sequence));
+
+	return steal;
 }
 
 int __init pv_time_init(void)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
