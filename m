Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481F1C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaxOjjc84E8uRqzOzQseo7mbNwXh2lfIR8XFBBMZ8oM=; b=HGG18mwfu6cZZX
	tDkI4ASehzfQTJQiWCbV5CpjC6J4wUnrVNtR/mRMLSQSHY3Rvq8Vpy90GanHzruqSf5Y8yh3sIK3c
	2TK4qro688ep1DqbHkLpwdknnjvq8jF3kK2ubYu2AH/rRK21NvcJlf3CJVbOupz/4ryOgsBgT828h
	rQoBe736yDk4tMYRUqCIEO3nszg7MGRvLA/XlCC5i8kN7DuKdHwzc+k+mrz+6LUOHeNA0nFFa0S9A
	K3vUzwl66XiuCzlDABMKWiy4hUOlI4QmqjU3OTQUVL+DzBlvpzeCoaUDg2ka3Fdc3Sn4gteRuzSHp
	U7JNqQ/irnZSzEp2E64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmFL-008f0P-OZ; Wed, 25 Jan 2023 20:19:51 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm4i-008aDJ-Kj; Wed, 25 Jan 2023 20:08:53 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-16332831ed0so3131678fac.10;
        Wed, 25 Jan 2023 12:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nDL5JMpYL8zMscLCkNwpf+56C4bxX8siHriNAzVjbw=;
        b=lVHGCtvr4uyKaFvIkt0r+vsFIeTKNmFpCNS2uEJrnMxu3OpPpw2eAFZghkiarLKA8u
         CPeP49xZB/GJdXHxdz0NMQBML1JbNc9/6bP2+HK2Sz7YVtJEAqtaSoHw0Qz6MCUtY0va
         WxdGip3gDIwG43nBIRHQViPcILp+vM9ymQJpU0fswfc6k4rMGwsfrXx3z+5J63+N0/dw
         wHbG2MuJrW9SuftiN2djDEkGjZj/oJj6VtmJ/g4B+v2+pMbmA2DtO9G6pQNTkgEmZvmq
         4ZN0B+f7zBkc57w8g1tJXlsFWpOROf5rSoRSWgmKCP/R5Mt2lAPUhjy+lU5tQzigMA0i
         FvEw==
X-Gm-Message-State: AFqh2kpHlrZ1k7q+e5Q0F1OK4QbkYslwvJnuGjA4t9Yjt8rJy/pzvFXr
	edpXCfjxCn2+YOfqvJwfog==
X-Google-Smtp-Source: AMrXdXuA8tO45Yj4ss66nTmpQUbLo6kLx/P66wPdUh9X5rLrKkVx5S80pJZ5ehwR5YNBU80lx/AzZQ==
X-Received: by 2002:a05:6870:9d0a:b0:15f:32b:6e33 with SMTP id pp10-20020a0568709d0a00b0015f032b6e33mr16413614oab.39.1674677330355;
        Wed, 25 Jan 2023 12:08:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p13-20020a056870568d00b0015f83e16a10sm2278638oao.44.2023.01.25.12.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:50 -0800 (PST)
Received: (nullmailer pid 2793767 invoked by uid 1000);
	Wed, 25 Jan 2023 20:08:48 -0000
Date: Wed, 25 Jan 2023 14:08:48 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chester Lin <clin@suse.com>, Fugang Duan <fugang.duan@nxp.com>, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, Le Ray <erwan.leray@foss.st.com>, 
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Peter Korsgaard <jacmet@sunsite.dk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, 
	linux-stm32@st-md-mailman.stormreply.com, Lubomir Rintel <lkundrak@v3.sk>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Michal Simek <michal.simek@xilinx.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 09/12] dt-bindings: serial: fsl-lpuart: allow other
 serial properties
Message-ID: <167467732818.2793535.3311476419413024796.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120852_730051_4DEFE690 
X-CRM114-Status: GOOD (  10.17  )
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


On Tue, 24 Jan 2023 10:19:13 +0100, Krzysztof Kozlowski wrote:
> Reference common serial properties bindings to allow typical serial
> properties:
> 
>   imx8qxp-ai_ml.dtb: serial@5a060000: Unevaluated properties are not allowed ('uart-has-rtscts' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
