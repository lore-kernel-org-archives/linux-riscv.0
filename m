Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C79CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yacda+PD9RmZ1F4kL3cA/9XEK1Y45nqVYPDAQ/ZnRxY=; b=It/nWzyro3aBSK
	2+fencxPVvhgO4GofqZMKnt8fmKX0T3PEbNSWwX9sVsycKMWi4GKsiVbWBTSBL8GZ6SoYWzyx9MKV
	oh435l2Th4N48kWE9Mq0U8Rq1GIdwENtSDDIscm7VOuEystg0UpPPe1CPapy/wiepb65MTnxRigFE
	WFTVkWGKJRwFXv6K6pYyIA8Mr87ADKUZQvBV7kOq6zl8qrr0Mk9NjIEWZ8rqjGcuizAIopVX5avHr
	H7u2hBFPhtzxFX513tYm6vj9S9zItsFaN6VrQDZpA4UyPtFTXO0bXHDS3whJSfu4FPuy9H1ZSPVNd
	Dm5oP+I/FcjcklVfPdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE3-00Bctv-2y;
	Sat, 16 Sep 2023 00:31:55 +0000
Received: from mail-yw1-f201.google.com ([209.85.128.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDj-00BcUd-0R
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:39 +0000
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59bf37b7734so29793387b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824292; x=1695429092; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qo2m7xsYGxv0LvZBx1IOU3suTnYOrGiO/bIX70mqbME=;
        b=wFTXSZSC7fjTmkdsO9oIhdXc38XaWY9xQ6fNyY36eiYYitav7tn5SLYzYS0oIRnPkp
         DleLLvScejLWd5bDdEoXjpf6vaAkEIUzgLIrj2wczFsfvEWx/dCyI99vKzqxzDu2ZY+L
         2ss+GkdmX/1D32PaSq0U2udZQDANeWbN+3H3h4Lpjs9N4JqygWIyp2jeWxJELN/F5dyR
         XmA56DKUlPiQO+23VLS3K800F+z6bk1BNDvVlr78VV1sOtC3r0nQ+SVLWDYKomumYW3N
         ea4aE9wSsFGmCnS0Tb6W5TlAprO5yk/ewvg8zsDX0OU3Q2iIqTHuztBJ6jfme1t3nVas
         HOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824292; x=1695429092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo2m7xsYGxv0LvZBx1IOU3suTnYOrGiO/bIX70mqbME=;
        b=CcyzUw1BXGoO6Ely87BfNxjzPvAnuYhEasfdz1sSxhgDdtQXFXygTpNHm89c/ob7Di
         GtmTSw244CBFiJTkvA5/994R0Q+bBs5YZ7NYDNRyJ8CkAfSicggvKJuNUtHjewm9pCvy
         +Ureq1fKPKPOBA7TskVpt9pP3jZ2HewKvXEZKq0AlcBe+G7ANm8BH0MSggK33Il+TdBP
         Nq7gPAQFs8VoSlAIiharyyAlBF05jYhAGLgGNAWF7I4iIWlsz6nBOfOG1qcD+m+1CQcm
         qtz0wFabXOXZ7yemGtrhzNirQ66A0/LAvXzpJJ67C5kPx3DOaK1mAPFP3ltggwdKNtQp
         ovhg==
X-Gm-Message-State: AOJu0Yx6r0fDhufzweuOTBwdn4Lr7SX/cyuHOzhV9PmopfrOminNV37m
	775r+80LEikDTOF8zGDLzT+LJLDycmM=
X-Google-Smtp-Source: AGHT+IGldyHqJlNQwUdnpkugxOOkbUw+dVHZu9n7C9ywbITmCocjjVdCkDZmP9v50Lpi+O1mI86Ze95fAkM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d045:0:b0:d7e:afff:c8fa with SMTP id
 h66-20020a25d045000000b00d7eafffc8famr73977ybg.5.1694824292733; Fri, 15 Sep
 2023 17:31:32 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:58 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-7-seanjc@google.com>
Subject: [PATCH 06/26] KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_173135_203455_14B2BE8B 
X-CRM114-Status: GOOD (  13.57  )
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

Drop KVM's KVM_VFIO Kconfig, and instead compile in VFIO support if
and only if VFIO itself is enabled.  Similar to the recent change to have
VFIO stop looking at HAVE_KVM, compiling in support for talking to VFIO
just because the architecture supports VFIO is nonsensical.

This fixes a bug where RISC-V doesn't select KVM_VFIO, i.e. would silently
fail to do connect KVM and VFIO, even though RISC-V supports VFIO.  The
bug is benign as the only driver in all of Linux that actually uses the
KVM reference provided by VFIO is KVM-GT, which is x86/Intel specific.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Kconfig   | 1 -
 arch/powerpc/kvm/Kconfig | 1 -
 arch/s390/kvm/Kconfig    | 1 -
 arch/x86/kvm/Kconfig     | 1 -
 virt/kvm/Kconfig         | 3 ---
 virt/kvm/Makefile.kvm    | 4 +++-
 virt/kvm/vfio.h          | 2 +-
 7 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 83c1e09be42e..2b5c332f157d 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -28,7 +28,6 @@ menuconfig KVM
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_XFER_TO_GUEST_WORK
-	select KVM_VFIO
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_IRQFD
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 902611954200..c4beb49c0eb2 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -22,7 +22,6 @@ config KVM
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-	select KVM_VFIO
 	select IRQ_BYPASS_MANAGER
 	select HAVE_KVM_IRQ_BYPASS
 	select INTERVAL_TREE
diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index 45fdf2a9b2e3..459d536116a6 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -31,7 +31,6 @@ config KVM
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_INVALID_WAKEUPS
 	select HAVE_KVM_NO_POLL
-	select KVM_VFIO
 	select INTERVAL_TREE
 	select MMU_NOTIFIER
 	help
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ed90f148140d..0f01e5600b5f 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -45,7 +45,6 @@ config KVM
 	select HAVE_KVM_NO_POLL
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
-	select KVM_VFIO
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 484d0873061c..f0be3b55cea6 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -59,9 +59,6 @@ config HAVE_KVM_MSI
 config HAVE_KVM_CPU_RELAX_INTERCEPT
        bool
 
-config KVM_VFIO
-       bool
-
 config HAVE_KVM_INVALID_WAKEUPS
        bool
 
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 2c27d5d0c367..29373b59d89a 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -6,7 +6,9 @@
 KVM ?= ../../../virt/kvm
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
-kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
+ifdef CONFIG_VFIO
+kvm-y += $(KVM)/vfio.o
+endif
 kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
 kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
diff --git a/virt/kvm/vfio.h b/virt/kvm/vfio.h
index e130a4a03530..af475a323965 100644
--- a/virt/kvm/vfio.h
+++ b/virt/kvm/vfio.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_VFIO_H
 #define __KVM_VFIO_H
 
-#ifdef CONFIG_KVM_VFIO
+#if IS_ENABLED(CONFIG_KVM) && IS_ENABLED(CONFIG_VFIO)
 int kvm_vfio_ops_init(void);
 void kvm_vfio_ops_exit(void);
 #else
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
