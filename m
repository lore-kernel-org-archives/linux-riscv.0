Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A89CCFA13
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jK1GuNAjmrMWrs6smZQ4v/j55V5REyXy+Iosp8FnWvI=; b=DV3VUZmiZWs9DS
	BgdTTe7fQq3+DoeQQDtGkCv7WRGbSlCR5WvhDlUNI0zPOodTDvaJQaf0B3q7mTJTCayn/OjWuFyZ4
	amjNny1AVGOIiVKrRYFHJiXS/iWIMIU+sYRsQdcGEklVNJmbPuaKvw9M+gpqphtZk10ayvg2ZHlRJ
	pupQo1InvmJptVFO7My4gyVUSwITcWzuUockZjw4JE1OwecOOpgZ782XiUV4RIs7vE/bKmfvsvdzC
	AbRiBpjWJ7nuz60DUcGsePN0X23JO6mb5k/puxKo8cGTQdTeiCthapTXpKO1ffEroeHU6IKeC/6a+
	8bjLRb+I7NJT/Q0P4PWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjAV-00000007YQ6-29FK;
	Thu, 26 Sep 2024 07:44:07 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stj1r-00000007Wz5-3aqm
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 07:35:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 69CBE68B05; Thu, 26 Sep 2024 09:35:02 +0200 (CEST)
Date: Thu, 26 Sep 2024 09:35:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] mmc: core: Only set maximum DMA segment size if DMA is
 supported
Message-ID: <20240926073501.GA25149@lst.de>
References: <20240924210123.2288529-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240924210123.2288529-1-linux@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_003512_065716_890D4D1F 
X-CRM114-Status: GOOD (  12.35  )
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

On Tue, Sep 24, 2024 at 02:01:23PM -0700, Guenter Roeck wrote:
> Since upstream commit 334304ac2bac ("dma-mapping: don't return errors
> from dma_set_max_seg_size") calling dma_set_max_seg_size() on a device
> not supporting DMA results in a warning traceback. This is seen when
> booting the sifive_u machine from SD. The underlying SPI controller
> (sifive,spi0 compatible) explicitly sets dma_mask to NULL.
> 
> Avoid the backtrace by only calling dma_set_max_seg_size() if DMA is
> supported.

Technicall this looks fine, although it would be nice avoid the overly
long line.

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
