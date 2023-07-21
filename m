Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B3CEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 22:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jBtwPXs2V/erdVRqr1boDIwqLByyQxzazGBKE4tGCJI=; b=coGIZo8IM9ze4wP6UE7mj4ZM9K
	3Bx1UseVPpNwYwcPsYQ/srfxf4K3IN+mS4iw7f7/SIjj2z0sb+/q8RRoR5mQdz3rONvwjSE4UgCTS
	P9PUNBEIxrhhDLi4Rz7TcV1rYA42AWvMqrh34y0hEeCoRvkwctBy4dQF5Xgv3tdcOeOCc8I3Th7Kx
	TO4u7CvgcWBrlM++xe2jmtSntf3tcc8nDpnKflIflHU4T/jQobwj2HTUC1xaL8yZie7ULGkl3JOEI
	4MvY+EyCWsLtbHe5AkZYkPCcPFnCnP6gOsMYv83Cx1RYgQOJPVeKgi69X20toY/id/Jc0cGF9Jrsr
	UeYmxEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMygc-00FHeK-1t;
	Fri, 21 Jul 2023 22:33:22 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMygZ-00FHcL-0b
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 22:33:20 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57320c10635so24254017b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 15:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689978797; x=1690583597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7T9EVRBobAr4a8JPgfiIjIX72kF/VyhERBKOIDOEvTo=;
        b=N3JmIIRFuucWrTRji2j76NW5FMl4jS4wLA3POQW0VLRrR4sFhmKgj7pRUj3gSs0yqe
         WZvjiVqpyglaAnq94LWefXiOIlgXr/PrbktD6W+TBAFf6s+alvi+gxgQyH8TNpVAsODx
         OCRkSmym8Xr89af+taUXT0Vhz6Xh0SqYzK++E+LxDlItaWIfk/xiv3hy/q9bOsyCLBei
         XOyxBMd+5ThifDUK6/o5f+QTqfW/eyfYM90Y+kU5f1e/gaMgZLzn2OVn9bd0Flf7Aat3
         ovp2GWeXuTu2BrzRvrwJog7aZBAUD7Ob8wE6NUPaB8bQmPi6OopUS5w2j6M71SZpRLW7
         K0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689978797; x=1690583597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7T9EVRBobAr4a8JPgfiIjIX72kF/VyhERBKOIDOEvTo=;
        b=WxFNRisM/COOxcP1QJeVR/dUnZh/YLnvuOPxtifuKrFiZa+BpL0IlSvGVUpW3f/YPB
         myw5qQh86kJh1esh1mNr8o3WG17c5pkTncSi0rBlCPmhtW5z+O2i+WQ1JpCaBd5URxy+
         BGICEaJLFiSukmOzw63UFGuxWn0DtrOCaBz+PL8u76HkKqBixEKHtPq3VIWv0wSqFNt0
         j/dAkDOrk7N+9BFNhxFOOUlAs+N2efcve6BHPvGJarOPf7qom+RjtpCLeWdzTzivW7rj
         ffMi/6RGoVM1SV8xGA1DxWXSEBCnRHMuQ6sPQluHakV5fGnfMB0NMg+bzwtN3JkG+bmS
         6cTQ==
X-Gm-Message-State: ABy/qLa8Cjuv71MleMCoKl+APpy14HaD512DZ/9lWE6vE12uZ0xz6Alm
	8dPxTj0kfXiX+y2n1+lnASti2AXSq0A=
X-Google-Smtp-Source: APBJJlHilhePzxpErmYmDQimNKPr2Kn3t6yMJLQXIDH2a2VxS3jSVStiMTfJxkBt/UbXzPR1R9iVHrOiOZs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ce82:0:b0:d04:faa6:e62b with SMTP id
 x124-20020a25ce82000000b00d04faa6e62bmr11683ybe.6.1689978797172; Fri, 21 Jul
 2023 15:33:17 -0700 (PDT)
Date: Fri, 21 Jul 2023 15:33:15 -0700
In-Reply-To: <20230721222704.GJ25699@ls.amr.corp.intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <20230721061314.3ls6stdawz53drv3@yy-desk-7060> <20230721222704.GJ25699@ls.amr.corp.intel.com>
Message-ID: <ZLsHq69sMG7pmRiz@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Yuan Yao <yuan.yao@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_153319_226077_7059B851 
X-CRM114-Status: GOOD (  14.85  )
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

On Fri, Jul 21, 2023, Isaku Yamahata wrote:
> On Fri, Jul 21, 2023 at 02:13:14PM +0800,
> Yuan Yao <yuan.yao@linux.intel.com> wrote:
> > > +static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
> > > +{
> > > +	struct list_head *gmem_list = &mapping->private_list;
> > > +	struct kvm_memory_slot *slot;
> > > +	struct kvm_gmem *gmem;
> > > +	unsigned long index;
> > > +	pgoff_t start, end;
> > > +	gfn_t gfn;
> > > +
> > > +	filemap_invalidate_lock_shared(mapping);
> > > +
> > > +	start = page->index;
> > > +	end = start + thp_nr_pages(page);
> > > +
> > > +	list_for_each_entry(gmem, gmem_list, entry) {
> > > +		xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> > > +			for (gfn = start; gfn < end; gfn++) {
> > 
> > Why the start end range used as gfn here ?

Math is hard?  I almost always mess up these types of things, and then catch my
bugs via tests.  But I don't have tests for this particular flow...   Which
reminds me, we need tests for this :-)  Hopefully error injection provides most
of what we need?

> > the page->index is offset of inode's page cache mapping and
> > gmem address space, IIUC, gfn calculation should follow same
> > way as kvm_gmem_invalidate_begin().
> 
> Also instead of sending signal multiple times, we can utilize lsb argument.

As Vishal pointed out, this code shouldn't be sending signals in the first place.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
