Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40A7ECAAD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kApGgoYgDiDAlhx8Ta9zxWvtde64FRKZEWDjN3pwrgg=; b=E1GXc70wtcOOWy
	nEmTwQF7iK48yk+eDhmi+Ybw15sqcps/B9DHCPB5QxnAUe2GIaU01js0r7DRMQRGH3UX4AeyDxKZm
	mhJybXbT632WuN/Jgd8HE38+BnM5D8u+CxnEDG4122HqOqCxCLHtJAqyIKve8ZJPPcnnFvIUW3SqR
	1JPZ1hJRM95U8HZOld2xwGk/BLzn28NA9WiQfvYN0mLmLThSlL4bvABF1EdBr8NFsafBn+YeiEQ0C
	IPv8rSL4SSAGxQBjGc7HRTqapYq8miYtdbd9TrJ07fxxFPtVXwlb7wr5k7s1NE3U/griFzL10J3s9
	CG0cS4epkWmxch/Htc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRs1M-006kpn-OY; Sat, 27 Aug 2022 09:22:28 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRs1J-006kgi-9w
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 09:22:26 +0000
Received: by mail-lj1-x232.google.com with SMTP id bx38so3597271ljb.10
        for <linux-riscv@lists.infradead.org>; Sat, 27 Aug 2022 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=poqSmM+AeoTfp1g4HUHnRawOxryRZkBqc2YyEx97xHw=;
        b=c183QsYPa/ht/WxKdij7ABL6NpZMgaWfZLdKAAZjw0y7OOrTL1MwrDY2r5xoyZRirl
         +0Uslq+R6GV/kPzwsqCbBJ/cYBDblXUlGrcThWxcbWV3m/DYeJEoL3M8rgV2uKyDzKIt
         U9eVRI/m0k5M1blN2D789VaTb4CJa2lAve/OhDTKwPsFV7nvjLJRO3ATsSCI3JtfU459
         0CIwI1MdjA89RhO5cZ7m13jzpRKQpCKyh9XBDAFr/tUYVyFYm9UgIxeIUZlIXN27IYMe
         oVNVheL+4alHMQUCss/DtEqYqmjMRehE3eurMcgApOTnrKswa+L+rM3Xt+BFWkm1S+1J
         Q53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=poqSmM+AeoTfp1g4HUHnRawOxryRZkBqc2YyEx97xHw=;
        b=EJZeTvoQCFd0a4YwXUDLw5cEuvV18WHH7j13Bmg7AOcnbZpj0kkTysYqGIBsCecX0Q
         7Vs1Sy9tPWFVs73kwOJeufsJlkAjkr7GTin3r7heE7YuA7VGqLHaBgFifdIivvfETV2e
         W6FLVI8zcCj/3sr1fVkzkT1iXISsKboeuBTKG5OGKRo4czsOrcm2UyNcZ/ky76V3cPw5
         smOguBsewDt0FOM4RhhrF5d8PLVK9dP9WthAVS41R5+SoOnyKktst1nJXD45DMJWuce6
         EfBygigR/nRwNsCDPbKq1944ZJWJhcXqHqD8dqZk1qtwUSwVZap3fejiRe1mrXtUFcmB
         3VRQ==
X-Gm-Message-State: ACgBeo2jGl2+Dst2VGp/Xmm6FiIdE7GIqIDHt0amtIaP77n9D+KpMK5l
	7fO+iG71gih1aFHTN6h3gB3/iw==
X-Google-Smtp-Source: AA6agR4VlP2DKSztiz5AJ521nKAFgaDJqM4XDcYtZ5oq2eD4Q95BAi4FjdQifM4U82KUR4L25Rzggw==
X-Received: by 2002:a2e:a887:0:b0:25e:3174:fb67 with SMTP id m7-20020a2ea887000000b0025e3174fb67mr3062275ljq.337.1661592143434;
        Sat, 27 Aug 2022 02:22:23 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id p9-20020a05651212c900b0048aa9d67483sm38762lfg.160.2022.08.27.02.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 02:22:22 -0700 (PDT)
Message-ID: <643651ab-cca2-28f8-beca-44ad7630affe@linaro.org>
Date: Sat, 27 Aug 2022 12:22:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Shravan Chippa <shravan.chippa@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril Jean <Cyril.Jean@microchip.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Vattipalli Praveen <praveen.kumar@microchip.com>,
 Wolfgang Grandegger <wg@aries-embedded.de>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220826142806.3658434-1-conor.dooley@microchip.com>
 <20220826142806.3658434-3-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826142806.3658434-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_022225_382121_F015604F 
X-CRM114-Status: GOOD (  12.66  )
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

On 26/08/2022 17:28, Conor Dooley wrote:
> Add compatibles for both configurations of the Aries Embedded
> M100PFSEVP SOM + EVK platform.
> 
> Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 7cfc96c21ab0..04ebd48caaa7 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -26,9 +26,13 @@ properties:
>            - const: microchip,mpfs
>  
>        - items:
> -          - const: sundance,polarberry
> +          - enum:

Make it an enum already in your first patch, so you won't need to change
same lines.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
