Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974E1C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdRRXWa7XD17VOuE6p3DWXuoBfleCf8isB5HeN5Zxew=; b=Bp+RjUnU2iO4g6
	25SnkqlVVNnl8FBH2EHcfCONwvOAZG9LZFtTLWt6zLIss6kd/JbNmdlBKBPBiS9etDU50FDXL5WYV
	a907uR6OoUbUFoybFx3vz2MGHsHJZLHBhh6mWJ6xYwnOOQqR7rCkE03Y7v/8NnbALSJEh5kdEOV10
	oMIsyiwWgsRne2g2RIKVpfsahC/KjRoD5hx7chR5X7ep7qhY59URxNzcbKcifB8bnM7AoFmdhQQyz
	ZXKenz+uoaqk9VLG6bgVgfOgxzRDAZhHWsruvtSNK3lAAsEOhQ5qj0RQXUPoSCFWb3OyW723sPhAm
	lOaik4e6fywiFN9CxAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVCy-00DtWT-Hs; Mon, 13 Feb 2023 09:33:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV6B-00DqL8-30
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:26:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id h16so11375380wrz.12
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSLZ3ZKzsvIefT199tYWo7cJEGZZJgm6+X6WVzrQDEk=;
        b=SLdab1UEWactdNcB1w+n5yvxgRExwZc1qv84xdAEmwynljSRSQ3Ci8uC20Xp/xeoD2
         VcW8RjLygpG/Vic1xrzk4LDrIIMHbU5ZCL2mTNqqQxqHyySDCkzOMi6skSPVhjxbFAJ6
         3DPVNXzwHenU7oA4LlRJtv8bRQvl2NnK49jTekMoOgvOxDyXD4JjwZz3VEia5N2TbEHd
         alyvyJ9GKaXrYxDN1TK7s/oRyizZXJMwt7yhcCe6Cfn+JSZOtuP/y5FcqHjwfutiChlk
         oSzGGpQtdmV40tjToqhFWJKA9xVuUvfPEujfkAglf75PmL72M99ijvPCErk58Kr6zLUz
         Hm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSLZ3ZKzsvIefT199tYWo7cJEGZZJgm6+X6WVzrQDEk=;
        b=gGFnqiXu3ImzQiqBRv017gVWCw3ifzsNRQY+x/aZqlXXlUbhB58OqhVQbYldtlu4yU
         9GubIjHRSNbhwsS64dvZy9xmfk1KNhpRocK4bKAEVsj3MxFrO4pgdUt9ecXeEjLY/hcY
         ZH+abw/6OTu/jD15noPhRLgLDG0ymcyTxH3vKm9FlDbRw0LurhrJ1/MYyaANbN4r1FHF
         5CvDZLQq+g7uBnzVf9txPYgU51NOi4FAg7h5qa6ksGzM9ciYS3pJanbnO+nV/cJ3bmqL
         zwMJrT6s4DHR7E6xO+DZkvfOnFud9Wtjhawm0hHswHmGLTtGH3Z4dMpMTFh0wGhDh72t
         iGvA==
X-Gm-Message-State: AO0yUKXZpUjQL72spDjG16ZyBIxq1unTFnxQnv95eIBqXqIReXbR/nQk
	ztv+rRmu828NIDbgMBFGfsHLig==
X-Google-Smtp-Source: AK7set/7w+SNxBNKti9FoZehdW/4irYGNDTCvC0R2xc487VgVY69FMUVdWPnhCVD0GvgBt0CK5LIuA==
X-Received: by 2002:a5d:6707:0:b0:2c3:d4b0:6d8 with SMTP id o7-20020a5d6707000000b002c3d4b006d8mr21318493wru.23.1676280369540;
        Mon, 13 Feb 2023 01:26:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r2-20020adff702000000b002bddac15b3dsm9806893wrp.33.2023.02.13.01.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:26:09 -0800 (PST)
Message-ID: <dbf26e3f-6a4f-cd15-c7d3-b0c1c482b83b@linaro.org>
Date: Mon, 13 Feb 2023 10:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/12] net: stmmac: Add glue layer for StarFive JH7100 SoC
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_012611_463792_6EC83E12 
X-CRM114-Status: GOOD (  15.54  )
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

On 11/02/2023 04:18, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This adds a glue layer for the Synopsys DesignWare MAC IP core on the
> StarFive JH7100 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> [drop references to JH7110, update JH7100 compatible string]
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d48468b81b94..defedaff6041 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19820,6 +19820,7 @@ STARFIVE DWMAC GLUE LAYER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>  
>  STARFIVE JH7100 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index f77511fe4e87..2c81aa594291 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
>  	  for the stmmac device driver. This driver is used for
>  	  arria5 and cyclone5 FPGA SoCs.
>  
> +config DWMAC_STARFIVE
> +	tristate "StarFive DWMAC support"

Bring only one driver.

https://lore.kernel.org/all/20230118061701.30047-6-yanhong.wang@starfivetech.com/

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
