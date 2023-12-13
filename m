Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B038EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DHtVzIAkgPzctaH1Zyhz7X2IIDCOsPSQUcL02/389pM=; b=bZXd5EnJ8cRzMG7sGhn7noYH+i
	t7wPX5UPoU7BsqVCNZUZtwlfP8fvyQm6qwLxpaOO2FVxF2OFu5hTexqGMpDUANPO61Z979uQaajY5
	f5k40vppw1iz6pI4+PuuRlCrmQc5l4O910t1ig9pNA6U+yhMTEAwsgGMYPbU7HFr8jNwyoa6tN4PO
	F2Ve5fyI/zJVgwDfXAgnfBLoBORVPPDsEK7fstIwaV7om1OrVqvOxSHtCaLHgqz7a6optQtFH5+c1
	ha1Q/+qBCcJEqcNkte1jyZB2sxT+eg8lnKQ8YN1t/WKg/y2cB0NciDhhWKiobfbXfAZV91LzlracM
	YFq6Fkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDEsx-00DOXU-24;
	Wed, 13 Dec 2023 02:22:07 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDEsu-00DOVx-2r
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 02:22:06 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-28ae055169eso111585a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 18:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702434121; x=1703038921; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3dbLwG3pwrVNc+flPqWL0ROEahdeYkxOItBObS2igQ=;
        b=h0wBYoiN9XMbOC3aEqFkTuow3aXaQErOo8Z4+7HoZwbNFXCVOCemSZ8EmHJ2LPwDyF
         8zoQn2nmbbVsnqYyVZ9HkfAP3Fb+ucuvvwVObN2bAT+yJcy7mjDL1wm9PQ9Ik93xd5jq
         IQbtfAeu90ECe1qYPcw/LhVrBIeFS9bMKBKMgIzVchKuI2XTG2AluEESaUGsQ9wtPe7V
         jATz5Qdn22IsZ/jxhcnVDy2zJaHD8rTSq11ayvcbzFAhHnpLrpWnIRNaA9qHA3oLel1X
         d2iBNSyLLjWatCq/Y2ILXjlIbRtJ125iQw8vUEOvykjeOsmCVO9ar7BjhUxwnnsCQeMT
         1npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702434121; x=1703038921;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3dbLwG3pwrVNc+flPqWL0ROEahdeYkxOItBObS2igQ=;
        b=onn4pCjkHeQ67BQBxmZtQQaf54bl1a6BYe2XXDG1OSouLT4grQL7wNoFSyn45dikSF
         z5nUFfJRX7uG4NR7bPVn1wbnAxRg1Y2TvahXwpXQ+3fRy1Iggl+l7+SYw1+8xV4QsCei
         4OoBB5HtxRWEsUkhd+R3pU0WywH96poHFU27b9pNPmB28VXKLouMjWDbfLfKK8BXeFOw
         JS0v7hH6Q/j1mhoKDdX2zbR0mop+hZ1ES7qsiDspxdRMpWoW347NwPJV04WHq49Rw1gq
         BdnAsPt2SAbiHxGj65f2KhkV1mnLE6JNJJ1lDksftAxWQcm3yDpvDvEZOuQ+4+r02Txe
         2ZVA==
X-Gm-Message-State: AOJu0YzSH1KFsD4ycJ5uz2S0qqCGDAkfhqHmP496TZRWVtCr5EDVtgTS
	9O0DMjAsHIEMHAkoG3WdHxRdiNEk8nU=
X-Google-Smtp-Source: AGHT+IEMdNbXZWy9ISUMeWXjYiRzXRSqXuBEtLtB2quA6rPLGk41btEuk2vriof3H/B+MEphfzV6B3hdgbQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c9:b0:1d0:cd87:64dd with SMTP id
 u9-20020a17090341c900b001d0cd8764ddmr52067ple.3.1702434121579; Tue, 12 Dec
 2023 18:22:01 -0800 (PST)
Date: Tue, 12 Dec 2023 18:22:00 -0800
In-Reply-To: <20231203140756.GI1489931@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca> <ZQhxpesyXeG+qbS6@google.com>
 <20230918160258.GL13795@ziepe.ca> <ZWp_q1w01NCZi8KX@google.com> <20231203140756.GI1489931@ziepe.ca>
Message-ID: <ZXkVSKULLivrMkBl@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
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
	Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_182204_949800_6CB49F63 
X-CRM114-Status: GOOD (  16.28  )
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

On Sun, Dec 03, 2023, Jason Gunthorpe wrote:
> On Fri, Dec 01, 2023 at 04:51:55PM -0800, Sean Christopherson wrote:
> 
> > There's one more wrinkle: this patch is buggy in that it doesn't ensure the liveliness
> > of KVM-the-module, i.e. nothing prevents userspace from unloading kvm.ko while VFIO
> > still holds a reference to a kvm structure, and so invoking ->put_kvm() could jump
> > into freed code.  To fix that, KVM would also need to pass along a module pointer :-(
> 
> Maybe we should be refcounting the struct file not the struct kvm?
> 
> Then we don't need special helpers and it keeps the module alive correctly.

Huh.  It took my brain a while to catch up, but this seems comically obvious in
hindsight.  I *love* this approach, both conceptually and from a code perspective.

Handing VFIO (and any other external entities) a file makes it so that KVM effectively
interacts with users via files, regardless of whether the user lives in userspace
or the kernel.  That makes it easier to reason about the safety of operations,
e.g. in addition to ensuring KVM-the-module is pinned, having a file pointer allows
KVM to verify that the incoming pointer does indeed represent a VM.  Which isn't
necessary by any means, but it's a nice sanity check.

From a code perspective, it's far cleaner than manually grabbing module references,
and having only a file pointers makes it a wee bit harder for non-KVM code to
poke into KVM, e.g. keeps us honest.

Assuming nothing blows up in testing, I'll go this route for v2.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
