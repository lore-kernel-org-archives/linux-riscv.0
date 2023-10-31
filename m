Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1281FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 00:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QAVQtUTcqRg75bLYXG5DljKYfrNyuUlMHSV+C2C0N+U=; b=ruk3RlSBySItT6EyPGIW4jSD5R
	l/QtOciUuzWotuohWd7ReFqoS0qmmYIE+AyfH6UIRoOhKS61ZqhXNVGSmUJFBqVBiKOTRSSzstIPp
	BiaR6cqbX2PZgL91788OLSh9Fpr0gIK76XZZU/uHllFY4uYbNTvQNdmwanAzmHnH6jnOUqWHfSwAC
	QktW+VDI087v7yibfhg2CfM69jWFx8sJGVM+V+XPWfFgqeZlMV1hYoh7mEHGzrkWuPlJEmLgcYA6w
	S6Ql6wiPwJRIAg3L62Ceupa8gOCWuBsIkHicHqj88AMHZ66/s2lFk90AVv8F6SDZvDOfFGg8zm9fv
	h3go+twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxcSh-004Hhu-0D;
	Tue, 31 Oct 2023 00:18:27 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxcSd-004HfU-20
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 00:18:26 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7af69a4baso55682177b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 17:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698711501; x=1699316301; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/LRaTLkejTxBM8pIW/wY9k081He9jXDc1u8/vyc5yU=;
        b=RILyQYkBJRp0kwjao9ZM0mQC4LhUXyALJ5vJROHOttqx9w8dPNBZ3kNOgMvYhrRl5k
         m/Rr5SqNR4HV2eQAmqodKN3k8IdRrIJX40IWN+4yfYijxXMej7XthiTiVREhfnHTpOTa
         Rh1X6N6Z9Xa41qAIsf++IMTMi/38SyocqgT2RRdInZXhNbp2+xlh8qJzDYXD24BL0PfY
         OCPwG5MI8OLSNOPFKrY1TlqTFp4iF+tCgOeoxu+cgj7N3KrSUSvVeWlB3q6hJcuuS9hS
         nFC+nl5EEIF4jdxCdAt3vZOZgxOncdpc/9TzIvAp35o9H+ZPmifVWgk1E4OFbinCjdoM
         kHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698711501; x=1699316301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/LRaTLkejTxBM8pIW/wY9k081He9jXDc1u8/vyc5yU=;
        b=LGz8zte1JRjOYStOFDRC/mK1lkC3eddb0VcK6ouT4W0BBhFk5ep1W39PljPUuWaa9b
         IVtycua4b2JH8ADKcGwuLn93knGsjAw+n5h2HPNiDhltJJ8rzRXFbfjbPqI9Y6F0dndi
         XKQYuSuCm40penF4cozA3krJX0CNDEt7+pwjlVudy3MOZkHGS3eBUV8jVluPtnMU3Vri
         k2KqIXJuyeuGigpbgYzCW4VQgUbBYysrm8SCEZEyhm6ouLr4O5VOcz3HCHJ5x4oNDUfF
         2GzsUcAgz5FZTCVJQSZ0qK7hBi2R6eBmAVEpUrQmkHFNje0FpM9m42jjf9YnUEtdqzeU
         fFtA==
X-Gm-Message-State: AOJu0Yz4kJ3avqhAfLhO+jOgkYjARSynVB+L+67M19wQqhWfM9uERhZu
	yUh3livbAQU2Xl2f2a9g/InS/ghJ1Co=
X-Google-Smtp-Source: AGHT+IHXEBSMgWOLLItH3ZyzwVZ95nnvcf8ZeQIGcTFfJ9alEhiQZOfJ5t56nJTNUPAWz2jzQYzE0vm4h+I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca0f:0:b0:5a1:d329:829c with SMTP id
 m15-20020a0dca0f000000b005a1d329829cmr241205ywd.0.1698711501089; Mon, 30 Oct
 2023 17:18:21 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:18:19 -0700
In-Reply-To: <afa0d4ec-4b37-4a67-b546-016148ef4efe@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com> <ZUARTvhpChFSGF9s@google.com>
 <afa0d4ec-4b37-4a67-b546-016148ef4efe@redhat.com>
Message-ID: <ZUBHy3rrJN8kbFCH@google.com>
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_171823_659391_25C00D55 
X-CRM114-Status: GOOD (  32.12  )
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

On Tue, Oct 31, 2023, Paolo Bonzini wrote:
> On 10/30/23 21:25, Sean Christopherson wrote:
> > > Probably worth adding a check on valid flags here.
> > 
> > Definitely needed.  There's a very real bug here.  But rather than duplicate flags
> > checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
> > have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
> > what if we:
> > 
> >    1. Acquire/release slots_lock in __kvm_set_memory_region()
> >    2. Call kvm_set_memory_region() from x86 code for the internal memslots
> >    3. Disallow *any* flags for internal memslots
> >    4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()
> 
> I dislike this step, there is a clear point where all paths meet
> (ioctl/internal, locked/unlocked) and that's __kvm_set_memory_region().
> I think that's the place where flags should be checked.  (I don't mind
> the restriction on internal memslots; it's just that to me it's not a
> particularly natural way to structure the checks).

Yeah, I just don't like the discrepancy it causes where some flags are explicitly
checked and allowed, allowed and then later disallowed.

> On the other hand, the place where to protect from out-of-bounds
> accesses, is the place where you stop caring about struct
> kvm_userspace_memory_region vs kvm_userspace_memory_region2 (and
> your code gets it right, by dropping "ioctl" as soon as possible).
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 87f45aa91ced..fe5a2af14fff 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1635,6 +1635,14 @@ bool __weak kvm_arch_dirty_log_supported(struct kvm *kvm)
>  	return true;
>  }
> +/*
> + * Flags that do not access any of the extra space of struct
> + * kvm_userspace_memory_region2.  KVM_SET_USER_MEMORY_REGION_FLAGS
> + * only allows these.
> + */
> +#define KVM_SET_USER_MEMORY_REGION_FLAGS \

Can we name this KVM_SET_USER_MEMORY_REGION_LEGACY_FLAGS, or something equally
horrific?  As is, this sounds way too much like a generic "allowed flags for any
memory region".

Or maybe invert the macro?  I.e. something to make it more obvious that it's
effectively a versioning check, not a generic "what's supported?" check.

#define KVM_SET_USER_MEMORY_FLAGS_V2_ONLY \
	(~(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY))


> +	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
> +
>  static int check_memory_region_flags(struct kvm *kvm,
>  				     const struct kvm_userspace_memory_region2 *mem)
>  {
> @@ -5149,10 +5149,16 @@ static long kvm_vm_ioctl(struct file *filp,
>  		struct kvm_userspace_memory_region2 mem;
>  		unsigned long size;
> -		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION) {
> +			/*
> +			 * Fields beyond struct kvm_userspace_memory_region shouldn't be
> +			 * accessed, but avoid leaking kernel memory in case of a bug.
> +			 */
> +			memset(&mem, 0, sizeof(mem));
>  			size = sizeof(struct kvm_userspace_memory_region);
> -		else
> +		} else {
>  			size = sizeof(struct kvm_userspace_memory_region2);
> +		}
>  		/* Ensure the common parts of the two structs are identical. */
>  		SANITY_CHECK_MEM_REGION_FIELD(slot);
> @@ -5165,6 +5167,11 @@ static long kvm_vm_ioctl(struct file *filp,
>  		if (copy_from_user(&mem, argp, size))
>  			goto out;
> +		r = -EINVAL;
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION &&
> +		    (mem->flags & ~KVM_SET_USER_MEMORY_REGION_FLAGS))
> +			goto out;
> +
>  		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>  		break;
>  	}
> 
> 
> That's a kind of patch that you can't really get wrong (though I have
> the brown paper bag ready).
> 
> Maintainance-wise it's fine, since flags are being added at a pace of
> roughly one every five years,

Heh, true.

> and anyway it's also future proof: I placed the #define near
> check_memory_region_flags so that in five years we remember to keep it up to
> date.  But worst case, the new flags will only be allowed by
> KVM_SET_USER_MEMORY_REGION2 unnecessarily; there are no security issues
> waiting to bite us.
>
> In sum, this is exactly the only kind of fix that should be in the v13->v14
> delta.

Boiling the ocean can be fun too ;-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
