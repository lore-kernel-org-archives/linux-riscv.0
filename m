Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68153C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKpeI9bxhoNoZRYWkPJt11utGPRSNh0WZa4lK9zU04Y=; b=gCZWpmoRvUsr+b
	vNFxHYxmS1S9zBZVHgtTM4L4F/2bzrhjIFG1XnKPFQ7NyYqjFoambGFdhG+HEWcqzFf36yn56V+4W
	XHRLVW9K5rkFTFbjv3CUxVrtVXs3tPHyLOJ5pbYWIDStgv3Lt5KgqjXRRq2XATzfexyH6tFNJjqSZ
	1FpFIKRBDFDKWWGQIg3BgkMz/8HzhzwLKfx/R4kJ25ag9Tnw5E1yqI8xUVjA9KeZUVmNQPrjek922
	lUABCZDuRRNoEeGdZgvTDQLkTtuSpvl9OUOtLp70AnYrNm0aMLD0CLYSU/xbWcDG81JKiRJ/Ajh1V
	9BpnPQv7klVHqkfMmwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipYA-00000006cIB-2Olc;
	Thu, 22 Jan 2026 07:56:18 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipY8-00000006cHq-2oXY
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:56:17 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7C1181C03E4;
	Thu, 22 Jan 2026 08:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769068573;
	bh=YJic1/XLgE96fzrxFvELH7XvK4WNcmG6B4CpNmXzS8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhMVwVRc9f2h1Xmdana7v4gRcA+ULRSJdCOUCZTS++WvgA5jydfggsztHuq5BAjSF
	 BBEJKltix0gAywoM7Ck1wHofbpNH5iNs8QU/bOPkUNgLfg/waClrLZREbbuBaboZ73
	 tdmfjzS3CFWCeeOLidAtieVaMLbnByW1grp1Adj9sxFxr/M2qqbwF+/mdUhlCI1FKe
	 NOBvppWc2xyjrjCyS9V8zHBjWfbw2k1vj1jtzFkVMOgZIbvAxxUD0x1Jt30HIgyybq
	 F7fAxuW368AWVIzKHGidk+ewgNwer1xHAuowrJsKP4pMUvW8xde8Y6mcQqaam9zFdt
	 AMfscVcSbKzzg==
Date: Thu, 22 Jan 2026 08:56:12 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, lihangjing@bytedance.com, 
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev, xieyongji@bytedance.com
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
Message-ID: <72olk767l4goaqsrkyelhtnzg33nxbtwnammy4asnqxukbolnh@gwypmg6n5t3e>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_235616_925918_9B324E19 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

Tomasz,

On Tue, Jan 06, 2026 at 11:06:44AM -0400, Jason Gunthorpe wrote:
> Jason Gunthorpe (5):
>   iommupt: Add the RISC-V page table format
>   iommu/riscv: Disable SADE
>   iommu/riscv: Use the generic iommu page table
>   iommu/riscv: Enable SVNAPOT support for contiguous ptes
>   iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST

Any opinion on that series?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
