Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B840FCD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fs5emjntms/bKPsKKfJ3JLyva1PHp/dQ2Y51bT0A2bk=; b=YdHfk5+Td2oX91
	JECfbol3pINyiU8fiiJYi/IUUOEJlbfltkDJu3fifgoIB5fueAErHxGRoLghBsdYfiZ96rNV79wt5
	H/mqRAWQNb97s4pL+JynRT0WyH536KEuDnEuG6yA+/bzFpHmHI7yfiDFSWAgNW2cQuEgYcFqZ/+hR
	JnF1Hv+8btf85dIKAvYEO2UK7P124KH6fcztPK+tB7A7YmFfPU/bHYRO2jamI7XZa94aRZ0+og7To
	Neq9lyhzaxS/AvL5dipT6rXxHKaoHi5HZu0r4O82oBcY3YZXRPdKbkuhON+jyfov9iLUqxwAurjuB
	NVFcxj0uJcNfg33QKLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJGC-00BesR-1R;
	Sat, 16 Sep 2023 00:34:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEB-00Bd2L-14
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fxp/wpw1LF0d8Fhe/2GDyJ/jS0kdkc80zXgNVrZkdeA=; b=ix+ZbfoJ2lAOHqBBtCHd3tzo4E
	iMbBliSUh9hXlVggjiiqzDFcynAArfnhzqNBnJWkN47ajHWwxfL88n9Ufbx3Q8uPP7nNw+0r/N9QX
	0CeY/2sudnXDgjS6oU1mURaFigF5LY7af9SX6/N3kc2fq9ErUCyuELevq6HDVdHUCjCClPPygCemc
	R3Kl4Qwm9veUr7tAVsLgCim1/MeSS/czCopd29I0xRqiyPF9mTLM0nVPnEUgezTTp4jbZnioIKfLR
	mo57ZEMo0rBRx5oCAQi3+uMap/hsfnjaD3ppANAoTJTaOy7NYzJSjB/RSAjxoJoYAvAwp8KTBBuwN
	TEOG3e5A==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE5-009jqS-2y
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:32:01 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81d85aae7cso2236569276.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824317; x=1695429117; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxp/wpw1LF0d8Fhe/2GDyJ/jS0kdkc80zXgNVrZkdeA=;
        b=IfgdgWhJexViMQv0Yipbvl3d+2TYIyC9MOJGlB8pfUJmagisp8ZUcYN0s1/Nkq/S/W
         kkpvbm2jhSXjPiFEUwrymXwvsDzQEHSRpMbEdv4/E6OASH6eW6tNtgKoqpkF0ptIocsn
         EcxRiv6Y3SlOkaTYb0laAYYzHW4/HZ8i605js1KosCfJBEUBZ4b6E1o6vdPX8VyzY41L
         tQ+f8Tck3Cql52XacHomDOXalEriAVmePrRMD1Ke5ofI0h20+4C9MJpUft4aIHLlARtp
         Ry0/8ak2voVqPawvCuAm7Q/NdISz+KL7Fh0rj6/41xiGIUj7Ldh3T0LMiuD4KbYHZtI4
         bM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824317; x=1695429117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fxp/wpw1LF0d8Fhe/2GDyJ/jS0kdkc80zXgNVrZkdeA=;
        b=ZbEnm8GizprFIxH7Gz7rU2obJUc+6BpVXqwSJ4Uhxy0dqoqnkz4X1Kk7TE0sOYY2g0
         EfZXo8SJcX93hsx8xUcb4TrlHHUflSBDhoMEoR8PUww5sv82K0TKTQGKanL/YnMO5Y0u
         HJHlHH9GYuOOoPlB79VGtbcBFU8TwA+eBStPpxA1Vj5FcBgiTdMdF5usC8lZksaU+qQB
         ScKoem9c5WFZv6vIVg0tmlzUfMupqZogbiBShTgNcJxXTb3NPaYlCB/qZgtVBC+KHrH2
         EHVvFf3zO792ZQKPp8p2/6eFkLYStwovIAbx+b9ZY/q1dYlNRUgAqPR9TBSlAwvL+Run
         2JaQ==
X-Gm-Message-State: AOJu0Yxubar1L8qEMLzW5mwNlts8Rfr3oLJTo6zW8pP02J36eYtwD7EP
	aXnbZhR9zt0k7fLFTGr0q6208nFR10U=
X-Google-Smtp-Source: AGHT+IEqdj0NaTPFhwcZwboCYWpv5WyTfAkaUyiX867J7n21mAe+KnDvjijo+FbZ8yrF1vPesmLGFCOD+Os=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4444:0:b0:d80:8aa6:5ac0 with SMTP id
 r65-20020a254444000000b00d808aa65ac0mr190245yba.4.1694824316815; Fri, 15 Sep
 2023 17:31:56 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:10 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-19-seanjc@google.com>
Subject: [PATCH 18/26] KVM: s390: Stop adding virt/kvm to the arch include path
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
X-CRM114-CacheID: sfid-20230916_013159_728495_3F39F0C6 
X-CRM114-Status: GOOD (  12.47  )
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

Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that s390 *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
Makefile when s390 support was first added.

The only headers in virt/kvm at the time were the x86 specific ioapic.h,
and iodev.h, neither of which shows up as an #include in the diff for the
commit range 37817f2982d0f..e976a2b997fc4.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index 02217fb4ae10..f17249ab2a72 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,7 +5,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
+ccflags-y := -Iarch/s390/kvm
 
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
