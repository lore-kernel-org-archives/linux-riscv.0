Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F409EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 19:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W1CUnKg+VZ2TSUZAXdBn2pC/EHLfh1CNST46XVw64RY=; b=3AMZGnk3kZKqvGrq4v5MzPIfkg
	B2mJMeqY2j0pD1xuL/TcyVLZyGjcN3M9MGCtEfUVgbNFMKaRyMJJJp6oMTZD7xLcj40rKY8GqCu3G
	9IueQoZf23EMJB3/dzigrgEN/p4U6oI6mLU/+/Xuj3cktrxvhtp2lURz6YE9fhn8ald9rewlTR8Fl
	z0gjLBRY/ewQ7FzhW9UPk29uuvofftBpqeHa6TP1GSagj8YIwHkZmM42yqFT7MZHTXrvs+C3lQK2V
	nWwTWA0KI+SlvUzEvWSc8r7nAmpLL1gnN/M2HlBLKnsUNQPOIcpO8I/IgbCaDyO81MV/9lIgEZdhk
	BwoTBIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYAeJ-00Eaqr-0r;
	Mon, 21 Aug 2023 19:33:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYAeE-00Eao2-2O
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 19:33:13 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-26f49ad3b86so1553818a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Aug 2023 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692646389; x=1693251189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTUf23UWw1SkKKJ2TYgJ195zKcBZk+aHzDWYw0jOr4Q=;
        b=qpKSqx5ICliXSxPjZu0tOZy7xlqIAe6qVNImHFeHE99jDfjJ0rkalTo5f1yiylL8Zp
         zW/oM/ylnbuxciYR4prkKI8mJaHp2WuQufXKGB2RG8EjyX49+7sODEpJkoODIpJFN+WQ
         d92P7dg0Kdt0AwxXyEzQoriMz6/KeQrNijacO4IuCJVKS1YJTlTz834blo5E9EKqcgWL
         PEM2JeCl6oJE3F68JjqgLe5PECwZdFSwKXlISOg41aNDBtfUtUCqAE2x2tOPTF0xf31f
         3SefiEREMJ5D9AnExP5D9BLT2XJ6ZGgC24sHacNuUQH7uTJzB0bBXanlC1qACw6pUjbt
         /CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692646389; x=1693251189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTUf23UWw1SkKKJ2TYgJ195zKcBZk+aHzDWYw0jOr4Q=;
        b=SKbowUvoerm4XYVmXvnt9e9StKthQFRCgQGJL6TgqgGdxYN5My1np/m0T/9QJBmrwx
         e31t4lYHfGAkiDa9e5Nmkz3svKXGrTPr7ElMNrJnccDb5nJ2899io3Rn1bhptAu1pKjC
         hRTt/IUYh64ewF0e5MMW2WvWx6W97SpFA3quWIXCmVK+MEfzEObhVyghmIv4QxuRRI5E
         oOseqpp81vHHM0wYtXfvepuWXQxn6y2tEXGsdnlyP4/9rWouzIanmd9QRa6P2pCEitb+
         jArTfCCqxaaFnNYBLnvk/fVegmX/jHehz/dbTmj6WIwmE8iSyCFVcLbzyLycdgvdXlLr
         5Kbg==
X-Gm-Message-State: AOJu0YzFDuCTsTMkUkjHl6mHTl87WSN1tS3zhEYKSZaY7ZhH2cVBV04t
	IPYRuS9g4hbYDEPIbGoOQPDhlJ2MaSg=
X-Google-Smtp-Source: AGHT+IHapYFA1E8erMKTCUk5o1Pg5iPJ1NuCQ0fs2o2CFjrEymp3AKNMxkfs6EIdF0eDdCPrJxgkHXuIM1g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:d90b:b0:26d:1212:7924 with SMTP id
 c11-20020a17090ad90b00b0026d12127924mr1918689pjv.4.1692646388708; Mon, 21 Aug
 2023 12:33:08 -0700 (PDT)
Date: Mon, 21 Aug 2023 12:33:07 -0700
In-Reply-To: <diqzzg2ktiao.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <ZNvaJ3igvcvTZ/8k@google.com> <diqzzg2ktiao.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZOO782YGRY0YMuPu@google.com>
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
X-CRM114-CacheID: sfid-20230821_123310_781182_97B9E22D 
X-CRM114-Status: GOOD (  42.97  )
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

On Mon, Aug 21, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Tue, Aug 15, 2023, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> > Nullifying the KVM pointer isn't sufficient, because without additional actions
> >> > userspace could extract data from a VM by deleting its memslots and then binding
> >> > the guest_memfd to an attacker controlled VM.  Or more likely with TDX and SNP,
> >> > induce badness by coercing KVM into mapping memory into a guest with the wrong
> >> > ASID/HKID.
> >> >
> >> > I can think of three ways to handle that:
> >> >
> >> >   (a) prevent a different VM from *ever* binding to the gmem instance
> >> >   (b) free/zero physical pages when unbinding
> >> >   (c) free/zero when binding to a different VM
> >> >
> >> > Option (a) is easy, but that pretty much defeats the purpose of decopuling
> >> > guest_memfd from a VM.
> >> >
> >> > Option (b) isn't hard to implement, but it screws up the lifecycle of the memory,
> >> > e.g. would require memory when a memslot is deleted.  That isn't necessarily a
> >> > deal-breaker, but it runs counter to how KVM memlots currently operate.  Memslots
> >> > are basically just weird page tables, e.g. deleting a memslot doesn't have any
> >> > impact on the underlying data in memory.  TDX throws a wrench in this as removing
> >> > a page from the Secure EPT is effectively destructive to the data (can't be mapped
> >> > back in to the VM without zeroing the data), but IMO that's an oddity with TDX and
> >> > not necessarily something we want to carry over to other VM types.
> >> >
> >> > There would also be performance implications (probably a non-issue in practice),
> >> > and weirdness if/when we get to sharing, linking and/or mmap()ing gmem.  E.g. what
> >> > should happen if the last memslot (binding) is deleted, but there outstanding userspace
> >> > mappings?
> >> >
> >> > Option (c) is better from a lifecycle perspective, but it adds its own flavor of
> >> > complexity, e.g. the performant way to reclaim TDX memory requires the TDMR
> >> > (effectively the VM pointer), and so a deferred relcaim doesn't really work for
> >> > TDX.  And I'm pretty sure it *can't* work for SNP, because RMP entries must not
> >> > outlive the VM; KVM can't reuse an ASID if there are pages assigned to that ASID
> >> > in the RMP, i.e. until all memory belonging to the VM has been fully freed.

...

> I agree with you that nulling the KVM pointer is insufficient to keep
> host userspace out of the TCB. Among the three options (a) preventing a
> different VM (HKID/ASID) from binding to the gmem instance, or zeroing
> the memory either (b) on unbinding, or (c) on binding to another VM
> (HKID/ASID),
> 
> (a) sounds like adding a check issued to TDX/SNP upon binding and this
>     check would just return OK for software-protected VMs (line of sight
>     to removing host userspace from TCB).
> 
> Or, we could go further for software-protected VMs and add tracking in
> the inode to prevent the same inode from being bound to different
> "HKID/ASID"s, perhaps like this:
> 
> + On first binding, store the KVM pointer in the inode - not file (but
>   not hold a refcount)
> + On rebinding, check that the KVM matches the pointer in the inode
> + On intra-host migration, update the KVM pointer in the inode to allow
>   binding to the new struct kvm
> 
> I think you meant associating the file with a struct kvm at creation
> time as an implementation for (a), but technically since the inode is
> the representation of memory, tracking of struct kvm should be with the
> inode instead of the file.
> 
> (b) You're right that this messes up the lifecycle of the memory and
>     wouldn't work with intra-host migration.
> 
> (c) sounds like doing the clearing on a check similar to that of (a)

Sort of, though it's much nastier, because it requires the "old" KVM instance to
be alive enough to support various operations.  I.e. we'd have to make stronger
guarantees about exactly when the handoff/transition could happen.

> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> be independent of the refcounting method. What do you think?

No go.  Because again, the inode (physical memory) is coupled to the virtual machine
as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
single ASID.  And at some point in the future, I suspect we'll have multiple KVM
objects per HKID too.

The current SEV use case is for the migration helper, where two KVM objects share
a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
that means multiple struct kvm objects being associated with a single HKID.

To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
machine has been destroyed.

To put it differently, "struct kvm" is a KVM software construct that _usually_,
but not always, is associated 1:1 with a virtual machine.

And FWIW, stashing the pointer without holding a reference would not be a complete
solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
struct kvm was unbound and then freed, KVM could reuse the same memory for a new
struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
check.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
