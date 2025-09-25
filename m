Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883B8CAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 12:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEB0wqM2Hy3BNGaLsnLyhDc4XPj+WDyzYxbcrwJ2V88=; b=RdemOyn1Mn6JGw
	1tlgoLeDyeRnQc1n5lJdAiw1IOmlYZStDsA74qOi4mgv8C1DRnaiidX9Qo0oYWwkCdkq9IwlaA1ZH
	OdnT+O/17E9sGYW737tkaSFQnny5w5ENcU9HTklaVM53sTJfgiylLuTsmUAA4cn5p60qyX1bZ3yYC
	Fx65itKtRL6FnLPSslRYA1uaeGWS1WN+W0inVNA4yQOc5t4/YGqY3CNM4EvleP7GwQNnG07w0zLoS
	O1GT9EPOeRuXcnCa0eTC4xHcwjCIFn3rniMVeFM5LMT/geZjEkAkKDqcMhDaqOZcnBY3R83oYUaUU
	oCYqvIQRJo4L65b4JAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kuN-00000008sln-01fw;
	Thu, 25 Sep 2025 12:17:11 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kuJ-00000008sjK-4Ae1
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 12:17:09 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-90a0b3ddebeso8401839f.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802627; x=1759407427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiMnnhjmKlHUptnM90BucFSlyBtvswCn8MfVq9OViiA=;
        b=qugYifehz1UAHyGd2eEo9o+KvZ2vgdtfhqACm3c7riIuUPiGsgyNOr2n5dRishrmoM
         fDp1aud/Na8z2K7tZ+s/CSzeMaeU8R8gNgVrzmNlOFdaB7e3MyK6z2Wjtf3CtGy5fGI0
         OxZcYyMoWsjljNE91y1UTQVWFfR2z4lMSNFzXcM3W5eBuCHS2tq6Jmndmk3vFDMtLsig
         oTxu9weKUO/JuRpnZR5qa+N1drc2ECkKHqaUfl3yriP6V800fUoP9VShwzMVH9lGjS9N
         VLKphZfcL726Ql2BwYLWmSx+gH9bKZ/QrPCo7pM1XatabcJcWkzdNyuwcqHThp7bvSF2
         glEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802627; x=1759407427;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiMnnhjmKlHUptnM90BucFSlyBtvswCn8MfVq9OViiA=;
        b=eUvHaRL2H0i/7IrcPAzg5nX7JZjuJyyBkT1cX6y4u8ZxRlSIjC6HDVe6yNv+Uu/mPr
         MOEPSl/sYGehWADghNUA4d560kvGpDihu/937BdVd2eT52sUhYATJSExH1OWY66rWNu6
         Jmy1BueCsHSF7D37XZCtCMStnNGSjtNLh5l8dTFgz6nJgR4i435igCDsmlTzrAGsENFs
         ALA4vtvCDEQFnq04XzkOjOAuw5BD0jHhlmW54UaJdlcWMsD1d/rj4rvPvG/o2Rkk/r7K
         8u8ALjaSq5P2Hi45/NmVR/dhn17qxM51ov/WLORdLi8gHY788kEx/Vlu9CoLYb2JWgWt
         7J0A==
X-Forwarded-Encrypted: i=1; AJvYcCW5lstKfdfyww+VJNVZARR3w5K/O6i710Uu61QBJNwvrFmkixCMta+n/mMoOHzN3SUTaISI0jcC6SZK0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtwyvNodhGc9VbMjp8RQaMrcqXGKAw6Vu2rB6VTSlZ2ZLBnddX
	S9o2nHD051KbSY1P6SoWvulcbi5UjoI2vR3qXIM7gNqXrSc16b/NgcJvoenf3Qgt1xs=
X-Gm-Gg: ASbGncti6Oho0i9AOO1EX5mO5yynIhyJQfqyEDqvmxVZQPlGh7CxfNQq9Nyv6oZN7kr
	MdnE+euxXXIwctbL+LYdlh44QVusBZqpkNc2Uq3o/RAgcQibVO/6KgFZHX9X6Nh1FAVKqXNkUzg
	H/Hy46HBYU77rr3bf+8wXVtTITseDjLV7FnDrkX66+LMpzh9HSuGYrSb6sqv30t6NTop/y2ZmJW
	hD20Owk1rWpihW29jgxW8u/e7vS+45FKTqH9RnjKgPEOSMzEKBZMmP3fWRxTcc3gGemqfUWLsHk
	+Lo7lKcXoH0hLnfKJwK15eVDad+zJKGi9Cc/o10H1QUWmgPNT2pVHrzA37HG87E/UmU8AY694ob
	auny20r/BmZemCcgU22uBZQyw5KKUy8wm7LTPmxx7hEy4IehBEUeShS32SXDaOA==
X-Google-Smtp-Source: AGHT+IGchv2CNYxx9JQbC4IeYd/wa2PLkKLFA1ut7JvKUIyUBucm43vFik72ll2XyHQiSOK+veiTDg==
X-Received: by 2002:a05:6e02:1709:b0:424:881b:ca76 with SMTP id e9e14a558f8ab-42595653b06mr40363335ab.22.1758802626788;
        Thu, 25 Sep 2025 05:17:06 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5adfa6sm750664173.58.2025.09.25.05.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:17:06 -0700 (PDT)
Message-ID: <ed0e5d82-040b-4642-8a82-611f6b0a401f@riscstar.com>
Date: Thu, 25 Sep 2025 07:17:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] spi: support the SpacemiT K1 SPI controller
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, junhui.liu@pigmoral.tech,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250925120909.2514847-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20250925120909.2514847-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_051708_048476_F90398F3 
X-CRM114-Status: GOOD (  27.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/25/25 7:09 AM, Alex Elder wrote:
> This series adds support for the SPI controller found in the SpacemiT
> K1 SoC.  The driver currently supports only master mode.  The controller
> has two 32-entry FIFOs and supports PIO and DMA for transfers.
> 
> Version 4 incorporates changes suggested during review of v3.
> 
>                                          -Alex

Please disregard this message and the one or two
others that got sent with it.  Something went
wrong with my git send-email command and I'm
going to try again.  Sorry.

					-Alex

> 
> This series is available here:
>    https://github.com/riscstar/linux/tree/outgoing/spi-v4
> 
> Between version 3 and version 4 (all suggested by Yixun):
>    - Fixed an underrun/overrun comment error
>    - Renamed a pinctrl node
>    - Formatted dmas and dma-names properties on one line
> 
> Here is version 3 of this series:
>    https://lore.kernel.org/lkml/20250922161717.1590690-1-elder@riscstar.com/
> 
> Between version 2 and version 3:
>    - Add Conor's Acked-by to patch 1
>    - Add Rob's Reviewed-by to patch 1
>    - Added imply_PDMA to the SPI_SPACEMIT_K1 Kconfig option
>    - Fixed a bug pointed out by Vivian (and Troy) in word-sized reads
>    - Added a comment stating we use 1, 2, or 4 bytes per word
>    - Cleaned up DMA channels properly in case of failure setting up
>    - No longer use devm_*() for allocating DMA channels or buffer
>    - Moved the SPI controller into the dma-bus memory region
> 
> Here is version 2 of this series:
>    https://lore.kernel.org/lkml/20250919155914.935608-1-elder@riscstar.com/
> 
> Between version 1 and version 2:
>    - Use enum rather than const for the binding compatible string
>    - Omit the label and status property in the binding example
>    - The spi-spacemit-k1.o make target is now added in sorted order
>    - The SPI_SPACEMIT_K1 config option is added in sorted order
>    - The SPI_SPACEMIT_K1 config does *not* depend on MMP_PDMA,
>      however MMP_PDMA is checked at runtime, and if not enabled,
>      DMA will not be used
>    - Read/modify/writes of registers no longer use an additional
>      "virt" variable to hold the address accessed
>    - The k1_spi_driver_data->ioaddr field has been renamed base
>    - The DMA address for the base address is maintained, rather than
>      saving the DMA address of the data register
>    - The spi-max-frequency property value is now bounds checked
>    - A local variable is now initialized to 0 in k1_spi_write_word()
>    - The driver name is now "k1-spi"
>    - DT aliases are used rather than spacemit,k1-ssp-id for bus number
>    - The order of two pin control properties was changed as requested
>    - Clock names and DMA names are now on one line in the "k1.dtsi"
>    - The interrupts property is used rather than interrupts-extended
>    - The order of two pin control properties was changed as requested
>    - Clock names and DMA names are now on one line in the "k1.dtsi"
>    - The interrupts property is used rather than interrupts-extended
> 
> Here is version 1 of this series:
>    https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/
> 
> Alex Elder (3):
>    dt-bindings: spi: add SpacemiT K1 SPI support
>    spi: spacemit: introduce SpacemiT K1 SPI controller driver
>    riscv: dts: spacemit: define a SPI controller node
> 
>   .../bindings/spi/spacemit,k1-spi.yaml         |  84 ++
>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
>   arch/riscv/boot/dts/spacemit/k1.dtsi          |  15 +
>   drivers/spi/Kconfig                           |   9 +
>   drivers/spi/Makefile                          |   1 +
>   drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
>   7 files changed, 1101 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>   create mode 100644 drivers/spi/spi-spacemit-k1.c
> 
> 
> base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
