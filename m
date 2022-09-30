Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0D7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cr+1JbjVukouZ+MJ3vVei/DV46f9DvhsMEinGQDr8wM=; b=zktS+Fn1edQjCG
	i5F2xfGl9W73+z0Fc1SNdTGo8K9cwZRNVVJN+ALVOJzw1lq6/0Jl2Do1pNn6+IDz6Y0n413r6fTJJ
	63PXKefs5HtOJOLH0h/XuR2tNH2x+B/wjThXTRpGNK3cIq217DzJ/0BLVE83bwwm7CEcpKzjmGDe3
	Gf5C5b5U1tz17W5QZ2+BCRucir+pE3oOnttvQPr0y4Oo79UiX3dCrWQJ5Yw9EU4wKHrnw5+QE8pKH
	Rs2i3rcY8tXLksbjWURH1KRIt3DMnPffOFx2uU4M/Vh4SgxpkEmKKIIULglxMVd9wt3ToNB8INbak
	QdtvqWvG2Tluri/VgLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDim-008iOT-08; Fri, 30 Sep 2022 10:58:20 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDij-008iMk-3M
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 10:58:18 +0000
Received: by mail-lj1-x236.google.com with SMTP id a14so4393007ljj.8
        for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5VAtT045HhMngkmwARoPHUum6+7Xd5AahGP1N35/lRw=;
        b=fawDO9CiFlwFpbC+3YyovBO32HiOGqZ+TrjsTr2Q6YcCJCeFCfaJEiuP3XHibreYfx
         wmTrXtWKvlU1ywiJ18MNHJj+RSbhfYPzYo/ZQnDGj5GgluDuZ7okPUozoUJ9Bly33yV+
         99Z1HqEmfxSxaOxu2hRBQLI/YMe6RRvV6/zPLAw5oIi08PrbCiJd9EDxTCh2vkUZ1DeE
         gB5wvphZ3bsi5lkQQFRQrzVf4UF488cob5ENfxZInr0/UCv9a9gGzuoOW55ZT5WQtV8W
         HTLuyjBNlC+clvHUjLjUY1yo60g20jhmRl9loUR9iM1zQH9LB+mXFS8ZnTfLUrKTAqZU
         AXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5VAtT045HhMngkmwARoPHUum6+7Xd5AahGP1N35/lRw=;
        b=t1c2ckydweNxR5KrbB3Ty55L362Ru6tX8HOazASlgHspEweeFHrIDD6ZjEjpTvSi/F
         6Iqw+53UlPCoy8pACEqQFO20HIt/FCw0y3mZv+8/iRJqVTYdd9L+0dYdeKEyy1cCeZtx
         5NKxxsGsmuFaIoBVNr9m89q1yLrRVpA9udXmJFr6nNC8aVbDe6Npu80pYtdT1SiyrtXp
         noJ3ayikZXfgeMEcQxSlmezLy3fkBLYnt0PzMaLEWybFsA7kn5HUrQMH91QxSQaQEl5b
         hO+BZeZ3B3uz2jsh7GKeCqEs1l/ZpGOkJHTG+NxiOJsg4eFlLDwVIutMW4Sc+Knl+p/0
         YLbg==
X-Gm-Message-State: ACrzQf2pwYhy4AzA/Ju/unxkiApKXGgM++7JRPt5mSZx3Kt6cASwfpD9
	0JUCbibXnHe3rE77wMWqVUkMBQ==
X-Google-Smtp-Source: AMsMyM7TKpBGxyi1XbG3exK/6MQW1oPEOmmR7/XdLTYi4sSeeYzQ9S++Asikue7qCrHD8G5zL9+8Lw==
X-Received: by 2002:a2e:7201:0:b0:26b:dd49:721b with SMTP id n1-20020a2e7201000000b0026bdd49721bmr2574829ljc.509.1664535493744;
        Fri, 30 Sep 2022 03:58:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h19-20020a056512221300b00498f3ebffb2sm265007lfu.25.2022.09.30.03.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 03:58:13 -0700 (PDT)
Message-ID: <c99f6552-db04-fe30-ed69-4a08b0af5276@linaro.org>
Date: Fri, 30 Sep 2022 12:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 17/30] dt-bindings: clock: Add
 starfive,jh7110-clkgen-sys bindings
Content-Language: en-US
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929222647.23816-1-hal.feng@linux.starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929222647.23816-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_035817_166682_DF31A49F 
X-CRM114-Status: GOOD (  10.62  )
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

On 30/09/2022 00:26, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the system clock generator on the JH7110
> RISC-V SoC by StarFive Technology Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>

(...)

> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive-jh7110-sys.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscrg_clk: clock-controller@13020000 {

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +        compatible = "starfive,jh7110-clkgen-sys";
> +        clocks = <&osc>, <&gmac1_rmii_refin>,
> +                 <&gmac1_rgmii_rxin>,
> +                 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
> +                 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> +                 <&tdm_ext>, <&mclk_ext>;
> +        clock-names = "osc", "gmac1_rmii_refin",
> +                      "gmac1_rgmii_rxin",
> +                      "i2stx_bclk_ext", "i2stx_lrck_ext",
> +                      "i2srx_bclk_ext", "i2srx_lrck_ext",
> +                      "tdm_ext", "mclk_ext";
> +        #clock-cells = <1>;
> +    };

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
