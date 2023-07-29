Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F93EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 00:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ivwInhwnbwHHrdTnPpG0krd0dJOZe3dwTugCnFeiLKc=; b=ILAQB+oIKlg64tjUruevoJsztO
	XvMHFAwq4/Vxr85nGm8F0A1hp37vQnFN4FmRHH4EkehRLdVYcUY7f9rAJJP0CkpXBp3WY/hKBtDHm
	yxH/ItxJ91ysS/rwo43bj23ExPS6D/vidLpH9K6kqR0ytzFjxBVz8IbSCu0JiEFUkjk2446P8Pl3U
	wAcIOioBaY2j1W3eKEaKgrbQx1ZyfSMAYolEVVYanzmV7ukKaeHyLaohtEfr8atXBashgQtOEkD8l
	pYgMjNJfqNgCj83YcCm4IoJBXpAjcipE1ScDKEhtVP+A7QoYzngBVATdmyZo/Q/PpitCWMQL7wdZf
	WX9MRPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPXQq-005ZQy-1Q;
	Sat, 29 Jul 2023 00:03:40 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPXQn-005ZPP-09
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 00:03:38 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bbf8cb6143so1944275ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 17:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690589015; x=1691193815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJg9MbukUkeAf25VcBnSvGPEfaUIyqqF94QJU8orhSY=;
        b=Zp0GOXqU9vAtanM7byzLEY1ZTAuQCQrnfrak1thKcFFHMBCZO/N4KqKDBd5I3kJffW
         Vh8ovzLtMVpv7R9tgjnJuitRPz0iowTqbSccpqb9sCrit8s8jZkHgE3EKWmaz9/YJybN
         uhR+1LBQ/EGKFm12kofvmo1N8Or8Mhd5I9QIxgAZxJjUnAncn/OfNQ+xg9V9rSfFrTW5
         6+gyXWvxsDfod0XUAEoSS/aCS0HqakbjGuI1/I8BU2Uy6FDW2YJ6LrCVt60GU5GehRX5
         3Ug/sPFW2Iawha4cKCkpfEtG9Mwjo7aL2M8Rz65tztUDm7ObzFqkZ6ozvUAWJtziwaLO
         +gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690589015; x=1691193815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJg9MbukUkeAf25VcBnSvGPEfaUIyqqF94QJU8orhSY=;
        b=c1f/bf92frMy1coY0w4dZcPGIQKn+19tswqnDQfycEuQVB+nTF1BDLuapVvEcoJImm
         sWuTS3vsy+nI9hbow4JLLUDwdYCMiSNGO+/4Ft8UIM0paKJWT5aKDvUsS1LbCI/+abC5
         aNBchkHaSdlYM/zSMMfMmq4Brp13A3Sk2+4lvNNYD3PlOlUD5uw8l2/kcDOrhax3jNVg
         N53BOlu9qxeOxBYb/dHNczSHMQqMLGfB5D2RvyGExiLR5h6Y7+q8dWuZv5wOCoYSdi+N
         KhmAQ5LExStJvLQcn1yG1z8InJ1+IbdYCKrOsNq5qY/QxQlMHzlRMzX2NxjydoPnt7fa
         FKNg==
X-Gm-Message-State: ABy/qLa3JEqJqfGVBjsDFVF6fXDX854thXYwdco1DtpBBrVzSkDLqOjC
	DV9YSWJJLaOOPQV52ECqJXa0jJXPTGE=
X-Google-Smtp-Source: APBJJlGy4rMQGFiWHQC+IuRONPQH0HvvNAt7asJXiFk+bZ/uVjfNOjPYVgrOl+x+eQJGyA+j61wbqvGP0DI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c951:b0:1ae:6895:cb96 with SMTP id
 i17-20020a170902c95100b001ae6895cb96mr12864pla.5.1690589014804; Fri, 28 Jul
 2023 17:03:34 -0700 (PDT)
Date: Fri, 28 Jul 2023 17:03:33 -0700
In-Reply-To: <ZMOJgnyzzUNIx+Tn@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-7-seanjc@google.com>
 <ZMOJgnyzzUNIx+Tn@google.com>
Message-ID: <ZMRXVZYaJ9wojGtS@google.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Quentin Perret <qperret@google.com>
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
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_170337_113067_1D0D3CB1 
X-CRM114-Status: GOOD (  16.73  )
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

On Fri, Jul 28, 2023, Quentin Perret wrote:
> On Tuesday 18 Jul 2023 at 16:44:49 (-0700), Sean Christopherson wrote:
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
> >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> >  };
> >  
> > +/* for KVM_SET_USER_MEMORY_REGION2 */
> > +struct kvm_userspace_memory_region2 {
> > +	__u32 slot;
> > +	__u32 flags;
> > +	__u64 guest_phys_addr;
> > +	__u64 memory_size;
> > +	__u64 userspace_addr;
> > +	__u64 pad[16];
> 
> Should we replace that pad[16] with:
> 
> 	__u64 size;
> 
> where 'size' is the size of the structure as seen by userspace? This is
> used in other UAPIs (see struct sched_attr for example) and is a bit
> more robust for future extensions (e.g. an 'old' kernel can correctly
> reject a newer version of the struct with additional fields it doesn't
> know about if that makes sense, etc).

"flags" serves that purpose, i.e. allows userspace to opt-in to having KVM actually
consume what is currently just padding.

The padding is there mainly to simplify kernel/KVM code, e.g. the number of bytes
that KVM needs to copy in is static.

But now that I think more on this, I don't know why we didn't just unconditionally
bump the size of kvm_userspace_memory_region.  We tried to play games with unions
and overlays, but that was a mess[*].

KVM would need to do multiple uaccess reads, but that's not a big deal.  Am I
missing something, or did past us just get too clever and miss the obvious solution?

[*] https://lkml.kernel.org/r/Y7xrtf9FCuYRYm1q%40google.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
