Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237CAE7AD75
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 15:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=31+jpTI+0vFu3wAQV3zSE4Y9Pcridjsb2bmQMw9l7mU=; b=C4yVTM2S4/JQuzaULXT7gRo8ni
	SnUGAzAOrInShsn074mMEAVis8n1Id2OObuKP8YFVxXgQ5Dxf6Shdkmb2pH9Dxp5XpLDfHqP8OB7D
	tXsnLERTRYLteGYcGdaGwIzvt1sZQYC55iPQyUv8AHDWBT8aT+dIuMdgmnVGEpfA3XRN7yGn38ENi
	bpyu+QK4jM8+0aK6UwUPdVQS6BySRka2R+t6Nx96akJ+uXs4Tug4Na0bA9srxYgEMgWLmMFzxq87F
	En0xXAKwKz6PznC3/+ZJh4BEFj2umRkKwAh/hzJL95zI2h5Ymfxz5Yy0gPMNjW+7gsXlSc2396IiH
	aPNEpnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnho5-00Ev2t-1e;
	Tue, 03 Oct 2023 15:59:33 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnho2-00Ev2A-2X
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 15:59:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d81646fcf3eso1311278276.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696348769; x=1696953569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP89tk8jeFUDqiHwgtcyinENLLmFDFAo+sp2wFgmRBw=;
        b=Uurf1snVUCspgWuf04/nuRKIiF2JuCmrBORv4xcyNhmes3ZGaLLIgYqVWNDNRLmvCr
         Sp6/XR+uVl4ClNidiIn87HttBPVsAi04urIHfCuib9SBSUUbB5gipxR0W34TEy8rsR3/
         fE/E+j35U1mCXLEqlVin+GxKkdw+tsMzNuVG/Ry1QvfcnnagShCzxDfiufWDDsKw3dF6
         gxR9mg2v+YiL93w4rdKRB4yrnFwicjZEHdzMBMTRKvu4m9K9Vx9i1te/OVonOZ9pM21P
         a9K0lYmJLhDrllFpno9KICi2IiB0hdyxCZKz7QLCixXIRHQYAlwAdSLqpUnnrIv4YMCz
         iggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696348769; x=1696953569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xP89tk8jeFUDqiHwgtcyinENLLmFDFAo+sp2wFgmRBw=;
        b=Q+Ukt2+0Xd3saYgxhmo4/7tr4K5gXRQvKKOhvjOFIJTDPJVlAWtkcAVCrlvBEXUtgJ
         TUF3zOAfLp5S0eGd2rFhLOMRZ+g5L8zt6AK1Rt757IjcKLdnWQ66mGaI4vhvpzoNTerO
         4zU3Ty0NU3IdBd92i7F9e4TtQV7LQIv5MgHrp1l/Btkhw7x5AWcWIIajV0qzXsKrODQO
         UVG7B9n8npSULsrxBKQHVnitFIKI1uP3YKZNQQd0M2jOZNDCPHCCCwCgDeZ4N+2iDM3G
         RPt71g8hjLk7rrq+M58/maKpyUWJqM9prEiHrGBWNoW8vSRSFRF0UfIXFtx9ZdJ2vOUF
         2QLQ==
X-Gm-Message-State: AOJu0YwDk2CjMHME6mFK6XKCE8nvPLb4xXkgPdKCU79n5c49XLqFdac9
	hNsPc5Rdt7ULc6NOfXS7GdsiAHaX9yg=
X-Google-Smtp-Source: AGHT+IHlsTPxnmIroL8cntBugIBpa7VGBcPZjKPldlj/dItcEWdxSvIkKSkj76hPSiTFqWvviFkle9Hc81s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:3604:0:b0:d7a:c85c:725b with SMTP id
 d4-20020a253604000000b00d7ac85c725bmr227114yba.7.1696348768967; Tue, 03 Oct
 2023 08:59:28 -0700 (PDT)
Date: Tue, 3 Oct 2023 08:59:27 -0700
In-Reply-To: <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
Message-ID: <ZRw6X2BptZnRPNK7@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
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
	Chao Peng <chao.p.peng@linux.intel.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_085930_825958_BF698815 
X-CRM114-Status: GOOD (  31.89  )
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

On Tue, Oct 03, 2023, Fuad Tabba wrote:
> Hi,
> 
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index d2d913acf0df..f8642ff2eb9d 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1227,6 +1227,7 @@ struct kvm_ppc_resize_hpt {
> >  #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
> >  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
> >  #define KVM_CAP_USER_MEMORY2 230
> > +#define KVM_CAP_MEMORY_ATTRIBUTES 231
> >
> >  #ifdef KVM_CAP_IRQ_ROUTING
> >
> > @@ -2293,4 +2294,17 @@ struct kvm_s390_zpci_op {
> >  /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
> >  #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
> >
> > +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> > +#define KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES    _IOR(KVMIO,  0xd2, __u64)
> > +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd3, struct kvm_memory_attributes)
> > +
> > +struct kvm_memory_attributes {
> > +       __u64 address;
> > +       __u64 size;
> > +       __u64 attributes;
> > +       __u64 flags;
> > +};
> > +
> > +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> > +
> 
> In pKVM, we don't want to allow setting (or clearing) of PRIVATE/SHARED
> attributes from userspace.

Why not?  The whole thing falls apart if userspace doesn't *know* the state of a
page, and the only way for userspace to know the state of a page at a given moment
in time is if userspace controls the attributes.  E.g. even if KVM were to provide
a way for userspace to query attributes, the attributes exposed to usrspace would
become stale the instant KVM drops slots_lock (or whatever lock protects the attributes)
since userspace couldn't prevent future changes.

Why does pKVM need to prevent userspace from stating *its* view of attributes?

If the goal is to reduce memory overhead, that can be solved by using an internal,
non-ABI attributes flag to track pKVM's view of SHARED vs. PRIVATE.  If the guest
attempts to access memory where pKVM and userspace don't agree on the state,
generate an exit to userspace.  Or kill the guest.  Or do something else entirely.

> However, we'd like to use the attributes xarray to track the sharing state of
> guest pages at the host kernel.
> 
> Moreover, we'd rather the default guest page state be PRIVATE, and
> only specify which pages are shared. All pKVM guest pages start off as
> private, and the majority will remain so.

I would rather optimize kvm_vm_set_mem_attributes() to generate range-based
xarray entries, at which point it shouldn't matter all that much whether PRIVATE
or SHARED is the default "empty" state.  We opted not to do that for the initial
merge purely to keep the code as simple as possible (which is obviously still not
exactly simple).

With range-based xarray entries, the cost of tagging huge chunks of memory as
PRIVATE should be a non-issue.  And if that's not enough for whatever reason, I
would rather define the polarity of PRIVATE on a per-VM basis, but only for internal
storage.
 
> I'm not sure if this is the best way to do this: One idea would be to move
> the definition of KVM_MEMORY_ATTRIBUTE_PRIVATE to
> arch/*/include/asm/kvm_host.h, which is where kvm_arch_supported_attributes()
> lives as well. This would allow different architectures to specify their own
> attributes (i.e., instead we'd have a KVM_MEMORY_ATTRIBUTE_SHARED for pKVM).
> This wouldn't help in terms of preventing userspace from clearing attributes
> (i.e., setting a 0 attribute) though.
> 
> The other thing, which we need for pKVM anyway, is to make
> kvm_vm_set_mem_attributes() global, so that it can be called from outside of
> kvm_main.c (already have a local patch for this that declares it in
> kvm_host.h),

That's no problem, but I am definitely opposed to KVM modifying attributes that
are owned by userspace.

> and not gate this function by KVM_GENERIC_MEMORY_ATTRIBUTES.

As above, I am opposed to pKVM having a completely different ABI for managing
PRIVATE vs. SHARED.  I have no objection to pKVM using unclaimed flags in the
attributes to store extra metadata, but if KVM_SET_MEMORY_ATTRIBUTES doesn't work
for pKVM, then we've failed miserably and should revist the uAPI.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
