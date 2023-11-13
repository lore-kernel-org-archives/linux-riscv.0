Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6750EC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 20:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRLfwt436hsnt2kN40rE5VAXTIK1pQ0I6nsNYJMaX3Q=; b=Cv72mb2Rv35m7W
	/T7oDu4Bv//IDdMaVEmME6IDgmJRG8DUD0/1bzaUiTU1KsYUihweUdl/GjyLZszz6pVieC9lKZWXB
	+30sOFLcPcE283gb2XExeps9ve2LKXspQzuVDjgmkRLEFuDQNWUvGw6VtqSTj4f1mdgzKdFdyRMhA
	CPWRBdC4DvqJDKQjvXv0RCPE5Il9+FOFGcVR6esINBahEo4X9NAWQHG60FS6L93521NoaCakM+fw0
	yyOYVV4iMG22wA5UX6O0cr3p+1PSAAQgvwpoUWoKCj512/n4zzmWf1zYF+NoMketF2SCeiSDdXzZA
	KIXQMdXMLb4ULWWnH6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2d90-00Ec9W-0q;
	Mon, 13 Nov 2023 20:02:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2d8x-00Ec7y-10
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 20:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699905764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5sbsbZrhM7njh7UJ8Gfj3jbjPzQiV5xODIk6atjKoU=;
	b=FC7cvOMY36DbgQF+XdGUaq5cSkrqnGGK8IZ5rJQqIIfaIxYX+Mn86Wz7CycVKWpBCKUfuz
	bcYI/a7egw3rPRjnbMrvjM4Su5TfBp0kxvoVe27CFAJ4Z3/jA18aUyGsKozAbK9ssl+Yso
	27Xgx5Y3DlLNQDeGasEJTIBsGoXsR9g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-PronPfz4OJy3AXHfNGqMIg-1; Mon, 13 Nov 2023 15:02:43 -0500
X-MC-Unique: PronPfz4OJy3AXHfNGqMIg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-66d159f725cso63271976d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 12:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905763; x=1700510563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5sbsbZrhM7njh7UJ8Gfj3jbjPzQiV5xODIk6atjKoU=;
        b=HFgDSAf1j+eH2CrXnbaREx++f5Ag3CESck9Vu2zfaqsgnSICghqyfjqoctwoocYvXk
         H+ubqg/eTzhw7DWCAvnmb3I6EPIiich6q2B2xhPuFyMZzOuH0QH6PwH0l6iJudIZpZk2
         on5WYzJ/GNZHujNGcGUA+izivS2jdbtLMPM8GKArIgeWsIANb1KAA3UibxxH7mw7o1Vx
         ir7tU61s2JqaI8nmB/FAtVylDdRU2vRhAYDW/+K4JIBo1aJQO9+JnKb2sezf++Btp160
         Or0Q9WeEJs/U8HvE/MoWCzg3gjAuFv1jl7akogmE0I0juBvzsWddek19CGiZb9pn2tO4
         bPjQ==
X-Gm-Message-State: AOJu0YzGEES4xVxQgRms+CWecrbZIjPnuvu3cDMUGPtiq3ncUHGcOO5G
	abQcBVj/Eg7k7XRhgnrMzeWSvfYMhPY5hV6lXwZZddGd5IB2hvMlK8PIj/GOXxu9UQrkvFLmK9D
	IaYYx5022iEKgYrXgVkTKW1C4ZDd2
X-Received: by 2002:a0c:f9d2:0:b0:66d:9970:6464 with SMTP id j18-20020a0cf9d2000000b0066d99706464mr233537qvo.13.1699905762794;
        Mon, 13 Nov 2023 12:02:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVvfJ/8QycB4sitSkyNc9BJr+XhgbESVoJGYkT8lKAjf1cMgXzof7Oqc5lCEmlPE1oL2APNQ==
X-Received: by 2002:a0c:f9d2:0:b0:66d:9970:6464 with SMTP id j18-20020a0cf9d2000000b0066d99706464mr233490qvo.13.1699905762358;
        Mon, 13 Nov 2023 12:02:42 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id vr2-20020a05620a55a200b007757fefea79sm2097337qkn.130.2023.11.13.12.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:02:41 -0800 (PST)
Date: Mon, 13 Nov 2023 13:02:40 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 12/17] iommu: Make iommu_ops_from_fwnode() static
Message-ID: <gg6ecoukkia32t33vjfunny4y54pulz6k6zfkfpp6nahav4otj@z6e62pbavceb>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <12-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <12-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_120247_422446_AD71755F 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, Nov 03, 2023 at 01:44:57PM -0300, Jason Gunthorpe wrote:
...
> @@ -1044,11 +1043,6 @@ static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
>  }
>  
>  static inline

   ^ was missed in the deletion below

> -const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
> -{
> -	return NULL;
> -}
> -
>  static inline int
>  iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features feat)
>  {
> -- 
> 2.42.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
