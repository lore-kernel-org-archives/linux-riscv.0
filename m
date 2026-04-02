Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF2D6AB17
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elryESHtXj2FqjsAUss+We8XZpsWLkPqD/y+1kyz10A=; b=TqACVwPQjPIaMB
	r7eTshJ0MueLbvOexYsel9ZjycZbvy7cqHug/FBKO30BUfRkNAuvJsOLD35Ss2CHk/6duV49p0zMt
	9nxUynmuWtA8dBOzwqQo++Wr2Trry9HawFNg7UpxgWZy+VjoJHtV8DDk9uFkg+O+JI/u8LDdYzlxq
	oDtG8+mVC3IGpXiPhVL0ZvmBwaWvbpuIWFde0MhTJM1CHvIg1wY/KG21i4OwfSo7lXp/XNm/BaP71
	7RfECV3jKpug+VcWp0HZyp+gMQiIu+c8PomJk9EvW1Xq/KJPdmn8zOdr5UWqO9xFslXrI2q9I14lX
	iwYfYtWbDywedTR2fQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Pdt-00000000nSA-1Kju;
	Thu, 02 Apr 2026 21:31:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Pdr-00000000nRl-3ivK
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 21:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1870960008;
	Thu,  2 Apr 2026 21:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB0DC116C6;
	Thu,  2 Apr 2026 21:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165514;
	bh=jT5N5puUXD0Mrt65ONYcgDH7TNm3QJ6jxgMZJyRwxew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sHv8PvHqqSh4BiskHrgktglKwp8MJBaWmkufhHJbTJhgjogmhjEG4QAVyAllgUnhY
	 GrKYChFOS+bD4G8ls//2JsxxmZ1QDMuTVeK1yADuDKGO8ax8lGAy9vpWMzbYQ5j0rx
	 2i9efUkcQqgyiEt7IJ1btK9W1Pv/M7atufr6JnUlh2wejfJQD8HQmpziatdhmWl26c
	 J1LfVKnk9xoUzF1ueu3DDoERR6MWaPSuR4aup4su7WUdvEgZjivrXvjHLjgPkIVndB
	 u381/NGJcgBaxxzbsXCb2HAWVxnm5jjgvYdgdCis4woZtjm26IGbEnQJMIvt7dE/CN
	 eDurMJ23g/RBQ==
Date: Thu, 2 Apr 2026 15:31:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
    linux-kernel@vger.kernel.org, alex@ghiti.fr
Subject: Re: [PATCH] RISC-V: ACPI: fix two __iomem cast warnings
In-Reply-To: <20260311102217.409376-1-ben.dooks@codethink.co.uk>
Message-ID: <df1a84c9-e039-f81b-eb46-04203990981d@kernel.org>
References: <20260311102217.409376-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
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

Hi Ben,

On Wed, 11 Mar 2026, Ben Dooks wrote:

> The __acpi_map_table() and __acpi_unmap_table() return and
> take __iomem tagged pointers. Add a cast to fix the sparse
> warnings:
> 
> arch/riscv/kernel/acpi.c:216:30: warning: incorrect type in return expression (different address spaces)
> arch/riscv/kernel/acpi.c:216:30:    expected void [noderef] __iomem *
> arch/riscv/kernel/acpi.c:216:30:    got void *
> arch/riscv/kernel/acpi.c:224:24: warning: incorrect type in argument 1 (different address spaces)
> arch/riscv/kernel/acpi.c:224:24:    expected void *addr
> arch/riscv/kernel/acpi.c:224:24:    got void [noderef] __iomem *map
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Thanks for taking a look at this.  It appears that some of the other 
architectures have the same issue.  Could you come up with a series that 
addresses the others as well?  You might need to get the ACPI folks 
involved; it's not really clear to me why __acpi_map_table() needs to 
return an __iomem *.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
