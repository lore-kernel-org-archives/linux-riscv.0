Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BC4C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wh01y+DRPfVn7r1svCTOjXDBhov0BEqOajIzE98RK6E=; b=MFO7qRzxP2FvK0
	sERwRY8c2DKY1CngZgBZIOYRQMr+1Ufn/VZ6+ZMYSAStqlOwWpcPgzVY5tjqSv2sJeOfHm95uy0ui
	ZaTkM8AmYMxuP0KoLRlOUakZETIdOLCuDOZIRvkFdoS0EvySSl97Rv4FPgc6D7lOQ5CIDpMYPhxmg
	6jB6BO7Z/7UX65vrRZPpGt77dQEXcUw5rhD7zsJoFCkn4+Q/5DE8PHxDClh5eCUx+E6OyrTUs3VhJ
	e12ZfR3D7sbR67/QrY3CUc7RYd2bSll+6WZrzV58RldRg2R6VXsYokWNjQWWH1cNDvfchkpQX/NiR
	f4osxQcWP4Ip09+Py89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Up-00EJTa-2h; Fri, 16 Dec 2022 11:03:19 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Uk-00EJND-Dz
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 11:03:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id b3so2965004lfv.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 03:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7nxly20Q+LIVX2HmOxQ1kGTZsAtQ7HVnD/+lRVkLcY=;
        b=vnZVddSwK8YrdASi377ehaE4VrYO3wUPvQFEPjVKRpnAIfCK+XqC0pvzUair0sN2qE
         iY/b1b+0ou2Q/iBUxcy7H1n9fq/SnuTe6xbbpWKmFoTbi6znOa8tgMqfJuLg9x/DpfNV
         5lECBlZOsk1XK6QiefewW9dkhuKDPprIbWvls7h47dV/PkrawfzuAVDCvEggpmAZRcFV
         JfdGdQjnhfR8Od6QqxrGUaoC4ZuzPV555VLxxRF1yCMaajaw42XRxXBoXq5yvU1b6UT2
         YUf7EO5N0xHcuqM5+PV19XaHVLOrpwFZDwD5r206/lzKvEzB5VbS+rDKPrIrTwQEzvFi
         7FkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7nxly20Q+LIVX2HmOxQ1kGTZsAtQ7HVnD/+lRVkLcY=;
        b=79O3LR7/XcJGOmADo+RzthP29CH6sU4bnhjY9Ez3Pb8l/+bA8TZGRi8mbiqxo6KpYf
         +Wy+fM7gqPa+5shSIP9Q6uTwnV61Avytks+pbT30gXw1ruyd2ksulgOSCVDrOy1zJuni
         66dOzoEi7QEnzMnX1Vit0UDXxQmbvVveb9K34iNW9+5NhLCa1J8ojFP2jKHYhy5IH6U0
         zI6qS8uOQ8kB6fLuDVGgk2y28O5uC8ntR9E4VYxB/DbCIjCLFvl1sa++Z8BlbkY3u4Ht
         j4VuRW1oiOUkHL9XruSjBrLvFmDyEUzjSqAWPR7bGiTNaCVAHqj+rdesu27DPoX4bZsm
         GNyw==
X-Gm-Message-State: AFqh2kovIDNWiJVvXpXNYWnH4AxeaIHVbUlerhGN0NrN1pk1URxJzAwN
	/cQlv1RNfGKw/hTHuGf6paw4DT1i6udpCmxU
X-Google-Smtp-Source: AMrXdXtzOYGUjuX1gxXuTmAU3msYzGH4XwL6Xg8wCGYSpE/H9JfkksbAt5csrE1WhWp9OYhyGEMCaw==
X-Received: by 2002:ac2:5a1c:0:b0:4c0:2c1e:1d5b with SMTP id q28-20020ac25a1c000000b004c02c1e1d5bmr439383lfn.63.1671188589735;
        Fri, 16 Dec 2022 03:03:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b00494a603953dsm191605lfr.89.2022.12.16.03.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:03:09 -0800 (PST)
Message-ID: <040b56b1-c65c-34c3-e4a1-5cae4428d1d2@linaro.org>
Date: Fri, 16 Dec 2022 12:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/9] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-3-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216070632.11444-3-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_030314_553898_EC62AF2C 
X-CRM114-Status: GOOD (  12.46  )
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

On 16/12/2022 08:06, Yanhong Wang wrote:
> Some boards(such as StarFive VisionFive v2) require more than one value
> which defined by resets property, so the original definition can not
> meet the requirements. In order to adapt to different requirements,
> adjust the maxitems number from 1 to 3..
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml       | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index e26c3e76ebb7..7870228b4cd3 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -133,12 +133,19 @@ properties:
>          - ptp_ref
>  
>    resets:
> -    maxItems: 1
> -    description:
> -      MAC Reset signal.
> +    minItems: 1
> +    maxItems: 3
> +    additionalItems: true
> +    items:
> +      - description: MAC Reset signal
>  
>    reset-names:
> -    const: stmmaceth
> +    minItems: 1
> +    maxItems: 3
> +    additionalItems: true
> +    contains:
> +      enum:
> +        - stmmaceth

No, this is highly unspecific and you know affect all the schemas using
snps,dwmac.yaml. Both lists must be specific - for your device and for
others.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
