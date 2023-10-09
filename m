Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3902FE95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkqrPDISQY6WYO6qNjruTSUUlllwjlCpGFJpvSvahVU=; b=L+xGLSVJsJPdVn
	NTUhscPB5sizawkgRD2tvsiuOGG34wlPfoUjJnHsQm0QDAnpYZkMTW4WedaEbGPY8ZKb/YdxPm+k9
	e2nMkOOt2tfp4nBEjZePcO7Z482IuJF/q9HvYmz3szlL3UKPcdEDe0uhvRYb917UIUsTw7bP5TDeC
	RQ26H52JGyYVXICX6GQU4zJv9jIsaDRYzcGakV5AzwRqKXykZPuYqegeDHqNOLOvVM9pcbH6dhkVy
	GpImOcEflt/o3hBCXOBDi+Mm1MFT7cFYJC4XBiofLC8PhqGKUBGFJvCSby+PK1i6zR8dGu6G5pP/Y
	KSb2/qJRMR9evKOhQaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppgI-00AimJ-34;
	Mon, 09 Oct 2023 12:48:18 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppgE-00Ailb-2s
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 12:48:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3A32068CFE; Mon,  9 Oct 2023 14:48:06 +0200 (CEST)
Date: Mon, 9 Oct 2023 14:48:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	arm-soc <soc@kernel.org>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
Message-ID: <20231009124805.GA7042@lst.de>
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de> <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com> <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com> <20231009094330.GA24836@lst.de> <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com> <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com> <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_054815_071706_1E15F7E6 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, Oct 09, 2023 at 01:10:26PM +0200, Geert Uytterhoeven wrote:
> RISCV_DMA_NONCOHERENT does not select DMA_GLOBAL_POOL,
> ARCH_R9A07G043 selects DMA_GLOBAL_POOL.
> RISCV_DMA_NONCOHERENT does select DMA_DIRECT_REMAP if MMU.

Yeah, and we'll basically need to split RISCV_DMA_NONCOHERENT into
an option for each type of non-coherent support.  This is why we
should never have added support for any of the non-standard versions,
as it's turning into a giant mess.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
