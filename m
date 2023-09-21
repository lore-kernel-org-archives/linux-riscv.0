Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473C0E71086
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZTThyFDUf5kTRnanX1iBzPM9hYosmPEAM2AVuvDFn1E=; b=HPD4XewZY/LMfI4CguozKI7CZ2
	R82KDmdjPJEYbqh0s8zbkvfsdjg3vs6QUTc8DmmoY5FUODpQ0jPtPffZ6T9APwQ9Ew7WHLnjJcwCE
	ICO9ZqTGxWxjtIGj7FgClhRkzseg7GJJPsJ83a5w6oMhp4YkbGTeREETRFAtkUaFC5ewPLSafHMSz
	b8XFLFC93VPniOCJABfr/DBrsSQSKKbp4piebG2YIM8dRh7/CnfosAJNYEynfZxhmuNwJ4Lrnr+4z
	rVtW+GAheYCxRWjOZZiTQwbDjgKuoVBunlQWWKZ0KieVcScKpWXr8eGrgvrn6NyuzkGEvvldeBaC/
	BmBh4aOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjL9N-006LKn-1g;
	Thu, 21 Sep 2023 14:59:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjL9L-006LJh-00
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Sep 2023 14:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4hX9qb1Iw7SkuB3FcSZYopfwd6y9xnz247DDm3mrX40=; b=pDPKZa4CBHSm7SjV0/XsFx1+Ks
	fg67Abt/9Ou05ndGaDc2LtpOZlkvWOT55gwBslYcyRR/vaXh4fLNK8Q4X1TH0vpRt9VcOIYGfVAjn
	DwYxfuu7Z6kKypPo7oY2dHBhnja/n8WRNE4EnwuVLn9uC9BP/+AN9pE+ofBx3gkXqz8q9jvtpIoz0
	NS1mZ/CpK7i9ArLDvUt6PVVeLWJ5uLeWASNvetisHPZSMKGUgnndlBg01AWWJ3cbr37vzZhV7euYQ
	06zPyRt3NAImQhasBFTP4Xs8QocEwpyw7WqZ308ZpSRFv6NXm//0y6OGSoj/7RobsMjHVBfO8WvCY
	KT205kwQ==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjL9G-00FSIZ-1r
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 14:59:25 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59c12d31d04so14369247b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695308352; x=1695913152; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hX9qb1Iw7SkuB3FcSZYopfwd6y9xnz247DDm3mrX40=;
        b=t2ZJY40VZc7n2whUoq4gyUECPdqwJxm/HhmqvczFVAM8LVHXhDINPB0CiducwvLush
         JhzDxQnmQeyF3aYoKirpIVNmsHU7RouW5thLM29v33clQAFBYVguBNx7tXmK8LWCAHTV
         r1KkmH9xv7OY8Vw31wuNZupvr8s3PX8Acvv7S9sahAlXjoorwmelU6m0PDn7ihN6Qmav
         xRcVwyMSBHsXv4fnsFcLRQOMHVKFha8HYLnz9/cyFZomFI9lLFgFQ4lf4ELbctbDlWDr
         blJynqKEr5bOSpISgrxyTib6XArOA+CevmVv42xibhGNpuqF8xFc8bdjja9ZVXHGjcLQ
         GTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695308352; x=1695913152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hX9qb1Iw7SkuB3FcSZYopfwd6y9xnz247DDm3mrX40=;
        b=lHstZxBHd/6GlrtxnLp+bAe2vPB2ys/jbNVJrpDxaLa0bf/ESfGvlmpgDHTg5MAXhh
         cYhfisMH/f8xWAJ9HE2qdu/6nPFmlIHfVEDktW8W4Uxj9UTE4ToKEqFMA3VDtgEMSNUv
         deNuZkEygJDsh4T/bsse6rRSwizm1w6Cw9H9RDrTNmKVFfOG1bu2xDXugcQlQUd+Tvgu
         Cb9LAKrIdK/GNkBErjWr6I38CS3rAuKH8OGhOqXR7dmz1RlEyDn8h6vCFx9FevSdhSlA
         iC0zJ6h6lY6JyfmB+CN5vDrf2Xz1qZgzPTqFdn/1TLZOfWOWSZLECknSqy0mY7FGUcSZ
         +TlQ==
X-Gm-Message-State: AOJu0Yz3yTC3r7JgEPSJSXp0LZXH4/LlNEWsFVrQ14etr6jLPXyvbl7p
	zbQlXWR7aWdRVpl1ddcoRxoUXHKCpVA=
X-Google-Smtp-Source: AGHT+IGMlI3r5pTKtUH2X22CRcKkDXwZa01FQ/zuLj/x6iC6Lpx1DAvznI7oMbumBcX5i3FsE4fH+yzcjSE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2906:b0:59e:ee51:52a1 with SMTP id
 eg6-20020a05690c290600b0059eee5152a1mr76581ywb.10.1695308352199; Thu, 21 Sep
 2023 07:59:12 -0700 (PDT)
Date: Thu, 21 Sep 2023 07:59:10 -0700
In-Reply-To: <ZQef3zAEYjZMkn9k@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-19-seanjc@google.com>
 <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com> <ZQRpiOd1DNDDJQ3r@google.com> <ZQef3zAEYjZMkn9k@yzhao56-desk.sh.intel.com>
Message-ID: <ZQxaPsNiFgfXH7aq@google.com>
Subject: Re: [RFC PATCH v12 18/33] KVM: x86/mmu: Handle page fault for private memory
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_155924_127850_F429648F 
X-CRM114-Status: GOOD (  27.25  )
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

On Mon, Sep 18, 2023, Yan Zhao wrote:
> On Fri, Sep 15, 2023 at 07:26:16AM -0700, Sean Christopherson wrote:
> > On Fri, Sep 15, 2023, Yan Zhao wrote:
> > > >  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > > >  {
> > > >  	struct kvm_memory_slot *slot = fault->slot;
> > > > @@ -4293,6 +4356,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> > > >  			return RET_PF_EMULATE;
> > > >  	}
> > > >  
> > > > +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> > > In patch 21,
> > > fault->is_private is set as:
> > > 	".is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT)",
> > > then, the inequality here means memory attribute has been updated after
> > > last check.
> > > So, why an exit to user space for converting is required instead of a mere retry?
> > > 
> > > Or, is it because how .is_private is assigned in patch 21 is subjected to change
> > > in future? 
> > 
> > This.  Retrying on SNP or TDX would hang the guest.  I suppose we could special
> Is this because if the guest access a page in private way (e.g. via
> private key in TDX), the returned page must be a private page?

Yes, the returned page must be private, because the GHCI (TDX) and GHCB (SNP)
require that the host allow implicit conversions.  I.e. if the guest accesses
memory as private (or shared), then the host must map memory as private (or shared).
Simply resuming the guest will not change the guest access, nor will it change KVM's
memory attributes.

Ideally (IMO), implicit conversions would be disallowed, but even if implicit
conversions weren't a thing, retrying would still be wrong as KVM would either
inject an exception into the guest or exit to userspace to let userspace handle
the illegal access.

> > case VMs where .is_private is derived from the memory attributes, but the
> > SW_PROTECTED_VM type is primary a development vehicle at this point.  I'd like to
> > have it mimic SNP/TDX as much as possible; performance is a secondary concern.
> Ok. But this mimic is somewhat confusing as it may be problematic in below scenario,
> though sane guest should ensure no one is accessing a page before doing memory
> conversion.
> 
> 
> CPU 0                           CPU 1
> access GFN A in private way
> fault->is_private=true
>                                 convert GFN A to shared
> 			        set memory attribute of A to shared
> 
> faultin, mismatch and exit
> set memory attribute of A
> to private
> 
>                                 vCPU access GFN A in shared way
>                                 fault->is_private = true
>                                 faultin, match and map a private PFN B
> 
>                                 vCPU accesses private PFN B in shared way

If this is a TDX or SNP VM, then the private vs. shared information comes from
the guest itself, e.g. this sequence

                                   vCPU access GFN A in shared way
                                   fault->is_private = true

cannot happen because is_private will be false based on the error code (SNP) or
the GPA (TDX).

And when hardware doesn't generate page faults based on private vs. shared, i.e.
for non-TDX/SNP VMs, from a fault handling perspective there is no concept of the
guest accessing a GFN in a "private way" or a "shared way".  I.e. there are no
implicit conversions.

For SEV and SEV-ES, the guest can access memory as private vs. shared, but the
and the host VMM absolutely must be in agreement and synchronized with respect to
the state of a page, otherwise guest memory will be corrupted.  But that has
nothing to do with the fault handling, e.g. creating aliases in the guest to access
a single GFN as shared and private from two CPUs will create incoherent cache
entries and/or corrupt data without any involvement from KVM.

In other words, the above isn't possible for TDX/SNP, and for all other types,
the conflict between CPU0 and CPU1 is unequivocally a guest bug.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
