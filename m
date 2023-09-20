Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D48C27C7B
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 21:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PBPZm6J/Z/jpvFYI/XXDwJe0heKQXG8Qu/TpM/H+f1w=; b=V9hqSR17EwUguZ4g30uky69RRj
	5AfRk/InqIsCjqKrt11HIbfQnwtnuvox0y38KNXT2UB3hHwalOI2u6ogSmGzFb5EE6IszD8vRoeHR
	B+pVytI3McooTJ/8IpxXjS/NGOHQD3frZ3pCTl6d46CR4bScoEq6xISt4qRKwgciABYb9gHW+WYfh
	SRMADC/tatSTESiTHhAlVU0pyS0HVNsvmU9rRhlrc8IcGC9cNAI3AyIKrR4ofyYzAw+AABydMDBqC
	XWXWh3ze4RS5VrqMphY07hPHNepB+V/tWwX/W8m9vhMKpnTw0/KE43t4Jtv9M88VDnR7vmxHAvudP
	fzlDwk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4MX-004DNH-1o;
	Wed, 20 Sep 2023 21:03:57 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj4MT-004DJW-07
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 21:03:55 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c577fea3dcso1840575ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695243831; x=1695848631; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QFTXI1M20f8gmG6BvRAdcxEpoXePrbyr+CokqbvWBWc=;
        b=Eac45T6a64OuRp9mWBK8Mj1pihqW3BUD6aunWputlsg65DvVwSo6q7Fp4zUdHjgRvX
         Ty5tJo7WIPCXKNb+uBGjTeYSpj3lVbPVROtqrL61eyJh1d7j5/bM0YoqSWLUu+GfIBqz
         +ynp1xNk4PbS1+61noK0JRC2L+wnMqcs1DgVlsN9XpE1Vrk8SsWhW8kdo54I9xLGZpeW
         iiOCTR59U8Lxp6sYmzPjTLcfYTOPYZdGctQQ+OZKHVU3e7yaAX8DTnLlmtlVcitfPW13
         fXvA6DBOMLQ74SaUsnPJSZrFHlA87ICWhHP0U46Sn82qn5xHPzEOTwvJLYsB0EaQPb41
         FvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695243831; x=1695848631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFTXI1M20f8gmG6BvRAdcxEpoXePrbyr+CokqbvWBWc=;
        b=c3KLNzbSkEQOs+nB4fESv+cHZ/NbMbGgZ4589Qqrf8KGWXaJgvVWLn+B90EuOGZLoW
         Y36YY58U8W5AHaQcwV4qxtKkybGkXNDGFlJLXXyZd+Rm18VAN8Q+0413r0pWUkbJQyDw
         Ws7mu0b1OoTRbL0K9qp9cd8Y3cRQlvJVH10Vs/VkpJAbpbfALmGu11SXfkpbqyLH03VC
         E/rnJNBiLlxmTpiLGUVi7zZjxul6mWWcupz/dwQHlXxV7dNU1mEgscOlWUSjVFmWRHos
         9T1p1iFZJpDMKC5QLYdsn8PCRVDBgxhf5KE7KF9DdfEOP5j4Cw8tlmGLYf2E7o76HAyY
         yVPQ==
X-Gm-Message-State: AOJu0Yztpy+yyeDD+fcb3Dq3iruS2UdkdKypKN7Y7+KHT/7vgLe+dHMU
	zNtlVEB118yMJOCjwCkYUztDKOSwIYo=
X-Google-Smtp-Source: AGHT+IH5QBEwnaGAG6ouJVZQG2FiwG4z7ywKiDhgLSOOF+0VMXfLus6G3HR8pg7XpQjZrIgu3wnPZ1Tf/l8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c407:b0:1c3:411c:9b7c with SMTP id
 k7-20020a170902c40700b001c3411c9b7cmr51568plk.13.1695243830643; Wed, 20 Sep
 2023 14:03:50 -0700 (PDT)
Date: Wed, 20 Sep 2023 14:03:49 -0700
In-Reply-To: <d66795f8-e524-2912-4b71-92ca4ffe8807@linux.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <d66795f8-e524-2912-4b71-92ca4ffe8807@linux.intel.com>
Message-ID: <ZQteNbPfx6P3r6B8@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_140353_076667_541F3336 
X-CRM114-Status: GOOD (  12.06  )
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

On Mon, Sep 18, 2023, Binbin Wu wrote:
> 
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> [...]
> > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > +/*
> > + * Returns true if _all_ gfns in the range [@start, @end) have attributes
> > + * matching @attrs.
> > + */
> > +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > +				     unsigned long attrs)
> > +{
> > +	XA_STATE(xas, &kvm->mem_attr_array, start);
> > +	unsigned long index;
> > +	bool has_attrs;
> > +	void *entry;
> > +
> > +	rcu_read_lock();
> > +
> > +	if (!attrs) {
> > +		has_attrs = !xas_find(&xas, end);
> IIUIC, xas_find() is inclusive for "end", so here should be "end - 1" ?

Yes, that does appear to be the case.  Inclusive vs. exclusive on gfn ranges has
is the bane of my existence.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
