Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269BCCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eaxa61v3qgA9a1p/rsPFMgm1K3Ct5YrAnD3eFfQXYoY=; b=aiwh0uMu8Vt+FM
	KzdmU9r5BwbV8YvPrLddxWt/yLLUyuJLQYnH5bGZI49si9UrqrfH7H6DjRUxf+HfAVBCZkcBVzZNy
	mAXKagFkc/23Xgvlt6h1/b2derEiOUQxUPHZMVgngsgV6WKAgh1wEvQ5AofSIkmNX6yaVTg+RduUZ
	F5GGZrJLtL/1PansDzU75mvjUjd9LP27VFhYvELEVhkLqtWnw/V7sbf0unaa0IjwjM/tob4Ox+uAj
	TtrEoavNG116D9iXnnXz76G4v3uXVXohJhwsoaLYurMKVx73npH6KIrfLkm0HI9fd33NzZp+BYP6N
	kILw6jjLqP7JsMAGCjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNTk-009ie0-2S;
	Mon, 16 Oct 2023 13:17:52 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNTg-009ic4-1C
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 13:17:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9503B6732D; Mon, 16 Oct 2023 15:17:45 +0200 (CEST)
Date: Mon, 16 Oct 2023 15:17:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
	iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from
 ARCH_R9A07G043
Message-ID: <20231016131745.GB26484@lst.de>
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de> <20231016-pantyhose-tall-7565b6b20fb9@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016-pantyhose-tall-7565b6b20fb9@wendy>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_061748_554487_603F1DB1 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > +	select RISCV_DMA_NONCOHERENT
> >  	select ERRATA_ANDES if RISCV_SBI
> >  	select ERRATA_ANDES_CMO if ERRATA_ANDES
> 
> Since this Kconfig menu has changed a bit in linux-next, the selects
> are unconditional here, and ERRATA_ANDES_CMO will in turn select
> RISCV_DMA_NONCOHERENT.

Oh, looks like another patch landed there in linux-next.  I had
waited for the previous one go go upstream in -rc6.  Not sure
how to best handle this conflict.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
