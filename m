Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827FDEA810E
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Feb 2026 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fN+5G58Or/GMRP73ESlK3CvKA3H6FIwYY/uFXQIfLuA=; b=lOZa0NXfI5G5BK
	PiyBAZDepWDteRtW/hYunIxcxh9l6CcgzC+eID6b4+U4CGXs3HU9kzmlWej0UnSMcsBdKYGYsWFx1
	YYPEXieFxrFPjF473ubWFFqSkb+WBTkcxIa26/xXm4zUYcVo43PJ9PjxtqpXA86aVfENeqGXhp3UG
	6jkftNu47+Li5bOJEXq4OhxDAgka/auILZml7BSZSgnVaLKbwGK6ExnUJopIGCstjHJw9Hww5rYfb
	UXwNIUlQ/8OI4ZbNKW1/V0OI18rzVSdGBiJ1loPxTXccAXKOfszwyITwh8FCLhxtE1gC+p/GukJrn
	d4dhkMz9LM06/DblbXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnNr-0000000GyFa-0Q9a;
	Tue, 10 Feb 2026 13:02:27 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnNo-0000000GyF4-3j5V
	for linux-riscv@lists.infradead.org;
	Tue, 10 Feb 2026 13:02:26 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-8c5384ee23fso445353285a.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Feb 2026 05:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770728543; x=1771333343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CukWcBoPz7v4d6E1diLj/dADiY14CHwtYahwJE8UFu0=;
        b=lGNSitFLXMjSPQhmYG/lGVgG9pP/NrfhBGoELD9P/prRq35gEOyL057viAnqQO86LC
         6KBhRidVNg8/pE1JTo0zOA/MBO3jHKZAA6EXdfaja0AuxChoQy2lcTwmUGG/Tw7AqVcr
         L3qA9TmHO1UPjfplxZj15TxfBDcVxnPcUvusR3uhRSldbEve3VeSNaKn/sPJrhRGXssd
         RUL3yNTDx2Uynd4HTqAAS5qi90InFuSM9a/llC7ZfN/tJKajtsXfJnuNnTcWaKkRvhOE
         b33B7+6ulEDzxbs0Mk+v3dLilrMMTCs+EfHgpxyg4ImeuQXuRkgFJhtzU24cBhbqmLE9
         QoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770728543; x=1771333343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CukWcBoPz7v4d6E1diLj/dADiY14CHwtYahwJE8UFu0=;
        b=OJEBj7QlXO1KSQOXhoN0utESzPCYNIM9Hj35S9a2NwCKQjRUfM96kf2Pe3ioKWb/tb
         EgLQFvxaedRHs+mijPl/ZE2chKR4zVX568YHGXY8bH+3EHzlvxd7yh0AGiudW8S2GJNq
         tiSDK8+GO8pgn+AD3xNYYhxhzjxPGNwpjmrLApjiUTTq65jrd6DzgrO69CCZwBCbDJT3
         KWpRgEf6LRmw2Z2AptQe7NpoHvkqgFmLf4N53feWhZEVz3siKbP59ElPjCWpVfm1rp8U
         Ge6FBdFtHx3lpd8zzrU+2xOb94pdzZhe9VhnPHON18Z6RPRR8Fbro9jgyUbtftsImLl7
         9L/g==
X-Forwarded-Encrypted: i=1; AJvYcCXwozgWyu/6mYp8eOLBdN4q7n0PJZJ97eJV6bAPZt3DGh+ktGdNWmMt1E9bBWwQBw2y2Ww0JjtuSmQ0ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBx+zGkDerw8jwugUqcmTb0Lc94S6Qvn9KiPu9AZ8LM/ciMjAM
	ajIK+wGmHx9nsrf+IRuJAu1pNH4MoBW8v/XzoTbD6i07KotOhUXTtQYDAKnLb9dJaVw=
X-Gm-Gg: AZuq6aKCs4RVmM8hZCo6a8axewuKeh7BU6D9w4ThdMjzguKIt0mgtfYMb/ngpxWHRJC
	HkVIINmm8LCwITYesMsLZqxYXFUQqIewiSSvLQ85MT+yCdse0MAap/beF/LzSaFlbPPGp1/vIJ0
	UIz9PksIh1ZWiO75LmmiNDLxtM9hPFVx64MoyPjQ2U5acZGdxxQRYlvWunB3x8NycWH8jGTiRg6
	VVVyfEPXQznSGitp+JdmLZQoF6We8mQT2ZM82ftHrHKmG241u+sTsXEwhm1qiLKm/oBKL/Fa3Iu
	8Pp/dAUSjBO7LsAgFHlEr7MYksDx1yZcJK0zDi6x0+nCnG8MUvROc24eZutiAPbeDgfgIeXSLTY
	6+xfPHy+/sEwS3wyzsFdI/6uYx2HaanlmJWvvOEM412CtaX9QQJB59TXXlRYXAotTADr5fUXMjT
	jQByBbVekXZtaHmK14IonZbA8ht75SNs8nLKEi6EYIUSvklYPCbW8UEonwap9E4EYZZDo2jr7QT
	fcA+5w=
X-Received: by 2002:a05:620a:4006:b0:8b5:9f45:cce3 with SMTP id af79cd13be357-8caf13078ecmr1893502485a.69.1770728542911;
        Tue, 10 Feb 2026 05:02:22 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee8662sm1119957785a.37.2026.02.10.05.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:02:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vpnNl-00000003784-1qfn;
	Tue, 10 Feb 2026 09:02:21 -0400
Date: Tue, 10 Feb 2026 09:02:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	guoren@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] iommu/riscv: support range and non-leaf IOTLB
 invalidation
Message-ID: <20260210130221.GE943673@ziepe.ca>
References: <20260208144213.94856-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260208144213.94856-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_050224_933223_69D9A18E 
X-CRM114-Status: GOOD (  14.08  )
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

On Sun, Feb 08, 2026 at 10:42:11PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> This series adds support for two RISC-V IOMMU v1.0.1 invalidation extensions in
> the RISC-V IOMMU driver:
> 
>   - Address Range Invalidation (capabilities.S), which allows encoding a NAPOT
>     address range in the IOTINVAL.{VMA,GVMA} ADDR operand when the S bit is set,
>     reducing the number of invalidation commands for large or superpage-backed
>     mappings.
> 
>   - Non-leaf PTE Invalidation (capabilities.NL), which allows IOTINVAL.VMA with
>     AV=1 and NL=1 to invalidate cached non-leaf PTE information for the given
>     IOVA, addressing cases where updating mappings replaces a non-leaf entry.
> 
> Patch 1 introduces the missing capability/operand definitions and switches the
> IOTLB invalidation path to use NAPOT range invalidations when supported.
> 
> Patch 2 adds the NL capability/operand definitions and extends the invalidation
> path to optionally request non-leaf invalidation. When map_pages() replaces
> non-leaf page-table entries, the driver invalidates the affected IOVA range with
> non-leaf semantics.
> 
> No functional changes are expected on hardware that does not advertise these
> capabilities; the driver continues to fall back to the existing invalidation
> behavior.
> 
> Fangyu Yu (2):
>   iommu/riscv: Add NAPOT range invalidation support for IOTINVAL
>   iommu/riscv: Add non-leaf invalidation support

These will need to be redone on top of the new page table code for riscv:

https://patch.msgid.link/r/0-v3-9dbf0a72a51c+302-iommu_pt_riscv_jgg@nvidia.com

It should get picked up early in the next cycle

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
