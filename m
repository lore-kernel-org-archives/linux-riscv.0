Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05535C2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ogdYtJlTcdICSaw/rYayfpZygylf7AwsnR4Jzl9rmk=; b=bfT9JF8qEGhQQq
	ezJcdnm8Jw86e6TB6EoKicJnzNuS2Fccc0ZCLFS54z9TFqwfHQDbK8YcH3gohqIzF9OvmAbAJ7Ot8
	v8O8H/udOeWwTU02/ApWKfjIGfgUh2zOF34+SiaQ0Ww5/MzMP6hN4RbNzOr7+GT32WDl7KWtAK5m8
	uPlsRCEtt7zIVlfi5Z0MMAMavKe4PslCexyR7p0NYyuwGG67Ek5AMuGMp1CpRDGagzOSjr0XOjo8C
	/471mNdV9mLWHuLt9p7xxG5xeGib6MI1YJ0GtDRKqgofulnBWqLjRpye6CnVvRNCZyjS4SCIpXbmL
	voouKKdoCj+BPjUbhbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxYk-00000001taX-0G6K;
	Wed, 19 Jun 2024 15:49:18 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxYe-00000001tWa-1kb8
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:49:16 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-70089223245so598907a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 08:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718812143; x=1719416943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zaUP1kZaDzbLlLlrnXpwVvSSBYt89/ufOLldJsnhc4U=;
        b=IgD2u6t3oBq0M5T8bawVJwBe9ST2Lgq1wqk75UsO0dbDfV4GMK22nun1ntwA77dLks
         fvgTeHLjgKZk0+qlywWP0jKR6FFr3VV4zlheduJm25ft8FIaPQ7n+nns02amKgh62NN2
         1Scuf4DYn9hk4s+vPXnXLdISGMbByg5CJr0AUdmqcahj6BAo+l/tl6iUNASShc4x76JB
         DOGAwJHwY5rhADMovBngAwwAWVBGmoJWTatk3FEUyXJ6jFG0EWQeHaHTUEhHPwjf+e2S
         n8Eyh/s6hK5PobyrndYBaLBnKSL8b3xYjFbA+snu5HsgGFqNaWpxPDrark/Mt9QsQwCL
         DvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812143; x=1719416943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaUP1kZaDzbLlLlrnXpwVvSSBYt89/ufOLldJsnhc4U=;
        b=KIpaQQFuxqJaYVtBEAtdjQ/N8vpllhdpyO/GTNz0nK4nvuEjkQC87Dc+PkE0HnjCS1
         EiL0ZItOSnLJmHIiOHBviEq7muB4Uc708omjsALteSUSGZVL5hIdhapGEbKFJ3cPwVDE
         781shsgg2ensWua+WA3RTlXL8CjjQVx8B/tQpj9GfCi2m092yvIsm5XxWGykY/Ydqair
         oI0lbYeqRrzg2yyhZrZ8F7a7yUu5sjanmzHAz0YmyXGAOt2HGq2BopVeu7zz7t8oVH50
         PZcXsOiaKbduIbenNl2cd7cFiQFM5juS0+uE4mSIWDH+OmNk7dUXCIDpCoXrqB11G5Bs
         xHfw==
X-Forwarded-Encrypted: i=1; AJvYcCVWTMcPCDmJaQEs9RHQU8cgCXMdyHW8wbeXWVb8rUtGxmy3XiaJeD11xTOckqFAhyd2ps6Z/tjgBgbgtQl9Ikal8j/YINbYqaZxnZucPAt9
X-Gm-Message-State: AOJu0YzhJVZzu8Pq/4HnG6vV1Zt1ySbpI8/a8jcfRDZvaQ4F7r7fXsTh
	umAJ6W4h9bwlSLeuPKqq07//+W5EW4RYBWXYtjAIaEggpf+9FCTHhPe0g2DICqs=
X-Google-Smtp-Source: AGHT+IGiKyWuqgAIxgrEV+lA+jwRvALxPu8Ex4GA8h6qTDbq5CrrDib3WqnWy/fQMHVAIh7lZU0CKQ==
X-Received: by 2002:a9d:7e9a:0:b0:6f9:62e9:9f93 with SMTP id 46e09a7af769-70075a747edmr2788040a34.35.1718812143157;
        Wed, 19 Jun 2024 08:49:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b4fcf9ab77sm15777616d6.7.2024.06.19.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:49:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJxYT-004xTQ-Ic;
	Wed, 19 Jun 2024 12:49:01 -0300
Date: Wed, 19 Jun 2024 12:49:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 06/10] iommu/riscv: support nested iommu for
 getting iommu hardware information
Message-ID: <20240619154901.GN1091770@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-7-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614142156.29420-7-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_084912_664502_F1B91B8E 
X-CRM114-Status: GOOD (  11.97  )
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

On Fri, Jun 14, 2024 at 10:21:52PM +0800, Zong Li wrote:
> This patch implements .hw_info operation and the related data
> structures for passing the IOMMU hardware capabilities for iommufd.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/iommu/riscv/iommu.c  | 20 ++++++++++++++++++++
>  include/uapi/linux/iommufd.h | 18 ++++++++++++++++++
>  2 files changed, 38 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

>  /**
>   * enum iommu_hw_info_type - IOMMU Hardware Info Types
>   * @IOMMU_HW_INFO_TYPE_NONE: Used by the drivers that do not report hardware
>   *                           info
>   * @IOMMU_HW_INFO_TYPE_INTEL_VTD: Intel VT-d iommu info type
> + * @IOMMU_HW_INFO_TYPE_RISCV_IOMMU: RISC-V iommu info type
>   */

Is there a more formal name than "RISCV IOMMU" here? It seems like you
will probably have a RISCV_IOMMU_V2 someday, is that naming OK?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
