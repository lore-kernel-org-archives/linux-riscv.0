Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330A5C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 20:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EF0Ngt4ocpoQpfRr4s/LPGe6HOupvafApsByz1LINDo=; b=4DPO3/XFVGUmoi
	OF7bJIf+L/FaY9gmbGYLoJCNgaLQv7Qd4MYZwcs/VcwIik/mDyOG7Wu73ah62IiJiOVbgm+5tWMj2
	8KpDit+R4LFukJbR86FFY6IzkeWBEvJNPIfJJucUUltN0HUWlHV40EtXQT6p9Kg2VIJ/NVKcwg8vz
	5F6nlr30k6AbvD3+ogfzbGzjR+k6uXtek/5NmdoZqWO4rU+l691XAksxraKRo1//qqgnBQxoFCHq+
	g4oH3W+qMl4BkfG/EhnTiJh18wiPgMNBvXPf4W8rFRq7o7Ns4FOnlr7rUohS9jtwq/BbOCrbTKfVj
	SUcfrHHjLXC0IvrSMTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmGR-008fTo-Bb; Wed, 25 Jan 2023 20:20:59 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm4t-008aIe-Va; Wed, 25 Jan 2023 20:09:05 +0000
Received: by mail-ot1-f46.google.com with SMTP id t7-20020a05683014c700b006864760b1caso11857otq.0;
        Wed, 25 Jan 2023 12:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t3+eN2lHtIu49LblIFaPzhFGYt/AfmaSuGsn+YEdS0=;
        b=nLSaugux7bjlTPw/13olc9N/TsR+pyvEzNY7VawpVrLDQG7PTDIHG+V0/v6Dob2x1a
         lPPvc1oRT5h9k3Jvf/7wv4/JEN2P4ItbFd7x4WKBMuOIPOnGg9jQzVNUciGFyWEWShAU
         qkB1Si9i4yzPm9TRO9mLAD06IImiciyDVyl9tgjXgGoAGgDW4HPJVPAS9LMoHmFH5L7o
         Q8ALMuYTvGPbM0OXAD/yR3BNaPisO7XfDIOHXovRFBPbY2mM4LD8ays/51OrojQ9qqVo
         KQCdYfMGCpmqa7m90JIAyUbNdNGj+uuzznxh37Ui1EJNhu3R1oqnWz2VEWGTicDDYurY
         CB7Q==
X-Gm-Message-State: AFqh2krbuxUhHb9IpSbcfHXTmvZlXhoLu33fE0IaCE9T6nWAZMYfNoge
	2erzfFpK+eAmcSySM23rMA==
X-Google-Smtp-Source: AMrXdXvmG+MMXgZe3y8Iabdwj1T7QPV9D3ixNYqPrRVv52b4IuvZX87jEuE4ezPKTjyH7bgohvzYWA==
X-Received: by 2002:a9d:6b03:0:b0:670:7a2b:f52f with SMTP id g3-20020a9d6b03000000b006707a2bf52fmr15887767otp.8.1674677341751;
        Wed, 25 Jan 2023 12:09:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f18-20020a9d5f12000000b00670641eb272sm2571030oti.20.2023.01.25.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:09:01 -0800 (PST)
Received: (nullmailer pid 2795996 invoked by uid 1000);
	Wed, 25 Jan 2023 20:09:00 -0000
Date: Wed, 25 Jan 2023 14:09:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-stm32@st-md-mailman.stormreply.com, Peter Korsgaard <jacmet@sunsite.dk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Le Ray <erwan.leray@foss.st.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chester Lin <clin@suse.com>, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pragnesh Patel <pragnesh.patel@sifive.com>, Michal Simek <michal.simek@xilinx.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Fugang Duan <fugang.duan@nxp.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 10/12] dt-bindings: serial: st,stm32-uart: drop common
 properties
Message-ID: <167467733943.2795781.3621050331030383112.robh@kernel.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
 <20230124091916.45054-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124091916.45054-8-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120904_050931_ABDA2F8D 
X-CRM114-Status: UNSURE (   9.95  )
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


On Tue, 24 Jan 2023 10:19:14 +0100, Krzysztof Kozlowski wrote:
> The binding references serial and rs485 schemas, so there is no need to
> list their properties.  Simplify a bit by removing unneeded entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml          | 7 -------
>  1 file changed, 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
