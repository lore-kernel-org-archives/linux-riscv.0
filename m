Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE6DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:40:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3BB3610F7
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3BB3610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HR+UmgyT2E6tXgAzxtP6hJctHgMj7tdOX5jh4LlRGfM=; b=XkYC6QgPLt7fR2
	r5iNp/Q32xJdArlMwEEAhR+ObBpg8jIdw56gExrNe0n2i6PwUhPOBX9QzO321126nSVSnKSVhTMUn
	D6VUFibTWJY0kTHDh1ySPFL71Rbm+sewr2WInM8E5rsROqBjKqeusj0wA/RRMKDrah6ZBUOovqkF2
	aIxUFzyCMOPB9heNiCorCvorI4zNYuMG4E65Fbdxs5Thr9CQrFqEJNGpN50Jv2ok0ywY5dBjRonTY
	BOD9YILc8EoYjkWv90WQE531UMP31XvEwyZbtgsps89UvNTXR7ocj+eGm8zEANh8LfhU316+op4zM
	1HZ6uMkZiKilmBgfYNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkG71-000Pr2-Bb; Tue, 09 Nov 2021 01:39:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFhO-000Fc7-HZ
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 01:13:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id p18so17779247plf.13
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 17:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OY5KYqUbBGpBDQ1k/TLXaDPEogjFGrqFLQuez5gL1qA=;
 b=te7Nw2DvzfZp/BOqwknAvOUpfBhundhcdPJe1dNUemJpr+5tBnfyFRHnMzcPLxJFqN
 KujEpDxbDQg9UP19BIas9xWrfjlUr8iNQnw44E4nNiuCXPw9XE2oUUEO4vm6LObg4EhG
 d4Eh18RhxnXj0DeQQGDa0fItbHkrWTp2aGHdm8SLozmyzGYlENGO46rSxB1omAxCZquV
 0SE2otTQgQ85nJvIEamMaKTrGUdltz0CPMYpQRIdj8uIl5/rXQOmwBDoJILcZ8QF1Jqs
 zpka1GweINt+W1Mdx9Gb5XIPiYSJXz2XTgcNv6K30CkWtk/7XN35z66PabO6xsFDyCBN
 K+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OY5KYqUbBGpBDQ1k/TLXaDPEogjFGrqFLQuez5gL1qA=;
 b=yheAVkMo2f5W+aelTCTmnTr/tnlKwvA2gEyhwFuxgAX1o8L9h9CzOJFncWM4UyIA7O
 mgQihlHXTy8U0vPPWs5VaGQGthbY81sSheGFml0aCJHaNGL5blcS0dgl4+AS0HNhyMgF
 NOcL9VIEr7QYbxSCJhfYSjG4sOBIcNAorCSreGqEiR3+nhOO5/I22iwm0PcuNFg1G/Ne
 wGPtM04wIiYlqDiTFQ/zCaZf30Bv/HLdT4Zd3JmNiqa2X6fjBb3k+iW1ROidsuFLBWue
 qhUsB9baNC8dllPN0qsp/Q7bYmJ2bbY0uruzN0KiEs/JiRwHQWJzRQ263txlgaI3RdNR
 vPTg==
X-Gm-Message-State: AOAM533K8r0d5D5Zah0KbttZqlZTpSyCWm+aZN+HuOIojmLoKX+WiHnb
 16JvqZ7to6HJK2I+BrJ17VPohQ==
X-Google-Smtp-Source: ABdhPJzcevbnubHEXgv1M6rLX2JGTzdlefd4kCjCHHTj8uzt2X4SJm7iMiDLodL/pGyJRFtYyjZrnw==
X-Received: by 2002:a17:902:7c0e:b0:142:53c3:39d9 with SMTP id
 x14-20020a1709027c0e00b0014253c339d9mr3570608pll.66.1636420393180; 
 Mon, 08 Nov 2021 17:13:13 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t135sm13421760pgc.51.2021.11.08.17.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 17:13:12 -0800 (PST)
Date: Tue, 9 Nov 2021 01:13:08 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 07/30] KVM: Let/force architectures to deal with
 arch specific memslot data
Message-ID: <YYnLJKyt0aYsl1H0@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-8-seanjc@google.com>
 <e12ecff3-ee69-9e2c-02f9-0e54a1cb9519@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e12ecff3-ee69-9e2c-02f9-0e54a1cb9519@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_171318_652805_CAE27887 
X-CRM114-Status: GOOD (  19.30  )
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

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > Pass the "old" slot to kvm_arch_prepare_memory_region() and force arch
> > code to handle propagating arch specific data from "new" to "old" when
> > necessary.  This is a baby step towards dynamically allocating "new" from
> > the get go, and is a (very) minor performance boost on x86 due to not
> > unnecessarily copying arch data.
> > 
> > For PPC HV, copy the rmap in the !CREATE and !DELETE paths, i.e. for MOVE
> > and FLAGS_ONLY.  This is functionally a nop as the previous behavior
> > would overwrite the pointer for CREATE, and eventually discard/ignore it
> > for DELETE.
> > 
> > For x86, copy the arch data only for FLAGS_ONLY changes.  Unlike PPC HV,
> > x86 needs to reallocate arch data in the MOVE case as the size of x86's
> > allocations depend on the alignment of the memslot's gfn.
> > 
> > Opportunistically tweak kvm_arch_prepare_memory_region()'s param order to
> > match the "commit" prototype.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/arm64/kvm/mmu.c               |  7 ++++---
> >   arch/mips/kvm/mips.c               |  3 ++-
> >   arch/powerpc/include/asm/kvm_ppc.h | 18 ++++++++++--------
> >   arch/powerpc/kvm/book3s.c          | 12 ++++++------
> >   arch/powerpc/kvm/book3s_hv.c       | 17 ++++++++++-------
> >   arch/powerpc/kvm/book3s_pr.c       | 17 +++++++++--------
> >   arch/powerpc/kvm/booke.c           |  5 +++--
> >   arch/powerpc/kvm/powerpc.c         |  5 +++--
> >   arch/s390/kvm/kvm-s390.c           |  3 ++-
> >   arch/x86/kvm/x86.c                 | 15 +++++++++++----
> >   include/linux/kvm_host.h           |  3 ++-
> >   virt/kvm/kvm_main.c                |  5 +----
> >   12 files changed, 63 insertions(+), 47 deletions(-)
> > 
> 
> You didn't include the RISCV kvm_arch_prepare_memory_region() change here
> (that's actually in patch 13 of this series) so bisection on that arch
> will be broken between this patch and patch 13.

Argh, I thought I had found all of those.  :-/  Thanks.  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
