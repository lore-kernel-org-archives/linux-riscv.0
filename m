Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AD3C00528
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wx3ANuqBEnZ/0WESHu7i2oZVhOYyz7SN+TUpczYi9+U=; b=xDBRaR7jL9IamgRFhZKEjw5zes
	WZJcpy41x+WBLdTf7jI+8iAFlkeXen3CswZ7OuhcEVDMlK3DeM+wDHpa14ut0ed+PrZeIUV6umeQg
	S2XyJWiZYqgcCRHuj3JbPNbyifoeL5DNOSfWm0lDgm+mjeLg9C99mXfNAI5UN4+kJFu83rKq3d2Lw
	8a3AZu/rJyzVouQ4hkKzFax9RSDYoY+ifDwXl4QnhtdKGxPZNmdDOopCDfQr8D6ApfLyrOfKtzjsX
	UKfhtwOk2RwGV10atqyHP7aAg7QDpK+rAr+gmvV7ByirtMXt7UZFa6ePl5JOTnEkZ6QB6usn6ehHZ
	VIRKxGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMa8K-00C8nK-1J;
	Thu, 20 Jul 2023 20:20:20 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMa8H-00C8lH-2E
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 20:20:18 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c6db61f7f64so1041033276.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689884413; x=1690489213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1/m4T5EZ9UQZdIAs+CFQOUhGGMJn3z6NAlZtvxtssM=;
        b=mbsHztlENnOTDgeCIXRdF8x4x9OfLSlTRQf7EJhk2yHC8ssudjPjJb663muGwwAUde
         HXusCSecX8QAy71He4xwRicW2VAZ7RFVOVmJQZun5eygpfocaFcEhJVdz1DXPqrP14f5
         Q9r/63tqP/iMmto5FytBtXhV7bicbpwNBGhhzc7AVroN6uvn7SvVpiEQCLnIHWcphWhi
         L6PAVpT/JWEQDmjGRRbXmNFkgwEJImoyKV1xDjpLesAAmXECVa9yb/PUNJmSrVHElsLh
         RUk/Cxj/0yokxjf+pISM5EmdcaPLl3odQz7EeG720kJEtO6hviZvCg7ubhY+cpI9tJBr
         NkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689884413; x=1690489213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1/m4T5EZ9UQZdIAs+CFQOUhGGMJn3z6NAlZtvxtssM=;
        b=h5wMa+CHzUjblFu/7gSQwunfdzqyb3BkwTEHKsChS8WUDMovYBB30RPLuYYdh1z0oa
         61vEhlsCyIwq9+Qb45E9QhYVPNFyY0lNQEY4nkzasynSbGVDjy0SXLaiv0kzJD7TnJJq
         3YcHAO+QeuX8PQvhb1v/y4ewwqZviEZuZzb9Wc32CjyIWldiknvST2L04yG7Z10TlS0Z
         ztP4Vas1O889wZmd7LAHiUvdwdMtVtltVdQ2m+Qsuuy8FHBpurIdwFuvChWDsStdL+by
         s2fsh5jEyc1XJzZ9ZpyQcj/UdxfSBZreA7zqenCXN4k3TypEfKbvr1Rqcf9UNDv2v+8R
         l17A==
X-Gm-Message-State: ABy/qLZ8HeVJAgtIyR+B51qOu0aTxQC2SWhvJQ0FJlE3oBhl5vNA/1d5
	IGJ2gC9mxWxJaD6P97J7jTdAPdjFdo8=
X-Google-Smtp-Source: APBJJlHJCm6H269xOtL/2AMirqWxt3kOhxlKiB8lLLwF2CbQnv6wXW7fNhFjFSiI4U52DqkXiLsyKn98s/w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4d08:0:b0:c6c:6122:5b69 with SMTP id
 a8-20020a254d08000000b00c6c61225b69mr236ybb.8.1689884413509; Thu, 20 Jul 2023
 13:20:13 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:20:11 -0700
In-Reply-To: <20230720190211.GF25699@ls.amr.corp.intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-9-seanjc@google.com>
 <20230720080912.g56zi5hywazrhnam@yy-desk-7060> <20230720190211.GF25699@ls.amr.corp.intel.com>
Message-ID: <ZLmW+9G6EbKLkOOz@google.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
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
X-CRM114-CacheID: sfid-20230720_132017_748320_A86EF374 
X-CRM114-Status: GOOD (  15.22  )
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

On Thu, Jul 20, 2023, Isaku Yamahata wrote:
> On Thu, Jul 20, 2023 at 04:09:12PM +0800,
> Yuan Yao <yuan.yao@linux.intel.com> wrote:
> 
> > On Tue, Jul 18, 2023 at 04:44:51PM -0700, Sean Christopherson wrote:
> > > @@ -2301,4 +2305,14 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
> > >  /* Max number of entries allowed for each kvm dirty ring */
> > >  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
> > >
> > > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > > +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> > > +{
> > > +	return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> > > +}
> > > +
> > > +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> > > +					 struct kvm_gfn_range *range);
> > 
> > Used but no definition in this patch, it's defined in next patch 09.
> > How about add weak version in this patch and let ARCHs to overide it ?
> 
> It is guarded by CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.

Yep.  I don't love the ordering, e.g. this patch can't even be compile tested
until later in the series, but I wanted to separate x86 usage from the generic
support code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
