Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDF2CD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpYyUbXZgsR706lNjzLgdTlZ5UT7FfBJLMs45vtqg3Y=; b=x4XgZDx44evDYl
	M+F6fcH3Gyn5zpwMIIWiXr7t2zik5wGBU4wO5BQs1kG+enKcVYqsThTMhAl3ocgsH8bqxegcvGz8z
	tdaicQNeCfokqfDVMYodB0m2aCzbqkWSA8YGrtfcP6f05Wn/vTamgX+9aEaASScHFjj2l/ac75wtE
	ploFgve9nqWMoOWFR7B7EU13sdh8E8PKub35Tfj1FrPyfmD5VgHwT6nawLp74sDKa6u5jiSCjaTeu
	/uj9tEX1scV4LA5iQZyW5FK3LfNsVTnz4uV/zrj3TXJVH3VixBD/+4m4ebz2m15Cn2i0jrI7hwK11
	r2DVLY0n5MAdguGRkNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEr-00BdgN-0H;
	Sat, 16 Sep 2023 00:32:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE0-00Bcpo-2G
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OjnVLG9a9LJLqorH8Rj1ZnrY26noTE5ZeEoscx0wCrE=; b=GMkBlfFU3/QtZBpYj2COtGCDKG
	BC2RH2mSxAM5vZNUOpKxyw2QNXpz0lK5xaVWoUD6xKdwJUD9bDhiFaDiaLoxpbh/Z2TCciCWuX9ao
	nz4lpoTwlTWFqr/wx7Xi8ifCA57bLirk9gh/ZDLDE5Q0XMxUuwFhpyywyqZNfyebMLtI1cPVv8O1R
	NJqe/vcdztWKUcPxIwyXB+Z8R3tqMAs1Jp2kt2heSGurHbZUPXxjyhJjSq1nMON6ONu8IDm13m1Tt
	hSIY6cF3KpM2AadOdZ+6cyyC7NvRNdxhcxken/YetJPQaoVWOMTCHBWc8b25utVGwgNDLpUbI4k1z
	RB+835+Q==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDn-009jlU-13
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-cf4cb742715so3251782276.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824298; x=1695429098; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OjnVLG9a9LJLqorH8Rj1ZnrY26noTE5ZeEoscx0wCrE=;
        b=gP91xEZAkGKYTxIDJIwNDjVpUvoxlxAinQAJW3KiWuYdgk4axoq82fVd3+dQ268xox
         L0addWzKPQy9g8sS0bCE1zn+5rBgaCsuRml8HLzIhBc0p1CdjR5BYs9NpbT5f9/q6M7N
         1sZ7aXLbpnGvGoJyB2amwgEIyHm/pJx1/lND+wAhsdx7EekTqibhBUn+s78X0C1zwayW
         GxgTltcoMhgpwc8r3ffCzsUDTcdswdaM4dIQa7xqLoba+RSfYrFzMdKONPPllYaB0V8y
         xSHxu0EEhr7oavB+wm68Q3r9sDrauus1m0J7w7LWDstl+Vd0KMCC9zpOPkg/yVvpyP6K
         HTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824298; x=1695429098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjnVLG9a9LJLqorH8Rj1ZnrY26noTE5ZeEoscx0wCrE=;
        b=IhSh3b+g3xmXMAs6oAer3WuS3biCS3GwuElLMNKCUU+9Q62NTrNqOh+KchP/y8+/lf
         1/Db4UtHs0SFrhYnDB85Mykf6QZbi+8mY/XjZktGjT5wjmGJdlnzMWMzsazted+VzdVp
         uqAQaGh7JmT4z0cYjhV3PbKxoaS28N9sb9YF/kkMRaz9T1mA+mtWBUpCxjSKg+pnvYlh
         KLcLFkvGDvw8XmqXqQWcNeAd2Bs98jtmd+p54LsnkrIQZRyOrL71xwSMpNX15l2RpIsc
         miqzuiRzTghA1ygTvn6H4eSCZveZecVUYrIvCFDqRfgmaHu7JO34GDGNWEfaTKKAX4VU
         sfhg==
X-Gm-Message-State: AOJu0YyqTEDSMotpkQM3gtFDlCRKea2s6qfjdQcpj+f/Yl8eCdbY3mpB
	8ohqjCNu/T4N2ZQAyy4UZqqURu7EVYc=
X-Google-Smtp-Source: AGHT+IEejUplN0yThqJglSyf2PAl899GMvDcyB4OaKD9HL7AL2P8QSuIFDWAjhltJc72cwzADimsWD5lopA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:138e:b0:d78:245a:aac4 with SMTP id
 x14-20020a056902138e00b00d78245aaac4mr82623ybu.1.1694824298283; Fri, 15 Sep
 2023 17:31:38 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:01 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-10-seanjc@google.com>
Subject: [PATCH 09/26] KVM: arm64: Stop selecting and depending on HAVE_KVM
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
X-CRM114-CacheID: sfid-20230916_013140_987163_5C4E109A 
X-CRM114-Status: GOOD (  10.22  )
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

Now that nothing in arm64 or architecture agnostic code consumes HAVE_KVM,
stop selecting it in arm64.  This is one of several steps towards deleting
HAVE_KVM from the common KVM Kconfig.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/Kconfig     | 1 -
 arch/arm64/kvm/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b10515c0200b..7d99f132e57c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -214,7 +214,6 @@ config ARM64
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
-	select HAVE_KVM
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_PERF_EVENTS
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 2b5c332f157d..c76af1973315 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -20,7 +20,6 @@ if VIRTUALIZATION
 
 menuconfig KVM
 	bool "Kernel-based Virtual Machine (KVM) support"
-	depends on HAVE_KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
