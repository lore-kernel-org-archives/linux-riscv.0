Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CB4EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oSHfT4O3tUTD1XeVOTULRwSGhVMBNRI0+NbQepTQahk=; b=nZbxdLAzwEG07fxaRxsko5ucGu
	zrs0v1Hqc0Mi5ltPdKu/I6VPyWGrimfEqOjp2fKWnVQaZBd289NBbwMjEuAeTQ+lG0Ez7peGgGuq3
	lQ5KDal1f2MjlpWPvp4BSTmOZW33teOpuHDvENH9Iz8s8iiSBkkycFK2KEpRf6KAQZ8FTnl5hvfu0
	5xB6nCgLweL5O5gZkxPTA6AZ54NAiewVLjV9olj6lGugQjb3U43bu8lt+nKgwCwsr6r4VnmoJXP0p
	iZ9zm99Z03024cDG7H3uGRTOYA4fBMCfU8mpq355qUTljKQNFQW0fAuFtPs+MtwjKgGIqWrlO9zK2
	QMENZhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMthR-00EjJS-0d;
	Fri, 21 Jul 2023 17:13:53 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMthO-00EjHG-0c
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 17:13:51 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-583a4015791so5041017b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689959628; x=1690564428;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7shZuEDiffXRYK22UXnQcffVUND6wfTW4U7DmHj+BWc=;
        b=saEUf4445sfHkPWRX975heL8zENfXcs3PgCyCgvEVdQjEpNK/pp+iAjdHt4YEb3A4E
         Wx6AMp1fx4AxdUC7quE/wuY8PzajpllFI1PSVxa0GJ6TCvZZ95BwZYWsRgoM01BQ4SqE
         g1i1UMNIUCRiN6vVjQF+QtV7pxLVFxnr+vtjGFTshuCRS/R0Np16E0/qf+bH5mnx7XFz
         ZsljdMjRbBLWTIazxQedjqyAevMpWeXTTd8MiT3v+VX/sBebfo66Po7WIiS0jw2kNrZS
         H5psY9S7R0h0zicR7miAPapKCtbYppPvDwh7bNN96b+Zux6kO9omgHgr2n7bbHvjHh23
         55GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689959628; x=1690564428;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7shZuEDiffXRYK22UXnQcffVUND6wfTW4U7DmHj+BWc=;
        b=Sx/r6ecTqDmcmLD+bh98y2KBNKTD1J82a29qPVVJXX4b7dyim4Epd45H6VznUpiqct
         fNl2l5lMjROnC5fNGlwbeqc+18mTI48puJmm5s33lwIY7O7kZBD4kida6SMmdVmwgWgg
         rTSBymSaaVYi6XuBuGrRAX9ZmWgBQN8xjz6rgrzthA3/7AFhGidz4iPcq4dedks5JXkW
         elay50XqsbUqXCRsZbePNfuIURtNfmM/XEjDPOaUbjg/QOf58JJTQ7UUSA7yVGgcqClP
         gq/EWkZGSQ8waZxFvm1FgThy/ZeoEaeeZyLGfujkbs4Pgg1NSAOm5kAIL6e/rs3vu41O
         v/zg==
X-Gm-Message-State: ABy/qLYgoR0ROIi3I5QNzh0qjgQvqNIFmc7vHrXMXIRV2b3rtOf7OleT
	i+rxQnXxKqzCdn5l+2ol5hemrPqXkIM=
X-Google-Smtp-Source: APBJJlHTu6oxQip7Fs57WKX81frcXYslN0cZxNmgdAvx9eWDlCTFu1+cjXODNvw8IvlIlsVUOd7h6YXth7Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a28f:0:b0:c6e:fe1a:3657 with SMTP id
 c15-20020a25a28f000000b00c6efe1a3657mr16139ybi.3.1689959627795; Fri, 21 Jul
 2023 10:13:47 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:13:46 -0700
In-Reply-To: <84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-14-seanjc@google.com>
 <84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com>
Message-ID: <ZLq8ylTsFQ1s4BAZ@google.com>
Subject: Re: [RFC PATCH v11 13/29] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
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
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_101350_228873_67ED8D74 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, Jul 21, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > @@ -413,6 +454,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> >   	u64 flags = args->flags;
> >   	u64 valid_flags = 0;
> > +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> > +		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> > +
> 
> I think it should be always allowed.  The outcome would just be "never have
> a hugepage" if thp is not enabled in the kernel.

I don't have a strong preference.  My thinking was that userspace would probably
rather have an explicit error, as opposed to silently running with a misconfigured
setup.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
