Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16BECC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clwMLyEgIaYv3NcrQiH2ciJKAbUzaJXlaZdbOI7l41Q=; b=A5DVlMHJZKAH1Q
	3PShvEEislTAjNBd2LZoYWPd6PI6Lknynuc+Gp9FcAhUeR2cAHtSdnB3BesZmCUDc5tyFJIZ5UPQg
	uubANaz7hntiz30M7CkLiGLH5CIKyOSdAmawLukYRvIXbGMa2xhgPNSQJCgRlwYAwBzqwhmbsEUic
	0QM7YY3LwgkTKoylNg2Kt0xIcnyuw0B/xO4wFY4XSvaPeoqOavgFNfjpqnwb18Ayjnzha5Y2qYlzs
	mEmINQgWlHKIlJ2MsbrZpJCgC5qltPbkRhJEhIbc6M9Geqjwo0966Q6QmmDEvAvFMhZiQcAs77i5t
	/WfHuJ8R4IwOsBf8b/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHisP-000000038a9-24VW;
	Fri, 16 Oct 2026 14:25:41 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHisN-000000038Z1-1eXq
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 14:25:40 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-91b89c6caffso309096d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792160738; x=1792765538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9B4QGdToSnYzAqwiubGkyqZ40Y9TYft35PK0Z/WSHI=;
        b=agKKXr7IWbEmGGhbfTyM6AeNiZ9FuHeKT+YF9Na/T+rbPZVTz+qibXDgBhPYPams+j
         ov597pH7U1eZz4pcwyaS0MofzGb9PcJXevxHn4HMFbjSf2o0kZfxhB11jN8ySbegc1KW
         2fx+izUcN0L1mNPZQMLLdXM84NjctvyHzR5qqYT1uOWUnJLNGbdziz1cVxqO6BrOW/4U
         ppHttzFX0RHTwXkv9l+sXdOnIl+YzWrJWRCGDx5IyS52G0jUc3pTwBsTAgTqXxDbfLAG
         Yh6XAOBWtmVHfEA161/0A+sdn8iXKCX4LkSunch/rDvsJlLD90J/I3mg/8gRYLEWLFVX
         3mEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160738; x=1792765538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9B4QGdToSnYzAqwiubGkyqZ40Y9TYft35PK0Z/WSHI=;
        b=RC10xElYK2JopwRJ5iifv9AUSw3G+ReGY3iFumy2n7GiwbbQyNhFFazTfuuXo38t0q
         ZCz/ySJIWDxSNSGWgyOEpMUTXhvEtryB7odSX8ucCcfpuovtxQh4nhyDM5E1pjgXE05D
         QZa1FHgKv3gPRh3D08CtPZUYcy69rK/yVCm3MSQu9hJyfgzzRxRTngRD0J9TUrzOPZkV
         Os8nqQVVWWX0DmV86/H+JidAyplXuS+nPIa28MCzTcY2cdBTnxQnDFSWhLRk7w3+Y3gC
         ak1jKMfFDJz0TQf/ALQwG6JJLsE56t3crggUdzu3SMr7JGjK/mS75h966o2PhbSVc8CE
         ot2w==
X-Forwarded-Encrypted: i=1; AKwUvBzTV7Z4SksmnQmtyTTXv+VGSDaNPZ4fZrmJ7UDNpU3REnpWcWn6+yGvNek51znzGQ4WgWvsv/eVQGdOWg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJoK93JWJZg0Qv7WQAPsRQC4xKo9VmMBc5f0PkouQ2/4CLT3Z5Q
	kxP4J3zPMlKVoGEx5kHAOca0KSjaU5AGvMSIJ8Qm2tLvTVc4Gd+hSY1VuttCGZmsEgg=
X-Gm-Gg: AYBFou0ph3teljRMCcX+zmrjasshRYsTFsPdPAT8wFVgfHinUtgv8dkmKK8w6kMAg7U
	aF/1zVTGHGc2SIgFHlWosaqgUD68gLI3jVxyjESXISd2nMYuuh7buVRaGqpDsXLQFgG9uH4H+fF
	ayaCLv5+WK2oWCMlyJaGnNW2LMxF7VU97swW6abGR1qraQZfn24IbdWe+Z1Cojral9u6GMTdNiK
	+jb0NEdu4TSly3YjkHbkCjNp9CE7pw6NdRfxt7niGbMYQP6vqrf/D1GKD71X+QYi2DIY09N+QNM
	fUfCtwjIsQpZ24IBGzK3iU+qFFvS1a473Yxad3vcpup2fN+QhuPw9hNicOpTu0ZRFweOMWZygzn
	i1Kf1ZCNNY8C/icTr+XoeGSSDtGKU8FD/194DaLS4yiFQNOjodLl7t6NVLG2z9+ErXhP590wEnW
	cVnf05sr/oLnGKGeSYEAiLZLkVShHXVrwafXmkfcZnELkw3k6c7ZQofNBZVM6co5m9uSE6HxkGm
	s2XdXJcKgrkIUNxvZdlxIiDVEAgp0zVnN9/mIeTsn1mU5rXk1BIu4/Y
X-Received: by 2002:a05:620a:3947:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93ebd24b2fcmr3934753985a.37.1792160737536;
        Fri, 16 Oct 2026 07:25:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba3e3a0sm23953506d6.9.2026.10.16.07.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:25:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHisJ-00000001pql-49O3;
	Fri, 16 Oct 2026 11:25:35 -0300
Date: Fri, 16 Oct 2026 11:25:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH 0/12] iommu/riscv: Add nested translation (vIOMMU)
 support
Message-ID: <20261016142535.GD14213@ziepe.ca>
References: <20261016000004.GB14213@ziepe.ca>
 <20261016091610.13912-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016091610.13912-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_072539_543595_D89DF4DD 
X-CRM114-Status: GOOD (  24.22  )
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

On Fri, Oct 16, 2026 at 05:16:10PM +0800, Gong Shuai wrote:
> Hi Jason,
> 
> Thanks for the review again.
> 
> > > Add nested translation support to the RISC-V IOMMU driver, so a KVM guest
> > > with its own vIOMMU can own the first stage of a device context while the
> > > host keeps the second stage, and add the interrupt support. This is an RFC
> > > and comments on the design are welcome.
> >
> > The iommufd parts looked reasonable to me
> >
> > I feel some mild skepticism about all the MSI parts, it would be good
> > to get more of the interrupt stuff actually landed before posting this
> > again.
> 
> Agreed on the MSI parts. They are a working proof to exercise the
> nested flow end to end, not a finished design. The reason they are
> in this series at all is that the NVMe device we use for testing
> depends on MSI interrupts. Without this support, DMA succeeds but
> the MSIs fault, so the driver ends up polling for completions after
> timeouts.
> 
> We will keep following the irqbypass groundwork as it evolves, and
> continue this work once it has landed.

It seems to me the riscv interrupt architecture is a terrible fit for
Linux, so I would prefer you keep that out of a viommu series and try
to address interrupt support in VFIO through the other series.

viommu shouldn't change anything about how interrupts work..

Without the msi stuff I think you could get this merged without a big
trouble.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
