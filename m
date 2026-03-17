Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919B6FD8752
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IVJ7QqpU6Ff8+M0CC77+0m263ayH2NjeaSkpFNiGPk=; b=cG1GJlLLDc/2RQ
	t/br+K02DGIi72AZ2CE1PPhCZkloh413dCE1OgLKTISRUj0rED03blzBpb01CeBhxTt9vj6E71HQI
	psJSnvMErGAni5qkhGt4xWRqWctqbK1rQGEYvQCzIkpQxE1gNRnTofswObeIF2xR3mONd2qzS6uSf
	q57UPqhwjfFS+R7qkyYpgGZGdaEuDO3bk48b6ldt3MAO/8Um6lN4upXEq+PBV9kC1TNAuXbpPORAh
	2T92eNdUC8qo3LZx/fxX64Y6vM6yOKqAN13h+VAwtf96pyHA5ED/7VfFv7VhzS7wy0VeyhM2cXVCg
	AwbO7EhqJiVHWIcpktEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TI4-00000006GsF-0Ev8;
	Tue, 17 Mar 2026 12:12:52 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TI1-00000006GrM-1YV1
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 12:12:50 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4E8581A3FD6;
	Tue, 17 Mar 2026 13:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1773749567;
	bh=VUwYbEC32ZyPKvaLYMgQTItjIPWxHmoviMx7i8ZsxGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yZE6o8qAPSqooYV4cRtlDoJOy/x62VC/y/8gnZVFtVpdH+g2TDC3dZGfp3LDDkM2s
	 ODrXQd4W2A/38530Xmgw/3adCFuKIyJcv7j3N65r0TTdEm9LiwubLqLosH2Zk1KAtc
	 LAl9q3zYkhfnDX/Xhld4VnD84AdvxzASxV7QPs3owec9JLrLgKua85gvKrXjDdAtV/
	 rd5nvG8MRgXALw7PLq/gs28+RqTZ8UUtx3Gy0wx0YYEOolfYtEiR+M9LLeEaO0a4TP
	 rzuLe5J7XOdVHhgy0/lwvk+3Bm3eRAQNg/ZT+oQaZulTYDwsoCgbA6ap2UJuax7tSq
	 FrNkJC36coBoQ==
Date: Tue, 17 Mar 2026 13:12:46 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: tjeznach@rivosinc.com, will@kernel.org, robin.murphy@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/riscv: Skip IRQ count check when using MSI
 interrupts
Message-ID: <ydj2t6zshj4ncr7hhummpcyk75tjatgjhgw7zfmpehvyp2hqxd@n6q4o264yvka>
References: <20260130065420.16811-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130065420.16811-1-guoyaxing@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_051249_583717_740DD12C 
X-CRM114-Status: GOOD (  15.13  )
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

On Fri, Jan 30, 2026 at 02:54:20PM +0800, Yaxing Guo wrote:
> In RISC-V IOMMU platform devices that use MSI interrupts (indicated by the
> presence of 'msi-parent' in the device tree), there are no wired interrupt
> lines, so calling platform_get_irq_count() returns 0 or -ENXIO, causing the
> driver to fail during probe.
> 
> However, MSI interrupts are allocated dynamically via the MSI subsystem and
> do not appear in the device tree 'interrupts' property. Therefore, the
> driver should not require a non-zero IRQ count when 'msi-parent' is present.
> 
> This patch fixes the bug where probe fails when using MSI interrupts
>  (which do not have an 'interrupts' property in the device tree)..
> 
> Fixes: <d5f88acdd6ff> ("iommu/riscv: Add support for platform msi")
> 
> Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
> ---
>  drivers/iommu/riscv/iommu-platform.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
