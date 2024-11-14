Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC2DD65C40
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YOMByq9HbLinO5M67rY0Zy55k1ROfxeJqsQCKgoiQA=; b=Kl3d99Ng/SU7Tc
	zmm6QhkSQUJmQrGwcSurgLfO9CNrJdAyArX5qqzs4nG7ooa4expT29uaLFXzRW4irV5MQ5luo9IW2
	jJuU5JdJvjZ5951YwUE4Yv8G+dIqLJjPn9i8k049fJJnluHn/nju2X2qJ8uRYDrFqwA8pRnQtCd16
	w42n1POSU0N4w//ulljKigFMviHGaa4YQaM6X1RAd9iR78W//b/X50p2E64+E7gszwOma+l1bOAyv
	jSeCldJaJV2PKymGXh84lS3whMOlN+T+BcSsajQ5zu8wQ3NBtx0Yz5kky09krtQMSpVagA0c0REBV
	UleIIcaRqoO1URmx9iBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSdo-00000008sv5-1lh3;
	Thu, 14 Nov 2024 05:43:40 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSdm-00000008suM-0DHb
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 05:43:39 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8DB1268C7B; Thu, 14 Nov 2024 06:43:31 +0100 (CET)
Date: Thu, 14 Nov 2024 06:43:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-mapping: Save base/size instead of pointer to
 shared DMA pool
Message-ID: <20241114054331.GA10817@lst.de>
References: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_214338_254291_C2196FF9 
X-CRM114-Status: UNSURE (   8.30  )
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

Thanks Geert,

I've applied the patch to the dma-mapping for-next tree.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
