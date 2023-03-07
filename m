Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE048C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 21:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/ktstL95iNiLbjnJK1PKiql4SET23P8eXxxuCQAUxgA=; b=2ZK2R48ThIzaXKLvoU7796QtFS
	/NnqW6b7iEGeXARUVpyHef7T2FuKDhAhgjjIvyH+VKflS5xHR4IU5AhcaE6tLJy3VUKxCq8CjGcTN
	n/UQdHIqVrdo6utyAaz7Y8awzP4TkZXnBdbB24CtuEGlH5R2tfPZ3XaYNKkRuLnqUIW6GXHtDhDPB
	+RGbmWu9izagi59M6jq7ibTwfxy84xUmaYkavtpslKDjiSkY1kbnmPSI1jveOinClRm83a8xxtkki
	acFEC7lE56Qa+MNB+HVCOtehBW7b+9rHjEfGJdFxDPigVRbJfKZaGodWc6xrcP9y8w3T6LjKAcNWC
	DTGLkTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfAX-002XTF-AH; Tue, 07 Mar 2023 21:48:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfAU-002XSc-B1
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 21:48:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id p6so15713805plf.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678225701;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOfYQC5Wms7nFLMbnCTJxEUtyV2SFvfbKCb8Kcs7zcA=;
        b=D9b9TY1UnnYGSB7zyK3QEHUXYMFmPnmCZ6NUoUZpQPwqUxRpJkwyi9CgxZCm34fGRd
         gOAEakDjL4IkU+ar3tjfsxBvWovUGxm5Ijr8HhtJG2bioYGxTyOPQMKhdXLvPWH9RCTF
         bZvqjp4FRiuaBYeaxK0JpS/o2vGhgYDcD9pY6ulyBfusRXNupF+K2AxpeCTR7OsUz+Jb
         0TzA6sFwIKcElDFmfY1SuhiKk+CZl4hU1uAEVSzXhY8MsApXJa454UMAlox8HY6DwYtm
         wA66apI6BqwHvXc24WwGgRkAnS7lJDXSGUiLZjrHwDe+K36XHmsO2JzNJNvF2JjRivdK
         9pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678225701;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOfYQC5Wms7nFLMbnCTJxEUtyV2SFvfbKCb8Kcs7zcA=;
        b=4ifPbIMhQqQIwwFXnW6rkvWwwqEEnpJABNqwn6UG8r873aq4FddIDI4P8HmYn4K00S
         I0nwWRTGXlVseveESx2PBA4gk2Av7610mLjr4Je3mWSKQhx/ayBetcrFHVIp7wnBYNHn
         KRYzLATTn7F5EaueU3fjkbUq8qNHVFnecV2kdFia0NQRZpkTiJUqyD3LChvktpgXs+N2
         6N4jEQPQsptOj3qJrBV1maaua9+9ZaebpQq/eroakwU1y3XenDO6jK+wqL/MVjamxiZW
         axhtQ3Z1+drEWbUXyDLXc3E4LGrtl1z6Oxbw43Q60zJI/19/khbaD9ZX+C8kA/GwYIqW
         4ScQ==
X-Gm-Message-State: AO0yUKVt9qacP1lD9FvlCwC7HnDWCYaCMHQWmN9xrRTtGfHJVTKLccKs
	33dQl0m3edKWbvUJCqAGQKBjtw==
X-Google-Smtp-Source: AK7set+GSVUL8t2kstOPArFwcKWIRajlkBT610ShNArrVGOJGOk5DsdDySSxduqsq1T9rnAQXWYMtw==
X-Received: by 2002:a17:90b:4f84:b0:233:ca48:540b with SMTP id qe4-20020a17090b4f8400b00233ca48540bmr16902419pjb.3.1678225700429;
        Tue, 07 Mar 2023 13:48:20 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z6-20020a17090abd8600b00233b18e6fb3sm7731237pjr.1.2023.03.07.13.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 13:48:20 -0800 (PST)
Date: Tue, 07 Mar 2023 13:48:20 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 13:47:30 PST (-0800)
Subject: Re: [PATCH v2 3/4] riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
In-Reply-To: <20230130154242.112613-4-jiajie.ho@starfivetech.com>
CC: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, kernel@esmil.dk, Conor Dooley <conor.dooley@microchip.com>,
  linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jiajie.ho@starfivetech.com
Message-ID: <mhng-c02e5405-6c88-4709-b4b0-80baae83584a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_134822_394974_24122E10 
X-CRM114-Status: GOOD (  16.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 30 Jan 2023 07:42:41 PST (-0800), jiajie.ho@starfivetech.com wrote:
> Add StarFive cryptographic module and dedicated DMA controller node to
> VisionFive 2 SoCs.
>
> Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4ac159d79d66..bb134a8a89c9 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -455,5 +455,32 @@ uart5: serial@12020000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		sdma: dma@16008000 {
> +			compatible = "arm,pl080", "arm,primecell";
> +			arm,primecell-periphid = <0x00041080>;
> +			reg = <0x0 0x16008000 0x0 0x4000>;
> +			interrupts = <29>;
> +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> +			clock-names = "hclk", "apb_pclk";
> +			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> +			lli-bus-interface-ahb1;
> +			mem-bus-interface-ahb1;
> +			memcpy-burst-size = <256>;
> +			memcpy-bus-width = <32>;
> +			#dma-cells = <2>;
> +		};
> +
> +		crypto: crypto@16000000 {
> +			compatible = "starfive,jh7110-crypto";
> +			reg = <0x0 0x16000000 0x0 0x4000>;
> +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> +			clock-names = "hclk", "ahb";
> +			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> +			dmas = <&sdma 1 2>, <&sdma 0 2>;
> +			dma-names = "tx", "rx";
> +		};
>  	};
>  };

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
