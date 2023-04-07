Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373E8C77B6C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 05:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3OOZzOHeOqkDUXTIWwU6f/RvXCjA2GJYmScYyl1lRQ=; b=C+BIqRHOm04OR3
	A5Fi29BPLhc7CFsfgPUM2GlFA3ldQ5wZ0/KjMRxKYg/dJDnSQeB1/PUnnI/MUZW93bLEf1mv/uX8A
	/SNvbmLqJrYxjFgWv7DfwkcSP0qZkwK4BrsyeqNGqYU27nohviMROBRsxGfdBBqIUj7e8+35thDa0
	k2QYMEZiW8d9Mf6eBaF8wFsWmYWUl2lAgyOs9bXEC2/k3xMo9UTYUs646C8xEXhMRJuqbNVRM11XY
	N5+wnZJY/dZbCwmXNjCHL3mQEPxno39F4flpnuhfklD/VfJie6sL2fL0kYlo6z2jhUfKwhGxB82Nq
	54+Ra0vXVWVsGxSoQmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkeoc-009DTu-2Q;
	Fri, 07 Apr 2023 05:39:14 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkeoZ-009DSX-0R
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 05:39:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6EF7967373; Fri,  7 Apr 2023 07:39:02 +0200 (CEST)
Date: Fri, 7 Apr 2023 07:39:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: iommu@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	tsbogend@alpha.franken.de, mpe@ellerman.id.au,
	paul.walmsley@sifive.com, palmer@dabbelt.com, robh+dt@kernel.org,
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Use dma_default_coherent for devicetree default
 coherency
Message-ID: <20230407053902.GA6636@lst.de>
References: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_223911_317234_43F6E49E 
X-CRM114-Status: UNSURE (   6.65  )
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

Thanks,

applied to the dma-mapping tree for 6.4.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
