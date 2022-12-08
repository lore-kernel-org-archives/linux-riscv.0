Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792FEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zgo4bjwcZKRXmcvQBJfDOYjToZawHimYRb3/XLABlsk=; b=eHuxQ8ayFWS3EclV+gbIo5G+N4
	90Nf4TbAaUlKcsW9xmxbz6W2eqVD3cwTr3IX/gVTNHTvdOPg2ejLxSnJxUiGQS0PcENwbaYDYoUN3
	Tg2qN7Y4A0z/fUwYN7LMsPszN996KlIoF2FnqduvGF9TFKFyRyQ5nyC5rydof1MJdZz/Jypp2f7BL
	NJbUrGSPMhSmozpCsYLVLOBr59v/VzQejSHWJHGPQBc00v3+QgIyGV+uhqz9yC0gF7o5fBxrVE1Z2
	BdTihUWmSToTJS/dj48VApUcxGwbPm14EBOvThKP63yRLedZwmWKVM5OWfuVabV6mluYncs9U9kac
	niOWNNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mkw-009tdD-4x; Thu, 08 Dec 2022 19:40:30 +0000
Received: from mail-yw1-f201.google.com ([209.85.128.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mke-009tEY-An
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:40:13 +0000
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-368994f4bc0so24905927b3.14
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9jkEeOR+eFVYLdV/biNhqONLCqpOOeuWNQBN9kUw+a4=;
        b=RcX1fA9WGa6w4C9PUxG4OPVBo1zxjA/xcbKeSP6a3foCAqZ7FzqI1mFwD63t1Zj64f
         dUcsVkx5+LL+NIjjNV1LqNWVddFOpYikSd3WUTyGFLn96H50k7PwdHsttsFJt9P1ez0b
         1mfPx6AlqK6ylftXIU2F9Nj5hSc+ikFrGZ/z1f/qPxYxfvx/OXVl/tDLZo61SUF3zvKK
         PYv1RXX6MMcltPMtFw1Jp+095PHbtWtFgqbpJbKkr0cp5YLn1DUp9X/nB2YNG55HXF6K
         /rKkgYv9i7/aE4/qJBLcexm7xz9bNSYN/tkjp5XaQYlxAPljLege78wWIo+X1uBQR1Re
         /MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jkEeOR+eFVYLdV/biNhqONLCqpOOeuWNQBN9kUw+a4=;
        b=ve2uqSOJ0ziXfHrfVdDJBLwlit9ZL//Qi/iUrItSKvMh47LI6nGIIVCG+AoK53TtUK
         pWX74aA3nLLV0qX/o6LOcxR6iBx9uJqE517bLmvBtSVrcDgQdjjnoJPjHWDHSvDog462
         azwW06Z/WtSUwskEox15C2ZuLPDY538m+twujXzj6dp80ET4gznxMypI6LbO6xv+Upgx
         nzrA5CPPmnjDROA9BuOPOMcZdtI8Li9Br349CAKWiHaf445s82dGlmNwMHdwvzxVdevq
         LUNXhyTUdGXwP2WX+o06LXUm1SCZa4BT72/2UzJPc0kEUyVtv/ErrBa31Ie+EgJNR6x8
         gh1Q==
X-Gm-Message-State: ANoB5pkBVWFYVjLLtv5o4W2EHSfFcSa+YF4IwP8dwEqOlbEow450vKO2
	6P39wZGFk2bCnnGCEI7qdT38G2JdWlM57g==
X-Google-Smtp-Source: AA0mqf5Y/oazogGX+tpbF7bdOJO4aayzIsYsnlV7zDudirQdvI5dtEVAX371oDYlEt+kHPpaNkmdcoOtQ7CEag==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:c6c2:0:b0:6f0:b351:c300 with SMTP id
 k185-20020a25c6c2000000b006f0b351c300mr63444626ybf.102.1670528409549; Thu, 08
 Dec 2022 11:40:09 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:57 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-38-dmatlack@google.com>
Subject: [RFC PATCH 37/37] KVM: MMU: Move the TDP MMU to common code
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
X-CRM114-CacheID: sfid-20221208_114012_380635_467BBCB9 
X-CRM114-Status: GOOD (  10.21  )
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

Move tdp_mmu.[ch] from arch/x86 and into the common code directories.
This will allow other architectures to use the TDP MMU in the future.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/Makefile                       | 2 +-
 arch/x86/kvm/mmu/mmu.c                      | 3 ++-
 {arch/x86/kvm/mmu => include/kvm}/tdp_mmu.h | 6 +++++-
 virt/kvm/Makefile.kvm                       | 1 +
 {arch/x86 => virt}/kvm/mmu/tdp_mmu.c        | 8 +++-----
 5 files changed, 12 insertions(+), 8 deletions(-)
 rename {arch/x86/kvm/mmu => include/kvm}/tdp_mmu.h (94%)
 rename {arch/x86 => virt}/kvm/mmu/tdp_mmu.c (99%)

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index cb9ae306892a..06b61fdea539 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -18,7 +18,7 @@ ifdef CONFIG_HYPERV
 kvm-y			+= kvm_onhyperv.o
 endif
 
-kvm-$(CONFIG_X86_64) += mmu/tdp_pgtable.o mmu/tdp_mmu.o
+kvm-$(CONFIG_X86_64)	+= mmu/tdp_pgtable.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f2602ee1771f..8653776bca6f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -19,7 +19,6 @@
 #include "ioapic.h"
 #include "mmu.h"
 #include "mmu_internal.h"
-#include "tdp_mmu.h"
 #include "x86.h"
 #include "kvm_cache_regs.h"
 #include "smm.h"
@@ -27,6 +26,8 @@
 #include "cpuid.h"
 #include "spte.h"
 
+#include <kvm/tdp_mmu.h>
+
 #include <linux/kvm_host.h>
 #include <linux/types.h>
 #include <linux/string.h>
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/include/kvm/tdp_mmu.h
similarity index 94%
rename from arch/x86/kvm/mmu/tdp_mmu.h
rename to include/kvm/tdp_mmu.h
index 607c1417abd1..538c848149c9 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/include/kvm/tdp_mmu.h
@@ -5,7 +5,11 @@
 
 #include <linux/kvm_host.h>
 
-#include "spte.h"
+#include <kvm/mmu_types.h>
+#include <kvm/mmu.h>
+#include <kvm/tdp_iter.h>
+#include <kvm/tdp_pgtable.h>
+#include <kvm/mmutrace.h>
 
 int kvm_mmu_init_tdp_mmu(struct kvm *kvm);
 void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm);
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 58b595ac9b8d..942681308140 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -14,3 +14,4 @@ kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
 
 kvm-$(CONFIG_HAVE_TDP_MMU) += $(KVM)/mmu/tdp_iter.o
+kvm-$(CONFIG_HAVE_TDP_MMU) += $(KVM)/mmu/tdp_mmu.o
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/virt/kvm/mmu/tdp_mmu.c
similarity index 99%
rename from arch/x86/kvm/mmu/tdp_mmu.c
rename to virt/kvm/mmu/tdp_mmu.c
index c950d688afea..5ca8892ebef5 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/virt/kvm/mmu/tdp_mmu.c
@@ -1,11 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include "mmu.h"
-#include "mmu_internal.h"
-#include "tdp_mmu.h"
-#include "spte.h"
-
+#include <kvm/mmu_types.h>
+#include <kvm/mmu.h>
 #include <kvm/tdp_iter.h>
+#include <kvm/tdp_mmu.h>
 #include <kvm/tdp_pgtable.h>
 #include <kvm/mmutrace.h>
 
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
