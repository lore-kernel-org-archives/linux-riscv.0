Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB0C54EED
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3BkvGZEjYG8Tltgx4xd14oT64gDgtNdmY/I0lKru8M=; b=P2YMbNE1VUmwN8
	QdecO+5Ifk3RJG/S2dsbfXm0pGc6XYsGH9ccW6yhZhmZwsUmBupsC6HC4/39+zrmNzPhPaMvQ7l+v
	bupMKc2C0AjNUsFA88BDJWAHm8XcTfENJmW4Ju882B0JIy2BxB7Jqx8sfDQCrAbZU3KcC/BCJXkUm
	i3pMFVxP3uGZB0wilWdNNt1mR8pRDE8ZzejBvA/p4poQAljM96eBF8B2rUF0EamCw1awK1/ZDfat8
	N7fuyP7PG3LpcqueSy40t79jCQ6BwuU+b5gkBQAgxpnMd28uMYqgTeW/hPUi75RfoiwEJBmWTWWBk
	61IT4aax5KkEvxZmeusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmDs-008eJt-Sn; Wed, 25 Jan 2023 20:18:21 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm4A-008ZyW-TL; Wed, 25 Jan 2023 20:08:20 +0000
Received: by mail-ot1-f51.google.com with SMTP id a1-20020a056830008100b006864df3b1f8so11792777oto.3;
        Wed, 25 Jan 2023 12:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t39EsIvvp67IzNGd+XHwSqU0K2A/vSnr7kxAVJ448Ms=;
        b=S86AfD7TFglCv54GpVzdUcJyg3oWk8ShMcIZRi3gd8aTV5dp11M04k5rw9gW6/XiQI
         HIFXuK/lFfgM7/QL79855p0Xdl/9VOXjBy6lmHybroV5C7GAB7gZv/ku/AFhue37a/BK
         UNgsV+IXY0cFzXH27LCgs7NHdvb14XrRafqmaoLjXi0ms61C7ec6GxARiQhhuSq+Jqli
         7MuzP02DMBPPEgmVzh+f8bef/HPELS1tbM3afDYZFd+/mg7g/+BD/68pk9XgNh5Pfpz7
         iv/XN7Nm4lycrIGavCsmNQK3VwIfgypTZTch95cp5UuSBmTPwOEMHN0ziZQg9kOhEc7Z
         SLKg==
X-Gm-Message-State: AFqh2krk284sP7cMS7iAk+A/AEjO8aMkvzzmbyJ1zEF2isnVGXz2cOsS
	BLTRmuxWVoTB2AWSYsKUFg==
X-Google-Smtp-Source: AMrXdXsmfTrkC6CB13iDEfae46rieh8cjr3v84kXPdnw8bCR8TEBh66uXMANGvdhEgd8e1uTEm4Jfw==
X-Received: by 2002:a05:6830:1383:b0:684:dbfd:f239 with SMTP id d3-20020a056830138300b00684dbfdf239mr22688884otq.9.1674677296424;
        Wed, 25 Jan 2023 12:08:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s15-20020a056830124f00b006864749f39csm2572694otp.36.2023.01.25.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:16 -0800 (PST)
Received: (nullmailer pid 2787324 invoked by uid 1000);
	Wed, 25 Jan 2023 20:08:14 -0000
Date: Wed, 25 Jan 2023 14:08:14 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Le Ray <erwan.leray@foss.st.com>, 
	Michal Simek <michal.simek@xilinx.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-riscv@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>, 
	linux-serial@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Chester Lin <clin@suse.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Shawn Guo <shawnguo@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Fabio Estevam <festevam@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Fugang Duan <fugang.duan@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH v2 07/12] dt-bindings: serial: fsl-imx-uart: drop common
 properties
Message-ID: <167467729413.2787137.2431263317209271713.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120819_073237_0C3BB955 
X-CRM114-Status: GOOD (  10.10  )
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


On Tue, 24 Jan 2023 10:19:11 +0100, Krzysztof Kozlowski wrote:
> The binding references serial and rs485 schemas, so there is no need to
> list their properties.  Simplify a bit by removing unneeded entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml | 7 -------
>  1 file changed, 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
