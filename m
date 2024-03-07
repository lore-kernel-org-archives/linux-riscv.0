Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D93DC54E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vzENpMW8ZtudIzFI7AmM+gC7OZB2ol6ttOJ6HahBJTc=; b=v5R+K4jSfgmuY/yPpw2/4vxghN
	cR8elww63WodiBoki79PDIOcErsBQboI6y/XQCqI8pU6AZZyPFOtZs2rtGeOJpVLhOT/38kIiyEDC
	1K4fBy4G24Gzr5UlNuV3uwkcAkATpnkXbssfs44UqXbul5xkftipsYj/ZnkhIWyNopuHw3CZBpocp
	mw+qs9Q+bkjzlJoKCaD5Pvg5Nb4KvEQMuLStPQyyLRu/PNEU/jugzEXwPLTrxe9tTPz1gBF9gKrs3
	FQ7qb0DSSSI17BZvn/tO1YzMcTIQ6O6KzsGOv9WOudFj94nb1u+SjZ16XaehzSXLtJMhko4kmcGih
	DnZb/45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riIhc-00000005tzH-0ZKw;
	Thu, 07 Mar 2024 18:42:48 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riIhY-00000005txb-2d4i
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 18:42:46 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6b26845cdso1840561276.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 10:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709836962; x=1710441762; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFgmTdXht8RiRN/KVF8IUqEEHnA/cyS+egW6ftIJGn0=;
        b=ZUkk+Kre86yDukddkfZ8TK3dUY4KniiFJsIb78aGs9wNwKV/f2LAZVoDUl18TKB/Ul
         LUsb2EXQYayXcrcYvVUCbRzJYnPlIvlfYAJHJA0KcQOIflsw87K9ov8KtLOkfZS1U+jY
         6NysfPVHEWHCyGSJDZCXfRVXTo5htmeqqr/YMlLKYJvJX0ok06mE/T0fWE7s6NGFuUYZ
         FMCUmHxrgLwbgdByBpjWaaoc1bIDCpKkJ7K69uwX9dm6yUyFCnTeXfvUbywV/jMx8pmM
         /CmoSlB7tT0kYarUpv3vlMG/kmF/qmsrz93XdOSSw3DQXILApmVIvJa6KAWx0G7FhbE2
         My/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709836962; x=1710441762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFgmTdXht8RiRN/KVF8IUqEEHnA/cyS+egW6ftIJGn0=;
        b=Kg2J2XyFnqToqx6glFvFysZTqjzWm/mW3OIQip+3LXpG+Y761NAqXSGI2ZCOjTAe04
         KscmWvwThyaTmoIjs/YspGE819/Wx25R9/o9Wg43tIBjc5nq2aQzzeE/mPzJ/h3nkBNe
         MwiNb4SFbwsNiBxCFxp9p1P+DZhxJbQTTC1A7ODvGT+bUVGQSWbjrazEp5KMYmX5wL0p
         n7XWFP29n1bEQZhfpBih6NlmhTGTvLh8FlyidruA9J7VqgFve27DkYYr7YS/kjAxo445
         4Ku0eGA9+2xzg/hi+zvUF8gKdFtxSsWoKul8ivbbFYiZEjjCnlaG6DSV9Frfo7gh1WLS
         uIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw2ExMB/5VcfkoauU9HiMxRJImfDgmcvY2yUbHhilSi8KsoY62LdCZnm5EGrSUtaZ4fRx1OHiCcaIhyHlJT8/2Nz/aab14gGyiuLJw24au
X-Gm-Message-State: AOJu0YyGPggTNi77/HzKGpFyjoOjAEI6qabSlXukQRzdEm0lG39InuCD
	+nC+DP/z5vHC43ZyfT2+Z17m/8hNRehrNxrSS0LKWuR8J+VR5NWqrahA6ep0d5pYlAiHkt5qjoC
	cDw==
X-Google-Smtp-Source: AGHT+IEAIaa6GjaeMCS4TAxKH9WLPDUDdEha+hFl+ev2/L17coDhI1aC2M0Y5txm8jNusXgQGhlZwSml4BI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1004:b0:dc2:3441:897f with SMTP id
 w4-20020a056902100400b00dc23441897fmr4576367ybt.6.1709836962743; Thu, 07 Mar
 2024 10:42:42 -0800 (PST)
Date: Thu, 7 Mar 2024 10:42:41 -0800
In-Reply-To: <Zen8qGzVpaOB_vKa@google.com>
Mime-Version: 1.0
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
Message-ID: <ZeoKoUJlCZMiwPXB@google.com>
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
X-CRM114-CacheID: sfid-20240307_104244_741093_AE98C907 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, Mar 07, 2024, Sean Christopherson wrote:
> On Thu, Mar 07, 2024, Anup Patel wrote:
> > ----------------------------------------------------------------
> > KVM/riscv changes for 6.9
> > 
> > - Exception and interrupt handling for selftests
> > - Sstc (aka arch_timer) selftest
> > - Forward seed CSR access to KVM userspace
> > - Ztso extension support for Guest/VM
> > - Zacas extension support for Guest/VM
> > 
> > ----------------------------------------------------------------
> > Anup Patel (5):
> >       RISC-V: KVM: Forward SEED CSR access to user space
> >       RISC-V: KVM: Allow Ztso extension for Guest/VM
> >       KVM: riscv: selftests: Add Ztso extension to get-reg-list test
> >       RISC-V: KVM: Allow Zacas extension for Guest/VM
> >       KVM: riscv: selftests: Add Zacas extension to get-reg-list test
> > 
> > Haibo Xu (11):
> >       KVM: arm64: selftests: Data type cleanup for arch_timer test
> >       KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
> >       KVM: arm64: selftests: Split arch_timer test code
> >       KVM: selftests: Add CONFIG_64BIT definition for the build
> >       tools: riscv: Add header file csr.h
> >       tools: riscv: Add header file vdso/processor.h
> >       KVM: riscv: selftests: Switch to use macro from csr.h
> >       KVM: riscv: selftests: Add exception handling support
> >       KVM: riscv: selftests: Add guest helper to get vcpu id
> 
> Uh, what's going on with this series?  Many of these were committed *yesterday*,
> but you sent a mail on February 12th[1] saying these were queued.  That's quite
> the lag.

...

> And again, this showing up _so_ late means it's unnecessarily difficult to clean
> things up.  Which is kinda the whole point of getting thing into linux-next, so
> that folks that weren't involved in the original patch/series can react if there
> is a hiccup/problem/oddity.

Case in point (I pinky-swear I didn't see the patch before sending the first mail):

https://lore.kernel.org/all/20240307081951.1954830-1-colin.i.king@gmail.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
