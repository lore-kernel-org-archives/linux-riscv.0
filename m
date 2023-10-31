Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02D0C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eClB8kMwFeKjnGkoe0iw+i7jw33TBaa6My7nPeBGr/k=; b=claUB8AFf+xLOMUuQ1EeB4ds2i
	HaZXcgZMx3qMMA61NzyepcvZJI8FNjm9bPcSK5K9BHxVogPLHg68qlfoRyrSH+Wy2WaSliknfJICw
	RpMOwq6Antxd5dqnOhOJsGzbD6PnAsMXwzHvdZCS6lsu1wzj30rgdbUyTuJKeAkQ2G5HDWE9ywLUQ
	waXlM/De2aTGc09y30IdMbdGZzb9dYNpjqRJkKoYOrBY9lDbTF6UBcBIwfy+lH5+DL1vzQo9qXhnW
	i9fDM+aQA2xGtsLQ/mxbYtE0Pk+aRBSm22p8gD6K4mT5LcZ7zVnYHcOWt1qTOtRg5DTvMh41Yy+bw
	oZWu/bBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpXc-005Pnu-0Q;
	Tue, 31 Oct 2023 14:16:24 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpXY-005Plh-2f
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:16:22 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc591d8177so15197515ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698761777; x=1699366577; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SCWDVcx1K76tZHWI6JguONJ6NnGeKLP7+QbYfrb3Rs=;
        b=KBY6N2Lbd87l9vaXmLehzeqK+hRZwP8dJVF6XwdV4rjbeNUQVnHg5X0ef6Hjs1lCFk
         b32LAMNidP+u3WB14OP54SJ6j3+kaVOoTUWSF6ixinumkKoHwKao1oKEjozFoNYo9EBL
         EIUQd1AkK+xx/IUmnlByJPZkPu3T3/pVgiBb3GXdc6w0dmQdJc6Vj5kfg1Jlh/Bo5SG8
         OTIOCxRJApLVL+AY4LC65gySo2ZqIj1agg1vihUSUQfoGf60dO1cVPRl6hZKMq2sD8m6
         E+XmXgy3dNH3+4voCB9g4EdP2jTDU1pA1xWF7kQDps5E84fjpoaP4RzXmuWkoKMVBjox
         rRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761777; x=1699366577;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SCWDVcx1K76tZHWI6JguONJ6NnGeKLP7+QbYfrb3Rs=;
        b=XU0GByD16agG+72fiaRYJp7Ky+PdSDICRwyxSpw8kA6kYPwZ0HpaJuH6O88yLIouYc
         VVmQ23AVXUeiPIfMMfEcyu4fbFwL7jCuc6nxAy4HZqkj2yuRJevhCY1SGniQ9G01O8VE
         BsHcvIkd2Xz+W7cK9qDBknq/eM4Z/Lu7Xtve15aK3l0YfQjJpn62BON/YfoKbvQxWgrl
         lMYFlcAu5ykIFfsIgdjR47KAqEMYsT/wK3DyokhrD0yst2Nhs8Icyk/STPoLONVrutaG
         t2LXu8A/V0mRfkRQw2AE9STxzB4kdtH+ULFLT7qYAIq0QEKGnPxtXliNyj18+RFYJy4F
         KAGQ==
X-Gm-Message-State: AOJu0Yw5vHCzxaHu5XeBzLYQHdDINlhLMX56k35DWsNQNnMCD/6A8jEO
	O9tpGxRDH23qe4Qs4Sop+JZRDtwM5lQ=
X-Google-Smtp-Source: AGHT+IG8tFKfIuO6cbI6ukftnUzYB8muWE8fOHZgWpajrHJaT+RkL+zDaTOo8ZNIlEatfvapWXD9jFRr58g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2616:b0:1cc:2549:c281 with SMTP id
 jd22-20020a170903261600b001cc2549c281mr206233plb.13.1698761777291; Tue, 31
 Oct 2023 07:16:17 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:16:15 -0700
In-Reply-To: <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
Message-ID: <ZUEML6oJXDCFJ9fg@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
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
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_071620_869703_9DC1FE08 
X-CRM114-Status: GOOD (  15.62  )
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

On Tue, Oct 31, 2023, Xiaoyao Li wrote:
> On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> > Extended guest_memfd to allow backing guest memory with transparent
> > hugepages. Require userspace to opt-in via a flag even though there's no
> > known/anticipated use case for forcing small pages as THP is optional,
> > i.e. to avoid ending up in a situation where userspace is unaware that
> > KVM can't provide hugepages.
> 
> Personally, it seems not so "transparent" if requiring userspace to opt-in.
> 
> People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE
> support, or check is the sysfs of transparent hugepage exists; 2)get the
> maximum support hugepage size 3) ensure the size satisfies the alignment;
> before opt-in it.
> 
> Even simpler, userspace can blindly try to create guest memfd with
> transparent hugapage flag. If getting error, fallback to create without the
> transparent hugepage flag.
> 
> However, it doesn't look transparent to me.

The "transparent" part is referring to the underlying kernel mechanism, it's not
saying anything about the API.  The "transparent" part of THP is that the kernel
doesn't guarantee hugepages, i.e. whether or not hugepages are actually used is
(mostly) transparent to userspace.

Paolo also isn't the biggest fan[*], but there are also downsides to always
allowing hugepages, e.g. silent failure due to lack of THP or unaligned size,
and there's precedent in the form of MADV_HUGEPAGE.

[*] https://lore.kernel.org/all/84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
