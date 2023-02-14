Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B05AC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 06:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o76nZE6dEI4lmzTAaphVOs7bv4lx4sxZMCeZnE4bTV4=; b=JiSeGj+EB+i8S3
	1JsQkhGOlTUP/ZFJZ+Uc31/zTDkKtRkU7FKSyCbF+H6O1WORP4xo1v51e3iSVZnnAy8hQvdheFnws
	ZfLlyMtNa0t3cI5xmxZpIKU2bwuO/npwsTHMgyGYFcKo44sUGT10iYqwflCH1V3zgMbsOEcFfd0wx
	CfZpyDT36lrlY2Nvw7v8WGjC3xFhItHlBcr6tBDO0HY5xns/fI64BuG+WseORKGHb5dAN8ltn52Bx
	Uu5CpPyrwYOitjvQCl/JML8VXSYfaCNgyR41o0iBhFefmtYqaKimwFbTHjkr57jFjZZoxbhUQJnrb
	+s6109PN0SmezrGJM0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRoYl-0001O6-NI; Tue, 14 Feb 2023 06:12:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRoYj-0001Ng-GA; Tue, 14 Feb 2023 06:12:57 +0000
Date: Mon, 13 Feb 2023 22:12:57 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: JiaJie Ho <jiajie.ho@starfivetech.com>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <Y+smaRL9f7g9RWEB@infradead.org>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
 <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
 <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
 <Y+TARjfzt2FMG6oJ@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+TARjfzt2FMG6oJ@gondor.apana.org.au>
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

On Thu, Feb 09, 2023 at 05:43:34PM +0800, Herbert Xu wrote:
> On Thu, Feb 09, 2023 at 09:33:06AM +0000, JiaJie Ho wrote:
> >
> > The DMA can only support 32-bit addressing.
> > So, I am copying everything in case kernel allocated memory region >32-bit for a user app.
> 
> Does your hardware support scatter-and-gather? If so you should
> at least allocate individual pages rather than one contiguous buffer.
> 
> Then you can allocate them on-demand rather than before-hand.
> 
> It would also be nice to not do the copy if the input you were
> given was in low memory (and contiguous if your hardware doesn't
> do SG).

All of that is done by the DMA API, or more specifically swiotlb and
does not need to be duplicated in individual drivers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
