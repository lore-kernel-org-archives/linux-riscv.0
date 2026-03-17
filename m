Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78583FD8752
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMRuF8eO3gP/61xpUTV/3lbFwUnhLlbd7vd+a9iuCAQ=; b=XcaGUyf7WRD09X
	yiTIP+ugpOpyDBpp3GFf+2n2j+i7nWYUCokJ1IYB01DSDtZ7gi1EwzHg7uW+X8OHq0TJLpwrP+XXk
	SYZOvdRfl10oVtPzj9qNz0VSITCkLwFF+cqtMZtauXUkVG2gv1PDaLxp48qKQtZz9EZw+O7mWWrT4
	toWUJOVnC+b7Tz+r4zr9qNz+tzjWt0QuyjEBN3z6uXA+y+QdGRL3/eP20m9hkKconMy5slRI/lZUs
	dm+U/5GQmksXRF7zQ1J4t/nuO4EmSPeIe23W5MYACyB5/4aJqrY0byG4Q4bQm188TGxjAwIByseRx
	tXtGDDP18mfm09ky9OUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TKB-00000006HFN-0RCR;
	Tue, 17 Mar 2026 12:15:03 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TK8-00000006HEe-33D2
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 12:15:02 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4DD8F1A3FD6;
	Tue, 17 Mar 2026 13:14:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773749699;
	bh=uAKahsM/qJGr5KlT8cxvZposlshEw4Sg6KAtjjfWjMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gL70x0AHPs4b2MXLmZcfKMG8XHMhjQusoC21eu4NG4CVOhElQ9MGMAmnAvuD2ueIa
	 xZ972IBnjrY//f+clncSB2uqqEQ4n/kg7BvJevZGHsGftVRvAOExXPaaLvhtyrPozA
	 nGm7W/Enw0cVPhUt3LX351AbTgZKfxMXhvSLS4vAL6x1tDRazU6TPtwFVUDparXMWc
	 dYfkUDJVlbdyIWiU71spAP3hp9DenKTDjlYF2DU0DYcHJf6i5kOnGHo9WPpLcRFHVF
	 r5ZIFD5OxSzGBC622hg+jVVB5UuFg2PBDRZN2hIjBSYlDKWHqm8Ug0wz42KKCgvcuK
	 AS9J3iabHR6Ow==
Date: Tue, 17 Mar 2026 13:14:58 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Joerg Roedel <jroedel@suse.de>, lihangjing@bytedance.com, 
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Vincent Chen <vincent.chen@sifive.com>, xieyongji@bytedance.com
Subject: Re: [PATCH v4 0/6] Convert riscv to use the generic iommu page table
Message-ID: <3ottjudlj5f6skb6oopihesuuio6oexs5ycbajxluihdzj6spt@3quz35c6eddf>
References: <0-v4-5a9ca1a9b7a5+5f2-iommu_pt_riscv_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v4-5a9ca1a9b7a5+5f2-iommu_pt_riscv_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_051500_989570_04FAEF4B 
X-CRM114-Status: UNSURE (   6.82  )
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

On Fri, Feb 27, 2026 at 11:25:35AM -0400, Jason Gunthorpe wrote:
> Jason Gunthorpe (6):
>   iommupt: Add the RISC-V page table format
>   iommu/riscv: Disable SADE
>   iommu/riscv: Use the generic iommu page table
>   iommu/riscv: Enable SVNAPOT support for contiguous ptes
>   iommu/riscv: Add missing GENERIC_MSI_IRQ
>   iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST

Applied, thanks Jason.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
