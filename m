Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE142C3DA61
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxxvVAbAs/6BHGkRjdLQzBNMu5+NhdmjhFtOMiO6S00=; b=fL5e4HuDSFCHjx
	VacWHCQfTRyFjkc2jW0v93rI2d4RZsyqbxaJkHhffm7WsgnYqiTlHhHG4yXvY280+vhaBTrOQZ1+H
	YzpA4d64l9G3BgYKZV1CagFW0E8xKZQMlMFpdGbQ0q4ChqoykQ4FaSboBmC+uwBzpnWHAr+mQz1+j
	oDkLsOho+GZBSK2KzOfhq3n3ECDHxatDAGcDSoX2T7kfc478Jd/OmaISX9UE4uJyKHfeADuCxN+nS
	xRNSZQCXA/Ia/slgPw5BVfp7CdvQg9RzjK04H87XI/aKaoe+SfHYSGVhz6lCzK+TyXJ0ZrZXDZXsu
	AM2w+aoNz3qDwOXz44Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUcH5-00000001Cdc-2OtL;
	Fri, 19 Jul 2024 01:19:07 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUcH2-00000001Cd3-3sWm
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 01:19:06 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7f99d50c1a6so59200339f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 18:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721351944; x=1721956744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kitCVRPpRWuruusdc0xZBytLiueygrYSLQr8urocHpw=;
        b=V12QnRJIkbWgNW/0KY0t4uiYuMY49H7MiT0WykOFZ2DZQV9yrJhaCJKOc7slE41jyu
         SVUZunYht373MCyOklKCWEvrVP/cazvhQO2WDQ4VKr4U7g8Ar0fFES6nk8bDsY63fH3s
         q+pl9b74I+lYm23yf57JmTzgBad0/IVZFWJ5b5X9+VYL3l6xS+L87ljrenUA/0vk9h6x
         cRcMayXq5RfSRcR/fNP8bPSdHHkYxPNC6XotPnimVGPCUUrUOm1A33wWkmOu4VwsQCtu
         zOe2+jpIbXwVzlzomLGtvvsAlgDNzTmFahjJAMfPr4Uj7KMxCq05uhOVtgSgydtK3/OO
         rsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721351944; x=1721956744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kitCVRPpRWuruusdc0xZBytLiueygrYSLQr8urocHpw=;
        b=syib9/OMbqU7niU3spNazuJ/lZuSp79eP0IqT+MlvqyKSt7x/QKMEvDjDqNWP3fFJ+
         XFN3DMqbyvAqOoWs5LKF1sRkMP039tIWKo6DL3uE5y0CXLeexGYoS2AzdG8RowgNL+/N
         77RaCgijLuy3r1yLouamUjACa4sme376dRziSM3B6ViPIQQ8d3t+5mZ2oBl8IH1a1YFT
         iEl/MEKqHvv9r1X3zlLcsR2g+AI9IOcHEW3LDHwy7vQukvq3trcIm1r+13eLy3H40wq6
         SOZKXdDAia80W2uvw47RacBfDE1LihMZam6aqJV/UEKeZBbSmAljAwvZQeF6FUXbldYr
         RqSA==
X-Forwarded-Encrypted: i=1; AJvYcCW7pm95IHXACfaqmMEIaTO/AIEMIO44O3fq7eelhe4cviv3jKptFFsXB0N/S+3jK7T2Tdztroxzbl9ovm5aeaFEq/YrKnnFEvg7g5BVn9Xa
X-Gm-Message-State: AOJu0Yzsn4Q4oUIIvkyyJw5JS+eQPQYRG3S+p3fZZQfY9gFa3RPRdqNX
	Yf9jf9ytlshFTSL34pqCyIVMdH7CYiWOCM0YYmgHzff4DXgoWtRlOJzq7GCQobI=
X-Google-Smtp-Source: AGHT+IGfm/S/FHPE7LA6XdxIKq5BMcfnNylk0g5mtJMSuhuINcBoNq6L3E2sbbLECTpJVZZr2PHwmA==
X-Received: by 2002:a05:6602:6212:b0:807:1908:b095 with SMTP id ca18e2360f4ac-81712003641mr780048939f.13.1721351943793;
        Thu, 18 Jul 2024 18:19:03 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c234405dd7sm107960173.176.2024.07.18.18.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 18:19:03 -0700 (PDT)
Message-ID: <3a7996d6-1137-44b8-b35d-d9c56bd98277@sifive.com>
Date: Thu, 18 Jul 2024 20:19:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv: dts: add mailbox for Sophgo cv18x SoCs
To: Yuntao Dai <d1581209858@live.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
 inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB2238CE3A016F21B632E61219C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <SYBP282MB2238CE3A016F21B632E61219C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_181905_014783_2852C21F 
X-CRM114-Status: GOOD (  11.13  )
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

On 2024-07-14 11:36 AM, Yuntao Dai wrote:
> Add mailbox node for Sophgo cv18x SoCs
> 
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 891932ae4..1c7035737 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -310,5 +310,14 @@
>  			reg = <0x74000000 0x10000>;
>  			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
>  		};
> +
> +		mailbox: mailbox@1900000 {

Please keep nodes sorted by unit address.

> +			compatible = "sophgo,cv1800-mailbox";
> +			reg = <0x01900000 0x1000>;
> +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "mailbox";
> +			interrupt-parent = <&plic>;
> +			#mbox-cells = <2>;
> +		};
>  	};
>  };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
