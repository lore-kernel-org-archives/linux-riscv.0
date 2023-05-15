Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33618C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 04:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySOsFPp/Gk+b5vhtja40znPm4h3YRwE4Xmbv5wAXrcE=; b=SqWP8dSnV3EjLJ
	TTIQI7Xc4CLyVUEOxW8+dSNp0w83+lG/VjV6JBIxWnKU3K7UyjQOQ05nes2pE1BWYWLG9OA79JQvG
	3rJgd6z1TvlzgHOQ2lWxWUCPk1xm3usTJ1Qwy/sQsRGJFb3saXwBOyjhlColg9mKalawDXcSGlWGf
	k3FlrUDtYtBkFPosE+6ZM+zVzx6+wLGaQIJTDqHQ2SuoXSGpD7IszhrENKIGmTkoz+wtwqW4Hamz4
	oT73D1fTGHp/Q728ipGYEeZ5R2XxRzI9U77RnZcsIVBrea9uWqIUu4ksnRuHUrqsoBPmVQAds07Wb
	qjBPt8+xGNNqyJa+O01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyPlx-000oRP-0E;
	Mon, 15 May 2023 04:25:21 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyPlt-000oP5-0W
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 04:25:19 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pyPkf-0090a9-6j; Mon, 15 May 2023 12:24:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 15 May 2023 12:24:01 +0800
Date: Mon, 15 May 2023 12:24:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <ZGGz4YFDMKQThG2x@gondor.apana.org.au>
References: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
 <20230504073400.1170979-5-jiajie.ho@starfivetech.com>
 <ZF4bKe0YkpcQakLs@gondor.apana.org.au>
 <2ae2d187-5db7-9207-7846-1a80e87047b2@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ae2d187-5db7-9207-7846-1a80e87047b2@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_212517_200564_B4C402FE 
X-CRM114-Status: UNSURE (   8.85  )
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

On Mon, May 15, 2023 at 11:27:35AM +0800, Jia Jie Ho wrote:
>
> I've added COMPILE_TEST in the Kconfig, then ran make W=1, sparse and smatch.
> However it did not produce the error message.

I guess you weren't testing on a 64-bit platform.  BIT(2) is
an unsigned long, so ~BIT(2) is 64-bit long on 64-bit platforms.

You're trying to feed it into writel which takes a 32-bit value,
hence the warning.

If you have to use the BIT macro, then you need to cast the result
to u32:

#define STARFIVE_IE_MASK_HASH_DONE ((u32)BIT(2))

But it's probably a lot clearer if you do it as:

#define STARFIVE_IE_MASK_HASH_DONE 0x4

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
