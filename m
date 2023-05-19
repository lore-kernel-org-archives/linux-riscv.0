Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA0DC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaPUfRWExnCnJESTa6aIIyrSGvjgQSxc6LRyI6XjJbw=; b=aP8guK5wyj176C
	Mq1fJ7ZsqO6u7oJEKfNaM/PVHahNX1HAX+9MPxSLXLmLDtggy/mnGdRsnI5h18DAjbexpBscIFa8L
	1OzI9iQY2NPSvW/WbWhhasd8LgAkYZB/UQU0Kp+LylL5uiYaLtllDyBFj9byU7QWZBpF6NZzxH5S3
	rL+ixLdXfQpbMhJJnnM6gl5sXXXl5391ason8iGvM7pNvYjqOdYHFMx8GrFhfG4zBZz8eNZjU7ukh
	k6x8HqmWhfSwQvBT4F6nqhRM1dsbz8lzK2BHgAYeEkk5p33maMmGtbVxi7NVcda/fDu1NcXEnR9nB
	lZe4nv9xS4xRSg52iAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvpQ-00FaPo-2x;
	Fri, 19 May 2023 08:51:12 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvpM-00FaNh-2j
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 08:51:11 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pzvoo-00Anzi-Vn; Fri, 19 May 2023 16:50:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 May 2023 16:50:34 +0800
Date: Fri, 19 May 2023 16:50:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/4] crypto: starfive - Add drivers for crypto engine
Message-ID: <ZGc4Wv0SU59dyVWV@gondor.apana.org.au>
References: <20230515125355.624250-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515125355.624250-1-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_015108_907918_3C0786C2 
X-CRM114-Status: GOOD (  23.01  )
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

On Mon, May 15, 2023 at 08:53:51PM +0800, Jia Jie Ho wrote:
> This patch series adds kernel driver support for StarFive JH7110 crypto
> engine. The first patch adds Documentations for the device and Patch 2
> adds device probe and DMA init for the module. Patch 3 adds crypto and
> DMA dts node for VisionFive 2 board. Patch 4 adds hash/hmac support to
> the module.
> 
> Patch 3 needs to be applied on top of:
> https://lore.kernel.org/lkml/20230424135409.6648-3-xingyu.wu@starfivetech.com/
> 
> Patch 4 needs to be applied on top of:
> https://lore.kernel.org/linux-crypto/ZEEOXIHwqKblKfBJ@gondor.apana.org.au/T/#u
> 
> Changes v7->v8
> - Enable COMPILE_TEST in Kconfig (Herbert)
> - Fix compile_test warning on 'long unsigned int' to 'unsigned int'
>   conversion (Herbert)
> 
> Changes v6->v7
> - Remove NULL assignment as struct is kzalloc()-ed (Christophe)
> - Do clk_disable_unprepare and assert reset if probe failed (Christophe)
> - Remove unnecessary null pointer check (Christophe)
> - Update module name in Kconfig description (Christophe)
> 
> Changes v5->v6
> - Remove set_crypt in export as request will have been created by
>   init/updated calls (Herbert)
> - Use new helper to set statesize of crypto_ahash (Herbert)
> - Use crypto_ahash_blocksize instead of crypto_ahash_tfm (Herbert)
> - Switch to init_tfm/exit_tfm instead of cra_init/cra_exit (Herbert)
> 
> Changes v4->v5
> - Schedule tasklet from IRQ handler instead of using completion to sync
>   events (Herbert)
> 
> Changes v3->v4:
> - Use fallback for non-aligned cases as hardware doesn't support
>   hashing piece-meal (Herbert)
> - Use ahash_request_set_* helpers to update members of ahash_request
>   (Herbert)
> - Set callbacks for async fallback (Herbert)
> - Remove completion variable and use dma_callback to do the rest of
>   processing instead. (Herbert)
> 
> Changes v2->v3:
> - Only implement digest and use fallback for other ops (Herbert)
> - Use interrupt instead of polling for hash complete (Herbert)
> - Remove manual data copy from out-of-bound memory location as it will
>   be handled by DMA API. (Christoph & Herbert)
> 
> Changes v1->v2:
> - Fixed yaml filename and format (Krzysztof)
> - Removed unnecessary property names in yaml (Krzysztof)
> - Moved of_device_id table close to usage (Krzysztof)
> - Use dev_err_probe for error returns (Krzysztof)
> - Dropped redundant readl and writel wrappers (Krzysztof)
> - Updated commit signed offs (Conor)
> - Dropped redundant node in dts, module set to on in dtsi (Conor)
> 
> Jia Jie Ho (4):
>   dt-bindings: crypto: Add StarFive crypto module
>   crypto: starfive - Add crypto engine support
>   riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
>   crypto: starfive - Add hash and HMAC support
> 
>  .../crypto/starfive,jh7110-crypto.yaml        |  70 ++
>  MAINTAINERS                                   |   7 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  28 +
>  drivers/crypto/Kconfig                        |   1 +
>  drivers/crypto/Makefile                       |   1 +
>  drivers/crypto/starfive/Kconfig               |  21 +
>  drivers/crypto/starfive/Makefile              |   4 +
>  drivers/crypto/starfive/jh7110-cryp.c         | 240 +++++
>  drivers/crypto/starfive/jh7110-cryp.h         | 127 +++
>  drivers/crypto/starfive/jh7110-hash.c         | 892 ++++++++++++++++++
>  10 files changed, 1391 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml
>  create mode 100644 drivers/crypto/starfive/Kconfig
>  create mode 100644 drivers/crypto/starfive/Makefile
>  create mode 100644 drivers/crypto/starfive/jh7110-cryp.c
>  create mode 100644 drivers/crypto/starfive/jh7110-cryp.h
>  create mode 100644 drivers/crypto/starfive/jh7110-hash.c
> 
> -- 
> 2.25.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
