Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5DEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zft3SD5E/F5yfQq5AFXrFB+z8MuCidpEB0xbFrafNCg=; b=YknfJsRjVHTS5F
	zT6KS7Ex2PM/ORItom7m9u7k+s1oB2V9eIxgNEVLAeDyUcawTGng1Dz6o5zeSk10kM1THTGI4798Q
	3JtxPJ9H/3jRDLUbVN5V+w9TM8OnQOuN0ov/L0Sc24VqWkN/NzayTP5bg47/NPCMleMb7F+ja+yOL
	uHKASBDoeOqMY37ZwXjI9J7k1LUFVdu8AvWEcXuSIJc2O2sUDgSlJZYHwMgeZmyLwcu6JzmHWABLR
	ZeBFItUsnfBwaTQvp3JsIBobN26KMgf1EHAMVLQiGQLI362Lw0C9Or3QcBat0uL/yxGGH/Z6+bKCC
	qRJsCbsc7XUIkCKUH1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oducR-003aSm-Jg; Thu, 29 Sep 2022 14:34:31 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oducO-003aNT-Cn
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:34:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id l12so1755348ljg.9
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xqO7boSGntSno3tBpht/Rqvzj2qvhSRjOWUVkdWFtBQ=;
        b=iH8BCt8voVsR0DnJ5f3TdhbiQ7B8m+riiYjqCQ5iXuWI00SIyrE/nPJP6e5UZHHgiD
         qyn9zwnx4xWCNEXkkGqNfVreJU4vfOl6MSBJfStcqVwYngUY/JuWVDnA532tBX/8XJhN
         SSZg/cOzMluTNkVPzwWkrhq7Xnxp1bHBNtivIW3F1Rwb1SSYtu9vgEnwj4skaNmomst5
         QWv6zYbXQJnVaEajlHZdoKV3UGR8SlIUJM8AdhrL4FZ/BntmeKNsRtggifuPNJc0isnF
         7eEUUFc5pUHf7BsZRWJKoS17X68rIWIa1+W3hxity1H7Vg7LsB8k50wSs3fcZqkf4VIV
         LPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xqO7boSGntSno3tBpht/Rqvzj2qvhSRjOWUVkdWFtBQ=;
        b=s034f8VekYnKG0W6EoozMfXFn9cAJNsW970NpMF1O34CQbgcNiJqpC3grCSVl3dZGf
         LRUdPzjrIMXzNIVIErJ+riVBnDHNajxdmnQHbWK4B0U/5/BctcQico1/jNT4o4Eyy7EN
         HnujPbNx/j3MAbLIrbgbtIXd/v+B1z5ngdszTpYhBoTKojNFAGlLhrSG2K1q7WKBCHNI
         h/fNNwpuddBzNN51k5ASlX39C5t7huJto4gDyhdR0zWKLdbQYL95Yzg66eFBSxIkoOYx
         3xBKshoHZ7zRR+TpzbYbV2CM7aBbnzYFCb+eZHdTrXb/rzBGsIIMCiZtXETpLwxW4RpT
         5ZrA==
X-Gm-Message-State: ACrzQf0zCckEgOfjdX+M5sXYlHcd5mr57BFza/AEENKqmXNAhkJUolAi
	EyKv5KJF6CbnHUTaIll5sPSVER6IeKyLqg==
X-Google-Smtp-Source: AMsMyM7Z/LaoxosbVcWiuMFaeyweVvrU8N+LBV3Off9sKT066Le2b1TIDHKPXaqvM4w9Rai6ijyMDw==
X-Received: by 2002:a2e:1f01:0:b0:25f:ea3a:4ef0 with SMTP id f1-20020a2e1f01000000b0025fea3a4ef0mr1283681ljf.330.1664462063936;
        Thu, 29 Sep 2022 07:34:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f08000000b00497aae401edsm798124lfq.109.2022.09.29.07.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:34:23 -0700 (PDT)
Message-ID: <5cd77839-d75b-9290-5d34-90d6464938d6@linaro.org>
Date: Thu, 29 Sep 2022 16:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 01/30] dt-bindings: riscv: Add StarFive JH7110 bindings
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
 <20220929143225.17907-2-hal.feng@linux.starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929143225.17907-2-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_073428_489256_F5B97703 
X-CRM114-Status: GOOD (  14.65  )
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

On 29/09/2022 16:31, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>

Drop last "bindings" from subject, it's redundant.

> 
> Add device tree bindings for the StarFive JH7110 RISC-V SoC and the
> VisionFive2 board for it.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 5b36243fd674..543be573921d 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -21,6 +21,9 @@ properties:
>        - items:
>            - const: beagle,beaglev-starlight-jh7100-r0
>            - const: starfive,jh7100

Blank line.

> +      - items:
> +          - const: starfive,visionfive-v2
> +          - const: starfive,jh7110
>  
>  additionalProperties: true
>  

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
