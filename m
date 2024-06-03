Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664A1C25B76
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIxx8PzFYlo4IlR9muy/HPpyR+X/EgtOzDETAW2fYx0=; b=fO8Hf9WY5BZFvq
	3aqjbEbODSdzr2h0Es/vvccMuXFD684B1IX0JbADHGb91EFEDU4h9KOI9pVarQ1X+JznLZTnSRzBc
	p3yoBvhCVZoVI8ZHWKbhDuFhKtUQfe6Zx/qdnQc2lcAbAIKBFQ4Sy7D/SCE8Ee8rLuathZJoArJpQ
	4Qhl9zt+btb3hR06wvs/q05M2AsSQvQL/0lWED08NAoT6H0jZDuMJFBDW8/1IlsdOggFLMKNdpT1B
	iIWj1fjLlizmnXVoYacb0/s/U0vlJtGhjQQzSDCbeDWf3nrRZ5i4YycDo1TTaiv3aFrYIFnsNhz64
	o7ok/SJpdhV+OxIKbIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9b0-0000000HEAX-279P;
	Mon, 03 Jun 2024 15:27:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9au-0000000HE85-2uux
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 15:27:36 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 418B9412CF
	for <linux-riscv@lists.infradead.org>; Mon,  3 Jun 2024 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1717428445;
	bh=Fr+lwAk3qfyLZR/E+av3Bn4ZLoKvig7SyD53fLchvOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=jrcHkDadeOO4NAAucQUZqKM5VCZ5fi1KAVBtQfgowc0WaNodP+yvtnYWNNR2EmlPv
	 fwEqibOWTZpRDuYRpTIggaawODJuRe1mPglGpC1QOAmjNqs8s1stBELIUQIFi/SgV5
	 esY5z3Rja1/fGCn84PEirfVz6//7OGD/d1h70LlJ+y4gOAMtXY3MJsRPVCE2GmbanI
	 arjsClpeWLfbCtPO2HXI3baM3hddKC1uYQPQj3ePyKyr7GItNzFRO8TJFzmIAldTmh
	 eueHVbWTuTiUswSocMMqlLGpRJzCtJTXJ0wNHLqDB2tRyH/bnhvonWMDT5bSPQ08O0
	 rtWAmUeLJ0ORA==
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52b88c558a5so2818518e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717428443; x=1718033243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr+lwAk3qfyLZR/E+av3Bn4ZLoKvig7SyD53fLchvOA=;
        b=LQ3DQsqT+nQr6baG2bygQEkoL6ZVrT0J5ObFOo7/+9ExAvQzg4ACgZSoc4+aQclsye
         kH8KKOwjJ89dxvvpqYyogTMSLfqGXcM5VyiATrpHYR4mh5FtCAOsYlVUsIEZaGQDJ/7a
         c0yJRmB6LfQD+ewGbe7UvKNUVO3atY4UaTgzVvCgATSEnMlNCuam08/fm/pvS8gfcU7O
         BKPwFsxg6pb7bsxOoVOPTeu3x+T3zTBvnbVr9t68JWdoqsHzqYiu4ymO3XueMuxjhXD0
         L8bjLCuISbriKxyVViQyRUlJl/zFpLLFu0/tTHYvX1Lia8rKTH0L9LxZky1LEbs/N1OO
         w5FA==
X-Forwarded-Encrypted: i=1; AJvYcCWPbvv+ddl/hpble1HwqdDMyNf3qrrTXMD9P/+dPBpBiEsJIq5sDBtIhVeRESAiRRa5ZRjTG76IaTlujomZzHy+SE3PWiCr+G9DG2GjBcsF
X-Gm-Message-State: AOJu0YwW2QbcQNvh52KuA6ONMuMoQ1ldoh/xvwE3PnbKxnYOFH7h9hM9
	qJUoVxm8omFdtW3/3snoputtmRUxCOo9Z69dhKFrS+qbftifJU7Z2I//j+zUjjAfHAj/x2CuCm0
	KwejqHJJuRPkZafMKX5S88er1W8hZAipjObJHz/vsLONTkoYQPh6cuR2CDOCjoGi+rO4qB5l8T2
	mLbvDmZg==
X-Received: by 2002:ac2:58d8:0:b0:525:32aa:443e with SMTP id 2adb3069b0e04-52b8954e931mr7769744e87.17.1717428442713;
        Mon, 03 Jun 2024 08:27:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4tA4IuchCsdrErWQrGd4V6yhmYuIPHnknJtEIeTtg0eU4jolMUpFBqZbhOrx6k/P93dx1fw==
X-Received: by 2002:ac2:58d8:0:b0:525:32aa:443e with SMTP id 2adb3069b0e04-52b8954e931mr7769726e87.17.1717428442197;
        Mon, 03 Jun 2024 08:27:22 -0700 (PDT)
Received: from ?IPV6:2a00:20:d00b:f75d:a576:8b02:7e96:f388? ([2a00:20:d00b:f75d:a576:8b02:7e96:f388])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68a53d38bdsm402013066b.172.2024.06.03.08.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 08:27:21 -0700 (PDT)
Message-ID: <8e50216c-2a3a-4946-ad90-9d66c6aae20c@canonical.com>
Date: Mon, 3 Jun 2024 17:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: Update flash partition layout
To: matthias.bgg@kernel.org
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, duwe@suse.de,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@esmil.dk, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Hal Feng <hal.feng@starfivetech.com>,
 Minda Chen <minda.chen@starfivetech.com>
References: <20240603150759.9643-1-matthias.bgg@kernel.org>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240603150759.9643-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_082733_156998_223A8C1B 
X-CRM114-Status: GOOD (  15.34  )
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

On 03.06.24 17:07, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Up to now, the describe flash partition layout has some gaps.
> Use the whole flash chip by getting rid of the gaps.
> 
> Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

For flashing larger firmware like EDK II it is helpful to maximize the 
partition sizes. Thanks for sending the patch.

Commit 8384087a ("riscv: dts: starfive: Add QSPI controller node for 
StarFive JH7110 SoC") 
https://lore.kernel.org/linux-riscv/20230804020254.291239-4-william.qiu@starfivetech.com/ 
introduced the current layout.

CCing Starfive's U-Boot reviewers.

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> 
> ---
> 
>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8ff6ea64f0489..37b4c294ffcc5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -321,16 +321,13 @@ partitions {
>   			#size-cells = <1>;
>   
>   			spl@0 {
> -				reg = <0x0 0x80000>;
> +				reg = <0x0 0xf0000>;
>   			};
>   			uboot-env@f0000 {
>   				reg = <0xf0000 0x10000>;
>   			};
>   			uboot@100000 {
> -				reg = <0x100000 0x400000>;
> -			};
> -			reserved-data@600000 {
> -				reg = <0x600000 0xa00000>;
> +				reg = <0x100000 0xf00000>;
>   			};
>   		};
>   	};


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
