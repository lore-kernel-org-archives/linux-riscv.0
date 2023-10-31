Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A9C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OYL98VR0bKvDeslRT+UfwCldDEE5MIswjLU8udwXPUY=; b=djej5jZb8uzK7x3mNo2eZ4FEGi
	SuqlDW16QUhfQLulTknWlVD711QFdBVTkNrb33XWi63g5NTkLXIlu8VYlNFwy1jAD8D/00f6Q3A9h
	eMp8Az372ky5EkpyP5yBa7436n4uGZocFrg8+KmxQ1e2TO2ugyiXPKYXbWY+hTOXG4zAYAM/W+Tzl
	PQgh4d0QmKa3tc7/PqUfYnyPn/ENoi7AH2/5umZQ1guECQUIJFlbABAswt4646RGvdWSE2sk2nbWb
	S+XkM2AVA2xE0FTB1D/SY8Ke6/kb0ZFNermZN2spRWFHSOssc0BA1TdriBRuuGOAI48iRFkxEqiwj
	DMujdOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpMZ-005O0p-32;
	Tue, 31 Oct 2023 14:04:59 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpMW-005NzE-2M
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:04:58 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d99ec34829aso5397609276.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698761092; x=1699365892; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsemryN+7v+wOBolNu7Hy0wHrULeaB9eFsfVkGp1/e8=;
        b=EKduNxKTl05tIjmYvFCZjj16MMz8JEcjmiE2h61746eHRbUfcSQxc/1aoDB/NC+wkd
         sdzsGNfUbgmfyt6PAjEPs4/vY3I6IuqQKu5m9uCXew1eJPeuRITZ22M6WVel4yOietYb
         DMW6zWfUVeHcLViTR1P+SrPTvTXpnN28cooUfxcs1NmFqKhJxmkwX9q/eh6WS81AJEA1
         2R54KnFQD9Agf/v++ljwmUS2UQEBf5VrofMK4omMFbPXAtA1WHHghFveVnBn8McG9WqE
         s7bAraAO/NCxZw3V2jF33bIkwqMhcl44UIHgIUk2JMDV32tjjPQRK11rW4H9ZwELtVMl
         H0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761092; x=1699365892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsemryN+7v+wOBolNu7Hy0wHrULeaB9eFsfVkGp1/e8=;
        b=C6uv6VUXaI1ek27njNhgOUmJPVySPBXq7x6VgcSzsD9udb52P0ET0qkcoCsXvvNTfx
         04pdiudlRQ6SOv5LXXiwahzJs80AOZ8Bwqx3r3ISZCUdmYKqgG1ypFc0XfiIxdpTh+hK
         METjF9eWbRb3imXx98TE0D94Fyc4WKClMRJ0I/xX/L2uhhwMjRWGxAZPz0an8wbdqqVV
         jDVXUy00RI68OlMfOhI4UCLLFkDYrcW3MYBG+yl1DfJfCZfjvsPHxRykRExGp7ZXYhsl
         OOqHuCvMhlxsJptf4tBYUuLRytFRZO7nFMEF2qgRu19+JlSorIEobEH8nHCcCGVwS1Zk
         PIyw==
X-Gm-Message-State: AOJu0YwXGKbNZJAl/Cz3tpyHASfcd8m5HW9/LjHVJYuF4RbSbdIbIUYw
	zgJPkrIC2U6TVb88J+H0C10UEUn6qog=
X-Google-Smtp-Source: AGHT+IGMRYf422gsAhq04hJnKRMCzmHg+RO6tAl4JuMhPFGeve1lxsPBrReypZbUvK9g95iFN5O303NMZlw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr301710ybu.7.1698761092559; Tue, 31 Oct
 2023 07:04:52 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:04:51 -0700
In-Reply-To: <2edd908a-9699-4d8e-9063-c655f1fc9712@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <2edd908a-9699-4d8e-9063-c655f1fc9712@intel.com>
Message-ID: <ZUEJg_rBf35NyCG3@google.com>
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
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
X-CRM114-CacheID: sfid-20231031_070456_771011_D82DCFEA 
X-CRM114-Status: GOOD (  25.11  )
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
> > Introduce a "version 2" of KVM_SET_USER_MEMORY_REGION so that additional
> > information can be supplied without setting userspace up to fail.  The
> > padding in the new kvm_userspace_memory_region2 structure will be used to
> > pass a file descriptor in addition to the userspace_addr, i.e. allow
> > userspace to point at a file descriptor and map memory into a guest that
> > is NOT mapped into host userspace.
> > 
> > Alternatively, KVM could simply add "struct kvm_userspace_memory_region2"
> > without a new ioctl(), but as Paolo pointed out, adding a new ioctl()
> > makes detection of bad flags a bit more robust, e.g. if the new fd field
> > is guarded only by a flag and not a new ioctl(), then a userspace bug
> > (setting a "bad" flag) would generate out-of-bounds access instead of an
> > -EINVAL error.
> > 
> > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++
> >   arch/x86/kvm/x86.c             |  2 +-
> >   include/linux/kvm_host.h       |  4 ++--
> >   include/uapi/linux/kvm.h       | 13 ++++++++++++
> >   virt/kvm/kvm_main.c            | 38 +++++++++++++++++++++++++++-------
> >   5 files changed, 67 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 21a7578142a1..ace984acc125 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6070,6 +6070,27 @@ writes to the CNTVCT_EL0 and CNTPCT_EL0 registers using the SET_ONE_REG
> >   interface. No error will be returned, but the resulting offset will not be
> >   applied.
> > +4.139 KVM_SET_USER_MEMORY_REGION2
> > +---------------------------------
> > +
> > +:Capability: KVM_CAP_USER_MEMORY2
> > +:Architectures: all
> > +:Type: vm ioctl
> > +:Parameters: struct kvm_userspace_memory_region2 (in)
> > +:Returns: 0 on success, -1 on error
> > +
> > +::
> > +
> > +  struct kvm_userspace_memory_region2 {
> > +	__u32 slot;
> > +	__u32 flags;
> > +	__u64 guest_phys_addr;
> > +	__u64 memory_size; /* bytes */
> > +	__u64 userspace_addr; /* start of the userspace allocated memory */
> 
> missing
> 
> 	__u64 pad[16];

I can't even copy+paste correctly :-(

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
