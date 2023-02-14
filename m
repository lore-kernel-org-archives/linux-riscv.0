Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD986C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZtl2AxuHyIQDV42lnAVZPylKcCyAcZfM4/d607iODw=; b=5FlAaMgOejWqI5
	2kQHvJ/EdAjiDAKdIA6GASgVIsuQTCXUZ+RAx7EOmCo0ptAtz91wzYXbCsfs6149wyWmRO+aTbnmN
	VrINCuDwE+LYI75RDzqKoZAaUltyH1pPs1GhAkA14ig1iZ49/V8+vqGkV5ZnMjBDUnjjHoQddQRRT
	AVb+yV++ptZX0SgjWJbkmSgrZZCg5WwSLazkGkHqCxRDWzpab9FoCkd55WIJ13QOYnraSpZZ9K7O5
	dHaMHNkjudgdV7sOoQcMjKjv+3pYBsoJmbzX5x/gMRrF0HilVpI0byrWJdDseaGB2woAwQHgatPLX
	gBD24L48yyjAWtM41xWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRoY2-0001Hj-HW; Tue, 14 Feb 2023 06:12:14 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRoXw-0001HL-Qo; Tue, 14 Feb 2023 06:12:08 +0000
Date: Mon, 13 Feb 2023 22:12:08 -0800
From: Christoph Hellwig <hch@infradead.org>
To: JiaJie Ho <jiajie.ho@starfivetech.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
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
Message-ID: <Y+smOBZ9CkEGY8Ua@infradead.org>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
 <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
 <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
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

On Thu, Feb 09, 2023 at 09:33:06AM +0000, JiaJie Ho wrote:
> > Why do you copy everything before you feed it to the hardware?
> > If the issue is alignment then surely you should only to copy a small amount
> > of header (and perhaps trailer) for that?
> > 
> 
> The DMA can only support 32-bit addressing.
> So, I am copying everything in case kernel allocated memory region >32-bit for a user app.

The DMA API takes care of that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
