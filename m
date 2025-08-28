Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CA6CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 03:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3hY1a0CKl8O9Nv4+TOu084YZNQKCX8P7q8CrJCi1dfQ=; b=EHoMuOSbwoCnAa
	2MTTBglHWjY0p+U9PkmbP2uOiu339eQ/OvKA957z4lzxSeCgEqFrNdq/WKwLUZf3xCVfE6f5xP8S5
	Z9no4gA0SqscIRJN43CU2U32HwodAbwbJAy8UAR6OW7Dw2ow4PnKDZ0JtcUwIG1meRtyA2NBILL4q
	pLMrItWuBiI6wlCWo2A5/44nZdlH8JHHd4jpL3Zff/KneycBo3Vp6/K+CtXuBppz9w5ru7vRqvEz9
	xzATGd3rDaqTFsDNhtVWKX4zNWT+50pwQrwHeA9AzX6MEUqoFM+86Kxm91YYDk9IiKZTQnq34yNtN
	CjBbpVPKvvn5sTyfJ6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urT09-000000006Wp-1MCc;
	Thu, 28 Aug 2025 03:08:37 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5a-0000000HI4y-3FSY
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3275d2cb1cbso561290a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 17:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339322; x=1756944122; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1KBCmOkm9jj1CVFgQDrkKT5Cri9uMCD3k1Mkup3E5M=;
        b=hqQobnjGFe7Rti+quNhvbaxu62g7cPUQPW94gTayChVrZ27MVgq/NUeLbh6JeIRUM9
         NO1INGYeb1Gct09zMrsrmjA1frsxaZeaMPa04ahW8blKi9Uropzy0i+vw9oWFIqoTlvI
         rHEGVmoEj2M+yel9Z+YZi0HwXwhaVV39JNvImn2aKl0mEPwvYFFtlkdLMWC2AX45DwgX
         8F2yQyoMwt67hmWp5aXEJL4lw5Ko7UoHrBpfneOEe1FGekea6RKcBxxZLATMxsBWfMeA
         XRfuyvy8H6ODx0xIkDJ3TbHV50XEhcJoo5g1t5TiwKZtRrV2wI2MNn+9mg3c8Ab7Imff
         3wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339322; x=1756944122;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1KBCmOkm9jj1CVFgQDrkKT5Cri9uMCD3k1Mkup3E5M=;
        b=Ut2HNuTjpUOo8RX/Pq6NroO3E7CW/keX7xO+UhmUVHhgw3EBPomxe1TxlQ2uu7Msmr
         6BKxLEp/WIJP0ipzXJLiirBxlCmiarckx9k+QKTL/hmzWhmXXeli5MNXLUu429Q8B6Mi
         losHEBaX2E2qM7O88hgc/LeXVFkgjbYWYV9Kuxqd1tr5RGsOwUB6UlexhaoOOlj1WDo7
         x8wS9VXUgR0Dee7cDoQIlx3fEUFHlW4dM4L8Czd6lqwshxMpGz8qbbsmwcI4HqYYfjza
         QvB0nwC93oflM9sNVn5SryHoRebBZJRhhpT44masP8x7cZ7GVEzEgxnSz2l4VlPC6u7/
         pYdg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Dl6CANiMsH2k9xFqPPfjQwHeMtVdlU9k2zPZEaMYmqU4RQ2JQYHOTptw9LNjdPo+XJbYerw9tQCM3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD1c5iVJX3oxCRzoQHAFyr/8Q/5xWa3FVanHEWxVStR/rdtR7W
	O/izXo7izRL8pjq6E7ZSNneyRm2JnDuLYETS2nNyiMIO/hwvhV+R0ejvwQ+ey5kR7PxddOcf3ap
	Kug4FkQ==
X-Google-Smtp-Source: AGHT+IF6kzCkrmSsnzkeC4ntTYmLEyMfD8fyiYTiSQm4IQpQL6BrLCB4IIHTXj0uI8vGzJiOm/SE6wuxA5g=
X-Received: from pjbsv16.prod.google.com ([2002:a17:90b:5390:b0:325:4747:a99b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5627:b0:31e:ec58:62e2
 with SMTP id 98e67ed59e1d1-32515eaafdcmr30552688a91.19.1756339321553; Wed, 27
 Aug 2025 17:02:01 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:49 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-1-seanjc@google.com>
Subject: [PATCH v2 0/7] Drivers: hv: Fix NEED_RESCHED_LAZY and use common APIs
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
X-CRM114-CacheID: sfid-20250827_170202_809471_6F792ACF 
X-CRM114-Status: GOOD (  13.73  )
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

Fix a bug where MSHV root partitions (and upper-level VTL code) don't honor
NEED_RESCHED_LAZY, and then deduplicate the TIF related MSHV code by turning
the "kvm" entry APIs into more generic "virt" APIs.

This version is based on

  git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next

in order to pickup the VTL changes that are queued for 6.18.  I also
squashed the NEED_RESCHED_LAZY fixes for root and VTL modes into a single
patch, as it should be easy/straightforward to drop the VTL change as needed
if we want this in 6.17 or earlier.

That effectively means the full series is dependent on the VTL changes being
fully merged for 6.18.  But I think that's ok as it's really only the MSHV
changes that have any urgency whatsoever, and I assume that Microsoft is
the only user that truly cares about the MSHV root fix.  I.e. if the whole
thing gets delayed, I think it's only the Hyper-V folks that are impacted.

I have no preference what tree this goes through, or when, and can respin
and/or split as needed.

As with v1, the Hyper-V stuff and non-x86 architectures are compile-tested
only.

v2:
 - Rebase on hyperv-next.
 - Fix and converge the VTL code as well. [Peter, Nuno]

v1: https://lore.kernel.org/all/20250825200622.3759571-1-seanjc@google.com


Sean Christopherson (7):
  Drivers: hv: Handle NEED_RESCHED_LAZY before transferring to guest
  Drivers: hv: Disentangle VTL return cancellation from SIGPENDING
  Drivers: hv: Disable IRQs only after handling pending work before VTL
    return
  entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM
    proper
  entry: Rename "kvm" entry code assets to "virt" to genericize APIs
  Drivers: hv: Use common "entry virt" APIs to do work in root before
    running guest
  Drivers: hv: Use "entry virt" APIs to do work before returning to
    lower VTL

 MAINTAINERS                                 |  2 +-
 arch/arm64/kvm/Kconfig                      |  2 +-
 arch/arm64/kvm/arm.c                        |  3 +-
 arch/loongarch/kvm/Kconfig                  |  2 +-
 arch/loongarch/kvm/vcpu.c                   |  3 +-
 arch/riscv/kvm/Kconfig                      |  2 +-
 arch/riscv/kvm/vcpu.c                       |  3 +-
 arch/x86/kvm/Kconfig                        |  2 +-
 arch/x86/kvm/vmx/vmx.c                      |  1 -
 arch/x86/kvm/x86.c                          |  3 +-
 drivers/hv/Kconfig                          |  2 ++
 drivers/hv/mshv.h                           |  2 --
 drivers/hv/mshv_common.c                    | 22 ---------------
 drivers/hv/mshv_root_main.c                 | 31 ++++-----------------
 drivers/hv/mshv_vtl_main.c                  | 23 +++++++--------
 include/linux/{entry-kvm.h => entry-virt.h} | 19 +++++--------
 include/linux/kvm_host.h                    | 17 +++++++++--
 include/linux/rcupdate.h                    |  2 +-
 kernel/entry/Makefile                       |  2 +-
 kernel/entry/{kvm.c => virt.c}              | 15 ++++------
 kernel/rcu/tree.c                           |  6 ++--
 virt/kvm/Kconfig                            |  2 +-
 22 files changed, 60 insertions(+), 106 deletions(-)
 rename include/linux/{entry-kvm.h => entry-virt.h} (83%)
 rename kernel/entry/{kvm.c => virt.c} (66%)


base-commit: 03ac62a578566730ab3c320f289f7320798ee2e1
-- 
2.51.0.268.g9569e192d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
