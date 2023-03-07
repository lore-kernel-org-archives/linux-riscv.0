Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D5AC6FD1E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=43V1TEtIJOXZlIODLvf2CQy/ShsmczWKYIh13pOn+SE=; b=CwKU7udOjaJ7wO4rap1aakJVbt
	buWGSxtcIzUPd2gZlijoGtqC5NtjcWVZxeQM7LZzi51W6y1cXIHlFvVLcyuitkFYdccoxxHx0nSNa
	Zq++5cajjc1gCOydWL8ZWZf+/iHdlkKI22axtnntfB+EqkbAJH0pDHm4dR/nUXZeRpFR/V6623KIm
	zY6309eFGsGcFSxjTreCJLVDz08uUPabvF4pfJf9dsM1Q3L6MnU6VUMWYTbcIO5ff7S5N2SzRCzxU
	35E51vskQlMoTRq017pMRw/YTCt1sSQtTsB20z+GISunY5fthcftaq7CViX+hxUia85HJiVUVqHOX
	9szvWgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeMd-002RDu-RS; Tue, 07 Mar 2023 20:56:51 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeMS-002RA2-VN
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:56:42 +0000
Received: by mail-pg1-x531.google.com with SMTP id s18so8421737pgq.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 12:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678222600;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hUNTaLzZDvNotIxhn6MyoQhiZFZ3+VH2QjfGOxPnRw=;
        b=h5Djc3etli6VJDb5WfFqu+J2bU6QolErLBRchPWvNYlgFyKIigoOvNjEGzW8hoT5Mq
         DdYOTKaPB7qSQClyzh6t+sVx1I0WsyUYarEgpsb+HNQITvkwMCULmQQBkMbuyMq09vMb
         Q6fxuwvliWWw0DzSeWKxjYIgwrUV+0CJ5zDDKvxZd0QfZj8/QvvIb8Y5XHIsA5oG/qXN
         3OIvXRMIKo4DmsxaSyKZ6AnP+vkS6Lq5bQDneP7NxLZmgdS7WvjKwJfh5KRTH6vECpVC
         InIae/TEHa7FK/32zXKvk0aTVnyenJeh7k/NX1nbl8/15yECB4yE0MbJ/nUaiNPjaWlO
         GmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222600;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hUNTaLzZDvNotIxhn6MyoQhiZFZ3+VH2QjfGOxPnRw=;
        b=uA+a9a8+5Tg7BiOAfaupw+xtCkvAwK2JizeyAV1fHmWHkEvyQxmzQyMmUolkTUANcq
         sToMWVSM3qluR29JPQtG+1G66m6KeVtHuIdnO6sADTNr8WYpIpKDCweyysL+3t6crU8l
         lIQQCTRzSQcWokslZu3M8B6dE6b8FRm0tufNnGk5t44cWQV9ur7svw3+wQS9uHPSABs7
         gYXo/kxfOUs6lJ6N9ASAKEEdXntVvbqF3XWmiI1WI9KrX+ns8gKpBF+y125Cngs0pcBH
         jXGkHvJVLj/Xz/1l3abUahr0DG8PxHN9j3UtmjT6kgx+bFzo7+JhUwycYfqkLvpk0MmK
         pUhA==
X-Gm-Message-State: AO0yUKXlO1U83Mu+Yy6f9iB5kjUuRkj9Ahhc5yvlB+25I7ZqJZzviMBH
	438+JHYjFkHXBOKe5Aw+x5y2xA==
X-Google-Smtp-Source: AK7set8aj9SpSp3tb9b2XdQj4tmRkNceu/cxunxMGoS5gBVk6iL/KAt4T5ZqaeDF7AdwY3g5oAGtIQ==
X-Received: by 2002:aa7:9af5:0:b0:5aa:4df7:7eef with SMTP id y21-20020aa79af5000000b005aa4df77eefmr15492706pfp.6.1678222599563;
        Tue, 07 Mar 2023 12:56:39 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m21-20020aa78a15000000b00571cdbd0771sm8343415pfa.102.2023.03.07.12.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:56:39 -0800 (PST)
Date: Tue, 07 Mar 2023 12:56:39 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 12:55:49 PST (-0800)
Subject: Re: [RESEND PATCH v7 0/5] leds: Allwinner A100 LED controller support
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
CC: lee@kernel.org, pavel@ucw.cz, linux-leds@vger.kernel.org, wens@csie.org,
  jernej.skrabec@gmail.com, samuel@sholland.org, aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>,
  guoren@kernel.org, heiko.stuebner@vrull.eu, heiko@sntech.de, jszhang@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, p.zabel@pengutronix.de,
  robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-93c6925c-9c65-40dc-ac0a-221dbdbbc492@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_125641_015039_9145CEF2 
X-CRM114-Status: GOOD (  24.93  )
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

On Sat, 31 Dec 2022 15:55:35 PST (-0800), samuel@sholland.org wrote:
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

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
