Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68826C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNO1J39ey0+cvrJ6bDZkckhgGQk4VzY0j2KmkpwAhEA=; b=WfOf8y4bQvDQVy
	RVM3swm6TKzcwBGTx1lbATUKA92Jcc4wc0EhdHtZmbWl9euOsiOPfEn+x1hQXFbeGSOO4HKJs+e3Z
	oNw8Tx4UZKDTifqpdmIu9Kz9FiThr4Vai2v3sOXkEpeNzK21eoQnTsHE4UUG0dXzNDoJoRBul5DqJ
	r2roAnenlSEJ11RTjOIn+IpjpW7ftw1hbmaf202F9SwP2MibJAhHgY9pf7SeKPlVmAXgyfnH0xol7
	Q7uSgyng5H6bYrmk4axG0nfOSPrx2K89uBO3AYGpBLNFNjJfQj1GTKP93h7CacYPUnmwqWylqJ/+o
	MsM/S6N1eR3sZf+1ysBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm97-008cJ5-5P; Wed, 25 Jan 2023 20:13:25 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm2w-008ZOS-Tz; Wed, 25 Jan 2023 20:07:04 +0000
Received: by mail-oi1-f181.google.com with SMTP id p133so17255901oig.8;
        Wed, 25 Jan 2023 12:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjxpPCXLfIbQ+6VlgSG0tsTyVkfQNnId/4DSkULnpV4=;
        b=CZeTi9u0Y51v3HV4G81f9GlfyZpB/q3X8qhPwUAupYhb2FQo3KR1wXeQ/38PuXY74E
         YacCMI2v8KoSEjgvzM5Y2tYkGOi6Nxg3D5NgkOT8sna6Jqgl7BpsT+JrUSPzpw9naQA7
         RMoSfPwxBzrSmTUisFvKHkChYiHCgL+UZq2E4ezHNX7AcyQbQTsjnPSPGI6VXIVDMRQ2
         2MQm5o9ATEdkO4+8sI8XzK7abXWkKzcSgPD/z3iRR5O8a2tFA3mgoZAGq6UtxJQKM8tx
         6JJft6p0jctxsWgAhujl1WJ0w9v70EtGAq2w3GO6mPwBaqBxzkxjdZHMjG+CjdmHzdxc
         PTtg==
X-Gm-Message-State: AFqh2kpbWg8Bx60l0cay5h3aSliRDuxQhYd3MX30Zof/IdYy77Kcw4cu
	8O5Vk1OU0q4qTaunxVpGlw==
X-Google-Smtp-Source: AMrXdXvZSXdLIAvantzWPKLx8w8nHQA+dbuiWBV7hE/X1AIpaFtwf5qnOANWheWQAHC+czb3K7K1XQ==
X-Received: by 2002:a54:4708:0:b0:364:eb0f:6de1 with SMTP id k8-20020a544708000000b00364eb0f6de1mr15696584oik.23.1674677219277;
        Wed, 25 Jan 2023 12:06:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id eu25-20020a056808289900b00369ec58932csm2620202oib.45.2023.01.25.12.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:06:58 -0800 (PST)
Received: (nullmailer pid 2771034 invoked by uid 1000);
	Wed, 25 Jan 2023 20:06:57 -0000
Date: Wed, 25 Jan 2023 14:06:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michal Simek <michal.simek@xilinx.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shawn Guo <shawnguo@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Fugang Duan <fugang.duan@nxp.com>, 
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Chester Lin <clin@suse.com>, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Le Ray <erwan.leray@foss.st.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Kevin Hilman <khilman@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Michal Simek <michal.simek@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [PATCH v2 04/12] dt-bindings: serial: correct ref to serial.yaml
Message-ID: <167467721713.2770933.9672853616239186241.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120702_998219_DBC61744 
X-CRM114-Status: GOOD (  13.00  )
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


On Tue, 24 Jan 2023 10:19:08 +0100, Krzysztof Kozlowski wrote:
> The serial bindings should reference the local (in kernel) serial.yaml,
> not the /schemas/serial.yaml.  The latter comes from dtschema package
> and is a small subset of serial bindings.
> 
> Usage of the local serial.yaml allows typical properties and children:
> 
>   xilinx/avnet-ultra96-rev1.dtb: serial@ff000000: Unevaluated properties are not allowed ('bluetooth' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Michal Simek <michal.simek@amd.com>
> ---
>  Documentation/devicetree/bindings/serial/cdns,uart.yaml         | 2 +-
>  Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
