Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5BDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QotRYTk/70eGGrKdtJ4sC3Suk6c2og2s+7vFU/q5Igs=; b=3+MFNhMahxTBu0
	fIPjU2U2iQLFZsu0JKkrx1TCExevjI0zP/hfYofzVp2SJFEaF3ItW5Y9lbg8SMu3ssr7deTMFzvQh
	9WV2ul+AW3clMhtZV3+U0jonI6gJyEYNenh4sxd6g0wxqwvUzV4LfBc2l8mhaVYEN+i8DVRm5Pohz
	SZfOJR5GgJaqwthWy1KHivvsh1jYoez4+6NhT8bl6r2sq7sq00OgbCJ+fNs890tDeHvAQiEOZDF61
	AcJ+MC6r9W0Ix6HfvD/D5KmPpxIYCoHrHYeC965Kgccq5kuEX/IFCPlvJaCPJyqRR7fEkWoM6rGwQ
	nxUmXdV/Ls+uKB+PZinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7viB-00D0aq-9Y; Wed, 21 Dec 2022 09:48:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7vhq-00D0IY-Nw
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 09:48:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id f34so7463564lfv.10
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 01:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okq6sy0T7fU71tA3WrKAH0MDghE0qvD1udHSmisw4vU=;
        b=rSFedQ6ephSqoSOM1xNTjzp4TxR/NrCK8xF040bSJAnk8UZxh6y12xYDiKsgIO0d+I
         333TAG1ukoMrXJolIfe7YWtp6xonwwsmDdvorEsTUXNX6LBAqwQ2x4r97uTOJEbEEplN
         p/XOAaeKuItfaHA9VRPsRt0YRx/yUG/m78JcBOgJ9bpYIS2sLE95bh+q+nlRllXjPHTs
         ym8Hee5bRIISzpSysLbBiYMOMxAMjj1ZG/3YmnJcojHbV8GlY7TNKFqJPx8I0q6y73im
         ORuDVOVTVAJ4FN/HzIn4LkJkL45qBa0Oghji2Ja73jaUnV1cpEM55gUxn9/L/BjSc5lU
         oYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okq6sy0T7fU71tA3WrKAH0MDghE0qvD1udHSmisw4vU=;
        b=I5A/P1ilRioNc9KUMG3gMbasddHniI57VF2RfOhZPX8GET9ZX9nvXlBz27JbxZYFFW
         k4DJRJVrloB15ioUnCys1PGWQWOWzKbBYTLOxl2FfCcBb/+LJg4TinweUY27fJoGDNVK
         +5kqDVOfq65b4uSXnmhP6723afTsfN21S26A/hnomjuWlVh6r8BUxs2juRJVEmDlwtEg
         AuORl8Pu7z58NOS9fjNZMt5pipdXOisvvnxeyJjo2/Zp0f/qO849qY7Ynnmzci/A02sI
         Rgf5BzqgeykANXdI5cRl3Wfm9rtaMTFIPz3AlTDVKxLCY8YSNijm1QVBE38e5zSs+/Dj
         EMWg==
X-Gm-Message-State: AFqh2kqZh9vSgm9AaGvWkcvMffYEQXE8VTuje+iQJRmIc5Nn3fP2dsq+
	h2+gzyODzjPpBptEDE/3i6mohQ==
X-Google-Smtp-Source: AMrXdXsc8QdIyYsJU8wWEIAz1v8DKIhBnjIQ1raMREsIM1Hxn1edvHmFheZfIYI+kgkglBCsKcsOvQ==
X-Received: by 2002:a05:6512:4005:b0:4b5:9183:5ad0 with SMTP id br5-20020a056512400500b004b591835ad0mr1845395lfb.63.1671616088853;
        Wed, 21 Dec 2022 01:48:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f07000000b004b49025f96dsm1782191lfq.187.2022.12.21.01.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 01:48:08 -0800 (PST)
Message-ID: <cbbf719b-a027-f91b-bd2c-6e6b43447b97@linaro.org>
Date: Wed, 21 Dec 2022 10:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] riscv: dts: starfive: Add TRNG node for VisionFive 2
Content-Language: en-US
To: Jia Jie Ho <jiajie.ho@starfivetech.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
 <20221221090819.1259443-4-jiajie.ho@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221090819.1259443-4-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_014811_009661_1622DE19 
X-CRM114-Status: GOOD (  12.19  )
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

On 21/12/2022 10:08, Jia Jie Ho wrote:
> Adding StarFive TRNG controller node to VisionFive 2 SoC.
> 
> Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4ac159d79d66..dd3ad19772a5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -455,5 +455,16 @@ uart5: serial@12020000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		rng: rng@1600c000 {
> +			compatible = "starfive,jh7110-trng";
> +			reg = <0x0 0x1600C000 0x0 0x4000>;
> +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> +			clock-names = "hclk", "ahb";
> +			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> +			interrupts = <30>;
> +			status = "okay";

Drop. It's by default.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
