Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62703C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWcrdwj69Ovouto1T8DIMsNbgU/mQuIipmWSQycjkyY=; b=ybEHmbYpFDYt9n
	gem4lzyRfnhvU5+OvwY1pTT5t5Ciax6muVjs1C0Bhe3uouCkJkqknkYr59B6nQn1Wd3IpIfciA+24
	/HtPJSEC80N4mejV7/iiqoIZfsBmJjo5lKM+eK9dhEDB4wv1hB/5ty8CTWKFB6PU29I4JLHGb4fsU
	trmUZ4L+tDE8RU+LRN3D/WZ3EUjsgWWZK/sIomKUQQ2lUOTOeAj7oPFs1e533QzjG2mLc5WbaX1TA
	D3YVnXK7fqtfpzzG1iI09Mqr5AgVeRUoI1yTVFwYjmt1hOyGd6DEmZBrEiS5z/O595/TDbsmD3ttI
	btZQVbhkJXb1VLzpvfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm7t-008bnv-J6; Wed, 25 Jan 2023 20:12:09 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm2e-008ZGW-1i; Wed, 25 Jan 2023 20:06:45 +0000
Received: by mail-oi1-f177.google.com with SMTP id v17so17275387oie.5;
        Wed, 25 Jan 2023 12:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjdeMOLunBcaH9abbjTPumVPAzpI0woKuv5TqA6wWlg=;
        b=mwqQFBwDH9SSBhclsroPrKYqd+3xwnGj3m7/QyDkj9TVtJI9L7o8UCGDz+YB6w2XHG
         y/xqknWOw+4a5/GsdiXDzekO0MxmVlsQHBdQ9oyypzRkFi+YsIp+W7wjtCRZJJJ381ZG
         MYF9/hfp4CSBNNtCf9n+4x7535IUiVnOV73BI7GvTy5gnVWyZgY2mNIppRzTi9yXne44
         A7z5gJxGVKxlNd7bXFQhZCsZqyGP9/GWw2TWhIbx1YJjGxzUpjGBc1JqkLoIhDsuqCPi
         8xyMLoeeQXk06oj3hh0pASn5V5KbXiwwOtFIYDctP+lL6l55k0XrhcqgxkcuJ2VocyhP
         xGfg==
X-Gm-Message-State: AFqh2koYMKHVAVLRgcpA0rtvbmU+4xqtR76jlb5HEQfEHAqbeKy0hDYw
	graAOV7zrYMwr84gyDtbOA==
X-Google-Smtp-Source: AMrXdXs39pVibYTbO8sCzlzh4gXhBnoYQHFDiAukdaJUOpcBjaCiIgpNW6SRZHdq1Euvc18hPYacFw==
X-Received: by 2002:aca:e106:0:b0:363:8e7e:60b with SMTP id y6-20020acae106000000b003638e7e060bmr15163351oig.31.1674677201827;
        Wed, 25 Jan 2023 12:06:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l74-20020a9d1b50000000b0068668e2e08bsm2534670otl.58.2023.01.25.12.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:06:41 -0800 (PST)
Received: (nullmailer pid 2770378 invoked by uid 1000);
	Wed, 25 Jan 2023 20:06:40 -0000
Date: Wed, 25 Jan 2023 14:06:40 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Fabio Estevam <festevam@gmail.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Kevin Hilman <khilman@baylibre.com>, 
	Michal Simek <michal.simek@xilinx.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Fugang Duan <fugang.duan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Chester Lin <clin@suse.com>, 
	Le Ray <erwan.leray@foss.st.com>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, Peter Korsgaard <jacmet@sunsite.dk>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: serial: pl011: allow ARM Primecell
 properties
Message-ID: <167467719955.2770340.7541724589555631279.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120644_122980_C5422A0C 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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


On Tue, 24 Jan 2023 10:19:07 +0100, Krzysztof Kozlowski wrote:
> Reference ARM Primecell bindings to allow typical Primecell device node properties:
> 
>   broadcom/bcm2711-rpi-400.dtb: serial@7e201000: Unevaluated properties are not allowed ('arm,primecell-periphid' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/pl011.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
