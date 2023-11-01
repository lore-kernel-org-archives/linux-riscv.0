Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC65C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 21:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2V9GyNKW3Hbna0Un/7W86TIBmaZte/4EzTarDsClVps=; b=n7DsDTWb+ilBi79Xbcn9LvroxZ
	duFv/bL+2qFLWex3bJLkuKc2Pw18xpkEyVmBb6OwQRMzzustkxrSrCf0+iivuGBIQR6ugyx5RMyM7
	C2oDaZRrul1LGITSJJ1c37C58dpv/r/ITL+W7rk4XToe2ST0TFk+dpd5Efs5YIOs/h9zlDu3ETmME
	zYx13xKu+SuwKitj8oBG9oewUVq0LHH+PGrC0jjEPtqSuUEEbr2oR5en4ywLWpj811IuPDt+JiJnp
	pGF2QDxsVdnZ1+Cxr2dlCRp5s9H1mWZBGsLqZvdJ79kQdcJkifvI5l1TAHieJdlITl5vVOYMOix89
	c+Y/YiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyJBq-008B92-2I;
	Wed, 01 Nov 2023 21:55:54 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyJBn-008B6w-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 21:55:54 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9a5a3f2d4fso287709276.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698875748; x=1699480548; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcqXHpLnYUoCfOstmB/gusaSnz1wSaaIZvticgi9YrM=;
        b=fi2v7xC9TH4oErbIOJfDXZfAdxQ494cxTQxZwVGxmvCjEwoZ5W9X+Du2+gOwu+MwLC
         0nlb+lsobtKLZIohJNZpFeYQNJw6uYEzrNK9BobAeVzNtzFX0QGhLeasz54o3vP7bZmv
         OhwgdqCkzGq2A0qY3wlZSutr1B5InCd9WoWXcPO3+w8G1xrcgfenGOfFT7hdyRFYweRC
         b0om9N3s3Ao1ysAH6kZB7HUY5SNrOt9qjNHvB7E7MA/GNxGxYdXS8pB/8Lm7LK+qLzCS
         LaM1TEZb2Fg1ihw4FrbFOCDqOIIwKWVN7jNFGgr7FaZvzI72e0NZExVCwvpPpJtawAeh
         FKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698875748; x=1699480548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcqXHpLnYUoCfOstmB/gusaSnz1wSaaIZvticgi9YrM=;
        b=iX17d67luVxpyUGckw555ikljmLWGcvoc4Vx5Cbai5fLUYQwF+OWxOfiRTgPI4oFlj
         N/YE95EnlJ8FCLQKX24624DWtWM5GOugMs/4GjHzhqZKcXBFaPWhcaSmDb6mODA5pENn
         BA4tf9Nx0KgN9oYO5X8z1SHUz30YA8pxrSRm+D1v0GAIh4ULsuhgKBvB/Qao73JaRzka
         3IsVOIvchcg7XJqPoY/SESck2LcD+MS2498T3F+7+Nr55KnMcRG41CeTxCuabC5olJqa
         MavWGXTwj0zcQUbJx12xIcfhFjOZyFEkDfDZT8P/iF8szj2sx3Yngic/J+M7ofUs/Ai5
         DWEQ==
X-Gm-Message-State: AOJu0Yzec/vBfOquoaE0BNd+2oFRUdjWDXRGKJtonOmDXM1S4jMbN3gt
	P4NyYTo7B3C9SUuQGOZ+OeQ/sdBpNSk=
X-Google-Smtp-Source: AGHT+IE2sMY2tsOG0bVHgm+pvNoyezNqlGkOo8OmSBoeRdI+YDBZP5bgBr5ffHZ4bVc102IwBIrDYpGpUa8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr405001ybu.7.1698875748263; Wed, 01 Nov
 2023 14:55:48 -0700 (PDT)
Date: Wed, 1 Nov 2023 14:55:46 -0700
In-Reply-To: <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
Message-ID: <ZULJYg5cf1UrNq3e@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_145551_173216_128C27BA 
X-CRM114-Status: GOOD (  34.33  )
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

On Wed, Nov 01, 2023, Fuad Tabba wrote:
> > > > @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
> > > >  /* This does not remove the slot from struct kvm_memslots data structures */
> > > >  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> > > >  {
> > > > +       if (slot->flags & KVM_MEM_PRIVATE)
> > > > +               kvm_gmem_unbind(slot);
> > > > +
> > >
> > > Should this be called after kvm_arch_free_memslot()? Arch-specific ode
> > > might need some of the data before the unbinding, something I thought
> > > might be necessary at one point for the pKVM port when deleting a
> > > memslot, but realized later that kvm_invalidate_memslot() ->
> > > kvm_arch_guest_memory_reclaimed() was the more logical place for it.
> > > Also, since that seems to be the pattern for arch-specific handlers in
> > > KVM.
> >
> > Maybe?  But only if we can about symmetry between the allocation and free paths
> > I really don't think kvm_arch_free_memslot() should be doing anything beyond a
> > "pure" free.  E.g. kvm_arch_free_memslot() is also called after moving a memslot,
> > which hopefully we never actually have to allow for guest_memfd, but any code in
> > kvm_arch_free_memslot() would bring about "what if" questions regarding memslot
> > movement.  I.e. the API is intended to be a "free arch metadata associated with
> > the memslot".
> >
> > Out of curiosity, what does pKVM need to do at kvm_arch_guest_memory_reclaimed()?
> 
> It's about the host reclaiming ownership of guest memory when tearing
> down a protected guest. In pKVM, we currently teardown the guest and
> reclaim its memory when kvm_arch_destroy_vm() is called. The problem
> with guestmem is that kvm_gmem_unbind() could get called before that
> happens, after which the host might try to access the unbound guest
> memory. Since the host hasn't reclaimed ownership of the guest memory
> from hyp, hilarity ensues (it crashes).
> 
> Initially, I hooked reclaim guest memory to kvm_free_memslot(), but
> then I needed to move the unbind later in the function. I realized
> later that kvm_arch_guest_memory_reclaimed() gets called earlier (at
> the right time), and is more aptly named.

Aha!  I suspected that might be the case.

TDX and SNP also need to solve the same problem of "reclaiming" memory before it
can be safely accessed by the host.  The plan is to add an arch hook (or two?)
into guest_memfd that is invoked when memory is freed from guest_memfd.

Hooking kvm_arch_guest_memory_reclaimed() isn't completely correct as deleting a
memslot doesn't *guarantee* that guest memory is actually reclaimed (which reminds
me, we need to figure out a better name for that thing before introducing
kvm_arch_gmem_invalidate()).

The effective false positives aren't fatal for the current usage because the hook
is used only for x86 SEV guests to flush caches.  An unnecessary flush can cause
performance issues, but it doesn't affect correctness. For TDX and SNP, and IIUC
pKVM, false positives are fatal because KVM could assign memory back to the host
that is still owned by guest_memfd.

E.g. a misbehaving userspace could prematurely delete a memslot.  And the more
fun example is intrahost migration, where the plan is to allow pointing multiple
guest_memfd files at a single guest_memfd inode:
https://lore.kernel.org/all/cover.1691446946.git.ackerleytng@google.com

There was a lot of discussion for this, but it's scattered all over the place.
The TL;DR is is that the inode will represent physical memory, and a file will
represent a given "struct kvm" instance's view of that memory.  And so the memory
isn't reclaimed until the inode is truncated/punched.

I _think_ this reflects the most recent plan from the guest_memfd side:
https://lore.kernel.org/all/1233d749211c08d51f9ca5d427938d47f008af1f.1689893403.git.isaku.yamahata@intel.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
