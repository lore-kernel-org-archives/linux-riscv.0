Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C69C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sqiJYETQIa34pZ5JWTWjX7YnS8C26Q3R/NGwQsw4Gw=; b=cTirAkzW/jeiXD
	x1ePfewWKSXDousf/L+Camj1ZwCEHs9gRtHcLsmzUFcppgW+OVtRfYzkiuJcD7gWkp/RsVJka2NJD
	ChY1fD3sG9U3by6/RKze041w9EcwD7NwoMG6eK5Vac3rbzElEtRjX+K/mhHpnO/smKcQk/tV3o6WL
	vBFyt1wQVabKfnVlpcR1JRoPbJpSQDPAsVL3eQrJUCplhwLhz8waGwdJmPW5Sgs+7hEuk8OeLRALA
	v4QZk6pq7L1JHVU0FzSw5VWIS5YG5q/8MkJT9+UNR6x/owB7GBxiul9CBaDvmnSNit3bcp3HNGKOi
	YttCKgim/BNbTkwhkUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncq0v-0006Yt-E7; Fri, 08 Apr 2022 14:55:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncq0s-0006X1-Uf
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:55:04 +0000
Received: by mail-ed1-x531.google.com with SMTP id v15so302956edb.12
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=09k0cdXExIXi2nZQGUowL8FTPg31pRqik4f6jmnnO2w=;
 b=MpbglDaS3k4EI/fk+SJWAT/f1sz20SJeI9EtjdiqXMiihqP1mS3ENkAO9g8FRFAN9J
 b30/PEOhU/Z2Gtcj3XsCAWwjN/8ZGJc2KoR8PPSyGLSibIx2jqdhtEWw7xfxdAsj/B2A
 UuvK26k322/fI+NzVLdyaJh95QBE09uVgbcDJjwVg7+3NmXytaRgvsAgX5RBMVGwkLhb
 WlidJYMNyaTKZNGXJbHAycABGs1gHPhEjA7s7pfjSQd5usRl3n9mlhJg9yQJVkSDd7/S
 n9DbZ/gShKAr3Bs8IllyEzXi2vIIo58F88IExJ6FEUL+YBowSMaQ6VH4hYAboT5Y55nA
 M16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=09k0cdXExIXi2nZQGUowL8FTPg31pRqik4f6jmnnO2w=;
 b=BOYCAD2SCRKw9Dh2gD0mH30Y9Zig0bNrnX3cJynBWz2VUjKr4PfbcMjXysJmtBTX5K
 bSFMF1fpVdlCLj3lR75M8vzXvSYXMlS/V5DUuZ6Bg0XYfxfb2pWXbPVuHqTFJQyjDRMl
 wd/H14ND1oPNesGao7mNrSCxqu/UkeZ9q3PrRmGCcuDMK+YOr09EQDQ/UKgv2sA/c/wc
 SPPxND7OK/FEyIv77qAvJvL6qIXb+ILQl3XLqzrDdKAAyNVI3X4sGojMv8cyx/Gvjapi
 B6AwUDNivuJxgsn34MVXRC1FMkfd3H5BOHMelDxJWAaGaH8yXNIsKr+hyxG/rTPkW2By
 XFgg==
X-Gm-Message-State: AOAM5321LXGV/6UAs066JO8YC7r9FxYYKQLFH0ldS8AU3/XdXkTi0wtn
 VrygGn5fmGGIG4RsMXq6FLFCVw==
X-Google-Smtp-Source: ABdhPJwHlNeuxcQeuAi8hDLAkT+emovtzwN0HxRAZ5hQ7o8XUVx4+YFAgDy29RKu/t3/uNC1/OGIWw==
X-Received: by 2002:a05:6402:278d:b0:419:3794:de39 with SMTP id
 b13-20020a056402278d00b004193794de39mr19787666ede.137.1649429699052; 
 Fri, 08 Apr 2022 07:54:59 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 j22-20020a50ed16000000b00419366b2146sm10878381eds.43.2022.04.08.07.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 07:54:58 -0700 (PDT)
Message-ID: <d4a182e8-9469-6dfb-af97-6e570d4c5ab1@linaro.org>
Date: Fri, 8 Apr 2022 16:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/7] dt-bindings: clk: mpfs document msspll dri
 registers
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <20220408143646.3693104-2-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408143646.3693104-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_075503_049562_BD6C8C1D 
X-CRM114-Status: UNSURE (   9.74  )
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

On 08/04/2022 16:36, Conor Dooley wrote:
> As there are two sections of registers that are responsible for clock
> configuration on the PolarFire SoC: add the dynamic reconfiguration
> interface section to the binding & describe what each of the sections
> are used for.

(...)

>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: |
> +          clock config registers:
> +          These registers contain enable, reset & divider tables for the, cpu, axi, ahb and
> +          rtc/mtimer reference clocks as well as enable and reset for the peripheral clocks.
> +      - description: |
> +          mss pll dri registers:
> +          Block of registers responsible for dynamic reconfiguration of the mss pll
>  

This breaks all of DTS - in and out of tree.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
