Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC126C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uamg8HkptlTSdoGeiOsGK2v5e1uHZ/yqx/fHlfJQDMY=; b=OHOmNQn3sj/Obf
	2F8l/a/ho5EkqMEZxI1p88/sPjxf9p5WOeK+g623NglPRpitOOka3o9S/sbmz55RHQ6YCr/9PiMpN
	N4cP9KAQQQ3OHOYYaPSk7/lv0jp23vhdsfR8FZ4e5iro69EJEAfGj9hpJH9RBOqBaFugkwJdASaoD
	wnrIDjbiISG9uqY+0IyPtiLPu7P/yvJ23nzSfAJbvFActZ1A9ihsOfDxAT3CXxi4HuFpma04+CnTz
	SrRTJRdwVVTTHn5QO2JNIMgjyj5zcIX6Sl+ViPaBwgyGrUh63KZDmEmahJmaJRaYRTaGVuBb9kOJH
	LHESP/DvuCyFZVkfRiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6v80-00000004qL3-0uO6;
	Mon, 21 Apr 2025 17:40:20 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6v7x-00000004qK8-2Q9v
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 17:40:18 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-477296dce8dso40266011cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745257216; x=1745862016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKl9K7y0OZr7wC01nlMRwEWzh4W8ODSSw6dPpbMz4Bw=;
        b=mAvFMEumgLJ/EPaNWv4qVUZpb7YVfBQJb4Zx4lRugPaWEDz8N116iSWzGRbBIt1ybj
         ZyU8azyhIl6nZigT9AIGET7aitmhOok0hdLqomKB1DoiB99JLvnc3DTG4IarXtpktjFc
         XxjndwmSQVdvd7hPSJuZ9RHaXSYI2Tw21LS8QgPF7y3dhki5Ld9aGmAMEKtOVI9dl9H7
         l0hcOG3jfy5K7PR3SzOWxGmN8BhEPpnCL5KmvTqURBl2UmWc0ZlbpGe18Iik5NrcIPBT
         R7wDz5OFEfBEYCplWSVAEqTPkFCcMZmnWxxQltvvpZIzm0AQtRQ8tNj3n+AaXe9wGJUN
         ILJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745257216; x=1745862016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKl9K7y0OZr7wC01nlMRwEWzh4W8ODSSw6dPpbMz4Bw=;
        b=HEpocGVrAZS8M5/6Ge1JT6OrO9T7ng01VappJd5jdtjWYmvZI40m2ti/NQZHx6zodk
         U02F0SXeTGCUoQg4oMnTkYmMytbiEuUzj/lG29GbkDJX2e3W01RvjcjkVCk4zIAEv+Yt
         teNnYLchm16WkQCZZ/Hk/HC9jsxysLnFL42uotiGk97H4+93DgJ8phjtiVoSDOG0604f
         62m6dIkGSMmbksRVt2qFPe4Nigv1+NhIoYZW6rvIn/hFnVL14xQ4E4rODKHyogpUfPSK
         QOcVaErSKKYDBLoKTHuHgmG+Oqg4quvRmu1J8tSUehD5OCDyj5l0LxGEBGKwEBJHknuv
         je9w==
X-Forwarded-Encrypted: i=1; AJvYcCVHohoQYra85jHsPT7DCptBcmae7mlSXaamBXKK6SEhJNn7oDs/WyHkMBuooSwvH/0k+XUksB/Efsqi+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbPst41CnTitc+DIuWTTCsviA1GDcMIjY82XngcUIFYpOyPz5X
	pXTqpvL6IKkxdeEeozUYULwzFmEZ/5Iqbz6n3/tLhe4h92ddxIOt2uuUg8IYTUo=
X-Gm-Gg: ASbGnctfTuxeyE5cXBxZ9VbnMNbfEVBOdoFQdH+CtAtHdBqjknKobR67Tt9Y/Lzisu6
	+OSkWTnwFNF3i5YUULRmiowxBu0CgK9Q1utVANvnBQcqt2qHncaziEA34DHcFK0hZ8n3Jb8v0B6
	uwKeS2z9FBhop1Hd8DhFkJwx97asZj1si9nyASe7bLsBLMAlUM6owvkpCSzpU9ycyLXkb1rn3W7
	uuOdxjBdAgssbV6m8cddL2pFRM1Q16QAMSz2fw8tjPhdCu8lxhdRrJx0VZTQsp3j46qySLcbRhS
	9WLJtBUKZjWNASPJ0Sjd33JaaMb600QH4dFQCQud0UFVmTQs/vdce08F12+gQTDVMr3NVKz4ExO
	phyuo
X-Google-Smtp-Source: AGHT+IFKSFfC6wpoUNvWav/Eqan/OSxBfbY3a7qMaAdUxlTtjGB0fwBAnW5re7pY3Pjp5k2BOvypNA==
X-Received: by 2002:a05:6214:500c:b0:6e8:9b52:7a1d with SMTP id 6a1803df08f44-6f2c450edd4mr263991346d6.8.1745257216244;
        Mon, 21 Apr 2025 10:40:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af120esm46284596d6.1.2025.04.21.10.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 10:40:15 -0700 (PDT)
Message-ID: <81788fbe-1344-49c4-9619-ea95956ddf15@riscstar.com>
Date: Mon, 21 Apr 2025 12:40:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Haylen Chu <heylenay@4d2.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_104017_749866_44D770FE 
X-CRM114-Status: GOOD (  10.60  )
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

On 4/18/25 10:32 PM, Yixun Lan wrote:
> Pinctrl of K1 SoC need two clocks, so explicitly acquire them.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..153fd1160182b42fe1a2f7f042c9c1da90f63b0c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -450,6 +450,9 @@ uart9: serial@d4017800 {
>   		pinctrl: pinctrl@d401e000 {
>   			compatible = "spacemit,k1-pinctrl";
>   			reg = <0x0 0xd401e000 0x0 0x400>;
> +			clocks = <&syscon_apbc CLK_AIB>,
> +				 <&syscon_apbc CLK_AIB_BUS>;
> +			clock-names = "func", "bus";
>   		};
>   
>   		syscon_mpmu: system-controller@d4050000 {
> 

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
