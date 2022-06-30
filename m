Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED9C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 04:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSSPv70BhVCrKtwrx2oqdkcy9A5h2v+7rswM6+9p63I=; b=z5UcTXnIOZBWTN
	9hd0AdmbYuZ/lIaxzVFXvmPThw1UXMsGUms3Qrgl5aqkTnYRGWd5cSzUNUwCe88KjLLUg6C5cTUYZ
	T5tMTV3ySEbK2ErjHg8vlqArkhkUzDmdsoDU7RWQ7+PWtOg8k7RMofa+UWEtWjh2nXl4thpZqSScz
	6ZkgRrpJ/F2vx7fjfh+50d1oVIju7DXaAQFrvThMIJOCec+PI6Soww1RPKithMOeb/KUk2trVfB7e
	2FDwYM43Cw6h1V2CiXfV9j1SKSnsj/YaJqbS6nkxHdRM3DA2jDT7a1e5BxUIzGYmATOKuvYbrzJr5
	JqUBcz8B80kikkqlhAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6lkc-00EzuQ-Nn; Thu, 30 Jun 2022 04:25:58 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6lkZ-00Ezsy-DO
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 04:25:57 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 887CE68AA6; Thu, 30 Jun 2022 06:25:49 +0200 (CEST)
Date: Thu, 30 Jun 2022 06:25:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
	philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org,
	atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
	robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	drew@beagleboard.org, rdunlap@infradead.org
Subject: Re: [PATCH v5 1/4] of: also handle dma-noncoherent in
 of_dma_is_coherent()
Message-ID: <20220630042549.GA4958@lst.de>
References: <20220629215944.397952-1-heiko@sntech.de> <20220629215944.397952-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629215944.397952-2-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_212555_623381_C037608F 
X-CRM114-Status: UNSURE (   7.45  )
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

Looks good assuming the new binding is accepted by the maintainers:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
