Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E464BEEAA7D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 00:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AoIBbUd72j6ZTubh/FqeAz1/Ggj1UyEGAV8XA2PdVi0=; b=qyWkmRh1p1DJQtDWZgmTST6WvH
	4VlqR81SW9JHtcUjRS1o5BbNMnvyS61Y+cYPP8GVtedeVYHddb0oFajhpVkyGmAyr1Gp9SlkhvUH3
	3aE6TGoEIWSssxAu9ucIwD4ZTcwY2wVVSoXCWbUgqiNRrcY/QLjitTendeFAlMj9PD4pnJknV4aMc
	VucE8IrAb8FGQw0O/klRo4TwPN+e1vnik8zKM6jmJF0+U7NOUiVC4s92DjL1cOJ4fXYpUKLYTIJUY
	6VU+7GgFPi8iegoJupKvkPL8uY24A60ifgmChP6LOKTzpugyQf4USe4KiDEhYFdutyQR1aVkDF/NM
	JqnjKa+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgwmd-009VXe-1B;
	Fri, 15 Sep 2023 00:34:07 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgwmY-009VUM-1J
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 00:34:05 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59bcabc69easo21648507b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 17:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694738035; x=1695342835; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J23lG2GsSAJUhRlfXZ8Nll1xYHKwqpwqAHVfDlHiwRQ=;
        b=g71BQcfs92fo8Cpval91PPu3kUZ0dlnudtymUnTMhOztZRd6WQncyyPcQYwmdslNdS
         CYdR9ByLoNMVRLqsEkowSzR2k53WgB4K2RmXJKgRbivFfU+23kcRQ4YiBaJz4fmS5+g6
         8vTcgEuzJs2nQdFNSUVk96xFuXvwC7c6xxaNWWe12dZCrqN/noX6OX7w9ajfYH+itPA+
         j99RUK8ViRdHs3g+rcXeAIa9hGnQom861Y4N9qhm5AT7EtlQKe/kxlkVmJ6tQMyrANjF
         pXxr8YQ/qFnoDdQWwqq+IQwhnNUP0Uf9XZKm+zibmJSfmLV0/t9q6mpI3miW5XFWlt5w
         joNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694738035; x=1695342835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J23lG2GsSAJUhRlfXZ8Nll1xYHKwqpwqAHVfDlHiwRQ=;
        b=Jgmxpw5Wpv5eHYOH9qLbS+8oG6xiLLvyIhcoeoWihc7XkMW3/tpg5Oy/HNxIas7Hou
         rl1+sDs//DP2l0ey1cm0m0/aFU8paaUNI4738hOqBcUIALwFqSCOO6U+kV28fQC3WcmP
         gTYMIbPmU4nO4wkrmpErbA32X7m31d8sn1b85zLYJHzL7oe0KV7Dp9D4kLvPAq035lCL
         WRbsOH91I5XrVoB8wed6o6nwZTidolXDdelqQzypu4Dk3Hzr5qk53YTk+l6hxdedwyaD
         1+c6rtq/YRV1z5EVr6hsz16UeevfXvLBvEA4vnTXz/EbkW4WHV+LGnULlwKSQl4fhbKV
         dWjg==
X-Gm-Message-State: AOJu0Ywm6OUfkHwXF+mf67NxiihrJlbToT8e0KDR+FGAZHg+egBmK2/w
	NQq6N5WlgJiqrA5y3t+wK2adwhRRWLI=
X-Google-Smtp-Source: AGHT+IHBN6t0jhuW16tvzWJMbA1thelqq1JkZNxaAmcO8xrBGxWQKZuWbB7lmKVGkcmoGzwdDBC0p73x1Zc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ad5c:0:b0:d7b:9830:c172 with SMTP id
 l28-20020a25ad5c000000b00d7b9830c172mr2934ybe.0.1694738035530; Thu, 14 Sep
 2023 17:33:55 -0700 (PDT)
Date: Thu, 14 Sep 2023 17:33:53 -0700
In-Reply-To: <diqzv8ccjqbd.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
 <ZQNN2AyDJ8dF0/6D@google.com> <diqzv8ccjqbd.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZQOmcc969s90DwNz@google.com>
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
X-CRM114-CacheID: sfid-20230914_173402_460272_7D1F8A32 
X-CRM114-Status: GOOD (  56.69  )
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

On Thu, Sep 14, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Mon, Aug 28, 2023, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> >> >> be independent of the refcounting method. What do you think?
> >> >
> >> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
> >> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
> >> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
> >> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
> >> > objects per HKID too.
> >> >
> >> > The current SEV use case is for the migration helper, where two KVM objects share
> >> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
> >> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
> >> > that means multiple struct kvm objects being associated with a single HKID.
> >> >
> >> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
> >> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
> >> > machine has been destroyed.
> >> >
> >> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
> >> > but not always, is associated 1:1 with a virtual machine.
> >> >
> >> > And FWIW, stashing the pointer without holding a reference would not be a complete
> >> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
> >> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
> >> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
> >> > check.
> >> 
> >> I agree that inode (physical memory) is coupled to the virtual machine
> >> as a more generic concept.
> >> 
> >> I was hoping that in the absence of CC hardware providing a HKID/ASID,
> >> the struct kvm pointer could act as a representation of the "virtual
> >> machine". You're definitely right that KVM could reuse a pointer and so
> >> that idea doesn't stand.
> >> 
> >> I thought about generating UUIDs to represent "virtual machines" in the
> >> absence of CC hardware, and this UUID could be transferred during
> >> intra-host migration, but this still doesn't take host userspace out of
> >> the TCB. A malicious host VMM could just use the migration ioctl to copy
> >> the UUID to a malicious dumper VM, which would then pass checks with a
> >> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
> >> because the memory is encrypted; with UUIDs there's no memory
> >> encryption.
> >
> > I don't understand what problem you're trying to solve.  I don't see a need to
> > provide a single concrete representation/definition of a "virtual machine".  E.g.
> > there's no need for a formal definition to securely perform intrahost migration,
> > KVM just needs to ensure that the migration doesn't compromise guest security,
> > functionality, etc.
> >
> > That gets a lot more complex if the target KVM instance (module, not "struct kvm")
> > is a different KVM, e.g. when migrating to a different host.  Then there needs to
> > be a way to attest that the target is trusted and whatnot, but that still doesn't
> > require there to be a formal definition of a "virtual machine".
> >
> >> Circling back to the original topic, was associating the file with
> >> struct kvm at gmem file creation time meant to constrain the use of the
> >> gmem file to one struct kvm, or one virtual machine, or something else?
> >
> > It's meant to keep things as simple as possible (relatively speaking).  A 1:1
> > association between a KVM instance and a gmem instance means we don't have to
> > worry about the edge cases and oddities I pointed out earlier in this thread.
> >
> 
> I looked through this thread again and re-read the edge cases and
> oddities that was pointed out earlier (last paragraph at [1]) and I
> think I understand better, and I have just one last clarification.
> 
> It was previously mentioned that binding on creation time simplifies the
> lifecycle of memory:
> 
> "(a) prevent a different VM from *ever* binding to the gmem instance" [1]
> 
> Does this actually mean
> 
> "prevent a different struct kvm from *ever* binding to this gmem file"
> 
> ?

Yes.

> If so, then binding on creation
> 
> + Makes the gmem *file* (and just not the bindings xarray) the binding
>   between struct kvm and the file.

Yep.

> + Simplifies the KVM-userspace contract to "this gmem file can only be
>   used with this struct kvm"

Yep.

> Binding on creation doesn't offer any way to block the contents of the
> inode from being used with another "virtual machine" though, since we
> can have more than one gmem file pointing to the same inode, and the
> other gmem file is associated with another struct kvm. (And a strut kvm
> isn't associated 1:1 with a virtual machine [2])

Yep.

> The point about an inode needing to be coupled to a virtual machine as a
> thing [2] led me to try to find a single concrete representation of a
> "virtual machine".
> 
> Is locking inode contents to a "virtual machine" outside the scope of
> gmem?

Yes, because it's not gmem's responsibility to define "secure" (from a guest
perspective) or "safe" (from a platform stability and correctness perspective).

E.g. inserting additional vCPUs into the VM a la the SEV migration helper thing
is comically insecure without some way to attest the helper code.  Building policy
into the host kernel/KVM to do that attestation or otherwise determine what code
is/isn't safe for the guest to run is firmly out-of-scope.  KVM can certainly
provide the tools and help with enforcement, but the policy needs to be defined
elsewhere.  Even for something like pKVM, where KVM is in the TCB, KVM still doesn't
define who/what to trust (though KVM is heavily involved in enforcing security
stuff).

And for platform safety, e.g. not allowing two VMs to use the same HKID (ignoring
helpers for the moment), that's a KVM problem but NOT a gmem problem.  The point
I raised in link[2] about a gmem inode and thus the HKID/ASID associated with the
inode being bound to the "virtual machine" still holds true, but (a) it's not a
1:1 correlation, e.g. a VM could utilize multiple gmem inodes (all with the same
HKID/ASID), and (b) the safety and functional correctness aspects aren't unique
to gmem, e.g. even when when gmem isn't in the picture, KVM needs to make sure it
manages ASIDs correctly.  The only difference with SNP in the picture is that if
KVM screws up ASID management, bad things happen to the host, not (just) the guest.

>  If so, then it is fine to bind on creation time, use a VM ioctl
> over a system ioctl, and the method of refcounting in gmem v12 is okay.
> 
> [1] https://lore.kernel.org/lkml/ZNKv9ul2I7A4V7IF@google.com/
> [2] https://lore.kernel.org/lkml/ZOO782YGRY0YMuPu@google.com/
> 
> > <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
