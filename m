Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C931BC83F12
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guqyfXFxVCFBplIMgqipkYZ9+JaDRLMaMfYd1emE+gE=; b=zp/xgo+lYB96ui
	mpcx23pmvnbTDdOPToNlC1rQm0YH5FDbLOHacihaRXYAsn3TyJbt3xbsKZykcLiu1B8Kg9/eYgABa
	MFDh7WPvB7h/e8nhtxZZMaRHcgGHyNZ3ATyydwStbJS3eo3URO/WQDXExizEkV0SyCBAvJecuAc3b
	/E0KRObtWgLcvQuCCsnbxiV7i7xlANZ4iPb9MJdhxMW/XwkBTnJ0LPyYCYqI3S/6ZyAYC+svvM8jF
	J62aZT22VWhCbGkamOx1KkOQG0rB6CPEXI9NrPIScvGpaD02BqPoI9sGAprX5bsr/ilaKaFc7oS4l
	ToyhxclEA8YaATGf1YDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOXe-00000007hgL-17Zi;
	Wed, 09 Jul 2025 06:44:30 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOTY-00000007gjU-1O2M
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 06:40:18 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D336D341FF2;
	Wed, 09 Jul 2025 06:40:13 +0000 (UTC)
Date: Wed, 9 Jul 2025 06:40:09 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
	Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add DMA translation buses for
 K1
Message-ID: <20250709064009-GYB487904@gentoo>
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234016_633869_A969757B 
X-CRM114-Status: GOOD (  12.59  )
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


On 18:04 Mon 23 Jun     , Vivian Wang wrote:
> The SpacemiT K1 has various static translations of DMA accesses. This
> series adds all the DMA translation bus nodes and also moves existing
> nodes as necessary.
> 
> According to SpacemiT DT maintainer Yixun Lan [1], it's preferable from
> a SoC DT maintainer's perspective to have this done at once instead of
> spreading these changes into various driver series. Once this is merged,
> life will be easier for future users of the buses.
> 
> This series contains no bindings changes.
> 
> Patch 3 moves the eMMC node added in [1].
> 
> These patches can also be pulled from:
> 
> https://github.com/dramforever/linux/tree/k1/dma-ranges/v1
> 
> [1]: https://lore.kernel.org/r/20250623070147-GYA193822@gentoo
> [2]: https://lore.kernel.org/r/20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org
> 

Hi Krzysztof,

  Just want to clarify, I believe you previous concern about the
"children of simple-bus are supposed to have unit addresses" [3] isn't
really an issue any more.. but, please let me know if I'm wrong..


Hi Vivian,

  We'd like to push this series for v6.17, so I've queued it at
k1/dt-for-next branch of SpacemiT SoC tree [4] for now, FYI.

Link: https://lore.kernel.org/all/2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org/ [3]
Link: https://github.com/spacemit-com/linux/tree/k1/dt-for-next [4]

Thanks all
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
