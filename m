Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060B6E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KioKX/YzXQP1a4fM97bVJ9kiZndq1APg3ZAG0PXyknA=; b=auxCrYCWyt0C0w
	lnJNz7Ys16+dfL2AbAggOusvwG/JbPwhV/6JfKP8MaR+KKYtGXQ12wLWt7dgW8GkEyfwSjr0Gic67
	Vb2XXVERhePlTIsf/bIrVuF8eTHLH9efdnwIliB6Gd6oA8cRFVW4p3MpHauuwQIFydTq0Pj0qNTiE
	Ie8HP7+KSscLMcudpnZcvXq5mnTE6eEJ/d93yVaRXifmSHdK+e7EKGFrWULnMpCyZwF3vnG4iJVkV
	Wox5MzSqfpe1cnlgtCjrsWgGvZCRtaV2vUPFZ4J0E3xTIUw7HGlgSWGmWJ+QDTqERZr52n5DWaaeA
	xe8nPk4cUxYJ6PSAfwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmnb-00A7cS-1Z;
	Mon, 09 Oct 2023 09:43:39 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmnY-00A7bL-0V
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 09:43:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 46F1668D0D; Mon,  9 Oct 2023 11:43:31 +0200 (CEST)
Date: Mon, 9 Oct 2023 11:43:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
Message-ID: <20231009094330.GA24836@lst.de>
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de> <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com> <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_024336_334906_0B27A3F0 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> The fix you are referring too is probably commit c1ec4b450ab729e3
> ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> 
> Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> depend on ARCH_R9A07G043.
> RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> up being enabled.

Ok, so we need to actually fix this properly.  Lad, can you respin
the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
