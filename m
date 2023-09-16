Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686DDCD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuqwCC/xzvv4MzxZfqhcwF2rbda88SK01A8h9BqqcKg=; b=ksL85VDc1nJnU6
	BfOdE7TuJv6UxxszrVuxxaNeG0aiy6UBKSXgTpwCOoeZHTAaH/ZacppW862y8zeJ/nDnTeKt7uBHR
	fE7sIA9k6zGN1E1CWVrcGP8QEpORpT80akyzXoj7hk1Avr2U7AaUIW4Le24jx4E86tcHA7te71yp+
	pYBzwtNhY4NSeQmSAjbtZDa9hGhaYqGAa0vQk/1TZ+U9sSDG5sYvcq8NYIb1mE+FjT8mALkxkC4x0
	OwjxHiVOeJL0uvSQu6nxGt66/WGau/LlaH3Xqf7SsflE0D1OHxJ+Wd/mZqRk9o5yGFzDWRzE7+AMd
	yIGVYnw3JYpwoMyu+CHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJFi-00BeSr-0A;
	Sat, 16 Sep 2023 00:33:38 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE2-00Bcre-2t
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:32:01 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59bdac026f7so35874577b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824313; x=1695429113; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pl7bBxxWVXjTf9iTQwKV6iNN5dTCLVhIVjlh92R6IC4=;
        b=2wL0dC+Ie68imWXPl9ttHYBB2q4O14qk2NtSE+7UaYNVeAAKgZelp8y2qmoV1NpoY6
         cMxpwKuLNl09usfz9bLOiMgfYPvUtOjE3CIbsNya5oUj/DFYLRxiYyZC5lQD3i6uMzox
         ySBuGzC6RecbsuB3DAO/jn8hnZdissZJ+PV4sZ0OgXnjsu5u/q3EfqGYwy06WMe3I11a
         IQycKDAv+9t3zEejpAgDJ8t6/JePI/CcMV9Wq42vb1atEOKA/LZ7zMGl/aGtKun4LSad
         n+ND2YzNAB/R9eRyAcK5b+Ib3q0OueQ86XF1W3iw+LORYUKe/LPfkzTQudXcWgkF59Gm
         EMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824313; x=1695429113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pl7bBxxWVXjTf9iTQwKV6iNN5dTCLVhIVjlh92R6IC4=;
        b=ANStIR2vmz10o2f61WK/mWGQpO/1kOAe85JCGP4IPSt6GZvqJacMgEoXmS8blVV5QL
         S0t8p5jBcCM8ca8B906bIgevkf0sRpa7XZA4yHHiO+pEO0uisYL77FNfnFtor9sPq/87
         PwGUQVpiGq0wqh1NH50v19aDZ7nZg8HClf0HLaP/2b1awOx9Yri4qqfE+BcLvUTCPYjB
         lQOX9cQ02tSX5k+jJOYyGnNHZJLMWo3/Z65l5O9zk9WW9fE3yFfSHAy5ia9npVOLyxjX
         uB+MZMcOvdH5oUQIzgXkOfDmcWdgZsM0rUKyDSvZ9m7UFBCJSfSfYOc77W6HK8M9Uz7Q
         xRAw==
X-Gm-Message-State: AOJu0Yw9+y6Ce7b+e+FGtzK15D2UVptcYFnUbQpkmnvHzP/6qalCgGvk
	CEwRVUW5ywfNoj9zhTheek2CxrkiwJ8=
X-Google-Smtp-Source: AGHT+IHIEoJ5Qp0cT7058FSDnFlcgu0NfKZ+k2cnwo0UQE0i+ifeNt8ssvIZEJlieWuqLdMggeWcLX6T9W4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:4cf:b0:d7b:92d7:5629 with SMTP id
 v15-20020a05690204cf00b00d7b92d75629mr82335ybs.8.1694824312956; Fri, 15 Sep
 2023 17:31:52 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:08 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-17-seanjc@google.com>
Subject: [PATCH 16/26] KVM: MIPS: Stop adding virt/kvm to the arch include path
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
X-CRM114-CacheID: sfid-20230915_173154_974731_EDED3289 
X-CRM114-Status: GOOD (  12.23  )
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

Don't add virt/kvm to KVM MIPS' include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that MIPS *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when MIPS support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 805aeea2166e..96a7cd21b140 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,7 +4,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
+ccflags-y += -Iarch/mips/kvm
 
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
