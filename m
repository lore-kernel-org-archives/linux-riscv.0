Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3F0C3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 07:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E414420874
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 07:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TAZa3uFE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E414420874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ko0/aeQHaU/g7RlvwDsRrMj+z3C4ZqUvHb7kgdMk/yA=; b=TAZa3uFE3CPoco
	02dIf5/Or7yHF/6Zt7DuurfjtxEbmAppDzXCLES0BA0CxiBQOrojlx4apcegqjMSUtFKIZkmEW61W
	qISyKNjRmF5I/7BwctTxe508Tp0QW8LKCDug3IWEJwqgpLcpZm9GPXcsRr354FCcCLquvaQfv+yP0
	YUzy6YpV0PQ6Bm6sQKI1iUdnjilZ+tUlGc3ermfXWNAh98KWuMRs0CH/UxnjorowVVY0OvgrgE+Iz
	M+8EkIUG7gPMSM3biN0q6ympH0Twt4Ghvec4CXlbmTz06ztpHsIwYMYbTIE397J6PIdXENtrSrO/F
	605z6E3GJAITqoh/o8Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i295c-0002H7-4F; Mon, 26 Aug 2019 07:06:56 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i295I-00026A-LR; Mon, 26 Aug 2019 07:06:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id CF05868B02; Mon, 26 Aug 2019 09:06:33 +0200 (CEST)
Date: Mon, 26 Aug 2019 09:06:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 10/11] arm64: edit zone_dma_bits to fine tune
 dma-direct min mask
Message-ID: <20190826070633.GB11331@lst.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
 <20190820145821.27214-11-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820145821.27214-11-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_000636_858013_40C6BA99 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: catalin.marinas@arm.com, eric@anholt.net, linux-riscv@lists.infradead.org,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-arch@vger.kernel.org, f.fainelli@gmail.com, frowand.list@gmail.com,
 devicetree@vger.kernel.org, marc.zyngier@arm.com, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 phill@raspberryi.org, mbrugger@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 wahrenst@gmx.net, akpm@linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 20, 2019 at 04:58:18PM +0200, Nicolas Saenz Julienne wrote:
> -	if (IS_ENABLED(CONFIG_ZONE_DMA))
> +	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
>  		arm64_dma_phys_limit = max_zone_dma_phys();
> +		zone_dma_bits = ilog2((arm64_dma_phys_limit - 1) & GENMASK_ULL(31, 0)) + 1;

This adds a way too long line.  I also find the use of GENMASK_ULL
horribly obsfucating, but I know that opinion is't shared by everyone.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
