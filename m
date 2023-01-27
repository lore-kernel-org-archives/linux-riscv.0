Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BEFC38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tn5CR7vQQ2m3Sg9r/MTywUDdh6eR2LVD9wGzUvD7ATU=; b=JlB6yRrLGWU2O3
	Lrc8SmKNniNf9ZUNXBTULVLmArn9V8HXV28uDXSng6lNxDNIVX7nxI8hc9vZI1Ks9mMtSGFaqV3dY
	kgw7uFOwcBKY0fs6UDwfoZ5+WajZn9XmgbxbcbrlJFt30RATscuvKvnO7o+ELobT6PI0m7uhIJS8l
	gaTpRPKG2fm9bexHLG320IrofOSQTxEw2GdLz0xPa6w3qiybSoc4uPfGW421Xnz8fC9DCV1ARhYKW
	0NZ8qs7FMTe0cFpy4Agr9zHAvNMjZ7PdN7UUVXNPjf76T6yzWfxWRpPVcO8nzruXu1+ZkTMkBZMt2
	RiIxwUEt7zgEDQX8/xMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMTx-00E2n1-JL; Fri, 27 Jan 2023 11:01:21 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMTu-00E2mA-IL
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 11:01:20 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pLMTL-004hGz-0u; Fri, 27 Jan 2023 19:00:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 27 Jan 2023 19:00:43 +0800
Date: Fri, 27 Jan 2023 19:00:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/3] hwrng: starfive: Add driver for TRNG module
Message-ID: <Y9Ou20ocr+ReaFVZ@gondor.apana.org.au>
References: <20230117015445.32500-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117015445.32500-1-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_030118_629681_E4DA5696 
X-CRM114-Status: GOOD (  18.46  )
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

On Tue, Jan 17, 2023 at 09:54:42AM +0800, Jia Jie Ho wrote:
> This patch series adds kernel support for StarFive JH7110 hardware
> random number generator. First 2 patches add binding docs and device
> driver for this module. Patch 3 adds devicetree entry for VisionFive 2
> SoC.
> 
> Patch 3 needs to be applied on top of:
> https://patchwork.kernel.org/project/linux-riscv/patch/20221220011247.35560-7-hal.feng@starfivetech.com/
> 
> Patch 3 also depends on additional clock and reset patches for stg
> domain that are yet to be submitted to mailing list.
> 
> Changes v4->v5:
> - Updated status in MAINTAINERS. (Conor)
> - Specified targeted device in Kconfig title and descriptions. (Conor)
> - Removed unnecessary goto label in patch 2. (Conor)
> - Enable runtime PM before registering hwrng in patch 2. (Conor)
> 
> Changes v3->v4:
> - Moved init_completion before IRQ registration to be prepared for
>   spurious interrupts. (Herbert)
> - Added locks to guard concurrent write to the same register. (Herbert)
> 
> Changes v2->v3:
> - Use constant usecs and convert to jiffies. (Herbert)
> - Removed sleep in irq handler. (Herbert)
> - Limited wait time to 40us if wait == 0 for trng read. (Herbert)
> 
> Changes v1->v2:
> - Updated of_match_ptr and added pm_sleep_ptr. (Krzysztof)
> - Dropped "status" in dts as module is always on. (Krzysztof)
> 
> Jia Jie Ho (3):
>   dt-bindings: rng: Add StarFive TRNG module
>   hwrng: starfive - Add TRNG driver for StarFive SoC
>   riscv: dts: starfive: Add TRNG node for VisionFive 2
> 
>  .../bindings/rng/starfive,jh7110-trng.yaml    |  55 +++
>  MAINTAINERS                                   |   6 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  10 +
>  drivers/char/hw_random/Kconfig                |  11 +
>  drivers/char/hw_random/Makefile               |   1 +
>  drivers/char/hw_random/jh7110-trng.c          | 393 ++++++++++++++++++
>  6 files changed, 476 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
>  create mode 100644 drivers/char/hw_random/jh7110-trng.c
> 
> -- 
> 2.25.1

Patches 1-2 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
