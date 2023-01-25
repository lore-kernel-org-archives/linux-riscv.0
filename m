Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A6DC54EED
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhChchbWwSWpNsojNP2XIq9R6mpDq29JKFRN/HxSE4Q=; b=LpdJwvXd3ndMGd
	OqcXe9DEJzR1KHgOpO5S7HhcTEMHYYSGaq8QngX6qVwKXMbBfSxluEvABkKJvI0JQbUEgF3NnUQFr
	ed3tlLre6lb3zdjegc7JYsON5kA8Z6jYwQpxrcp4ohSTT7K/N2calDVENaLQtnCO/f/GeURwWtF6H
	54tseHrkLj4GyAhDKMuWSl5RAjA25qNqTxGDxnVjKl4gnAssBpVelA0A06cNJAh6Pa06ulWWskcu6
	7pWxBYTVinwLu1jkyfjPJsMUzEz2r6BvG+hxJnJY4vc2wqUUPXaoxxgSfCuBsaTiK2Pt/McMgaAIF
	PStdWR9OOb6AsnNsTNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm6s-008bFU-Hk; Wed, 25 Jan 2023 20:11:06 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm2N-008Z91-79; Wed, 25 Jan 2023 20:06:28 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1442977d77dso22761266fac.6;
        Wed, 25 Jan 2023 12:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmbysuHPjfK+X9Z9VAj7ZA13Rw20BD2qll2fpcLoSIU=;
        b=1rJHerhUnU4UfmIhepD6q6FyD6TXB2X33hzT1LsQEEwr+1ecb7i+qEzgiMAeQbyZ6L
         3GheS4706ggMSQPcroKD4LHDR7l/+4OM1zkZ0zoZHdzfnrQf8ec3aeZMtgBYWjk/TjFM
         p6VSSn9vhoBOsgb4Z0IuyD/tjRSVEBYtVChjjJLrgdnENgY9zzPzPFGk3wTUmLslyjsS
         B4zWhzq5EsDiwWB/oyYwx19KV+ifLLGPXD4dq5AOz7JXjvicF6X4RGoshFDJRuHnaueA
         YITrvdn07OnjTUOk7bixb8JqQbGV2svltjoLBbEJxGNsIzlheOLuT7dHOF6hiHVTZifJ
         jJtg==
X-Gm-Message-State: AFqh2kqidX40muTCD/7fbH/k8JUyYSEcHCasamTBakOg3d0qQdnNbrNZ
	s5R7sxB3/DkEya18lpcbQw==
X-Google-Smtp-Source: AK7set+GaEu8klX8ZrT+kPUSQ/UdfQGCuvFO5aVmA0fCZzJ/i5NkLzmYTh9rERQZJyp7IvXTuaR09A==
X-Received: by 2002:a05:6870:d356:b0:160:3369:1624 with SMTP id h22-20020a056870d35600b0016033691624mr5072686oag.13.1674677184988;
        Wed, 25 Jan 2023 12:06:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id lu24-20020a056871431800b0013297705e5dsm2285614oab.28.2023.01.25.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:06:24 -0800 (PST)
Received: (nullmailer pid 2770011 invoked by uid 1000);
	Wed, 25 Jan 2023 20:06:23 -0000
Date: Wed, 25 Jan 2023 14:06:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Le Ray <erwan.leray@foss.st.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Tomer Maimon <tmaimon77@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <clin@suse.com>, 
	linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	- <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Michal Simek <michal.simek@xilinx.com>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-riscv@lists.infradead.org, 
	Peter Korsgaard <jacmet@sunsite.dk>, linux-amlogic@lists.infradead.org, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, linux-stm32@st-md-mailman.stormreply.com, 
	Fugang Duan <fugang.duan@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Fabio Estevam <festevam@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: serial: 8250: correct Nuvoton
 NPCM850 compatible
Message-ID: <167467718287.2769960.1087362383778612276.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091602.44027-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091602.44027-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120627_305634_9F179FF2 
X-CRM114-Status: GOOD (  11.99  )
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


On Tue, 24 Jan 2023 10:15:52 +0100, Krzysztof Kozlowski wrote:
> Nuvoton NPCM850 UART is compatible with NPCM750, so add proper fallback
> to match existing DTS and Linux driver.
> 
> Fixes: c8177f90b7c6 ("dt-bindings: serial: 8250: Add npcm845 compatible string")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
