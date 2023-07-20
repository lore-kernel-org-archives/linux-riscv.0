Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA780EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kUPrlnRIjD6sAMipzHdibeksucBCYhTIrydtohu77dA=; b=N8UJe1wYP2ZynLFaiiMiqIW74N
	RhErB+aUfYPvO/pPCCiAdDOYcawFOpz3a4HXQjpmrFgKEuGPqLB9g3RduW39kVuqOsrZ6m6EvMz7r
	NCKAd90V+b8ghw59wtdlCxbGeIOKMM13a914oUDFOY3Ikea3VK3oJHRvYqix6dtKhR8C7y1XhF38V
	J/Y765q+cEUJKWV4HysUaOkgEPZZtWv1Bjb3ei0BQjKDzSqWcVtGoIqgCGsotV4SnzXmjOu9VW3R6
	xZSdmGCHCZAqZyn5eIq5EMhPgQwctgtA2julJGdJ5YqTy8Ii8V4IoeNRd1aVqQCXiwPWM2NQcUSb1
	BM/txr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVMk-00BVtU-0f;
	Thu, 20 Jul 2023 15:14:54 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVMh-00BVrs-1w
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 15:14:52 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c0f35579901so791794276.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689866089; x=1690470889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jyO/GZcznauRS+IxFjefkQ411ageTxV8Pq4vykaVGvo=;
        b=zTnr2gXYIfqrhSL0WP50qLuqh3ZSH0gfVOnKmqwBvWYCge11/urc6Mcz48DQC5VeI6
         s/bgjrFlzBMXd0PxaHBdxoR2ZqKrVqjnkCnhcQbbSnTvJYQ3aBe8wGkYdi1iCIBydfGh
         kDBro1Ztm9Xs7cfFTvZ7Ey8Gxe05PCCIDn4nx9L+2nwHbFPbro9d3jap/zFGaLY9lF26
         GO0Vu5OUt+nUmBQOwJoSD8n40MC7ZQXlXpaj59Y1nIZxZy5/TzmEdTKZZXkcpmTSKYdO
         Y0fmzsgj8zCYsvUdMgpPWIv3Ur8RBp8NDUrrxEURomdLy8NcckIjCEtpSXTS4KS2mzFS
         29+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689866089; x=1690470889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyO/GZcznauRS+IxFjefkQ411ageTxV8Pq4vykaVGvo=;
        b=byBy+UdEPFbg4BkcrTbAZC4nMBq1ieDsxoU4M/sphIkXCtsEa53liEjJQgUYyM6ozG
         PMbKJJ6mafKgFZmoxZ9pYLaL5NKN6qRRrHwhMl7YdNrntcz3EfhHZHW4OLgCqA/R25X4
         SGs3Nby47QZAgtY7YZsw+gi0xwZqUL0FOi8mc1IKHUBq9VdbA/jqw80G+tq9CI8FDdHH
         X/6wLNhNn/lE1cAL63Mvog2kG3RtH7Sa+a3f+wDvPaSmxZ3EugUuWwZlUMk+Fut5wUVD
         I+zi74g+55jqO5QuED3K2WihEkgyNqDKWalaBjAWQe2OlsMj6u540D2yNWAYSjWBlCZS
         qvyA==
X-Gm-Message-State: ABy/qLbl8i1/0R67lYNc3ZLBjKSYSRkOzGhSUhMInfc4jEto5euywRkD
	FSLcHMZzsiiS9u7WU707FsqWOb1sXCw=
X-Google-Smtp-Source: APBJJlHgB47FmXfk0Rt+Hyu6ZgRaD/aSiXUWbAQerG5WzFKE3pY5cKaePpzhb9OPvUF/5F0XHeWF4GbW2oc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a105:0:b0:c65:8983:ac2 with SMTP id
 z5-20020a25a105000000b00c6589830ac2mr17912ybh.5.1689866089303; Thu, 20 Jul
 2023 08:14:49 -0700 (PDT)
Date: Thu, 20 Jul 2023 08:14:47 -0700
In-Reply-To: <83eb5c50-7287-7845-ffc3-a7c58e638ea5@intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <83eb5c50-7287-7845-ffc3-a7c58e638ea5@intel.com>
Message-ID: <ZLlLx7wkE6iPTIcI@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_081451_643206_BC04A368 
X-CRM114-Status: GOOD (  13.88  )
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

On Thu, Jul 20, 2023, Xiaoyao Li wrote:
> On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> > @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
> >   	case KVM_GET_STATS_FD:
> >   		r = kvm_vm_ioctl_get_stats_fd(kvm);
> >   		break;
> > +	case KVM_CREATE_GUEST_MEMFD: {
> > +		struct kvm_create_guest_memfd guest_memfd;
> > +
> > +		r = -EFAULT;
> > +		if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> > +			goto out;
> > +
> > +		r = kvm_gmem_create(kvm, &guest_memfd);
> > +		break;
> > +	}
> 
> Does it need a new CAP to indicate the support of guest_memfd?

Yeah, I meant to add that to the TODO list and forgot (obviously).

> This is patch series introduces 3 new CAPs and it seems any one of them can
> serve as the indicator of guest_memfd.
> 
> +#define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_ATTRIBUTES 231
> +#define KVM_CAP_VM_TYPES 232

The number of new caps being added is the main why I didn't just add another one.
On the other hand, we have room for a few billion caps, so one more isn't a big
deal.  So yeah, KVM_CAP_GUEST_MEMFD is probably the way to go.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
