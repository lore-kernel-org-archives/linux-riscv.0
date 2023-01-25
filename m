Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78A9C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ow5P1n0DepFcyzUYYVWphZzTVTUP2qeMtdXcDNV7hP0=; b=D3eQA3YUetm3Ol
	OT5CYIGA9xik60KXwXDy9BNp6TD/UvbmCwYKYaCDysb/cCRHqTACb8gMwZMqA/kbYacOeJkC1aY6q
	5GupHiPA5HauLtXeGpv57o4TlRY1uTrl0HW5UgbAKJEGTRYTJG9O+pN/fs+ZHOPCTluMsx0CbSALz
	BtW2uZ773rmPrg45NJzhVFdnJRNxZ71NY19CrSyQeT8GmVVooC60DSytLCBJS6ydcWE75ij10OysG
	Ou1eG156JkstRTPz9W3GoojFGVP7UJU9q9Jbk+qYyeLOkfM9uU8qlS7/Jjcy1iz19xGrKFNraKjZy
	EhPeSCVSQRdHpyl3wP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmIA-008gDV-5k; Wed, 25 Jan 2023 20:22:46 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm5r-008amX-FL; Wed, 25 Jan 2023 20:10:04 +0000
Received: by mail-ot1-f42.google.com with SMTP id x21-20020a056830245500b006865ccca77aso11789006otr.11;
        Wed, 25 Jan 2023 12:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvGxKBe2tXNnIAXd7DhRCMLLrdEFz1rEy7hosIzra4k=;
        b=owtiYgy86v00Tll0rxpSI95SY96H5INMHrXKlezdyUYlgWqgPQi63NHQpFLm69IadJ
         c/ECa2IVxeLDt9aX47efbnAME1gqF1u7afNJ/TMlAQ9dwZ5jEgHo5SWlXAbU++O/z0Dk
         NucJ044R4yMaAZfV0W3TgBtdIGSi5RGIhbF8VKyzR0d8JWCZXq5gn6v/yYdCda27S99V
         nYknWQ8wnaO5clt7yVlbH43n89Uyj94DVWYoVl6wJTNFp2OeaUgKhV1+PyXk+TefvgTO
         FPckbS3zVtnOnsqi3ItHC3Tk4JOxWYEpQrr8xAf7Gc/6fOU2O62eemzRwTp09851t87Z
         QS5Q==
X-Gm-Message-State: AFqh2krq7dMzdndV96BhRRN41NSWnUp8XfjrUvCN+zWYiBQl7BohL7VM
	R9ROlRFxicIbFY1mEffCrQ==
X-Google-Smtp-Source: AMrXdXuxRG4RDF7RI7gCrOg1RarCpE71i170Oc3Cr+xu3/OuWc975n087q9cZ/K9XzPPfyTQp3Iy4Q==
X-Received: by 2002:a9d:7508:0:b0:670:686c:7dc with SMTP id r8-20020a9d7508000000b00670686c07dcmr17455962otk.26.1674677402557;
        Wed, 25 Jan 2023 12:10:02 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b6-20020a9d6b86000000b00684e79759d7sm2505546otq.65.2023.01.25.12.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:10:02 -0800 (PST)
Received: (nullmailer pid 2808877 invoked by uid 1000);
	Wed, 25 Jan 2023 20:10:00 -0000
Date: Wed, 25 Jan 2023 14:10:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Korsgaard <jacmet@sunsite.dk>, Chester Lin <clin@suse.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Vignesh Raghavendra <vigneshr@ti.com>, Shawn Guo <shawnguo@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michal Simek <michal.simek@xilinx.com>, linux-riscv@lists.infradead.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-serial@vger.kernel.org, 
	Le Ray <erwan.leray@foss.st.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-amlogic@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Fugang Duan <fugang.duan@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 12/12] dt-bindings: serial: example cleanup
Message-ID: <167467740050.2808709.16126387956370383942.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-10-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_121003_590113_9FE798A1 
X-CRM114-Status: GOOD (  10.46  )
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


On Tue, 24 Jan 2023 10:19:16 +0100, Krzysztof Kozlowski wrote:
> Adjust example DTS indentation to match recommended style of 4-spaces
> and use lower-case hex for address in reg.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/serial/8250_omap.yaml | 18 ++++++-------
>  .../bindings/serial/amlogic,meson-uart.yaml   | 10 +++----
>  .../devicetree/bindings/serial/cdns,uart.yaml | 10 +++----
>  .../bindings/serial/renesas,em-uart.yaml      | 10 +++----
>  .../bindings/serial/renesas,hscif.yaml        | 26 +++++++++----------
>  .../bindings/serial/renesas,sci.yaml          | 24 ++++++++---------
>  .../bindings/serial/renesas,scif.yaml         | 24 ++++++++---------
>  .../bindings/serial/renesas,scifa.yaml        | 22 ++++++++--------
>  .../bindings/serial/renesas,scifb.yaml        | 12 ++++-----
>  .../devicetree/bindings/serial/serial.yaml    | 18 ++++++-------
>  .../bindings/serial/sifive-serial.yaml        |  6 ++---
>  .../bindings/serial/xlnx,opb-uartlite.yaml    |  4 +--
>  12 files changed, 92 insertions(+), 92 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
