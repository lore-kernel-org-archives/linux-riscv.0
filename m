Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E84C54E49
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h/jIaLUEhDWxFNRuie6E6Q6cxDN73pE8mLMocWOGcms=; b=i+Q0Sz3VHKXZq7gr7iZMLcwR4/
	kRJOP9JkoBqIttjfkDJO56gx74nlLDZ4uSKoZyJl1eXToMbTZZbN6ytHuK4Z4vnNKuZmJ4rO85XHO
	7bVvkfw+te2Ppf3hIUIvbDx9eFfKI1SfNdvUB4/ShknXsz/EkRAWSHW1NX/PS2c1sj9j+HftU9PtA
	sWZXos+zlDw9S0IFqBma02K2TPebvnR8cbPlt0+xC3422GXgQnLs1YdbJW4fBIWJjXIl96H10K6SL
	dKA/gwiCxIB7yC7snN8HpM6px45r5+n3leVZk08SvYla8JAsy7ICyilUPVDzrqgCjkI7LcfIA18Bp
	WvwqYOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHlu-00000005kVf-1Hoj;
	Thu, 07 Mar 2024 17:43:10 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHlr-00000005kUb-25Qa
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 17:43:09 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-609d95434daso20580897b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 09:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709833386; x=1710438186; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+5Nth4pqkIcnddTjv6Z5nf7/zGpa8tqI8lzvmd174U=;
        b=FmuUAHfdIuW3D3zwtFOqlFS/i5feUIWB/aXYm7EbCe+dkURjoHGmVs3XoHVUcQq4Pc
         w2aRoZOaWW6xzww0wyyCyskTL2jdMz2lzPKp2FPcFJ6zbiYIBY345oD8Ib3VCkyqwE+4
         O2SKIKrhXOncpNlfsi0N9OsfBk4gyQn1qfvwHk4yF0AzQdsmswuAEXGM9Au7SbrdDWKp
         thWehNhmWgTlI6oXf3YqtBUjPv7PJnnp6YGd7DgvJXnQa6onO7W1zShGvLAtoMfV5GOi
         7htGKhUoU1+Ew+ccFPkK1WW/KmlM/uR60jxXWrSQ1BGw65of/KdLMDYKFP1T1s/5Myl6
         OZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709833386; x=1710438186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+5Nth4pqkIcnddTjv6Z5nf7/zGpa8tqI8lzvmd174U=;
        b=CwX3TqiCfy6XsFv3KwOQR6KbJiAfAM7s6xifQzFkSaVdJACjovKkA2us/aLmmgpvZf
         HJnoUrYL1EREoNWm22YsQh8SaCabwTwWM/nwe7jhTCuvp4DAizOu9IDeWKFKuCJ7rUWl
         /J9TdYuV9HU/WbDmwzG45uFfEwD+S5xTa4ZutPwEvXPGMnayAsT6tmZrR1eBDCfV6ZNL
         V3MxCQQlfnzqK8MbaYCvq173H6VZUuzGJZ8f5+n2/8Y28woiX+aiPfxzjKbyqby2xKCi
         04vKEMiWtVJJH7ToYZvWQJ8DFkZUOeGPSTwwdSzaKtYG/V3Whv++shdHi611PA72+OH3
         jIrg==
X-Forwarded-Encrypted: i=1; AJvYcCXkVyMB6ORwFbluWKVTQ0eQOfzqxglQOiZfYsH1LGqiBjJirHXhAVdfaoKo8/eWdRytyjIE9pi8HhfX8siBjDUBSGUO+41LEWIBoNm0aTjm
X-Gm-Message-State: AOJu0YxQTPeAP4I99nIL1wPYmVZIKHvB/YATPTC8TJcA0kR0UIMrxxN+
	fi5v3mrv+XwHGfXfbqx1/BjesoYwfl5/5tBRdvMhdVNJmtzt9zWaWluVlz31X85BG1och+t47sH
	EFw==
X-Google-Smtp-Source: AGHT+IHNTAEAMeaU5NCWBeLFwT7ykzpqTDT1vNYBMW7hMx5a61k23ruY/0B0R8r7RW9EZoJZ8cIFK3Zky4I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:c86:b0:608:ce23:638c with SMTP id
 cm6-20020a05690c0c8600b00608ce23638cmr5279235ywb.4.1709833386363; Thu, 07 Mar
 2024 09:43:06 -0800 (PST)
Date: Thu, 7 Mar 2024 09:43:04 -0800
In-Reply-To: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
Mime-Version: 1.0
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
Message-ID: <Zen8qGzVpaOB_vKa@google.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.9
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_094307_582070_C81E9408 
X-CRM114-Status: GOOD (  17.48  )
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

On Thu, Mar 07, 2024, Anup Patel wrote:
> ----------------------------------------------------------------
> KVM/riscv changes for 6.9
> 
> - Exception and interrupt handling for selftests
> - Sstc (aka arch_timer) selftest
> - Forward seed CSR access to KVM userspace
> - Ztso extension support for Guest/VM
> - Zacas extension support for Guest/VM
> 
> ----------------------------------------------------------------
> Anup Patel (5):
>       RISC-V: KVM: Forward SEED CSR access to user space
>       RISC-V: KVM: Allow Ztso extension for Guest/VM
>       KVM: riscv: selftests: Add Ztso extension to get-reg-list test
>       RISC-V: KVM: Allow Zacas extension for Guest/VM
>       KVM: riscv: selftests: Add Zacas extension to get-reg-list test
> 
> Haibo Xu (11):
>       KVM: arm64: selftests: Data type cleanup for arch_timer test
>       KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
>       KVM: arm64: selftests: Split arch_timer test code
>       KVM: selftests: Add CONFIG_64BIT definition for the build
>       tools: riscv: Add header file csr.h
>       tools: riscv: Add header file vdso/processor.h
>       KVM: riscv: selftests: Switch to use macro from csr.h
>       KVM: riscv: selftests: Add exception handling support
>       KVM: riscv: selftests: Add guest helper to get vcpu id

Uh, what's going on with this series?  Many of these were committed *yesterday*,
but you sent a mail on February 12th[1] saying these were queued.  That's quite
the lag.

I don't intend to police the RISC-V tree, but this commit caused a conflict with
kvm-x86/selftests[2].  It's a non-issue in this case because it's such a trivial
conflict, and we're all quite lax with selftests, but sending a pull request ~12
hours after pushing commits that clearly aren't fixes is a bit ridiciulous.  E.g.
if this were to happen with a less trivial conflict, the other sub-maintainer would
be left doing a late scramble to figure things out just before sending their own
pull requests.

  tag kvm-riscv-6.9-1
  Tagger:     Anup Patel <anup@brainfault.org>
  TaggerDate: Thu Mar 7 11:54:34 2024 +0530

...

  commit d8c0831348e78fdaf67aa95070bae2ef8e819b05
  Author:     Anup Patel <apatel@ventanamicro.com>
  AuthorDate: Tue Feb 13 13:39:17 2024 +0530
  Commit:     Anup Patel <anup@brainfault.org>
  CommitDate: Wed Mar 6 20:53:44 2024 +0530

The other reason this caught my eye is that the conflict happened in common code,
but the added helper is RISC-V specific and used only from RISC-V code.  ARM does
have an identical helper, but AFAICT ARM's helper is only used from ARM code.

But the prototype of guest_get_vcpuid() is in common code.  Which isn't a huge
deal, but it's rather undesirable because there's no indication that its
implementation is arch-specific, and trying to use it in code built for s390 or
x86 (or MIPS or PPC, which are on the horizon), would fail.  I'm all for making
code common where possible, but going halfway and leaving a trap for other
architectures makes for a poor experience for developers.

And again, this showing up _so_ late means it's unnecessarily difficult to clean
things up.  Which is kinda the whole point of getting thing into linux-next, so
that folks that weren't involved in the original patch/series can react if there
is a hiccup/problem/oddity.

[1] https://lore.kernel.org/all/CAAhSdy2wFzk0h5MiM5y9Fij0HyWake=7vNuV1MExUxkEtMWShw@mail.gmail.com
[2] https://lore.kernel.org/all/20240307145946.7e014225@canb.auug.org.au

>       KVM: riscv: selftests: Change vcpu_has_ext to a common function
>       KVM: riscv: selftests: Add sstc timer test

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
