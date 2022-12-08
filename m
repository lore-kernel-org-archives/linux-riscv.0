Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258CCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vWiXhz2SNUDlfjRXSnAi/t+QwHJwbFaNrpNpCdhUAUE=; b=adJSoklxl5+SXBMREZtW241HJh
	o2OoDx+7yo3DpQAO1cNboBzhoM8q6iW5YnSbv53va6yzVYgh92sneNmUctko1XHOwFp5OTqp7jqep
	6NluXUvSr5nuVpiKfg3Kjt0B/5PDWovIUjcg23aeNUvH8x6kAKBpWPSpiTmS9ywqJXzlJLnJGGE1Y
	+LjweK6W1Nim7r6JumPKNiew91kdIVH/rmhXDs8MrvDVoqrHaEe6dj12lOnN5CZicA9pmZKYiIILj
	RS7CI+3Jzzfu42oH9aeinKJzpTzanLD5YlQ3PtZaLsXEdLidwRwIhpSODDU41fa6e7J4NjVg9nsdZ
	6ZXlHWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3N34-00AADu-U3; Thu, 08 Dec 2022 19:59:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Myz-00A7bR-1X
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 19:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7el2leYxw6DuE2TKpxO/GVa0AQVZhVPYSCMmz19ZHuI=; b=Q52O4ZwjbN6zb1XcjxHSGcDBKL
	ihOTLHD4dGK6NE8zXcNJK4oXRt8a1vT71SIW3d5w0Faz/ONfVkvGLAU8qGwODBNVBjbN/9dR/rAJC
	vmwgPJIh2nYcCgX2mPx8oumQgJ7xJONX6WLSM+Tg5YF55UdAjffFH/pxO3oTHFU+0GKu+LfPyOsO8
	hWebFfS3W/InlgwtE+nP73Nnql95i1hj6WV9+ls9VXgLz7Qf54OzqZ7t1rXAyNQpo58WIpZgm8F2p
	lbC0sTUZaT9Tr4qVR4knR09E6dXSnVl5YnmOw6oIdq2ufgV8/LIUigfdANBaCdQnG3u6889h9ANg4
	QpJlsz5A==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mkh-007G7V-0I
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:40:16 +0000
Received: by mail-pf1-x44a.google.com with SMTP id cp23-20020a056a00349700b005775c52dbceso1739528pfb.21
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7el2leYxw6DuE2TKpxO/GVa0AQVZhVPYSCMmz19ZHuI=;
        b=O++bFFpSURwB8JUZDeWwEc8lxc4/9crS2K4HsyuyBbvilW8kdB4FZPUpBapa95NsxY
         0xO+2BUFvsH7Lv9OpM/ZNw6lAX1BZkwmvpchLqFMC1N46mGiLFFJBG/HkNWtdDFKz0HV
         gaJZcacGlJwuJDiHLoKW0WYD/nKr6azk72Tngx5olXe8pBzakRuhI16DprQMVZTjM2QI
         klMPqFL6afDQzxyjJFzvNFwT6YpAogs4p8iE9rScX7ZpN21ivdBFghpL37wrQT+9CnOv
         tdduCPP5Ti74kCPUwjTk76Ln1pEwMrFI/tCITETf7aNuyVpMp2Rq1UKSZarbJfTksvTP
         6Wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7el2leYxw6DuE2TKpxO/GVa0AQVZhVPYSCMmz19ZHuI=;
        b=4Sh0KaRUyn5DaswVc8x449uwjTm3lH4N7x8ho9BuetCiGU3Fa7OZbaJu+Ckz91WnSU
         oRimKbtf28pEOD0b/vnypTQrbA3TsWFgxE6D9H715QGorVJ8Ky1wRjQJm9QZqJXuXZTY
         66R+kluV1t5tBV5n7Ej9ypfSTyYrjRuaAy3E00meftJeyZ+SSG+kBawAqUzW6lduPjLr
         xe/zONHOL60KdAt9UNTlkJtlOZUDndioCq60H7dHg1IwlP19KwFpTEotyqV00BxziNrD
         xqXXZDhGRPHO5JTCV1WkP4+hNKkrnKH/Optfcz2LS8Go8JHxkOTgvLE4bVWY7cWxfqrd
         uBJA==
X-Gm-Message-State: ANoB5pk5ZmjxJmgdHVuuDeEeS7PkjZEaCYP948RA5wwKJXh+bwl7JWWG
	jzs0kdFDgxjMKujvcounlAlq+9FCq15x4A==
X-Google-Smtp-Source: AA0mqf4ImIWXetG7XX1SXxRXGnECaJ0ODlsgksb3SPKCTTh3sr1uwrp/2qso+8Xm6A48WDYB3HG6hZIxDgKp9g==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6a00:2183:b0:574:2104:5657 with SMTP
 id h3-20020a056a00218300b0057421045657mr5713585pfi.58.1670528404717; Thu, 08
 Dec 2022 11:40:04 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:54 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-35-dmatlack@google.com>
Subject: [RFC PATCH 34/37] KVM: MMU: Move the TDP iterator to common code
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_194015_078019_5022DC66 
X-CRM114-Status: GOOD (  12.54  )
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

Move arch/x86/kvm/mmu/tdp_iter.{c,h} to into common code so that it can
be used by other architectures in the future.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 MAINTAINERS                                  | 2 +-
 arch/x86/kvm/Makefile                        | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c                   | 2 +-
 arch/x86/kvm/mmu/tdp_pgtable.c               | 2 +-
 {arch/x86/kvm/mmu => include/kvm}/tdp_iter.h | 9 +++------
 virt/kvm/Makefile.kvm                        | 2 ++
 {arch/x86 => virt}/kvm/mmu/tdp_iter.c        | 4 +---
 7 files changed, 10 insertions(+), 13 deletions(-)
 rename {arch/x86/kvm/mmu => include/kvm}/tdp_iter.h (96%)
 rename {arch/x86 => virt}/kvm/mmu/tdp_iter.c (98%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e586d7ba78c..3c33eca85480 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11206,7 +11206,7 @@ F:	include/uapi/asm-generic/kvm*
 F:	include/uapi/linux/kvm*
 F:	tools/kvm/
 F:	tools/testing/selftests/kvm/
-F:	virt/kvm/*
+F:	virt/kvm/
 
 KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
 M:	Marc Zyngier <maz@kernel.org>
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index c294ae51caba..cb9ae306892a 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -18,7 +18,7 @@ ifdef CONFIG_HYPERV
 kvm-y			+= kvm_onhyperv.o
 endif
 
-kvm-$(CONFIG_X86_64) += mmu/tdp_pgtable.o mmu/tdp_iter.o mmu/tdp_mmu.o
+kvm-$(CONFIG_X86_64) += mmu/tdp_pgtable.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 1f1f511cd1a0..c035c051161c 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -2,10 +2,10 @@
 
 #include "mmu.h"
 #include "mmu_internal.h"
-#include "tdp_iter.h"
 #include "tdp_mmu.h"
 #include "spte.h"
 
+#include <kvm/tdp_iter.h>
 #include <kvm/tdp_pgtable.h>
 #include <kvm/mmutrace.h>
 
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index cc7b10f703e1..fb40abdb9234 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -2,10 +2,10 @@
 
 #include <linux/kvm_types.h>
 #include <kvm/tdp_pgtable.h>
+#include <kvm/tdp_iter.h>
 
 #include "mmu.h"
 #include "spte.h"
-#include "tdp_iter.h"
 
 /* Removed SPTEs must not be misconstrued as shadow present PTEs. */
 static_assert(!(REMOVED_TDP_PTE & SPTE_MMU_PRESENT_MASK));
diff --git a/arch/x86/kvm/mmu/tdp_iter.h b/include/kvm/tdp_iter.h
similarity index 96%
rename from arch/x86/kvm/mmu/tdp_iter.h
rename to include/kvm/tdp_iter.h
index 6e3c38532d1d..0a154fcf2664 100644
--- a/arch/x86/kvm/mmu/tdp_iter.h
+++ b/include/kvm/tdp_iter.h
@@ -1,14 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#ifndef __KVM_X86_MMU_TDP_ITER_H
-#define __KVM_X86_MMU_TDP_ITER_H
+#ifndef __KVM_TDP_ITER_H
+#define __KVM_TDP_ITER_H
 
 #include <linux/kvm_host.h>
 #include <kvm/tdp_pgtable.h>
 
-#include "mmu.h"
-#include "spte.h"
-
 /*
  * TDP MMU SPTEs are RCU protected to allow paging structures (non-leaf SPTEs)
  * to be zapped while holding mmu_lock for read, and to allow TLB flushes to be
@@ -117,4 +114,4 @@ void tdp_iter_start(struct tdp_iter *iter, struct kvm_mmu_page *root,
 void tdp_iter_next(struct tdp_iter *iter);
 void tdp_iter_restart(struct tdp_iter *iter);
 
-#endif /* __KVM_X86_MMU_TDP_ITER_H */
+#endif /* __KVM_TDP_ITER_H */
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 2c27d5d0c367..58b595ac9b8d 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -12,3 +12,5 @@ kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
+
+kvm-$(CONFIG_HAVE_TDP_MMU) += $(KVM)/mmu/tdp_iter.o
diff --git a/arch/x86/kvm/mmu/tdp_iter.c b/virt/kvm/mmu/tdp_iter.c
similarity index 98%
rename from arch/x86/kvm/mmu/tdp_iter.c
rename to virt/kvm/mmu/tdp_iter.c
index d5f024b7f6e4..674d93f91979 100644
--- a/arch/x86/kvm/mmu/tdp_iter.c
+++ b/virt/kvm/mmu/tdp_iter.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include "mmu_internal.h"
-#include "tdp_iter.h"
-#include "spte.h"
+#include <kvm/tdp_iter.h>
 
 /*
  * Recalculates the pointer to the SPTE for the current GFN and level and
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
