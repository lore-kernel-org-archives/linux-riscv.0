Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF803EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVjN+zYQkFYQaBrdgMM/Kwv/Gvww1QgRpFypBtek5pQ=; b=gXyebgLrCIIJcN
	j4tDDV7PJGwdv6zHTwoPUgOCITt5S+sQoXHEQsFQSmNIdBD33m1NnLDklG2tEsAWhiiELFSkYAz/O
	nCE5WqfcRkhJDb5954LO3LvM2pv+WvsJADXfqAe5l8xzAJ8a5XClwDoVXj7t3sx4FsviertDxQyjC
	GbAO/15F7s1wZ/kB17Rjb0rJC8vMj9yAoPgipEI9ewRrbPq1cLmiUOniNPqZLmYLXBODlxmHLH7fy
	a7TP7TuxgEApS2eJHikth41TeA1GvrK1jisRQhHOHEg5oAfdy3XwIg0ZHwGl+Zoo+YVeE6EHANqud
	F7Z2ozA8vvG/DBS1RGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHsQ-00FdHw-1S;
	Tue, 11 Jul 2023 18:14:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHsN-00FdHF-0V;
	Tue, 11 Jul 2023 18:14:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3113da5260dso5958124f8f.2;
        Tue, 11 Jul 2023 11:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099252; x=1691691252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kADj7TkFJka2Bqlkae4pY0x9oLW69mUSF/u4OPIu9zw=;
        b=SNVpgjSRTHtGVEhHWsNPdWiarBQISqftEQCEevuNc0G5qc6wA70ZMwDItNi5QJ70Lh
         WQ/yxCzHaCQP3aJ3pHyxeHwl1bizDesfw8/jNROxhaIh96PVDo0ojv5zrpdHqWbcRPLi
         UIl1Sqy1afzf9t2csa9ICDq3NyYCfhXP+oXpAXpeQ7XijcZ5iztSQ3aSEiNftbWK1yG0
         FR5v/WYsJqwcRIAiacYa16oeOsxmphNPUIFgbzJl4pI1eK4Y4zZBWj59q2IVB3dT9qRP
         XomOxRXpy3ZicVH4KLIE/F5V4OStm4RAupaT2pd0yI/E1l4X3AJnkzUAGIwHRpgNg9Xo
         wB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099252; x=1691691252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kADj7TkFJka2Bqlkae4pY0x9oLW69mUSF/u4OPIu9zw=;
        b=gukvCAgBIkUN7DujHjmYutsds/IUfN+waQ27axtDwhSJ8XpC25T0DH4QhxDo/TgZpl
         sv3YyZ/PWoURB8Dl6Vj45TJJa0TQp3SOjvbglm1Tv66NqIUH2EAlurBvWtQFJhWkuv0P
         8UrbGAhts+0SmUh8fN/e6uXIQKYOCglbV49wQAAMeu2y3fOZQtXNwtr2UUB1RAcw6/ub
         OlXjYFJ+y8AT1Bp/FDK9QqHCDE/G7Zfa31wDUon6CCT6eQX0Lw4zKUV/D6keTXc8bhgO
         yME27K7sjfceuUH3AOVdPHq3rBN5sM0LHFnzPUXzjnaxqlXp8N3naLtzVR4SirMmKPB0
         uAyg==
X-Gm-Message-State: ABy/qLZgp6afEkllW/zNMNthwRAErE7ND+46noffO+1cajkKPn7C44kw
	+X3te5Svxkoa876n/sj+NkU=
X-Google-Smtp-Source: APBJJlE81gCA4q7wctwDy79JVHUy50OZdvk15qWNdOhG/fVz/02t692RpTHodquQlZi07SyIt6jUVw==
X-Received: by 2002:a5d:4f0c:0:b0:314:1fd7:188b with SMTP id c12-20020a5d4f0c000000b003141fd7188bmr13503587wru.17.1689099252131;
        Tue, 11 Jul 2023 11:14:12 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id x10-20020adff64a000000b003142e438e8csm2868429wrp.26.2023.07.11.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:14:11 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-iio@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>,
 Leonard =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Haibo Chen <haibo.chen@nxp.com>, Mike Looijmans <mike.looijmans@topic.nl>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 1/4] iio: adc: Kconfig change description for Allwinner GPADC
Date: Tue, 11 Jul 2023 20:14:08 +0200
Message-ID: <2148594.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230619154252.3951913-2-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
 <20230619154252.3951913-2-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_111415_201351_E7F2B737 
X-CRM114-Status: GOOD (  16.42  )
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

Dne ponedeljek, 19. junij 2023 ob 17:42:24 CEST je Maksim Kiselev napisal(a):
> This patch adds SoCs names to Allwinner GPADC description to
> make it more informative.

Please reword to remove "This patch".

> 
> Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC")

I'm fine with the patch in general, but does this really warrant fixes tag?

Best regards,
Jernej


> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  drivers/iio/adc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index eb2b09ef5d5b..d93868684c7b 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1105,7 +1105,7 @@ config STMPE_ADC
>  	  built-in ADC block (stmpe811).
> 
>  config SUN4I_GPADC
> -	tristate "Support for the Allwinner SoCs GPADC"
> +	tristate "Allwinner A10/A13/A31 and similar GPADCs driver"
>  	depends on IIO
>  	depends on MFD_SUN4I_GPADC || MACH_SUN8I
>  	depends on THERMAL || !THERMAL_OF





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
