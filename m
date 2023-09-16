Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64044CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hzq3WIje2lhuDBxY94IJOR3faCvsVWTcKj3qHjJ198g=; b=0sb3+Uul9Pl/oA
	OZIuDAxWotozGQiyIQcZCwkNzTep6RoG1xWAQEpBB56tSaGRMCCua3WHXIkKkSKITgxw5r7NJS/1m
	+3GTgDGWtT+jGlXVRG7Ex5Cf+6DP+b0Fqivebtxx9tpkfBhvg2Q0sBoETA7Y6RIK/nN/gs7s5sXFg
	9i63Yc6/JwMAWDdx+Qep2uc/843eyzX0G7u1Ogi8xbPrrZvufjKAxfDIFVWSZqAyMc4i2gnwtXSbk
	h+0gJyRusAWjUohnnW19Rojc1UsJRKIbAr8bAFodsdo6Txct369ABWS7eNQ14W0GriQc09CGnjQlO
	4qDw1zuUz5D9jtHymO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJFE-00Bdze-1g;
	Sat, 16 Sep 2023 00:33:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE1-00BcqG-0T
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HQNUEYOJ/ozgdrFnqx+YRCy2I1exOHPHuH58RF8SFNA=; b=Cv2dVCelloI2jvc3ArIrNobhdB
	7++KjjHTNO5mU0nMJkr4m4HTVd40z9JA0HwjUmxpnKafLYEONB9LUeYD5d7Ws6L/GovvNzbhAX9f4
	3Iqf40RIJi2sITK86tIT00ifY8d4bBVRxltSj2pnRGILsMQX5w3GyN4b2UXzqSGZ7yy7racG6WUId
	g4JMwrUQJusfYGoRJcZnrESxXjVqrkEgt/eAGJuTwlrmRGOX/9Ek41xCNm27xynJz1amIcvwSTkzG
	3EGDnR1QDPBCUy6jJQfhXN7HtQporohLtEyfPs4sGn23GG2pDnV9b0F76wxpRHf7p1Q9WvjStViP0
	t+kcvSAA==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDv-009jn0-1H
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:51 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c395534687so25925505ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824306; x=1695429106; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HQNUEYOJ/ozgdrFnqx+YRCy2I1exOHPHuH58RF8SFNA=;
        b=xtcTa6R+fjOqPDMK+dMCzbfGnP+mt9FBizhVDXI7GAUuEE3UIJpB90UrBqy7s/cyvk
         O+lmFh5WFdE2noCr1FPdbSGPPeG+WQl1MiddhCIF59HW9vPm4zIgFqv0athXOQcDPv4r
         tyFubLUgsD5oMX3M6ooPg/h/Lqr1JrL7dJmi1XwCvFIRWNxDut/Qm8MDpp7YDGL3x+vV
         +SRGwLTkxxEmADaAaPn1fq9UP5QUJXxtjlKkayxbur6MoVAakp8t8bETjLZiY0JWTWiT
         5jnVpewRimnDqFFME+55pckflxO91k9QxYtIy3MajxDt/hWKkbH3UOnihuAV0j460Nxp
         8vXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824306; x=1695429106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQNUEYOJ/ozgdrFnqx+YRCy2I1exOHPHuH58RF8SFNA=;
        b=OK9hgWMPCzU+yKBWgnPIget2HFKqDgad6Pe+k0GK9DlTSC/q4OT3eQpuusQ3q9bBXU
         +oDJsNowVSnyDBLo5brQxqKlYQidendS2cB81FusGu/mkuxHFec60256a0NLVm+Ndprg
         CDvbO3ZC5CSFxCpaWG8CrEY1YRCiikiEnE9QyGZiA9gv9yuCd5dX3VTixi+Ua12oHZLu
         SMLkbDQEk81fES2csKCKRltuG/IRmFpFuBQEIZSSaWCaV/KDwideQzVCnB1kJ0aW2HOo
         Dtj3i6pqeddW3OifaT3tfnKVzNeh1uIdjW2xnd2bFHQcmXlWdqDuy/7ANtk/VIS9f5Sh
         J7VQ==
X-Gm-Message-State: AOJu0Ywrp2uPz1TBYbZ33JRQXEvT/q3+Msg+hoMlfjH6mzUlX1irmxWh
	1gOi3FaRgMcjFO0tUZJwawPXBwvp3Bs=
X-Google-Smtp-Source: AGHT+IHwZjKrwGdEWszMvnFwhRAkOaZ4ZXt/sllxoteViYwmhz1Ar6ouDJgF8x4FFhszG2C3n1vTw2Lw6BE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:32ca:b0:1b8:8c7:31e6 with SMTP id
 i10-20020a17090332ca00b001b808c731e6mr93755plr.1.1694824306427; Fri, 15 Sep
 2023 17:31:46 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:05 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-14-seanjc@google.com>
Subject: [PATCH 13/26] KVM: arm64: Include KVM headers to get forward declarations
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
X-CRM114-CacheID: sfid-20230916_013149_201130_62287493 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Include include/uapi/linux/kvm.h and include/linux/kvm_types.h in ARM's
public arm_arch_timer.h and arm_pmu.h headers to get forward declarations
of things like "struct kvm_vcpu" and "struct kvm_device_attr", which are
referenced but never declared (neither file includes *any* KVM headers).

The missing includes don't currently cause problems because of the order
of includes in parent files, but that order is largely arbitrary and is
subject to change, e.g. a future commit will move the ARM specific headers
to arch/arm64/include/asm and reorder parent includes to maintain
alphabetic ordering.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/kvm/arm_arch_timer.h | 2 ++
 include/kvm/arm_pmu.h        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index bb3cb005873e..e22a15c66288 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_ARCH_TIMER_H
 #define __ASM_ARM_KVM_ARCH_TIMER_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/clocksource.h>
 #include <linux/hrtimer.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 31029f4f7be8..e80f1d090579 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_PMU_H
 #define __ASM_ARM_KVM_PMU_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
