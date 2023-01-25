Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0DEC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKdWsQxtRON5h1f/KBkpeUyX1aGgz6tjP/M7zUM+mWc=; b=G8imnfr5eq5Mh+
	TpEb67Nx89ZL3YO8Tg30+TbKw6dGj2lGJ2lshG06X+gTn9GrIK7YisiePP1nCaaF06FyAbdSMpxTT
	QrSuChM2wjb7lDJ5pTlvXUU1HLV299ee4mqYQB07Fjo/MznyjNbbU+cm5UUM8eAVDkLLIporsuQg1
	WlPZX2wCd623/uinsfzQHybhPXStW/q2Q/QabKlEG2FswcHXM3+YoTaNzHJiFMo0J8sVZsZyoDUKx
	rZIVzDR8aO+q25ck+f8zLmZnTz5k6LWuK6vQMVkW17Kan16p6TNOkCYUCWC5Cr7KzDYU0uEYNG4Qs
	5ZWqWCDtR7z+utYUM6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmI0-008g9H-Aq; Wed, 25 Jan 2023 20:22:36 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm5H-008aSY-9T; Wed, 25 Jan 2023 20:09:28 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-15f64f2791dso22745170fac.7;
        Wed, 25 Jan 2023 12:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GwbvorGn0RsrCr1lYO8AQMjltKd8a/pRgkR5/1pKCQ=;
        b=UoKOx+knhCnGsC/foEoqHAApk4/lm0EnftmPGyPYclq9/6Jf/Dvj+HOIGWI35FQNAa
         nIzRGf89sej48AlOFTe8k5Oy7mceWTNayl/lcrquRJdqj1/0pUBtcjSR55xjEoJQUlrR
         3412Q3WsKFnxPvTBoMjZTWiFQYZWC5ir5M2MXmPxDUFkdgN4BDfjiJ7pTwZD0aLtWDFj
         9kGWMnpclw1hsoEqCnjXhiIzUX5y8UkCe7SO46A/pYKrJkArYRgiygJL4ajWegbyauoX
         Apb/IAT1/divgfp8KxTtkGU45ogRIHsvbFlujnE08jX0Slmfd8rpR6dPV9MurXB3sH+p
         ufFQ==
X-Gm-Message-State: AO0yUKViQOcsGDpy5ecVdXtkazdKWu61yoCBP09byCzwyxfPqZlB2ugk
	QUosvrSZ+XxexK/aZGdttw==
X-Google-Smtp-Source: AK7set8vWoADu2dFh2Wi0jTLqZLUS3c9WQz5pfsofwNc+7WfeFAiHYC6lXfkVBUekSKcwpURaqmjaA==
X-Received: by 2002:a05:6870:1711:b0:163:3d31:58be with SMTP id h17-20020a056870171100b001633d3158bemr1344921oae.45.1674677365046;
        Wed, 25 Jan 2023 12:09:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j24-20020a056870051800b0013b9ee734dcsm2271007oao.35.2023.01.25.12.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:24 -0800 (PST)
Received: (nullmailer pid 2800439 invoked by uid 1000);
	Wed, 25 Jan 2023 20:09:23 -0000
Date: Wed, 25 Jan 2023 14:09:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Fugang Duan <fugang.duan@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Peter Korsgaard <jacmet@sunsite.dk>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Chester Lin <clin@suse.com>, Tomer Maimon <tmaimon77@gmail.com>, Le Ray <erwan.leray@foss.st.com>, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michal Simek <michal.simek@xilinx.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 11/12] dt-bindings: serial: drop unneeded quotes
Message-ID: <167467736271.2800253.2821370670394691234.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-9-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120927_380329_AF3ADF27 
X-CRM114-Status: GOOD (  10.61  )
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


On Tue, 24 Jan 2023 10:19:15 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs.  No functional impact
> except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml            | 4 ++--
>  .../devicetree/bindings/serial/fsl,s32-linflexuart.yaml       | 2 +-
>  Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml    | 4 ++--
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml      | 2 +-
>  Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml   | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
