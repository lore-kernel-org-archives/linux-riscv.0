Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E79C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1T50eVUBH+aRBd1MrFiBURyMvPUeoXLG5YY+VHJRrZQ=; b=w3996dW57Z0wB4
	OTSP9fu01+d8fYXj7/TOLcrvyneaZH6F3SNsq7QHqxtPW8IYl85ZAfT9fBQRzbcfd+8pEVFQYwFhh
	19HcwRco0db8VENK48g5oEePLqyazpDhXLc8AMmN5revvLm596WD11bGGeq5UpktTlxrr0CYGEu0G
	8BP1Xd/1JekYGS/G9ReEBhmGW/LMkSERQ1wENtts0KjQJeUMqzjXFcDNfDtgf0NiZJ+0DsT2y1qLP
	DgVzQSsSP7inMUa/25h7t/B9EbsF7sN/Iocyc6/PlaFbCqyhKo5glvexnqhu9YJuWOClsruilVoYj
	0EGG6K6t8UvA6vDsfoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfe4R-0045UY-1Y;
	Fri, 24 Mar 2023 09:50:51 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfe4O-0045Ts-2H
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 09:50:50 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pfe3k-008ExG-92; Fri, 24 Mar 2023 17:50:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 24 Mar 2023 17:50:08 +0800
Date: Fri, 24 Mar 2023 17:50:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZB1yULAh8GUswpHk@gondor.apana.org.au>
References: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
 <20230313135646.2077707-5-jiajie.ho@starfivetech.com>
 <ZB1x/bUdOSWzim+8@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZB1x/bUdOSWzim+8@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_025048_741294_DFC06FEF 
X-CRM114-Status: UNSURE (   8.38  )
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

On Fri, Mar 24, 2023 at 05:48:45PM +0800, Herbert Xu wrote:
>
> Please don't allocate the whole thing because it could be unlimited
> in size (and triggered from user-space by untrusted users too).
> 
> If you have to copy, then just allocate a single page and copy
> that, hash, and then repeat until it's all done.

Nevermind, your hardware doesn't support hashing piece-meal.

So just use the fallback if it's not aligned.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
