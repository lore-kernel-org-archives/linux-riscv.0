Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABECEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 22:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXUrvojhcC8gpQKYbBUS9TI/yF2YvwC/OC7qfOSYgOA=; b=YbH+OGmb6thB3I
	fQPAsxq+KikFZi7YtZbXpquxj+QnvtzuL1CUailNBi2S1UdqEJzLHTI4pFddj6NCINZRr7FDB2WUl
	gkYcLkvU2xxzdQ6fvt5r98NM2Z8OuuxXGQA31SUn1rQF3WBhel9eJW4Xn30nrdahLeEgv3EF/NiXm
	imU0bDH2onE/8LJ0aMGNfRnfZL1B+wFSMTi9DZZHNgp6BvuZmvHzkMjlQsLtD4EfN1dzrdyq0SJzv
	SQEyDiKQCq8hwR8B5fmNsG607Zzuk3q2dnADoBXoSg28fiteVwaJmIqim7KSuOrze/aeWX0AYGXzX
	RMrA64BmUkqK9d34Jyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQEw5-00CyGY-05;
	Sun, 30 Jul 2023 22:30:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQEw2-00CyFm-1J;
	Sun, 30 Jul 2023 22:30:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31781e15a0cso3196532f8f.3;
        Sun, 30 Jul 2023 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690756243; x=1691361043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gel3Fe0n25TUws0Hk9Qd0MUUJAa6WDx17jjyONCSFYw=;
        b=mWiBPv+dmsQZhbaLCfWQxgfy10UsWYdTTx1NN4VSLkepwadA05OqGDb32V6/5+FtD6
         Dl1y2FLquhOJs9mF5RkaoODP3PxnpVmBF7XU4bvoqCCoAccf+f1dk7h5h+7WlsIRh5Xr
         zLejcg+HXTF7del6cv16A9NDcn4PMiprf+m250AP04Jiab3U1eBaqSLv7/8EspuTInvs
         MCLsh8STYfbLIyqjXQj1Rex2L3RcgakqCgbA9n47+4RCF1ilH6GvN1rO8ZnPNJbHDx/+
         LUDW8RbaJ7f2RmDwr3581Do1OXJVuRaWoG0Es7+6JTu7CvwbVfYn8cEpmJPRY5SD1H2I
         iRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690756243; x=1691361043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gel3Fe0n25TUws0Hk9Qd0MUUJAa6WDx17jjyONCSFYw=;
        b=eX0SHZASDaG0YvTOdS2CJDaAd1tJ7h+sZxNH3BKm5TZMoaSceRRhL7fYUhe72ewDkq
         yi8yONNeI/tcz9NLyjqca8/GRpOEpNK+i6M0LnzpYcSjM2ydI4oRr3eyMsoBZn+fySz5
         cAlpFG6U8GrcgP8+bDhv4nR2UsgavRKj/eGnVjMhzV+jLDfh4vSy7w9ELGp5mUQnK/qi
         ee7mIZisorbE3oNgvGWrSX7PwoF3yHCaH5BieQumo4czg9sy9l73LTRuosS4NMBOq65X
         ITvH0kz2iXjb7RpRBDh63JaXoI8XRQHcrlI3e2Sz1egGVmilWFXIhF59GahOcXL+LWnn
         SF9Q==
X-Gm-Message-State: ABy/qLZTQRKiM+p6izo2oHURzJC38j8VNl7g7cb/9YNHKlfWR8SrrP4T
	fNFJN5pHp173LJTNgchr5YQ=
X-Google-Smtp-Source: APBJJlFXiQpqspdOBp7EzGDoS/QjTssDdL+zkH+BSXifpt+9Tx+StGhiesv1d9FzlyBMIIudJbBf4g==
X-Received: by 2002:a5d:43c3:0:b0:30f:af19:81f3 with SMTP id v3-20020a5d43c3000000b0030faf1981f3mr4712223wrr.41.1690756243005;
        Sun, 30 Jul 2023 15:30:43 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id w4-20020adfec44000000b00317614b6a5dsm11125160wrn.50.2023.07.30.15.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 15:30:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-spi@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH v1 3/3] riscv: dts: allwinner: d1: Add QSPI pins node for pinmux
 PC port
Date: Mon, 31 Jul 2023 00:30:39 +0200
Message-ID: <10311404.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20230624131632.2972546-4-bigunclemax@gmail.com>
References: <20230624131632.2972546-1-bigunclemax@gmail.com>
 <20230624131632.2972546-4-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_153046_470395_BB89903B 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dne sobota, 24. junij 2023 ob 15:16:24 CEST je Maksim Kiselev napisal(a):
> Add pinmux node that describes pins on PC port which required for
> QSPI mode.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> 1bb1e5cae602..9f754dd03d85 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -131,6 +131,13 @@ uart3_pb_pins: uart3-pb-pins {
>  				pins = "PB6", "PB7";
>  				function = "uart3";
>  			};
> +
> +			/omit-if-no-ref/
> +			qspi0_pc_pins: qspi0-pc-pins {
> +				pins = "PC2", "PC3", "PC4", "PC5", 
"PC6",
> +				       "PC7";
> +				function = "spi0";
> +			};

Sorry for late review, but it seems I'm missing something. D1 manual says 
those are pins for ordinary SPI, with HOLD and WP signals. Can they be 
repurposed for quad SPI?

Best regards,
Jernej


>  		};
> 
>  		ccu: clock-controller@2001000 {





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
