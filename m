Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24DCC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ORvkX7LIlUbPj/hkLdaH7k1BLJJqvWhK+pcYIDXvxS0=; b=ZExWby5DVFzm3tGwQ91xqFoAJu
	/cOl8H1oFXChd2UvKoJAt4c23LSSkKzYfsfjhlL6v6QJqcuZ6/Ybg9EEGB0IzfmWvdXU3jv1slxmn
	XuspV7Cez3zvXT9aM9YDe7pZqiSo7FpIu1VaUgxNzivYOg/RmCCl1sPL1qZTfqXwy2J0u91B4Tl1B
	M/fgEUkIo1hwNIu402N11TCP44bh93tdwKIpkXc+n91c/iMWUqqWCIyUt8Z2OuCnG16zsgSmHNrld
	b9Or0lkwkycs/wlQtfs+oHZdnyoPH/PS/cxrV5ZgFrLozIwnQ92tpv18UdL+zxFdOKE63Gnva+q2o
	hJCjlI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxUqs-003c9j-0Q;
	Mon, 30 Oct 2023 16:10:54 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxUqp-003c8U-2X
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 16:10:53 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da04fb79246so3988503276.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698682249; x=1699287049; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3/eJ4eIlm/QBKFGigGc88HjjNKR0Bxic1+CMFaJ9ygg=;
        b=UWFFhIlOQSlUqeBVcBYe4Y+hxkLGm/x/6GVROHD79PrzfC4l8R4a5c/7RAVuOO7HCA
         3+C5pDalFr0i+lPpvlhzY/VRVXEQ8zPsZbvyigIA6bbVDqrKIDkeaF6mCTlc6NXDgfvj
         IBWkrzxA0a0x9bEeQhmVKmNQacxfk8IjfLO/fbUt9U69yoZrbbW3yj2LD+7fj7iYKVcd
         mWhAe5r9vfE+4fX3QjGoUGZAJ9VSo7Sfjxl/a6jODzmn9O4GVhyyWPDmGm65ujN24SZZ
         xWqMN/S/vNymgKBjijXlfMJGMW1UWihwEZ0m//TlqMyPSm3JzGdj1D37ZXrQDPOOBpb8
         g0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698682249; x=1699287049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/eJ4eIlm/QBKFGigGc88HjjNKR0Bxic1+CMFaJ9ygg=;
        b=Da6kncJC4/Xqr+tAUDWVft4myQca9fktnsJ7rpfU9w+nU0yaRi1D6tns+no3OVx/5d
         jx7MXVvmCEdcvY5wQU0J0bXuQNKfj+jrz8ZkJeVQBQwCJHFsecLF5FYATFoLwECM/n/3
         BaiDygSQ4EeUy7+RQroyxX9qZa69CAG/WWVj+Y8pf15+kNKqocUFS6rYvAab5RHjYiYo
         jGyAEAuVWEwIqo4vrQIjJCrI5oalXb6Ltc+FDhycBysUQwi+kiHJByKTo1vpmGM0gj1W
         bmFpGqtnN6W/kNjNwMW8NxN6CN7thysp+ifmHvRyp9aqe8DdWf5TASERwoGSwPk3os8J
         c9aQ==
X-Gm-Message-State: AOJu0YxVV0z8RAd8Dn+nHuN7bYcspFtxxVXqi7SCOvevdRuahQ8JEtJc
	D8DzL+XidAMfptZHClR4rrZy1SK9u6I=
X-Google-Smtp-Source: AGHT+IG/nj4LaX3JPzHZqsehR5FWhArOOi7E0ApKeqEkunCLK98IonUlxUU55c5VBDsNlZFSGb1icvfnahw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr243782ybu.7.1698682249642; Mon, 30 Oct
 2023 09:10:49 -0700 (PDT)
Date: Mon, 30 Oct 2023 16:10:48 +0000
In-Reply-To: <ZT9lQ9c7Bik6FIpw@chao-email>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-14-seanjc@google.com>
 <ZT9lQ9c7Bik6FIpw@chao-email>
Message-ID: <ZT_ViJOW1p4TN_fI@google.com>
Subject: Re: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
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
X-CRM114-CacheID: sfid-20231030_091051_825716_BE12D4BF 
X-CRM114-Status: GOOD (  18.49  )
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

On Mon, Oct 30, 2023, Chao Gao wrote:
> On Fri, Oct 27, 2023 at 11:21:55AM -0700, Sean Christopherson wrote:
> >From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> >In confidential computing usages, whether a page is private or shared is
> >necessary information for KVM to perform operations like page fault
> >handling, page zapping etc. There are other potential use cases for
> >per-page memory attributes, e.g. to make memory read-only (or no-exec,
> >or exec-only, etc.) without having to modify memslots.
> >
> >Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> >userspace to operate on the per-page memory attributes.
> >  - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
> >    a guest memory range.
> 
> >  - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
> >    memory attributes.
> 
> This ioctl() is already removed. So, the changelog is out-of-date and needs
> an update.

Doh, I lost track of this and the fixup for KVM_CAP_MEMORY_ATTRIBUTES below.

> >+:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> >+:Architectures: x86
> >+:Type: vm ioctl
> >+:Parameters: struct kvm_memory_attributes(in)
> 
> 					   ^ add one space here?

Ah, yeah, that does appear to be the standard.
> 
> 
> >+static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
> >+					  struct kvm_gfn_range *range)
> >+{
> >+	/*
> >+	 * Unconditionally add the range to the invalidation set, regardless of
> >+	 * whether or not the arch callback actually needs to zap SPTEs.  E.g.
> >+	 * if KVM supports RWX attributes in the future and the attributes are
> >+	 * going from R=>RW, zapping isn't strictly necessary.  Unconditionally
> >+	 * adding the range allows KVM to require that MMU invalidations add at
> >+	 * least one range between begin() and end(), e.g. allows KVM to detect
> >+	 * bugs where the add() is missed.  Rexlaing the rule *might* be safe,
> 
> 					    ^^^^^^^^ Relaxing
> 
> >@@ -4640,6 +4850,17 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> > 	case KVM_CAP_BINARY_STATS_FD:
> > 	case KVM_CAP_SYSTEM_EVENT_DATA:
> > 		return 1;
> >+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> >+	case KVM_CAP_MEMORY_ATTRIBUTES:
> >+		u64 attrs = kvm_supported_mem_attributes(kvm);
> >+
> >+		r = -EFAULT;
> >+		if (copy_to_user(argp, &attrs, sizeof(attrs)))
> >+			goto out;
> >+		r = 0;
> >+		break;
> 
> This cannot work, e.g., no @argp in this function and is fixed by a later commit:
> 
> 	fcbef1e5e5d2 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")

I'll post a fixup patch for all of these, thanks much!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
