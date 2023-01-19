Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0C1C38142
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 04:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BioulIkqm4d3shlYvOhZQLbYiVDjeHxpNLeJhW0pgo=; b=C55bhqNdKmoKLC
	Pli+wqjdaXOO6YQ9hBR5rkzzPnrGWV9Jg0EoxOqu4AlGS0kFhw7fHOjHFGsh2eymPBWDErXPgxms5
	9VygLtJYhWfxpeoBOEKALbusIQglJ4xcMWBvBusV+tdGO2MIv7tkWXOUFz9FRlm4d/QDmvK3fX3w1
	S9fqOETgjs+fnyQJxnht16F5CXXIPs7PNDLCCaMIu131dtpKVHdLADV4fw/hL4Rub9APb/IB0awy3
	iMpGN4Q7Bk8+hXIevpTEz5SFgY/LUaV+jN6rqrBO6E2RdYY2Y+3YapMdsBEsukqQQ6wClwGbke2WB
	8UklJDXfzOVsIpuh7Vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIMYY-003ZO4-QD; Thu, 19 Jan 2023 04:29:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIMYP-003ZIo-CM
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 04:29:35 +0000
Received: by mail-pj1-x1032.google.com with SMTP id gz9-20020a17090b0ec900b002290bda1b07so3225236pjb.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 20:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1y/5KDHgKHirXTUDecr+02A1cm5hXFyau/VonkRgpE=;
        b=Qwwu3mjMk12mb8arDhmeBCvpdrQtaWykCv52bQMcfaQnPlZn+g4S4pyHWK9g5gJq/E
         bO7IKgK54I54tGt/S05MX6Bugw6bPxNfhg+ah1MT6QRzC2BodAU7Nxc3jTYm0+gOfRju
         rQK0Xne7+kdHXBVjGreIcWWobpNO5IybesRxyfrNKwIxvNJ4yschR/MT3M0xuU4V9iLQ
         o9Q6K/DEzCiH29zW01Y9cg6rR9MmG3HVgncg8V1EWXGBj2G8UTMnjfYdHZEb5fExOvTX
         fa3wF8EGcngCDygVAXXSYTLa32Z2WL/Lw84vQis+TJezj9R9KJ13ggeoKElki9XZ9BB1
         8FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1y/5KDHgKHirXTUDecr+02A1cm5hXFyau/VonkRgpE=;
        b=yfHaE7z9L5sQY80O5RJ6xmip82RLaCyDLULJjn/+vlvp68e/E7axM5Q+axaVDf7yli
         QE+q4acPQtYFm79rOC8j4F7jX5WXNZVMDFj5BQJp18K0C9XLIOoaKyMFhKHpIoaINEbH
         pJQfiF86HQynKNGlljEOwBYNrqMarHq3U+ZlbANTVpJAtkNgEbLP0xRXLWZWFkQcjHp2
         ppF5Kbke6/1fvRjI53xcVufXijJ2RbEzSe6NTsUymnvZiXrHydzq4TIw5PMJe6cQM/IQ
         tOSs4u3HycE/5zKBOsO1buEdjiOYWNXPQsbXPETNNF602lvUnpcB+Jom5voB332/g9nP
         YkGQ==
X-Gm-Message-State: AFqh2krbPbvFy1kxeFdY6s6IpmGaqx94QdpxCtpavsBrwth0cP/4Y49a
	CS9Vks0xC2GBMeSKXR3dZ1hk3g==
X-Google-Smtp-Source: AMrXdXsL1ggmaWVhUlXD0gW9Nplw6seQdpkL31Roa0A2ZWPa6AvCI+80NJvuCsPquPnD0v53gX9ycw==
X-Received: by 2002:a05:6a20:9b86:b0:b8:648f:f414 with SMTP id mr6-20020a056a209b8600b000b8648ff414mr9493806pzb.29.1674102565791;
        Wed, 18 Jan 2023 20:29:25 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id bg7-20020a056a02010700b004785c24ffb4sm10760212pgb.26.2023.01.18.20.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 20:29:24 -0800 (PST)
Date: Thu, 19 Jan 2023 09:59:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Green Wan <green.wan@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
	Peng Fan <peng.fan@nxp.com>, Paul Cercueil <paul@crapouillou.net>,
	- <chuanhua.lei@intel.com>, Long Cheng <long.cheng@mediatek.com>,
	Rajesh Gumasta <rgumasta@nvidia.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Palmer Debbelt <palmer@sifive.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
Message-ID: <20230119042922.aiggjqvnirk6sgdo@vireshk-i7>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_202933_460935_8B3F35C7 
X-CRM114-Status: GOOD (  10.38  )
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

On 18-01-23, 19:01, Krzysztof Kozlowski wrote:
> diff --git a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
> index c13649bf7f19..5da8291a7de0 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  
>  allOf:
> -  - $ref: "dma-controller.yaml#"
> +  - $ref: dma-controller.yaml#
>  
>  properties:
>    compatible:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
