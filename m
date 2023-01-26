Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893ECC54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 05:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HflZC4gryTfJ7c7t0xAxZfzC1X8ow53FJqsPUJCXrK8=; b=vqUQ5g+389ig+7
	YkPyFhE0JcOAj6QMoe7L9gIibT6B9dAMauEjAVhVp17tsioq64q9rcjbe4djhzPIRTakoLYNOXR8t
	sdO0iEQmH7TfPvmCzv2zJy2PfwWogCrDR0iGeYxlD0MTEBf4n03R6AxPwRsOHqD9JqHBWoDEhuz/e
	qcMKlX1LnzoYfKDFi2Gwa3LYu+UPGt4IGFL0YDc0G5WtVzQBet+NHbmf+Zdo2E29up4Mrbn4I9/X4
	T3cvTZlokKxp8UgEGBF3/nXQRBrzgmnHg5GlU/1+JTQmcOAJ6QbxN+rsHT6VWr2dkuWh12mvVcX8m
	gEK3edqpy3JoW0SAUBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuRf-009ekB-Sx; Thu, 26 Jan 2023 05:05:08 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuLq-009byZ-0e; Thu, 26 Jan 2023 04:59:07 +0000
Received: by mail-qt1-x833.google.com with SMTP id m26so506762qtp.9;
        Wed, 25 Jan 2023 20:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2S3RLfrNyQH49fsnFGoQQ0jF5nvWXPOvFK0VP3Scjo=;
        b=IWV/X5EtYYc53U1keZc6Iu7v0jyTbAY6l2uYNr2tB7WaZHXvEwhIXcw5VZBulQSL6A
         6Jvn59mMR6weRaRmLdZ8F/95n+NaBJ9dRVjOjQ19w5aWxL+R6I/zOQkl4hj19hbQKkcg
         XmaOWJvaFGorOGR6gKFoxWNZ42yq3JI5PBjwnFIMJq9VFbqd+i4rUMftB8vjBgxSsNEW
         8gniu1Yv79dBtc9rOZbpIC451t5eJqX4pgao5Ha7dYw38DOKNCO4jT0+eG5WUHdqooRu
         CkQgahq+Ky8sF3BbotZY5uEqwtIQM7xrxtVzCBDUeiEKNovMTvE8/M+lrLSGEv0r5Wgg
         UqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2S3RLfrNyQH49fsnFGoQQ0jF5nvWXPOvFK0VP3Scjo=;
        b=crQLR7lpgo95LGCR6HBQYHhSf8cZ6uIlRRTXkN4XXReS2WdMIBdP/wrTk3Q6vB4wYS
         n2ys5GnVejLq+hHMLhN9v+0l5qvALqkrzh8aPIkXMXpjtU9S10eQvmeAnLXiEmYlnpi3
         zV5MQ1lsfbBY7+92wz5+BwEzAzXESG+/pACypdxuYC/vXs48JNi6noHItocb3UvYyFN2
         CIZKShuLMIme+VbND/24q6BUDXe+KEtA5POFRxb7PJHZ3wY02Q6iJAyPthBt7w1WXqGP
         pbLWw8Cpxaenah2UwVZBBODojYgZrA7aFGc/vVcs9WDNC8UnUUuZtWRivFEwkngogCyn
         K5fw==
X-Gm-Message-State: AO0yUKV/5nwMpTTwZz+vTa9oJwUm2sKhMmf2BunTeQ0FVfi8X/Ee8n67
	TvWtoylMuRT3gFQpgMMxIZU=
X-Google-Smtp-Source: AK7set9uZfTD1W3z0cbHBVUg5SVE0mxBEXs/DXbPnm5/hifsR8XEBxaOH/w+lDF8YqDyrPMz+u2j0Q==
X-Received: by 2002:ac8:6794:0:b0:3b7:ec87:8154 with SMTP id b20-20020ac86794000000b003b7ec878154mr6565219qtp.44.1674709143369;
        Wed, 25 Jan 2023 20:59:03 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id j7-20020ac806c7000000b003b80a69d353sm120720qth.49.2023.01.25.20.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 20:59:02 -0800 (PST)
Date: Wed, 25 Jan 2023 23:59:00 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH v7 0/5] leds: Allwinner A100 LED controller support
Message-ID: <20230126045900.GA7126@localhost>
References: <20221231235541.13568-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_205906_101820_CC5873BF 
X-CRM114-Status: GOOD (  24.41  )
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

On Sat 2022-12-31 @ 05:55:35 PM, Samuel Holland wrote:
> [Resending because it has been a couple of months since v7 with no LED
> maintainer feedback, and LEDs now have an additional maintainer.]
> 
> This series adds bindings and a driver for the RGB LED controller found
> in some Allwinner SoCs, starting with A100. The hardware in the R329 and
> D1 SoCs appears to be identical.
> 
> Patches 4-5 depend on the D1 devicetree series[1], but the rest of this
> series can/should be merged without them.
> 
> This driver was tested on the D1 Nezha board.
> 
> [1]: https://lore.kernel.org/lkml/20221231233851.24923-1-samuel@sholland.org/
> 
> Changes in v7:
>  - Use DEFINE_SIMPLE_DEV_PM_OPS
> 
> Changes in v6:
>  - Drop the A100 DMA controller DT node patch, which was merged via a
>    different series
> 
> Changes in v5:
>  - A100 contains the original implementation, so use that as the base
>    compatible string, and rename the binding to match
>  - Add "unevaluatedProperties: false" to the child multi-led binding
>  - Rename the driver R329 -> A100, since that is the actual original
>    implementation
> 
> Changes in v4:
>  - Use "default" instead of "maxItems" for timing properties
>  - Depend on LEDS_CLASS_MULTICOLOR
> 
> Changes in v3:
>  - Removed quotes from enumeration values
>  - Added vendor prefix to timing/format properties
>  - Renamed "format" property to "pixel-format" for clarity
>  - Dropped "vled-supply" as it is unrelated to the controller hardware
>  - Added vendor prefix to timing/format properties
>  - Renamed "format" property to "pixel-format" for clarity
>  - Dropped "vled-supply" as it is unrelated to the controller hardware
>  - Changed "writesl" to "iowrite32_rep" so the driver builds on hppa
> 
> Changes in v2:
>  - Fixed typo leading to duplicate t1h-ns property
>  - Removed "items" layer in definition of dmas/dma-names
>  - Replaced uint32 type reference with maxItems in timing properties
>  - Renamed from sunxi-ledc to sun50i-r329-ledc
>  - Added missing "static" to functions/globals as reported by 0day bot
> 
> Samuel Holland (5):
>   dt-bindings: leds: Add Allwinner A100 LED controller
>   leds: sun50i-a100: New driver for the A100 LED controller
>   arm64: dts: allwinner: a100: Add LED controller node
>   riscv: dts: allwinner: d1: Add LED controller node
>   riscv: dts: allwinner: d1: Add RGB LEDs to boards
> 
>  .../leds/allwinner,sun50i-a100-ledc.yaml      | 139 +++++
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  14 +
>  .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  12 +
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    |  13 +
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |   6 +
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  15 +
>  drivers/leds/Kconfig                          |   9 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-sun50i-a100.c               | 555 ++++++++++++++++++
>  9 files changed, 764 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
>  create mode 100644 drivers/leds/leds-sun50i-a100.c

this whole series:
Tested-by: Trevor Woerner <twoerner@gmail.com>

from: https://github.com/smaeul/linux/tree/d1/all
test script: https://github.com/twoerner/rgb-led-test

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
