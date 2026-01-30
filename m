Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DD6E6BF3C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 23:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7m/VAzlYCdUal4kKZdPSu0gW8ccE7o8MsycBTLCO8zw=; b=3vVF2E1ZnH4TnQ
	WFhDm9YzWA61G5mlgtEdwDXDdfiwcK1p4W4X9ttKKDlzxQfdkK77/e7d/2aGdPrjg2M3hk2j+QzCL
	JKhRKnbWfltKWVQRjzpE2Ci7MgXq6Y5dZuT1DmBBzf+T00TpT/RZtOYIkzVL6UEKVP2vD/qu7U9sV
	Y8qEod8YbfyRkPRV6sCANcoih9fcRVGRW+YnLRD/RgSY9U+RwM6yxTgRcQM5aCaSEnMW9fiJ7iQQ/
	SJJi67Gm1+9QdM5qgAh+hFQaENjb2F5MfbNPb4aMkkqeg20Nu3Puy39rBMfBxD3hlclNoSBKkZzgq
	qxocUL0ePqLc13mGwZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxh9-000000025dD-4253;
	Fri, 30 Jan 2026 23:14:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxh7-000000025cm-3rMf
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 23:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EBC9442E2;
	Fri, 30 Jan 2026 23:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C2FC4CEF7;
	Fri, 30 Jan 2026 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769814867;
	bh=BYVLMfjlzugSV06GJuMhIdNz3ii0H/2nYGc7SJ5HKu4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GdD+wVPUvvGQjp73geEyDLrh0soCtHBNZVcAcWAkgcbjjCCdvJ206yPdVnVWBjCnP
	 mMGJsYvquL1KVKDccli3glI2w+MfbL0yQQ1BJ1+QlXap0Ck+AUpgMqo7NEA7mYCxkG
	 gPEctX/SPOsnWU8xXeUjNb9rc1TPsQhJJgyYBqY+q7KZ7T5WX/YYj3qLABuPAhnTR0
	 SVQq2j8zeYLJ+lzqZwR4j0RKA5GZqDDsRMuYb5WzLVrkkFaIAQz7k0wUEzSSHsljMb
	 d0NiQe7Dc/j4TFzw3+mqE3QQejUhbT62cgpkhlIOonOFqhy2h+4NY10ZmyOO234yn1
	 CrojXD2jTfg1g==
Date: Fri, 30 Jan 2026 16:14:24 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>
cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
    linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
    Will Deacon <will@kernel.org>, lihangjing@bytedance.com, 
    Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev, 
    xieyongji@bytedance.com
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page
 table
In-Reply-To: <20260129004640.GB1641016@ziepe.ca>
Message-ID: <63c38161-762f-bff5-0b9c-0148140c695b@kernel.org>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com> <72olk767l4goaqsrkyelhtnzg33nxbtwnammy4asnqxukbolnh@gwypmg6n5t3e> <20260129004640.GB1641016@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_151430_008119_429A8835 
X-CRM114-Status: GOOD (  12.38  )
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

On Wed, 28 Jan 2026, Jason Gunthorpe wrote:

> On Thu, Jan 22, 2026 at 08:56:12AM +0100, Joerg Roedel wrote:
> > Tomasz,
> > 
> > On Tue, Jan 06, 2026 at 11:06:44AM -0400, Jason Gunthorpe wrote:
> > > Jason Gunthorpe (5):
> > >   iommupt: Add the RISC-V page table format
> > >   iommu/riscv: Disable SADE
> > >   iommu/riscv: Use the generic iommu page table
> > >   iommu/riscv: Enable SVNAPOT support for contiguous ptes
> > >   iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
> > 
> > Any opinion on that series?
> 
> Let's take it if we don't hear from Tomasz this week? It brings
> the contiguous page feature people wanted and now that it is tested
> I'm not especially worried about it.

In the event that you don't hear from Tomasz:

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
