Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1B6CD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6SwJpK8DPnGe/urjycPceIX3xwWrmATFipdEs2n6sM=; b=GY8S1AFuBUUjoy
	pPYfBeIbSRKenCgOtyLuASZDAI+jKFMDp6CNIlFrXitiFmO1rkXwiweCyhq6HbhCmll4PqmocbmoC
	FrB9udDi2bpewFlM/y+aytAnAyd1hNNS2IDrWVlejXZ4qBnId9007vo3nID2oVyQBqpF6Mbdxrsqa
	7v+ITEVguXDnHdoTDw4kSKk28cNMLRJCLpbU0Eam5LsQUP4Wxo/Z1UKEDYGVCgnfCTO+qBpQYHNbE
	rzhVy1En7zv7/Rug0dvALVsYBA7G/7WdTUCZptuOct74xvu0pWOy90H1pGP1WHPvTNVXFYENtKJoy
	I5y6CghJPeakRTKRq+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEY-00BdPp-2g;
	Sat, 16 Sep 2023 00:32:26 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDl-00BcYu-2S
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:44 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d8186d705a9so3253438276.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824296; x=1695429096; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2bGNmVCdNvvogzEXgW0zNdAXreJziaadtBBldNfFmhI=;
        b=iQBlC65+WYSUwsFZaugF+xqK6pfS58neBPSfOjpnauT/98TeYN5k34n26f69zxE++Z
         Ko9gZpB1R44XHo9h7NK/UDszUvlCRvSD6SY/1H8CN1I0wLT/hyFvNILOZL2tp+HkTUHs
         GLNo6Y18AGaY8VgIcW8Ma6U/XItUO4JYqujgeP8n0nf8SNoD4wKQCoG1CtQl0R0wQTg1
         HiKvwCQUSW37/j4X1gboYqo4IhDka+hjjwhsai7/+l2Hyzpn+lTbg6YU3LxpigZ5qRra
         CjW+udOM42Ems7DrRAsVsFwiAcTHPPERV+d3KUEUjSippyZ9S5NFdzsW19eRZRo/IAvd
         1eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824296; x=1695429096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bGNmVCdNvvogzEXgW0zNdAXreJziaadtBBldNfFmhI=;
        b=gyCeLsQWJiyuApgioIqhIDe9AZZkS/Ea3ZOuOuVNLv/+Q4olpJ9fa+j+1X2+S49SyV
         /ggEp6BqJ+AIsT8wNYyk22klot/j0N2kPU4YMlfqOi+NJdLFXvr/jPBcqaHLpoK22pZg
         ZJQhA7F+B5c7iPBcQbq1EJiArLL68/BtSaIbTaM4ulgqEhhLAaJ5N1OGM+ySZgWADPNg
         GGufGgA6090tWGmNio5QfbHsMxrvb039uNenkhJpQ/a8bph4Q8AtjKEulIIkLSx8C1LP
         1nTnqmyv9FAMBDErBGhitkaL6FPxmtsRKQ7AY0XCU8YFETugy58DifYV1Dn9HEck2uMP
         Y/oA==
X-Gm-Message-State: AOJu0YwuwHw2BzOIgnaucUN4R/s0oWkcEIIbk13Nb8TLXTwM2QqGssJ/
	I1CNJhN46BIOhnWosuTMhS9VvFm+i5c=
X-Google-Smtp-Source: AGHT+IEii4782d+JzWBACVp4gsfxYcFW3PZ67SLHnb796XbOz2rrTeQdE9Xb83Qlv7LO8McNRbBpWAwnK1E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2982:0:b0:d05:98ef:c16b with SMTP id
 p124-20020a252982000000b00d0598efc16bmr77753ybp.5.1694824296181; Fri, 15 Sep
 2023 17:31:36 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:00 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-9-seanjc@google.com>
Subject: [PATCH 08/26] KVM: x86: Stop selecting and depending on HAVE_KVM
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
X-CRM114-CacheID: sfid-20230915_173137_828268_4A9478AB 
X-CRM114-Status: GOOD (  11.20  )
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

Now that nothing in x86 or architecture agnostic code consumes HAVE_KVM,
stop selecting it in x86.  This is one of several steps towards deleting
HAVE_KVM from the common KVM Kconfig.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/Kconfig     | 1 -
 arch/x86/kvm/Kconfig | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 982b777eadc7..32eb288a4e3a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -240,7 +240,6 @@ config X86
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_KRETPROBES
 	select HAVE_RETHOOK
-	select HAVE_KVM
 	select HAVE_LIVEPATCH			if X86_64
 	select HAVE_MIXED_BREAKPOINTS_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 0f01e5600b5f..8c5fb7f57b4c 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -7,7 +7,6 @@ source "virt/kvm/Kconfig"
 
 menuconfig VIRTUALIZATION
 	bool "Virtualization"
-	depends on HAVE_KVM || X86
 	default y
 	help
 	  Say Y here to get to see options for using your Linux host to run other
@@ -20,7 +19,6 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
-	depends on HAVE_KVM
 	depends on HIGH_RES_TIMERS
 	depends on X86_LOCAL_APIC
 	select PREEMPT_NOTIFIERS
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
