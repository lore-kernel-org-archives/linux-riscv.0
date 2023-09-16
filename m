Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F020CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8Zh/cWkpFaIJrkh1DpbOBj+rwQKUOQAVKno5xe9Pv8=; b=EC/4GHAyWw1JsU
	BWRoB2WDmxrvHDST5fle9I/1KJPxxFAin3pou413clAz3vlzzb71aGbaQDiFPrdnJ3GHGXHNDwDs9
	5nC9EBLv6kGMtqymlsCnxtwOJp7G0sy0BU5Ej81jalNCDTAufdMuppTZIRofwyq0hLJbIxu9MRJFJ
	LxCxvZZLMAyBTbsJO3mzYF8Un6Y+GT16YT0/8FdG4YPy+Etw+GP9UUZY9ck6GJLlJDfsuEWsMNTd0
	B0DO7+OHMgGy2RZpJQuZ4zRgCrkgk+Yyew53dRTGgdrDChD6qjUOAw+jORVguo6GrC3HrwohmmqSi
	a8cekQZum5Pml0JPIzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEl-00BdaC-0m;
	Sat, 16 Sep 2023 00:32:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDy-00BcoL-38
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=11iXbA6RA96N2ihdzvT9DOzykVF8TPNgieg32BOfaCo=; b=EYxRb5wEnwwZASPVPrnRQN3uPi
	6mzBmPXkRjeK2gPjgxYSrnUKAsEuxzQMDEmCtzj3ujnIp2kbvWLLQV9or8wyzmk4vyIHfHKDbW9+z
	meL5l8nQEQfwTMYn+6JxjFksSl8MUOdI3ux9xXiBq904pP0eQNUzc9kLI74C+ROGvLB+7StKQSVAD
	RM9WnfEskP0d/ANMTSrH/uiG9vQrii64UHlmyCu4noGlfEbMZQWjUBEHSpBw3xKnhbtn4UgK9h79c
	fcwdfPanj7W4TeO5bQbaHamkyvGqkLuFF6eHXeAz334GdU0lIgu225zHYK76+8IHe0M/5T+VJOwvz
	sAOOsRAw==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDt-009jmm-10
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:49 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d8191a1d5acso2868008276.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824302; x=1695429102; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=11iXbA6RA96N2ihdzvT9DOzykVF8TPNgieg32BOfaCo=;
        b=a2CBc8IA8PV2pD8hTo+WqCu9+mN0WTn2ZhyOSiMr0xeTBAlIyXvGMmX+qLL0dGKrf8
         QXecz9U+fHXwvhN8L7xn9ickv/3heVuYn+EUfINzq8WJqESHK2Jafvnpeg6ygZWZtDvW
         ksR6mDUZTLPxmnwvRAyfZu+sjnfsr2vBSfqdu1QYUq9l4yWtLQj9agxM8iM+VZ+SJizg
         pyLoKE34QPqbFWooR6SMc56WnO+lLqJYjJXopahiKAwioaNp6Bnl2vnDgi8EDDjEiQb3
         Fwc3YEvH16Vr6F8AS1CmL+/mTaCmxKLyxTTouUeLZZ0Kt5Q9/n8M3MS2gs45AhRyYBqd
         LqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824302; x=1695429102;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11iXbA6RA96N2ihdzvT9DOzykVF8TPNgieg32BOfaCo=;
        b=NPuoeodeDG9Z7RgptDhg9C4BEL62/0ZpHw7NqBIb4LLil+VuSRZdZWJiSc8YNLSdCK
         7mdEO4MS62O1te21CR+p6N7K0ZMFtnbzomCYKsbxnKpoYCrR/CvejHsiGCYBNaJm1qos
         YI/m0Z7iyWULjW39nUBqDzXNVj/Cl5MLJpjsI38mcUHvT6PuSXodnVvuG2xEmch1bshE
         shzQPDSh2W2Alzkl43GijEeMYtoWC72SKq3N3kORO7ptJWBo/EDw75BlAjTcCV4DFwh5
         nUdZcb8y5ZGWve6dZZaDTSFnWObu3JzGr7GJYvMdGYXSa4x2NgtuCLCCWfAJEa6hK7dI
         8F5g==
X-Gm-Message-State: AOJu0YyBfuJ+WVaCqAaQJ03hDI80YyrGXH3udmm/jjtxiRyMb0wwC4hK
	aYgz0W3EX4PZHrI3Qwv0gIRS+DFBcM4=
X-Google-Smtp-Source: AGHT+IEXzBZMjfoz19MMDpz0z/mfp5J4Xc54+oTqT/y9sTC3/YRTAU+NLkJhdnChwcXUDWkKwhep1BL4HMg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:138e:b0:d78:245a:aac4 with SMTP id
 x14-20020a056902138e00b00d78245aaac4mr82625ybu.1.1694824302614; Fri, 15 Sep
 2023 17:31:42 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:03 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-12-seanjc@google.com>
Subject: [PATCH 11/26] KVM: MIPS: Make HAVE_KVM a MIPS-only Kconfig
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
X-CRM114-CacheID: sfid-20230916_013148_072398_13A94E3F 
X-CRM114-Status: GOOD (  10.93  )
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

Now that MIPS is the sole remaining user of HAVE_KVM, make HAVE_KVM a
MIPS-only Kconfig.  Because most architectures unconditionally support
virtualization, advertising to the kernel at-large that an arch has KVM
just led to a bunch of useless and misguided #ifdefs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/Kconfig | 3 +++
 virt/kvm/Kconfig      | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
index a8cdba75f98d..c4508f49caae 100644
--- a/arch/mips/kvm/Kconfig
+++ b/arch/mips/kvm/Kconfig
@@ -4,6 +4,9 @@
 #
 source "virt/kvm/Kconfig"
 
+config HAVE_KVM
+       bool
+
 menuconfig VIRTUALIZATION
 	bool "Virtualization"
 	help
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index f0be3b55cea6..f7bb6c59658e 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # KVM common configuration items and defaults
 
-config HAVE_KVM
-       bool
-
 config HAVE_KVM_PFNCACHE
        bool
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
