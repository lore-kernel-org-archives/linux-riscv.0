Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B5EC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AmVhzq+Nbafh1AsxCAr7SFmSndvH11sBVcidKLrXMAo=; b=izzSTQNxynObZIOOtfRFQiuq3M
	eClFXsuVwMJfSiz56VBRZKtuw5NyvZpwpefcGYsNOEhbIokt/AKxR0gYaIKIuUAbGy7B/yfjmf1WF
	JJ6ICl2UmcpsxIyDtIhsNo+mx0NPfre2u44tZa1csnteg49IOcHqvtwY3Ik4gEGngMxWQx8ywGQaC
	tG9uNIP1tM/Yghq+RCJBsWVhGwRPqzxTIi3nDVYmPBFVe4GfFABq8COf0I7eodQUsex6DaOA06EHD
	zSfSL1T6TnEpAht3fGn5hxrvVPCPJVeLzHpwDhS1jaMYEdyjNDkFtYkS+X0uBjhrorm9jIVAjKnkd
	QGmd1Xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9EEr-00Ewed-1j;
	Sat, 02 Dec 2023 00:52:09 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9EEo-00EwcK-1A
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 00:52:08 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6cdedef4b62so3080956b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Dec 2023 16:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701478317; x=1702083117; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf5LyHZHuBq8ET8yZ518WK6d/Ohu8OSBvuXvyN934wU=;
        b=ssmpraemfge8cj9yx0bQe0olitdcprZSjL66pJDSdmW0aPZIfyKM0ZJp9V1tq2m8jj
         J1Ua1wVh0BVpFthTM9gr9XJBNyjlSD9Ay0NcihLc7oazbRDj84VHrGecjs/ZuYvbyAnM
         Irwag3DSPVoTeWXxyK+mpZdjdQUXh6FtVOCjwaRgdE8+X6ITCVI3DOrACYY4mY9DvgHd
         YzTzmsNR8OIBrxP2rimNl3luKd5BOiGlJCgH+urgFV4uBABJzgaRJHiXbCpaiuG6xbQ7
         BywurV+G1BbrK6d3YrA1uUATEdddTUsB4QDF7q6w8TBFaPUbMiOh9cC0cliWt+7ajyYC
         kUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478317; x=1702083117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf5LyHZHuBq8ET8yZ518WK6d/Ohu8OSBvuXvyN934wU=;
        b=eNocGrtQvkaiRaIc8ijbY30rIPluYBekG/rN0nVSgj56NdaOHgIc7ZmebG+i45rsgF
         zpwY7IAktXXZBFou5rCKZcgGiSaWIG8c1G7Q/XNihyZv6pHkkGD/dsmtQ/84G122bMjw
         r5UoJdLy3GvxDANOviTHy//dPLRFjob1uayJpLx6RwCQWqZE9pBVUNr2xYxJLMpw0z1+
         YrUebx70o8rW+gve99S74txNMjz8nkV7gc/l3CCTkjMPmiNeO8dpaAQIylLIRhrLOwHG
         KPlfsLiZF1CyVedNhsKPy2+6ZMCsvObA4WeyJMGMKLHROJq4o4YPYksJoODy8pGVMGv1
         K/SA==
X-Gm-Message-State: AOJu0Yz5kTMQ9JYOTU4FfotnWgYPuZfv1mLDcL1stIJU2NFl3G+Sf/l9
	roPaH7TJl9e8elN1m1ialv0dbkkWr0g=
X-Google-Smtp-Source: AGHT+IEloABSTDcKm+41L5WpzazJRfhcCVpuae9X+15kKFthyi+8YQcZOmegDR+VoF+o36yu4wG4kUpnsoo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:5848:0:b0:5b8:fe99:152d with SMTP id
 i8-20020a635848000000b005b8fe99152dmr4028549pgm.7.1701478317322; Fri, 01 Dec
 2023 16:51:57 -0800 (PST)
Date: Fri, 1 Dec 2023 16:51:55 -0800
In-Reply-To: <20230918160258.GL13795@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca> <ZQhxpesyXeG+qbS6@google.com> <20230918160258.GL13795@ziepe.ca>
Message-ID: <ZWp_q1w01NCZi8KX@google.com>
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
X-CRM114-CacheID: sfid-20231201_165206_397128_68121A62 
X-CRM114-Status: GOOD (  34.70  )
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
> On Mon, Sep 18, 2023 at 08:49:57AM -0700, Sean Christopherson wrote:
> > On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> > > On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> > > > Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> > > > VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> > > > KVM and VFIO do symbol lookups increases the overall complexity and places
> > > > an unnecessary dependency on KVM (from VFIO) without adding any value.
> > > > 
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > > ---
> > > >  drivers/vfio/vfio.h      |  2 ++
> > > >  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
> > > >  include/linux/vfio.h     |  4 ++-
> > > >  virt/kvm/vfio.c          |  9 +++--
> > > >  4 files changed, 47 insertions(+), 42 deletions(-)
> > > 
> > > I don't mind this, but Christoph had disliked my prior attempt to do
> > > this with function pointers..
> > > 
> > > The get can be inlined, IIRC, what about putting a pointer to the put
> > > inside the kvm struct?
> > 
> > That wouldn't allow us to achieve our goal, which is to hide the details of
> > "struct kvm" from VFIO (and the rest of the kernel).
> 
> > What's the objection to handing VFIO a function pointer?
> 
> Hmm, looks like it was this thread:
> 
>  https://lore.kernel.org/r/0-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg@nvidia.com
> 
> Your rational looks a little better to me.
> 
> > > The the normal kvm get/put don't have to exported symbols at all?
> > 
> > The export of kvm_get_kvm_safe() can go away (I forgot to do that in this series),
> > but kvm_get_kvm() will hang around as it's needed by KVM sub-modules (PPC and x86),
> > KVMGT (x86), and drivers/s390/crypto/vfio_ap_ops.c (no idea what to call that beast).
> 
> My thought would be to keep it as an inline, there should be some way
> to do that without breaking your desire to hide the bulk of the kvm
> struct content. Like put the refcount as the first element in the
> struct and just don't ifdef it away?.

That doesn't work because of the need to invoke kvm_destroy_vm() when the last
reference is put, i.e. all of kvm_destroy_vm() would need to be inlined (LOL) or
VFIO would need to do a symbol lookup on kvm_destroy_vm(), which puts back us at
square one.

There's one more wrinkle: this patch is buggy in that it doesn't ensure the liveliness
of KVM-the-module, i.e. nothing prevents userspace from unloading kvm.ko while VFIO
still holds a reference to a kvm structure, and so invoking ->put_kvm() could jump
into freed code.  To fix that, KVM would also need to pass along a module pointer :-(

One thought would be to have vac.ko (tentative name), which is the "base" module
that will hold the KVM/virtualization bits that need to be singletons, i.e. can't
be per-KVM, provide the symbols needed for VFIO to manage references.  But that
just ends up moving the module reference trickiness into VAC+KVM, e.g. vac.ko would
still need to be handed a function pointer in order to call back into the correct
kvm.ko code.

Hrm, but I suspect the vac.ko <=> kvm.ko interactions will need to deal with
module shenanigans anyways, and the shenanigans would only affect crazy people
like us that actually want multiple KVM modules.

I'll plan on going that route.  The very worst case scenario is that it just punts
this conversation down to a possibile future.  Dropping this patch and the previous
prep patch won't meaningful affect the goals of this series, as only kvm_get_kvm_safe()
and kvm_get_kvm() would need to be exposed outside of #ifdef __KVM__.  Then we can
figure out what to do with them if/when the whole multi-KVM thing comes along.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
