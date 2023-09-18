Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598B5CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gx7Zjber7CsZ+JbiVFarrWEkD7221WKaPkMdIVgcgDo=; b=fSfpzcmOGCqYQq
	4peF3owyQ1RBQn8x8rSM3ugDtpYhqbozqVVqv+fKEViQ7xPolAQonYs+kzGzP6ccu1xDSeTwYHgBS
	WzhqwtvNBkJs6DKw9wvKbUK2FsYxqpvoZSgaAKCw7dLaZlZhiBe63NRjPd1MdoRPm6EXCkIxd1e0J
	zu9clb65UULv1jIZWaqcl5BVmKd3LqhO1BFuNjLBC159gn04ZD4KLZm4N20ffi26QfkukhHjkGawR
	JlJ/GR76HawTzpslUOIqdI6+nTdVhPBdbi644N0RidWkW29y7CQj2Y/dkYnJ4xZPctxHA5DgEIroR
	h0Z0INoRtg9n+K3+1Nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiFzz-00FjUa-1H;
	Mon, 18 Sep 2023 15:17:19 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiFzv-00FjQx-1m
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 15:17:16 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so3052906fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050232; x=1695655032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/NB9QogE7/hqQA3eAPgSewNzbsnZd2QFPin+QhCO7do=;
        b=WknH2CIRyTdIkOUKy+OQLfdOd8u2oYgqKDYDa3dyDoGGTu9fQ/RC+BK7TmkKY+Kq9N
         6pVR3GOeviwc99ne33oMmcRq0xo82NHF8dZQR2B+EPYMBHtPMjD798rPo9gkYWmVds+P
         mfWskWMLb/WVYTVYIEmfcqxuGCzxuxyEgtis71ro3KsFfNqAlyYvIwvA/dbcDuh9FEzC
         GR2MZgwVMOx/c8mdxVncmm1B1CHMcHELRpBPEYcDDaPEEswYPeHOfM3d16uOuCyy/StU
         AgxOwqi5HDinDmR9uPs9fLi0RtEJUbugK/QEZRWt503W40tsYtUSQvYRIclcy2et5mfh
         io2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050232; x=1695655032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NB9QogE7/hqQA3eAPgSewNzbsnZd2QFPin+QhCO7do=;
        b=PwDWf45VRL59UFk4GmsMCzw33uIY/h8gpmUG7/FsxqjW2Z6FOsfJPwZmjDSQkCuXDB
         iVqCRUBsDyhcW/FF91vMKUE03SpynIStKDTPO4ab2XE/xD7xJWtySVdcbtl3k3gHt+CA
         f19km+uobpJsFbD8lZTA8loi0tZPjla5Bmlj0ZZakotiPcle/pQ0OmM6UrlapgdvcMCF
         nJJFKNuNXqGsvgFNT3eNFFsZhm1IQ9LONgf9DKPy6gxP31pWdFOlVIJMPGZ7k05WosfE
         gcJahPEPmjtRt5zGHDNopou+kFFfbrAYBiZ4fvJ4hT9z9WKe0GzlsWLLM0Qn7Hg3K7Yv
         H32w==
X-Gm-Message-State: AOJu0Yw/tvVvwpSnvoHOrlJsF5xQVehhYZWxAs79B7oKNBA7X7ln8ver
	dBGl/AR4VG4LwJD+xF/Mo8h1BQ==
X-Google-Smtp-Source: AGHT+IGk3T+gnY/Ry6RzP8KMpZ6etd0YaUlt1+KGAcu6zz40/S34i/NvbRLiXeftEMRhME9haaF4Dg==
X-Received: by 2002:a05:6870:b691:b0:1d5:b442:5de7 with SMTP id cy17-20020a056870b69100b001d5b4425de7mr10054844oab.35.1695050231963;
        Mon, 18 Sep 2023 08:17:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id r13-20020a0ce28d000000b0064f50e2c551sm1477356qvl.1.2023.09.18.08.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:17:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiFzq-0005O4-IS;
	Mon, 18 Sep 2023 12:17:10 -0300
Date: Mon, 18 Sep 2023 12:17:10 -0300
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
Subject: Re: [PATCH 02/26] vfio: Move KVM get/put helpers to colocate it with
 other KVM related code
Message-ID: <20230918151710.GG13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-3-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-3-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_081715_597060_926E67BA 
X-CRM114-Status: GOOD (  10.73  )
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

On Fri, Sep 15, 2023 at 05:30:54PM -0700, Sean Christopherson wrote:
> Move the definitions of vfio_device_get_kvm_safe() and vfio_device_put_kvm()
> down in vfio_main.c to colocate them with other KVM-specific functions,
> e.g. to allow wrapping them all with a single CONFIG_KVM check.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio_main.c | 104 +++++++++++++++++++--------------------
>  1 file changed, 52 insertions(+), 52 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
