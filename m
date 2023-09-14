Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADF3EEAA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ez1sMyLq2AD0CoJ3DQncR2w3dPemeSf6TJUbhg+Nvxc=; b=vzVqv89MJTQkzap1dhy9Qh5xiN
	bvV8UVYnXrYXRxh9ZcXlEgABayCLl2g6Kkd011UH+dL3yG185NOKwx7cN+ML9LjQOO502lZqc/Bf8
	NcXwv0nN0/U+dKzI6P+PDMqFb4mct2HKg/4j1OFcUAbabnaKxqz4lBZrOri4RDz+0B4TG85PCxStS
	x/9K8zdKux630cJg1sUOL+yfBnt88VpHoZJdEIQrh3WkLovVu/BoVOa7iYLssa7dyqIONijvHiQZ0
	XoSsMnURUWR3pIN6eNY32kebjs7ms5nIlNsntHwJ/bQuRGAn21lBn7LtT7IX5OBW3xWuBVvFjUH3F
	wrmHNuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqsi-0093IL-21;
	Thu, 14 Sep 2023 18:16:00 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqsf-0093G9-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 18:15:59 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59b56dab74bso17824837b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 11:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694715354; x=1695320154; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NotwC0wYPH9Bmm+eHoPAvBDfUZeidJiPlRdc5f2ZPWA=;
        b=Lg4gb3OTkYh7Ac+HxHElSe/6ti6AZFtWQDm5d9eSlZGaMPa8UgWRkkBGRAGSpvkYW/
         eZH1o3lwYgZhW/5vgUEYhTafGFhEWuT8aXKul+206N2CjFsAXVNGj3p4eM502Y7rGWsV
         zgnZ2p2nHvu3pdKRcJzO7V/NanLU76jM/+f6m2APfoC1AunveVwq7fm11zQVNTU8SQ4I
         OYqMwkAwB+Sk22y86Gkga8XDC7Ol51aMIvkqjFIkdm8cpMMkTMbp/6pqkkdZO3lI3ddY
         kYQqTtSpaQzW/e0GRYsOdalYi+I0+391t6upjxuKog8hkduzKtvZrBXIZs2pTH+r+N2H
         SwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694715354; x=1695320154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NotwC0wYPH9Bmm+eHoPAvBDfUZeidJiPlRdc5f2ZPWA=;
        b=AwVM9qWA7SjVykigavPwUaVxVfjQeJzhT0QtZI2x1Of4fukoSx5zGNENYKSLozzI/L
         ezCD400mN9GeLoIeshwTCcPaRTDJVgVs1MJ3xWcJwscLKBTSvDuDpWLVe94oOfV3HAUk
         6N6q+u67yfGIfNWXAo1x2EcYY9EAA/2iElnAfWJ6OV1QN1mWJAit+z8/0jJI2h0Yr5az
         7G2SzvhOjZbaFov7GuqsoJcY1D7+Ye8hww5t4ZVRGvrqpHYaNpeY0VI0ooatk8jUr5mS
         cNjh2jG5aIS/0sl55yy2nPyDKWJzj5H1Bb1AWnwR2D6Hiv467q79we5hUux2tAxX8gTL
         P6sw==
X-Gm-Message-State: AOJu0YzHhzNoAgLat4yD+yXUa8JB/8CR8UlEXHoO68gLbypNUxE1lRCJ
	zKJg5z+DFsZSeQU63WKjH4bEep9FNdc=
X-Google-Smtp-Source: AGHT+IGPJqA/+ZACxXOUgdzWN4hGcwV50i6jcfcPa2GrWEQEeACHClOtxAN3Jr9h2WjxVFoJdPIyBK0jy04=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:3187:b0:59b:e81f:62b3 with SMTP id
 fd7-20020a05690c318700b0059be81f62b3mr91025ywb.10.1694715354294; Thu, 14 Sep
 2023 11:15:54 -0700 (PDT)
Date: Thu, 14 Sep 2023 11:15:52 -0700
In-Reply-To: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZQNN2AyDJ8dF0/6D@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	willy@infradead.org, akpm@linux-foundation.org, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_111557_505263_6DF063FE 
X-CRM114-Status: GOOD (  48.39  )
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

On Mon, Aug 28, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> >> be independent of the refcounting method. What do you think?
> >
> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
> > objects per HKID too.
> >
> > The current SEV use case is for the migration helper, where two KVM objects share
> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
> > that means multiple struct kvm objects being associated with a single HKID.
> >
> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
> > machine has been destroyed.
> >
> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
> > but not always, is associated 1:1 with a virtual machine.
> >
> > And FWIW, stashing the pointer without holding a reference would not be a complete
> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
> > check.
> 
> I agree that inode (physical memory) is coupled to the virtual machine
> as a more generic concept.
> 
> I was hoping that in the absence of CC hardware providing a HKID/ASID,
> the struct kvm pointer could act as a representation of the "virtual
> machine". You're definitely right that KVM could reuse a pointer and so
> that idea doesn't stand.
> 
> I thought about generating UUIDs to represent "virtual machines" in the
> absence of CC hardware, and this UUID could be transferred during
> intra-host migration, but this still doesn't take host userspace out of
> the TCB. A malicious host VMM could just use the migration ioctl to copy
> the UUID to a malicious dumper VM, which would then pass checks with a
> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
> because the memory is encrypted; with UUIDs there's no memory
> encryption.

I don't understand what problem you're trying to solve.  I don't see a need to
provide a single concrete representation/definition of a "virtual machine".  E.g.
there's no need for a formal definition to securely perform intrahost migration,
KVM just needs to ensure that the migration doesn't compromise guest security,
functionality, etc.

That gets a lot more complex if the target KVM instance (module, not "struct kvm")
is a different KVM, e.g. when migrating to a different host.  Then there needs to
be a way to attest that the target is trusted and whatnot, but that still doesn't
require there to be a formal definition of a "virtual machine".

> Circling back to the original topic, was associating the file with
> struct kvm at gmem file creation time meant to constrain the use of the
> gmem file to one struct kvm, or one virtual machine, or something else?

It's meant to keep things as simple as possible (relatively speaking).  A 1:1
association between a KVM instance and a gmem instance means we don't have to
worry about the edge cases and oddities I pointed out earlier in this thread.

> Follow up questions:
> 
> 1. Since the physical memory's representation is the inode and should be
>    coupled to the virtual machine (as a concept, not struct kvm), should
>    the binding/coupling be with the file, or the inode?

Both.  The @kvm instance is bound to a file, because the file is that @kvm's view
of the underlying memory, e.g. effectively provides the translation of guest
addresses to host memory.  The @kvm instance is indirectly bound to the inode
because the file is bound to the inode.

> 2. Should struct kvm still be bound to the file/inode at gmem file
>    creation time, since

Yes.

>    + struct kvm isn't a good representation of a "virtual machine"

I don't see how this is relevant, because as above, I don't see why we need a
canonical represenation of a virtual machine.

>    + we currently don't have anything that really represents a "virtual
>      machine" without hardware support

HKIDs and ASIDs don't provide a "virtual machine" representation either.  E.g. if
a TDX guest is live migrated to a different host, it will likely have a different
HKID, and definitely have a different encryption key, but it's still the same
virtual machine.

> I'd also like to bring up another userspace use case that Google has:
> re-use of gmem files for rebooting guests when the KVM instance is
> destroyed and rebuilt.
>
> When rebooting a VM there are some steps relating to gmem that are
> performance-sensitive:

If we (Google) really cared about performance, then we shouldn't destroy and recreate
the VM in the first place.  E.g. the cost of zapping, freeing, re-allocating and
re-populating SPTEs is far from trivial.  Pulling RESET shouldn't change what
memory that is assigned to a VM, and reseting stats is downright bizarre IMO.

In other words, I think Google's approach of destroying the VM to emulate a reboot
is asinine.  I'm not totally against extending KVM's uAPI to play nice with such
an approach, but I'm not exactly sympathetic either.

> a.      Zeroing pages from the old VM when we close a gmem file/inode
> b. Deallocating pages from the old VM when we close a gmem file/inode
> c.   Allocating pages for the new VM from the new gmem file/inode
> d.      Zeroing pages on page allocation
> 
> We want to reuse the gmem file to save re-allocating pages (b. and c.),
> and one of the two page zeroing allocations (a. or d.).
> 
> Binding the gmem file to a struct kvm on creation time means the gmem
> file can't be reused with another VM on reboot.

Not without KVM's assistance, which userspace will need for TDX and SNP VMs no
matter what, e.g. to ensure the new and old KVM instance get the same HKID/ASID.
And we've already mapped out the more complex case of intrahost migration, so I
don't expect this to be at all challenging to implement.

> Also, host userspace is forced to close the gmem file to allow the old VM to
> be freed.

Yes, but that can happen after the "new" VM has instantiated its file/view of
guest memory.

> For other places where files pin KVM, like the stats fd pinning vCPUs, I
> guess that matters less since there isn't much of a penalty to close and
> re-open the stats fd.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
