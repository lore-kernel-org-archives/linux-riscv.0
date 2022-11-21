Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaDfRIVkCjJgopi2K/h/UetP3y+p7jTUkIrfpyrMo1M=; b=TyyOWRujj1EH6s
	u80X2mRr1txxOcqpdcLrFipT7EhksDGjqbyPyX/0ePTxQ7Ojw4TD5Baf1PvTzvaPE4A3KbdhsmihM
	/EdvRQjol+315v7h3dADXU+fTQAoAQ/RSrNlKuNfbcYuulM4fQR47OG2SUk14Z0LhVBKVjEF4WVvP
	rpsi1per4OHnPzWCU2R/AVQeTlarECdAtfMBd8iNCkiv9ZeONouQdfZ3v13fVgjp7MBJc3l4h7ejj
	Q8aT3/ogeIakEruWKMzS6T5j2UX/Z89Op+SYax9tcULq6WbbY/+QQaFZ1c68FEkfN9MW4I+Fn0ApY
	H21CNc4f0vmUXNsrs2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3lx-00C8Jj-1g; Mon, 21 Nov 2022 10:11:29 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3lt-00C8H2-Jo
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:11:26 +0000
Received: by mail-lj1-x229.google.com with SMTP id z24so13962354ljn.4
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vkbm4Bxn5eLnjPj3/tOUOnl04OhPLdTSTUnYDiGnDgo=;
        b=bR/nvBGSZjElA8QI/+tH/765a4y1M2Z+4n0UDqntO79EVlF1v7gSzOkFqB0mmLdDNj
         hOt6Kx6yDqk6TdNyNxegPDA45Yx0nzjaOTEyfn5KrZCMGNutG2of+2wV6Dms1L1GqR8N
         pmkSNKO4mEJkwD+7YrtKCJ5mpfGXgV+ccv4g3F1JKKPsYfFBwyubXPB9b6pFq8f2suft
         VlfBiXfLZpUvsDkWsrN/6JOKGF8TgBap+757VGyxsw8qk/HjB/ML/O8tXBfwYxkKj5CS
         JselQKZ24Kxskv+/m9hOFQjCXcc6/YfJexxtCPLux/6+Cd1+bYWrzG1aIIRgzzmb/fsw
         axJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkbm4Bxn5eLnjPj3/tOUOnl04OhPLdTSTUnYDiGnDgo=;
        b=1ydrmyoonZ+3vX3kG7UrMsxPUdd4Dc9jhmTB/9ns1iKoSE2sgxepSzKRr197HupTSY
         d6HgDMLFwvl16piYEL8jBNW7kJknZyo6Al0+udoog4Dv6ptcPIZAyVz7T7krhTgrrtx+
         W8IhiuvpeEfwtEDpWEF+ZmGruReRlWPOPY78riS94gfbuz0kYEenjxlFJ8OcIvfqXo4u
         n3+cPmkSUyMGZcQxjC6h33V4KjwH4aGs8f9+vP9QXboCs5TL+q7OLAH/3c21S4YJaYHT
         PlU0421qy2rQTDjtBqrz9df6J0v/cwNBqPK6nqTA31QTQmzIx9kLiKTRCVjmDHwKE/5h
         PPtw==
X-Gm-Message-State: ANoB5pmY5wf8R6T8OUs0dvKc0JVCIDZ/7CXsOeTZ1A10MnlD+OTiuDLN
	UjNdeUQTBp8hbQBeTI9XrmcB5A==
X-Google-Smtp-Source: AA0mqf68/n19Rjf7V+oTQiueK1njPoKnq0nXUA6E151V5mffE88KckL4M3G268YOmAXtMqrcnqK5hQ==
X-Received: by 2002:a05:651c:1510:b0:277:75fb:1fc5 with SMTP id e16-20020a05651c151000b0027775fb1fc5mr5398278ljf.405.1669025483901;
        Mon, 21 Nov 2022 02:11:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b0048af397c827sm1974128lfr.218.2022.11.21.02.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:11:23 -0800 (PST)
Message-ID: <9cc705dd-191d-ddf9-9e26-403d5124c77c@linaro.org>
Date: Mon, 21 Nov 2022 11:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 7/7] MAINTAINERS: add myself as Bouffalolab SoC entry
 maintainer
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-8-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221120082114.3030-8-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_021125_700848_BA0AE9A7 
X-CRM114-Status: GOOD (  12.24  )
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

On 20/11/2022 09:21, Jisheng Zhang wrote:
> I want to maintain this Bouffalolab riscv SoC entry from now on.

Use 3rd person narrative, so:
1. Subject: MAINTAINERS: riscv: add entry for Bouffalolab SoC
2. Commit: Add Jisheng Zhang as Bouffalolab SoC maintainer.

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92451834b940..3564b27d7da4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17738,6 +17738,12 @@ F:	arch/riscv/
>  N:	riscv
>  K:	riscv
>  
> +RISC-V BOUFFALOLAB SOC SUPPORT
> +M:	Jisheng Zhang <jszhang@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	arch/riscv/boot/dts/bouffalolab/
> +
>  RISC-V MICROCHIP FPGA SUPPORT
>  M:	Conor Dooley <conor.dooley@microchip.com>
>  M:	Daire McNamara <daire.mcnamara@microchip.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
