Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84989CD3423
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 00:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gtzIca1vFbO9eOfVblOXMXTHmcXYWgGUGXpJGf0Z4RA=; b=jgg0ivofSS4mRUThkkTFm0k6UQ
	NMEA4XpDQxxXdRjbJ46uXlh/A/QcUITniRtEMQCNNlDFlujI14yfNx28nqv7FYnQH1fI5rRszK/U+
	CfrN/3VKz882c/sDoUSVwvHDAkkYxP3yQ00op8n7ewqzz37XYq6ZRehtZkr78usIZ9bq0SQPve8N/
	wmiaT9ZmOMLh/vO6njRe47TYT8Qyn2AhPrJrGV9T7B6ynyRO0Uu8UEo9cH1dVCnt/fuxeSIS4APjd
	hzrwWU97IcHBd+AoJwtd4fP6zo5HJMF8OFQVRAfbrcNZMQyRWGbNEQb2z/jTLBSo+rEUCCp+IoJCh
	lQ+Q9XSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOIK-00GZFD-1j;
	Tue, 19 Sep 2023 00:08:48 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOIH-00GZDs-1P
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 00:08:47 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59c27703cc6so32443927b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 17:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695082123; x=1695686923; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dInZugQi4I3jT3AsjQuL7R2MGGG9K+dIBnr86/ph3q8=;
        b=a65hwXrfQyHXgDYe6XnxKZNx6Vn70ATf8JIavZCEqAWzw7esLm3cM/ae6QK4xsb9Rn
         BRTF9rCvXtCzMYOWedGjJlp4yeqO/JNCC/3dH5orgyF3ISY1GPdoGLd/2MCJFhDiAP4w
         xn0Ow7H6TJ9/iY7piZrFZNl8PlL60kCiA+MR/6w2vIfrtWcdwzaRGsIizxoEd4kmVSCv
         PzKKjI0TikoOVMEFxjElWQWuXub0hahVDzkzB2gpBdx+554CU//gbGcy4ECFAPeHdk/o
         mirjiVu/ySiLajC9o8B0WThZuPRoIP28+J0p5ODhb3t6uAopW9hVsxBQalzWc3yExLhX
         16MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695082123; x=1695686923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dInZugQi4I3jT3AsjQuL7R2MGGG9K+dIBnr86/ph3q8=;
        b=v8GjgQ8zAMulHV1869Tfin+rf+n1PI68gc6+u9pqqDgM3kCRpsDpqgt7Ad/+2gSqb0
         dLAOl1Tb0rtnbjoNTLLhfw1vrJiplGg9ZJjUKW13RYMAtHptEJNFUOV+sRrmOclzdQZp
         I0y6j0djngwKdWxAu/BPPXxAjKquZNDrOD4myyz/JYtgNBEOCuCcCD4nunN5QABJb8Xe
         //LKy1KAlNKKnq3zZAF/uyQpUEPpKf73s92VQ0Qp1Vv77EqeAov90gsPZReFPym3LZkL
         B9Ootjtp7e/K1Blt6UbrjPKOyr5rYRJdKTqdQyR97HSkmT7xfWvkKeY5KxRq1+YqypDE
         k+Gw==
X-Gm-Message-State: AOJu0YzvAYDkaXBQDo6Eo7iABPaQloGZ9l7ojR5AlV2FzJht6/oC1/9P
	WED978pOAxZfAfEyDYzZ6p93YZyoiLo=
X-Google-Smtp-Source: AGHT+IHHNvt5OesaYTZ4SrOkO6G/E0GpOB67x3jgD/5Z7IEbZFEyHH5t/MUiil/50JGkevI3xvv2hT/ge04=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:11cf:b0:d80:23ff:ae7f with SMTP id
 n15-20020a05690211cf00b00d8023ffae7fmr237508ybu.4.1695082122578; Mon, 18 Sep
 2023 17:08:42 -0700 (PDT)
Date: Mon, 18 Sep 2023 17:08:40 -0700
In-Reply-To: <20230918180754.iomoaqnw75j3rrxb@amd.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-11-seanjc@google.com>
 <20230918180754.iomoaqnw75j3rrxb@amd.com>
Message-ID: <ZQjmiE7cQ/4UynNz@google.com>
Subject: Re: [RFC PATCH v12 10/33] KVM: Set the stage for handling only shared
 mappings in mmu_notifier events
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
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
	Quentin Perret <qperret@google.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Ashish Kalra <Ashish.Kalra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_170845_495515_D03EEB7B 
X-CRM114-Status: GOOD (  37.88  )
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

On Mon, Sep 18, 2023, Michael Roth wrote:
> On Wed, Sep 13, 2023 at 06:55:08PM -0700, Sean Christopherson wrote:
> > Add flags to "struct kvm_gfn_range" to let notifier events target only
> > shared and only private mappings, and write up the existing mmu_notifier
> > events to be shared-only (private memory is never associated with a
> > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> > 
> > Add two flags so that KVM can handle the three possibilities (shared,
> > private, and shared+private) without needing something like a tri-state
> > enum.
> > 
> > Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  include/linux/kvm_host.h | 2 ++
> >  virt/kvm/kvm_main.c      | 7 +++++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index d8c6ce6c8211..b5373cee2b08 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -263,6 +263,8 @@ struct kvm_gfn_range {
> >  	gfn_t start;
> >  	gfn_t end;
> >  	union kvm_mmu_notifier_arg arg;
> > +	bool only_private;
> > +	bool only_shared;
> >  	bool may_block;
> >  };
> >  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 174de2789657..a41f8658dfe0 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
> >  			 * the second or later invocation of the handler).
> >  			 */
> >  			gfn_range.arg = range->arg;
> > +
> > +			/*
> > +			 * HVA-based notifications aren't relevant to private
> > +			 * mappings as they don't have a userspace mapping.
> > +			 */
> > +			gfn_range.only_private = false;
> > +			gfn_range.only_shared = true;
> >  			gfn_range.may_block = range->may_block;
> 
> Who is supposed to read only_private/only_shared? Is it supposed to be
> plumbed onto arch code and handled specially there?

Yeah, that's the idea.  Though I don't know that it's worth using for SNP, the
cost of checking the RMP may be higher than just eating the extra faults.

> I ask because I see elsewhere you have:
> 
>     /*
>      * If one or more memslots were found and thus zapped, notify arch code
>      * that guest memory has been reclaimed.  This needs to be done *after*
>      * dropping mmu_lock, as x86's reclaim path is slooooow.
>      */
>     if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
>             kvm_arch_guest_memory_reclaimed(kvm);
> 
> and if there are any MMU notifier events that touch HVAs, then
> kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() will get called,
> which causes the performance issues for SEV and SNP that Ashish had brought
> up. Technically that would only need to happen if there are GPAs in that
> memslot that aren't currently backed by gmem pages (and then gmem could handle
> its own wbinvd_on_all_cpus() (or maybe clflush per-page)). 
> 
> Actually, even if there are shared pages in the GPA range, the
> kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() can be skipped for
> guests that only use gmem pages for private memory. Is that acceptable?

Yes, that was my original plan.  I may have forgotten that exact plan at one point
or another and not communicated it well.  But the idea is definitely that if a VM
type, a.k.a. SNP guests, is required to use gmem for private memory, then there's
no need to blast WBINVD because barring a KVM bug, the mmu_notifier event can't
have freed private memory, even if it *did* zap SPTEs.

For gmem, if KVM doesn't precisely zap only shared SPTEs for SNP (is that even
possible to do race-free?), then KVM needs to blast WBINVD when freeing memory
from gmem even if there are no SPTEs.  But that seems like a non-issue for a
well-behaved setup because the odds of there being *zero* SPTEs should be nil.

> Just trying to figure out where this only_private/only_shared handling ties
> into that (or if it's a separate thing entirely).

It's mostly a TDX thing.  I threw it in this series mostly to "formally" document
that the mmu_notifier path only affects shared mappings.  If the code causes
confusion without the TDX context, and won't be used by SNP, we can and should
drop it from the initial merge and have it go along with the TDX series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
