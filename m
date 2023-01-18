Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0923C38147
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 15:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdAthCseffliiPKieyiGQT9gPv+YQoWxIYP6q84/Woc=; b=c6FzhO7TeoqFCb
	pEvTJ2DUS16GvfngqdaV8wFOi4AO65snGVE13KA6m3NPDhcBn74LzckftxWgvwrEIhRp1J3Ee1km5
	9v9huyWBE5NfpnNmXJsx+zTjBJDFCM59YXUikfMh7uJClF/xtGp3iA+smuSFFPEop6IL5zudGa/tg
	nxJry/yGtvf6ocD+A74zASi1ZNrPC5jVf1r14wf5MCqS9aUcoFiD+AAqENNa6Ocx/Kst63e9Sf0l1
	Zi3HTdxyigjLEfdB2f7QjH/Ch3nzM07cq2PTf0UAmY0t0SoFHqtO8WAMy3pDljOOzN0w6zYiKevE7
	j6oRDDkV9KRuEk8M3G5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAjp-001hJq-NT; Wed, 18 Jan 2023 15:52:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAig-001gkK-G2
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 15:51:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m15so3822573wms.4
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 07:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXztzz9eQE5yAeZKGMUMFg/Zj91bDlHuOhYcwUvF18o=;
        b=GdYhmLDVzU5PawleUjy7HzJQlHRp0xzQEUubtVRgF2UOPS3DWbci8yK2YWVJHZNZXm
         ss2vqx1iLlF7UivFNF/DEiz/B0eBf7jqxPlcF7RF6APAFktd4XDKr/ppuhS/OUz0YI8v
         B9xJyVUyJrQlU/J1P2rESSuXHZOqmafSwSqWmOjF9XuYO8z5Oh1zHWNXrGmtRrwBFPRr
         JZ4Ya68B5bnCZG/DyxF2QZInee68Ju5Ft0SAj285r8eJv46ovDyWDku52pZMkJOq7Wlw
         rnG6GnLO0Qzmxpp2pf2WVS7cryB7T97mfWIIw4L+H7PKTVzYOctj1ZrvBIHTJ5Qa79Ia
         Fo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cXztzz9eQE5yAeZKGMUMFg/Zj91bDlHuOhYcwUvF18o=;
        b=iLrkPE5W0B/bXQyX3msb7DfiBkhfvXmLVCu4tvYgS5hqYlmaBjr8P6PfEBPc97RS5n
         6c3R2G2YInuxMPzB6nbwav6aYutAV+PdlANemouTMi6ioX6QErH4BuUk2f8v0+uD4Moh
         PGdqaRxZCSu6QpRqPDPpegZrC+gTaHqjCQFE4lj3JPKWvd+Zp9Ko/u/Mm4vnW1mGxKsC
         ecpX0xai4NV7Qnn9r6vf2amB2NYV5f0O5uYQZkf0hLHyEYwvevpJbIKAz+moSZcKBDyX
         5peKjd14PkrBnj40XevkeYjGR6sbEVQJsZomnYB0ulXhQZ1dzVN/D3mxTdYqnjSBQPus
         55EA==
X-Gm-Message-State: AFqh2krVhxr3UGiVKbNt/qjYXfBKMU/86Cz5UXJWhTmTYCuweieFvWVG
	u/kaiTMHVpnn7mm7mSb2Y3QO5w==
X-Google-Smtp-Source: AMrXdXsTZcClQl9bxcwiEKjoRnzSJ2yCZmooCIKBSadeADdTTA6+M/TsGtBVZ7NPee6iuUewrbzdtQ==
X-Received: by 2002:a05:600c:5405:b0:3d3:5709:68e8 with SMTP id he5-20020a05600c540500b003d3570968e8mr6990822wmb.36.1674057078592;
        Wed, 18 Jan 2023 07:51:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w1-20020a1cf601000000b003daf681d05dsm2330254wmc.26.2023.01.18.07.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 07:51:18 -0800 (PST)
Message-ID: <55f020de-6058-67d2-ea68-6006186daee3@linaro.org>
Date: Wed, 18 Jan 2023 16:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 6/7] riscv: dts: starfive: jh7110: Add ethernet device
 node
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
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-7-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118061701.30047-7-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_075122_613947_1577925D 
X-CRM114-Status: GOOD (  12.76  )
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

On 18/01/2023 07:17, Yanhong Wang wrote:
> Add JH7110 ethernet device node to support gmac driver for the JH7110
> RISC-V SoC.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index c22e8f1d2640..c6de6e3b1a25 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -433,5 +433,98 @@
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		stmmac_axi_setup: stmmac-axi-config {

Why your bindings example is different?

Were the bindings tested? Ahh, no they were not... Can you send only
tested patches?

Was this tested?

> +			snps,lpi_en;
> +			snps,wr_osr_lmt = <4>;
> +			snps,rd_osr_lmt = <4>;
> +			snps,blen = <256 128 64 32 0 0 0>;
> +		};
> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
