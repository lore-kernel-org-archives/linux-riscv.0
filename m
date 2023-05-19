Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD1BC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5C5sni3GX7BWkeeZ7nnrD5zezo5ieEORF9Al/TbfYAw=; b=gaJqbhs20WtvbR
	pBBXwpnmos6oNWvBJVOOW7D8tgc2l+ow2t2/IN87Lzla+fJSU9Ktr3RdTVpfYWyA5+HIpgq9vbpxE
	35np+bOCpHSOTsZ3J5J9ZG9d0CBnFAkuXL8ZMP8z1YHhH/wE4m4NS4MhXTHuaUljqwKmKyXa32hHw
	m1uF9RlXLi5PkxzSB6wRu4p4DfV1dSv+HjQ/8JxX0f+oLhGXTBU6+KQlXP+K4SeXwNuKIFWqxO14g
	4haj19kG0mXKHfnknu7o1sXrXcYtftw2kblBm3NerpDXZW0jsYTlGtL3wgYwG6wWBL4Bbz8c03eU5
	75p4czZ2uB/uXMTIyUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwRJ-00FiU6-16;
	Fri, 19 May 2023 09:30:21 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwRF-00FiT7-1O
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 09:30:20 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pzwQW-00Aowi-Vt; Fri, 19 May 2023 17:29:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 May 2023 17:29:32 +0800
Date: Fri, 19 May 2023 17:29:32 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jia Jie Ho <jiajie.ho@starfivetech.com>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/4] crypto: starfive - Add drivers for crypto engine
Message-ID: <ZGdBfPfL675OBcTS@gondor.apana.org.au>
References: <20230515125355.624250-1-jiajie.ho@starfivetech.com>
 <ZGc4Wv0SU59dyVWV@gondor.apana.org.au>
 <20230519-moodiness-backtalk-cc838c53e8b1@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230519-moodiness-backtalk-cc838c53e8b1@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_023017_467238_7A62CE39 
X-CRM114-Status: UNSURE (   8.63  )
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

On Fri, May 19, 2023 at 10:24:28AM +0100, Conor Dooley wrote:
>
> Can you drop the ea1aeba1b2e07b82f9eb7cce5cb169263a77d046 ("riscv: dts:
> starfive: Add crypto and DMA node for VisionFive 2") please?
> It depends on a clock node that has not been added to the dts yet, and
> will break the dtb build:
> 
> Error: arch/riscv/boot/dts/starfive/jh7110.dtsi:505.22-23 syntax error
> FATAL ERROR: Unable to parse input tree

OK, I've dropped it.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
