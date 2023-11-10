Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6155DC4167D
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 18:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ndxdwwxIBzSs+sKpCsH9f3W0Fc4V+s8BYE6RIRb6Xro=; b=gFaZvcpze+vC593bc9n+EDQorO
	c0pIFrMAUSGlYeIoo8FGF/2WSuuJaAzlwbH55vuY8hGcoKfrkNL7xnHsZ93wH4qRAioEuEnsdwA7a
	BO92lpzSSoeELqeCe3RVeXgeT5k+Ky0xI000+668JCUXGktOpFHbJ/O1CYF1cbbJTC3yauwkqGH84
	B4peO0cE2ZBChuryWVAmMxtWetjQailDyd9I63iTSYB0YrqBgJvOIpH5U68W43XZMh1/5SYwsbxit
	bb+mby5yxfl02apWHOphNV+qDeUBCiJKLrJ5rafyYp6X7a6oTDxaqMjI7a/4wJPjQuxvvMrlnrxx/
	56S45c2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1W9r-009ECA-2W;
	Fri, 10 Nov 2023 18:23:07 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1W9o-009E9w-0T
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 18:23:06 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b1ff96d5b9so31778477b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699640581; x=1700245381; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/u2JG0fndtvz5StB0AokXkOquj7NpP7M8gj3x0QBG2E=;
        b=MUSyrQpV43BGlYXNFS0rbHybNOJp2tO7C5me5bX63NHu22IMa73vdw795LR9LuebSz
         Zrow+5HKu4AkksSzzJUSh62btuvpYY6WM1thjvjMwrQNZdewJk/Tng0MIzcFGAXDhKyj
         aEit1g9SaXFJXSKCMmOipOxs1yDCHtm2Pm6tsuENgnTrRE6yg637s4Fe45viCJrxXuyv
         0xaTrVfQgPOP2ed5qQsEI/r7PyyKC5J0qYSpvlM4FijzGkJtXwmoSfSUBi4owJLvArSq
         j1M5Vcc+DtdjU6wvl5A1sOBWq/wFVKNObg/UmPfrnTaX4y94APABFtf3ghChvaPdieJk
         oVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699640581; x=1700245381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/u2JG0fndtvz5StB0AokXkOquj7NpP7M8gj3x0QBG2E=;
        b=GZQCHgXvyVYoMut4HvlQFM1ebOD/VKthmONfEMDxUftM0HxHgfbexYe3NNSM3VVDWL
         0VgojuHDEZYRlq0k+wXfYoJG2dtYHrhd0149ndZ5hSw4LWJWBgxKcyRU5oo9y+bzJzb/
         3o6EJsxQucOHq0J21YArqLw5mc2SxrRLRmFsQR/1h64IfdQUSXTvglnSVz5z+iUjB75n
         56Ay19oy666JyX5P/r1cRlzWr41ZAx1vhDWYBkjXsubRRaWwS2lyiWjCK7bM7R3UTb1c
         3jjPH9bZg9trW++cv2rAupOXBZbBgXsl1BT3SUFF7hKjOehaUSNRzKQboIMd1olBWnaz
         qTWg==
X-Gm-Message-State: AOJu0YyJ3XXWmZsWtE111fltDyqXd/rff4LMZOoVouWTlo86UK1CaoXw
	DUkenkUqolFc4zsEqg8E39j5OHq0WBk=
X-Google-Smtp-Source: AGHT+IFilgu1/Q1EZiEoL3sTFYKCQfnhtgAeMBBAfAGcs6DHfZF6Y3nZ5EepLJy80XYZ0ZRT2keQkzxRdJY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ef0c:0:b0:5be:ae71:d70a with SMTP id
 o12-20020a81ef0c000000b005beae71d70amr242444ywm.4.1699640580898; Fri, 10 Nov
 2023 10:23:00 -0800 (PST)
Date: Fri, 10 Nov 2023 10:22:59 -0800
In-Reply-To: <956d8ee3-8b63-4a2d-b0c4-c0d3d74a0f6f@intel.com>
Mime-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-16-pbonzini@redhat.com>
 <956d8ee3-8b63-4a2d-b0c4-c0d3d74a0f6f@intel.com>
Message-ID: <ZU51A3U6E3aZXayC@google.com>
Subject: Re: [PATCH 15/34] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
	linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_102304_184751_40EB579E 
X-CRM114-Status: GOOD (  19.33  )
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

On Fri, Nov 10, 2023, Xiaoyao Li wrote:
> On 11/6/2023 12:30 AM, Paolo Bonzini wrote:
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 68a144cb7dbc..a6de526c0426 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -589,8 +589,20 @@ struct kvm_memory_slot {
> >   	u32 flags;
> >   	short id;
> >   	u16 as_id;
> > +
> > +#ifdef CONFIG_KVM_PRIVATE_MEM
> > +	struct {
> > +		struct file __rcu *file;
> > +		pgoff_t pgoff;
> > +	} gmem;
> > +#endif
> >   };
> > +static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
> > +{
> > +	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
> > +}
> > +
> 
> maybe we can move this block and ...
> 
> <snip>
> 
> > @@ -2355,6 +2379,30 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> >   					struct kvm_gfn_range *range);
> >   bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> >   					 struct kvm_gfn_range *range);
> > +
> > +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +{
> > +	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
> > +	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> > +}
> > +#else
> > +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +{
> > +	return false;
> > +}
> >   #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> 
> this block to Patch 18?

It would work, but my vote is to keep them here to minimize the changes to common
KVM code in the x86 enabling.  It's not a strong preference though.  Of course,
at this point, fiddling with this sort of thing is probably a bad idea in terms
of landing guest_memfd.

> > @@ -4844,6 +4875,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> >   #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> >   	case KVM_CAP_MEMORY_ATTRIBUTES:
> >   		return kvm_supported_mem_attributes(kvm);
> > +#endif
> > +#ifdef CONFIG_KVM_PRIVATE_MEM
> > +	case KVM_CAP_GUEST_MEMFD:
> > +		return !kvm || kvm_arch_has_private_mem(kvm);
> >   #endif
> >   	default:
> >   		break;
> > @@ -5277,6 +5312,18 @@ static long kvm_vm_ioctl(struct file *filp,
> >   	case KVM_GET_STATS_FD:
> >   		r = kvm_vm_ioctl_get_stats_fd(kvm);
> >   		break;
> > +#ifdef CONFIG_KVM_PRIVATE_MEM
> > +	case KVM_CREATE_GUEST_MEMFD: {
> > +		struct kvm_create_guest_memfd guest_memfd;
> 
> Do we need a guard of below?
> 
> 		r = -EINVAL;
> 		if (!kvm_arch_has_private_mem(kvm))
> 			goto out;

Argh, yeah, that's weird since KVM_CAP_GUEST_MEMFD says "not supported" if the
VM doesn't support private memory.

Enforcing that would break guest_memfd_test.c though.  And having to create a
"special" VM just to test basic guest_memfd functionality would be quite
annoying.

So my vote is to do:

	case KVM_CAP_GUEST_MEMFD:
		return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM);

There's no harm to KVM if userspace creates a file it can't use, and at some
point KVM will hopefully support guest_memfd irrespective of private memory.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
