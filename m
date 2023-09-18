Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C54CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2edxLerv8L+pbgXW+xqhx+jUgC/RcbYb852Hoq2Lrsk=; b=gj77IMjgd0ZlU/
	3T5d2dWJ3JplQoTlu70XQFrh+xDiDnl8p8DDB9HYvo1lte+dQW9glCM6P9Doyw7Azv3N5wwglDEEe
	QL5ipbPTYbRt3VCjJdzq2DUWNdWaVHDShc3ip+Ewnx++zrPbGG9yrUMmu6IrK+Hk5oCzHrMPDEwhY
	8y086OHNZtrdps2mLp9QKEIJR3U8bUOGID1MmUbBO2CHj9IpCaFErBVVVcyLyG0r5FQkH5mNIYyF8
	p581Zyn+6lZk94t2ERvBtiGM3KZUy/QjCZesTVni45e+7NKvRtiM+zExkvHK3P5QagajhbsZDTwsX
	S62ufNJCd2oJYT3Odiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiG3p-00FkJo-1d;
	Mon, 18 Sep 2023 15:21:17 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiG3m-00FkHd-0E
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 15:21:15 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-76f08e302a1so302429985a.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050472; x=1695655272; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9iwt12QdmH2nPtcjR0iEq1G+1D18erLjJ1cQj58qe4I=;
        b=eb9yifQt/YrxDMJ/Q/23v00sc3S4wXULB7+EvlXgU5cUBWfTl6WEfhwh22586TTQ89
         n3dJmVeFe4LmlhEx1QFPvF5lGidf421MPVZeVDrbKMWcfjrysGyagHpX6G9yIryaZs0J
         xai8cdRBMlXNqYQbKkSYKFClYGFM9XzfTeadouDqcpXLMkCQ06reFOkYjUR/DqJ51oEd
         PGP6/nQgB8qdN3+W4gaWXpLuHl1N4BSa8oL7YQXXKX28j0LXkdyeZ4uXhJ0uJPvO9K/V
         9psOnjexAbtq6ZYkLMXqUcfkyLPW1XloIRIdsBxhqdouK9EICEgaNnII/4PqR951ak68
         zB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050472; x=1695655272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iwt12QdmH2nPtcjR0iEq1G+1D18erLjJ1cQj58qe4I=;
        b=A2WXWIOPAGMPCw4IsvLjCQ8GnNZIUOsehqRjsGpTy1yotvG6jnQ8rw6YntcHu92Y8j
         IOhLQP1xtCoD+J4du+VWKt4n7DwEeFsLs2TtBjcJp8kiFe7boBC7xwwzh3qDh2++BKJj
         EzZ0/T7Hv5jde8TAgegjzzKHM1Vel9jRQuYlwLvYfJq3ANKq6jHb+U0YKjkPpeE7s8Py
         4Qs+MXftxAnWPXH5zE8zhhnZPIXxEQS7aejvv1ttPk5NikyO+zUNpDHxwZeITMiaeX61
         sKWfJpWR4QApyw3haXByEC87zPWaM4O7zfCoKCP2Q+zJmHn+96JihU4zz8QgPqtK33jA
         vR4w==
X-Gm-Message-State: AOJu0YzkROVix4kCbRPRorFUcv6uhUO4sZnz2yWmTBcBxaEdysCBcfmH
	hU3vc5C7m2HvfEn54ILG8LCwkA==
X-Google-Smtp-Source: AGHT+IEUJFa3aXEX1YodKfdMrwJPEEuzBhbA2hgycHy86i8DANtxQ0UmL29SlN96YZ1Wg+zGpbaj/w==
X-Received: by 2002:a05:620a:31a8:b0:76d:a110:856d with SMTP id bi40-20020a05620a31a800b0076da110856dmr11089993qkb.0.1695050471902;
        Mon, 18 Sep 2023 08:21:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id i20-20020a05620a145400b0076f18be9a64sm3220186qkl.81.2023.09.18.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:21:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiG3i-0005PK-IY;
	Mon, 18 Sep 2023 12:21:10 -0300
Date: Mon, 18 Sep 2023 12:21:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Anish Ghulati <aghulati@google.com>,
	Venkatesh Srinivas <venkateshs@chromium.org>,
	Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
Message-ID: <20230918152110.GI13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-6-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-6-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_082114_112829_FFE00236 
X-CRM114-Status: GOOD (  12.76  )
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

On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> KVM and VFIO do symbol lookups increases the overall complexity and places
> an unnecessary dependency on KVM (from VFIO) without adding any value.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      |  2 ++
>  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
>  include/linux/vfio.h     |  4 ++-
>  virt/kvm/vfio.c          |  9 +++--
>  4 files changed, 47 insertions(+), 42 deletions(-)

I don't mind this, but Christoph had disliked my prior attempt to do
this with function pointers..

The get can be inlined, IIRC, what about putting a pointer to the put
inside the kvm struct?

The the normal kvm get/put don't have to exported symbols at all?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
