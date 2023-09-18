Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E4CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8t4OPkiilzomyGiWtvDJ2PEhdSSXhoflUGUQHVJBkts=; b=OL1yXnw6kS2dyT
	JlnLdccrIuXVoThlfzLT+MzcnliKOmJmlv+H/9SutX5RAHjpmQcWblGT9I6QoA+balau9GxMInqRm
	DT838Dqb9lGQwxyGbuHghrVtpT8QSc/ZxaXQQxEnogC0dDMbl+J4DBJwHo9Z/x80AkQm+11ilf+56
	7VZUEIwn/k30UMHr5yR0UuJTSAasTdd/Sp6SD9aRZhdSTc+JR+PGFZkjaUlNbYfwOt/REcik+7ksn
	yecqfxT7Urzaj/3IPhN5Bxen29u6KUa5YxJcYdP+mIDQT6KeKqVbK3KGTZDbIwDn8B3GXVd4CS8lq
	fj3/NE/4JXPT8UpWFM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGCE-00FlFY-0M;
	Mon, 18 Sep 2023 15:29:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGCC-00FlEx-1h
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Sep 2023 15:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nmpxNm78kWfejPgZcglZLNttpcA+aOzIbjCglm6BlEY=; b=fs/NyhrsxRv7ruKDlk1OmNCYxa
	K7OuS3YhAtc8o+BVqnzxkxUrf7zdpEInmzQa6Wdlp7xvfk6BIiXutLYK6PvYwSuKSKMnbPUkKb+XU
	tDxbxlJLiL0W+SjjQpd8xwNGMtCxw8BkZRgb5Ui4PVJrq+wPyE3vYTpG7WO1Mmb/1UXsUxUcrn1Fr
	ysOy5itkpL6dJDvnPlFMzyAT23mG0ScJ/cBs6xulJcb0jSTMZAkafj2EiXUA+nKpyQhFhRLMj7EPV
	61b2mvZ1i+0FXOTcD8mdAo1LUoNOpiXd3TPIUOeyIei5QtRZiK/N9i7CmkE9kgrk0MVhf7rC7u8sS
	IWaq7LGQ==;
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiGC5-00Ck8t-2b
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 15:29:55 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-773ac11de71so231971285a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050988; x=1695655788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nmpxNm78kWfejPgZcglZLNttpcA+aOzIbjCglm6BlEY=;
        b=PSsD0MmsZwzFK385Ugw9ZpPkhsP+ZE65yutMe9DJGEJsqv9TZWp88IufLxhnwfyqco
         qRc/6qb98mc93IIZQ4Iu34PP25jsG9rW1ex8MyynVsHvvKj1QN+9oI/ygzZbON7dKqh5
         wRa+rMBUvOu/yNLT24q6mTzdUoVLMGDEf5VnjHCb88vMMEQFpU5820iHPos8f3kjTLjP
         26+coybFjbXmI9vA82qSCpbI6PebJV+QKbBDDeBKpj9eZoD5CuuXvMLqq5oY1BGY/NGO
         AF3WZTp1gd21HU4d0AEVpob3T/bd8AEc1QNPf8Uu0tlKBth705DAvRZEWCGDDRP7wXmG
         3CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050988; x=1695655788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmpxNm78kWfejPgZcglZLNttpcA+aOzIbjCglm6BlEY=;
        b=aoabr6Fg2GlTL4p3hJiRoLVfaX/a8FId3+ja6s/TaA/7Tbu5Z5FtDghprhby72ZOpj
         LSBkZcBOs8kEGNUE4TC0762BUTQiVI7tp2gynAStU9rxmGhq9kTBRzeNeHXzMksldmIa
         v8pfQH0e8BpX2jWnCFsUtqoHB1PUNqV4g7LVf53BglxbujRUIx4SYNp+x395PTb5pO1Y
         hrtTfyg/fhoDHjHxUGy4PmAFFLxNl1OXbeEGwcVBtx03hmwpUdOFkN0di7yNSV6OwkY4
         rZOXgJ5gg2zD9UzuITCfwQM2j+a2OkwRzIXtA3AzYapl95cOaRh6NNHrtjKg7VmxCcYC
         9Isg==
X-Gm-Message-State: AOJu0YwGUNvDkbZAyr/1Y9r9Xf4ySk0QTCfIfEazNbZ4iHueU6bKrEpk
	gL6gZhayLUOcVIEIKmgocLha1w==
X-Google-Smtp-Source: AGHT+IE5R1x821mq0T9l2iChMZP/v62/zLl2heVXzUEZigk+bm+oq/r6FG+m4/T/InbSxJxTjGr9mw==
X-Received: by 2002:a05:620a:2887:b0:76d:aa93:2e3c with SMTP id j7-20020a05620a288700b0076daa932e3cmr11157815qkp.24.1695050987781;
        Mon, 18 Sep 2023 08:29:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id s4-20020a05620a16a400b0076d0312b8basm3183843qkj.131.2023.09.18.08.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:29:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiGC2-0005S2-Ku;
	Mon, 18 Sep 2023 12:29:46 -0300
Date: Mon, 18 Sep 2023 12:29:46 -0300
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
Subject: Re: [PATCH 06/26] KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
Message-ID: <20230918152946.GJ13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-7-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_162951_990803_BADC2332 
X-CRM114-Status: GOOD (  16.74  )
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

On Fri, Sep 15, 2023 at 05:30:58PM -0700, Sean Christopherson wrote:
> Drop KVM's KVM_VFIO Kconfig, and instead compile in VFIO support if
> and only if VFIO itself is enabled.  Similar to the recent change to have
> VFIO stop looking at HAVE_KVM, compiling in support for talking to VFIO
> just because the architecture supports VFIO is nonsensical.
> 
> This fixes a bug where RISC-V doesn't select KVM_VFIO, i.e. would silently
> fail to do connect KVM and VFIO, even though RISC-V supports VFIO.  The
> bug is benign as the only driver in all of Linux that actually uses the
> KVM reference provided by VFIO is KVM-GT, which is x86/Intel specific.

Hmm, I recall that all the S390 drivers need it as well.

static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
{
        struct ap_matrix_mdev *matrix_mdev =
                container_of(vdev, struct ap_matrix_mdev, vdev);

        if (!vdev->kvm)
                return -EINVAL;

        return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);


I wonder if we should be making the VFIO drivers that need the kvm to
ask for it? 'select CONFIG_NEED_VFIO_KVM' or something?

Regardless, I fully agree with getting rid of the arch flag.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> --- a/virt/kvm/Makefile.kvm
> +++ b/virt/kvm/Makefile.kvm
> @@ -6,7 +6,9 @@
>  KVM ?= ../../../virt/kvm
>  
>  kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> -kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> +ifdef CONFIG_VFIO
> +kvm-y += $(KVM)/vfio.o
> +endif

I wonder if kvm-m magically works in kbuild so you don't need the ifdef?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
