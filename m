Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B84CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wG484FvZyqFP8KoDXWiW/AAgECIupPiq6cKs4aL6kJQ=; b=OwDA1/ouLN0nF7qKLU20riT0qk
	bSqnWXeaOt/qMZo/o8A3cPHiQjWbkkc2d2B4lUVmoWjqVhba+3eL4H0AlNwsZkTXOTfXDsEQjAbya
	la77OrHgTgxUeVuyA8+frgDm16NIjzTYpZz0AdZHvLMBiZtehZ2HlEjAcVPmZS97KKgZiMBFRgu5Y
	rfPi1KcYhqxfrJ6YIDqwYj/aIzWPtwA+a0WhtwRT36ZTf7SfWsy+CtwxzpahXj8ZNyzAAUZBhIhvx
	uxHAvsyft25PLU9iO4pEnd94Ek9lapW7c9xcgkpYvl+2qZEKfs++3yVOoiAM26c8C36GiIDHGKx48
	OfnPsDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGYN-00FnVn-03;
	Mon, 18 Sep 2023 15:52:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGYL-00FnUk-0r
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Sep 2023 15:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2U3xsG0fg5xdFpPmP8zowhEzmg+gfxwbZh9hlXMaF+c=; b=TiL2I65ZvlwvXCI0j1wMMGdzwU
	f4BkQ3RWE7z1RB2GOBqSZ39SAnS99ohDgBD973U7HjZuH62p/1mdpQHlqbYM27+zdqgT7zXUp6IfQ
	tG+8zy7IxdXJ/+6jBLUIDaJOO5cxnmpF+i7OSn1r5Qxk6yxVT/KzCDCZdZ/9IP/3lCzco8ukVL6yC
	YJTI/YwgiMR1mfSxtHzFMzSQ98/663l9DPzgXVcT20ebRuLe0m28sPa5F84Mwasv+LIsuc5FeM/6L
	TvS4uUPnNpfSUhox0cG9mUOZGh+jrcTcY8wVFW8Iq0Jm4LKdz+n3eF3Uz3mnDok+V7/injTwKJrpS
	bL4G5baw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGYE-00CknE-33
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 15:52:47 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c448ba292dso18243045ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695052362; x=1695657162; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2U3xsG0fg5xdFpPmP8zowhEzmg+gfxwbZh9hlXMaF+c=;
        b=XxYu6bP2DTtr4ffUKkuRN2st++P15WhFvDq7F7FMB6BTUvZxcqALBz1li/RM/ydBUR
         WEWg+u+TwAN+uf2hHJwQ6Vltj8gPArEoI3SAhWyOoi+HkZJA6VIUbQpNLBg8bWVE95VO
         TemPSPamKclzSyVeEWV9vv8bbcF26okzwsAPXQQkQQ8YemF8VBBWv/3shgR3jdYJjDLl
         TkgujhIXaN4u4tu84MHJGUyWl/y7UrHVzbk69xZxPRL7R9rdkYvnuwZ4h6fel9ZhaLsv
         ZNbQ5aFdSI19f8hefcsTr0X/YzFjjKrtDR3yfXw/JwO7Yw4hpxTirh91gRrvua8ECR/H
         mavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052362; x=1695657162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2U3xsG0fg5xdFpPmP8zowhEzmg+gfxwbZh9hlXMaF+c=;
        b=ORzkajAFkMmzJc0AH3b+HZO6OThAFege/QAUNNJnuhnKXtnxhqzlYgZC9DELU3W9Oz
         dc+YYVa+mtbHT+HlLL+FOEtkrVJdC+1++O9XIhDQzUcJEFASEO1FA9fhh7HkmdiN3nua
         nqfYi8whBFQTIyHtvAQTm9266O9AU8EUTmaKgzic9/gl5lOX3sJ/2kKoo6IoUSFvRE4N
         s8WYryhwFO8yHInq2+QuziQa4IIlbCYTuPnDhdQ3IxULe1dEx477hWRof2TNl6lm4G54
         4ENRfVE5/HgQiVoltf5lQLv3odzPMJgca/vBX3AOGIAJ2AKDYxQo21TDDgnLmd2vGhCc
         faPA==
X-Gm-Message-State: AOJu0YxfOgyag5Pk0velOdQdurTdCQI4byzMCLfI6DGHVp/V4cDzaSME
	6v0uDrtkSkwiR8K6gwKoFfoGxd8I01I=
X-Google-Smtp-Source: AGHT+IGgNS2Vz9a89mB0wnbmpqOo9ipRBHkgWDp+LBnX1+UB/D0eQmGLqC9so7UJgprSn2d6kzcCXv9BIzw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c2:b0:1c1:fbec:bc39 with SMTP id
 u2-20020a17090341c200b001c1fbecbc39mr210522ple.4.1695052361665; Mon, 18 Sep
 2023 08:52:41 -0700 (PDT)
Date: Mon, 18 Sep 2023 08:52:40 -0700
In-Reply-To: <20230918152946.GJ13795@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-7-seanjc@google.com>
 <20230918152946.GJ13795@ziepe.ca>
Message-ID: <ZQhySMjmuyW2Czas@google.com>
Subject: Re: [PATCH 06/26] KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
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
X-CRM114-CacheID: sfid-20230918_165244_495303_E7C8A6E8 
X-CRM114-Status: GOOD (  24.88  )
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

On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> On Fri, Sep 15, 2023 at 05:30:58PM -0700, Sean Christopherson wrote:
> > Drop KVM's KVM_VFIO Kconfig, and instead compile in VFIO support if
> > and only if VFIO itself is enabled.  Similar to the recent change to have
> > VFIO stop looking at HAVE_KVM, compiling in support for talking to VFIO
> > just because the architecture supports VFIO is nonsensical.
> > 
> > This fixes a bug where RISC-V doesn't select KVM_VFIO, i.e. would silently
> > fail to do connect KVM and VFIO, even though RISC-V supports VFIO.  The
> > bug is benign as the only driver in all of Linux that actually uses the
> > KVM reference provided by VFIO is KVM-GT, which is x86/Intel specific.
> 
> Hmm, I recall that all the S390 drivers need it as well.
> 
> static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
> {
>         struct ap_matrix_mdev *matrix_mdev =
>                 container_of(vdev, struct ap_matrix_mdev, vdev);
> 
>         if (!vdev->kvm)
>                 return -EINVAL;
> 
>         return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);

Ah, I missed that the KVM reference was routed through VFIO in that case.

> I wonder if we should be making the VFIO drivers that need the kvm to
> ask for it? 'select CONFIG_NEED_VFIO_KVM' or something?

I wondered the same thing, if only to make it easier to track which drivers actually
end up interacting directly with KVM.

> Regardless, I fully agree with getting rid of the arch flag.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> > --- a/virt/kvm/Makefile.kvm
> > +++ b/virt/kvm/Makefile.kvm
> > @@ -6,7 +6,9 @@
> >  KVM ?= ../../../virt/kvm
> >  
> >  kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> > -kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> > +ifdef CONFIG_VFIO
> > +kvm-y += $(KVM)/vfio.o
> > +endif
> 
> I wonder if kvm-m magically works in kbuild so you don't need the ifdef?

Yeah, that should work, no idea why I added the ifdef.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
