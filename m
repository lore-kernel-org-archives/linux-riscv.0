Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F053ACA0EFF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 02:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kvugbpNWVEOWd0MlKJ59bQgYHNFJRFCWHzSWYuvoBQ=; b=beKOyhKh/+n3Zw
	R1hJ5AKunEeAxIJuR/J1c7SV/gXamFN6b9shlRBBwwweHYWdfBPd+MzMW2Ue2EVdZzR3UPIh1YZt2
	I0Rzk50dCkZjDKKXs2GQBvmxGn8qKxzbmyrUZaWL83BHNdRsx+v3Uoj/AsFc5Q9QLavOmvVHm1OZE
	+CtkWOWLUV2oYZ2SKvYGOeq93HHUZFv+Q/389g5GFE7pu2iGeTfOXidfNMd77n4WfedzcTCKWoZqH
	MxEVBf5OuCddgzCu7lnGJQPTNDlEakZ7QxYZIqxffE8eJlkVXh3GuKmhHxpJ5EbNQVtB1FdwqRg4p
	SP21MrT1oPRiFIT1u4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSX9-000000002E8-2uqA;
	Thu, 28 Aug 2025 02:38:39 +0000
Received: from mail-pj1-f73.google.com ([209.85.216.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5o-0000000HIB3-1i8y
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:17 +0000
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3274f7e6c1fso353970a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 17:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339335; x=1756944135; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=;
        b=FCqRi2sVZQvLvILjHF4/S0OSuocQe6dYKEQWRuUx8RbxZL9uSU2lZ7EQMHGnAwq0oI
         bwtMctphX3sq0IvtLf2y65HMTB0PW6dDV2YNLSIKRQIGzzncNX6q887oIkJmm7UQWk7j
         bRNk98FKdrtwmLLnoJEaovWuwNCy3oiiLWn3VmSPMTydJBBY8LH7zyimMSAKNq06CxcY
         kREb+yV/5FiNK2kVoW7LZ1/VVspxAG6+4Mp+4cQH0r+jo4mcO/Uq4dqFbuM86viE9aaf
         zP9P+51A5MiUhK8swewvt5ZJfwnehs8YFMk99lHPj9ouYPubuHTR75tmwmE/rKjK20O1
         oI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339335; x=1756944135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS5zxATrMXESBFPKwTqytXa2jxoDaW3HrytCSPyurss=;
        b=lmQ1XRSJROqd1Vyq1dhB+19oXW/RupkeG27477bnPi09WLe8JZh+GhpTKiICNpUv96
         OO7NE+t+GSrXUg79usJfIR6nVkK7QxZMfpsz0wS4LfM+Vd8dDHDv6wiESg8ES4fRJ2/3
         5ytevS76egE3olGE9P+8TPlO+y1W1AEnRGHwJnalKGF4h3P9s3VUxzJdLlg1PUnhIGfu
         mzxOYt/YuXjy7idXw8toSlLM4KraCXg+wxrQisGsjqHMecSJScJZznvo6BgFmULXy3RB
         1WQeIfs4u3AjDr4a/5u7a29sSA3cEgfcwe9RwKmMh9xsQxpG5BFCmsTacxtGD0JXndyB
         MuvA==
X-Forwarded-Encrypted: i=1; AJvYcCWjLhbMdUbX1PYWl+JMVSsVJc7lwy7BeWN2iwxe+mHrnMrkT3EUV2EEgBj8Q3FofYUevqMjJPmSjkk/nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ1y4F8SfMEwpnQDjNZZYkeXdifSkEBL5D6bO5dOnaMsQ7iMw3
	kIp12pfwmOJmzDyIvR3V/7ZWgttCTU2vnP9Sp4BF7rtBZSw9EzV2bwY9AwtNcfWVChpRBzn+Kar
	S8iOAlQ==
X-Google-Smtp-Source: AGHT+IHTwHRJ1LtJUNLrZJovplfjTJdtHnbpa9Rw0OlaHYLIVyGS/gJ8LisaniBrYJHJcn/KzpZqw55zABU=
X-Received: from pjbsc11.prod.google.com ([2002:a17:90b:510b:b0:321:c36d:1b8a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3941:b0:327:b01c:4fd4
 with SMTP id 98e67ed59e1d1-327b01c52bcmr306189a91.2.1756339334767; Wed, 27
 Aug 2025 17:02:14 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:56 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-8-seanjc@google.com>
Subject: [PATCH v2 7/7] Drivers: hv: Use "entry virt" APIs to do work before
 returning to lower VTL
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_170216_449800_309E9F4D 
X-CRM114-Status: GOOD (  14.66  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use the kernel's common "entry virt" APIs to handle pending work prior to
returning to a lower VTL.  Drop the now-defunct common MSHV helper for
doing work as the VTL driver was the last user.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/Kconfig         |  1 +
 drivers/hv/mshv.h          |  2 --
 drivers/hv/mshv_common.c   | 22 ----------------------
 drivers/hv/mshv_vtl_main.c | 11 +++--------
 4 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 894037afcbf9..b00b2b3fe3db 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -85,6 +85,7 @@ config MSHV_VTL
 	# Therefore, do not attempt to access or modify MTRRs here.
 	depends on !MTRR
 	select CPUMASK_OFFSTACK
+	select VIRT_XFER_TO_GUEST_WORK
 	default n
 	help
 	  Select this option to enable Hyper-V VTL driver support.
diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index 0340a67acd0a..d4813df92b9c 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -25,6 +25,4 @@ int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
-int mshv_do_pre_guest_mode_work(ulong th_flags);
-
 #endif /* _MSHV_H */
diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index eb3df3e296bb..aa2be51979fd 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -138,25 +138,3 @@ int hv_call_get_partition_property(u64 partition_id,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(hv_call_get_partition_property);
-
-/*
- * Handle any pre-processing before going into the guest mode on this cpu, most
- * notably call schedule(). Must be invoked with both preemption and
- * interrupts enabled.
- *
- * Returns: 0 on success, -errno on error.
- */
-int mshv_do_pre_guest_mode_work(ulong th_flags)
-{
-	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
-		return -EINTR;
-
-	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
-		schedule();
-
-	if (th_flags & _TIF_NOTIFY_RESUME)
-		resume_user_mode_work(NULL);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 4ca13c54c0a0..1eabed16aab9 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -8,6 +8,7 @@
  *   Naman Jain <namjain@linux.microsoft.com>
  */
 
+#include <linux/entry-virt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/miscdevice.h>
@@ -727,22 +728,16 @@ static int mshv_vtl_ioctl_return_to_lower_vtl(void)
 {
 	preempt_disable();
 	for (;;) {
-		const unsigned long VTL0_WORK = _TIF_SIGPENDING | _TIF_NEED_RESCHED |
-						_TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL |
-						_TIF_NEED_RESCHED_LAZY;
-		unsigned long ti_work;
 		unsigned long irq_flags;
 		struct hv_vp_assist_page *hvp;
 		int ret;
 
-		ti_work = READ_ONCE(current_thread_info()->flags);
-		if (unlikely(ti_work & VTL0_WORK)) {
+		if (__xfer_to_guest_mode_work_pending()) {
 			preempt_enable();
-			ret = mshv_do_pre_guest_mode_work(ti_work);
+			ret = xfer_to_guest_mode_handle_work();
 			if (ret)
 				return ret;
 			preempt_disable();
-			continue;
 		}
 
 		local_irq_save(irq_flags);
-- 
2.51.0.268.g9569e192d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
