Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1A6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuDYm/hILfUbBLCavI/trBBKm+O+vgaP/YM0EsDyS4c=; b=KLuCjx2kzPstG+
	gKVJCHkRDpogDeeUYdqLb2YHVBKYBXm5nORANWxwNem8jaV/IdLR+ihfs81eNIF4jtkMVmYxQWpTq
	dNYrdshuNu6Ii+I/1QKWIiIVmNh7Z22h1HYFrRXHawxf9d4Nqf/Um2d3bpaDW9J4rmvrW5atUInZK
	h61ldJkvaKqPkbzsJM0PcShpB86OIB7evcdZCoFmjM40PqY6uiqA6o9vKNdg/d+XzA/7F1Ide2JEZ
	DSJng97VZU2X0QiUsRNbD9D/3qq/xWyze0rO/n2LFPfd5YELfkk6yfVEkx2PPsLiDsVBMVpV6cK09
	hnS78lIltChDQeQ+nvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncq22-0006mK-97; Fri, 08 Apr 2022 14:56:14 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncq1y-0006lH-MR
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:56:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id b24so10333531edu.10
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5HiRw4Vbmz1rrJh2dozRKVeZfGCAzISbQu8r7Z7QixE=;
 b=TXoWEV0RnLwLPtIPTm4lzG3zoNDm3YiWUjCw7wRjYTfTrFmkWqp+LdrZg0MSY5Avkv
 q7EJYQhW6ssnLt9w9Vbe6vrWBEZiXEjwAdHqUDm7N1hWkOSV7A1MtLjw9SpAvAtg3jiY
 LU74+guOMRM8Rqk6kmvWoyZmDQvWQkB8KXpt52/sPqAFqujQ8o4NyaHvtyGuLOgb5xIE
 s1bO1plHEn5j78tXuUN3xUGKnpcQ0dBkA4rfVq9v8wb/NiC/3s+y1lPR51CZV9VYjk2l
 pk8EF5kkkVIz+rrN9FHxCf4e+N2qNQdL0xIrWJf2z9qZGA+5/6vV0CtGmFuhIxYSvQJi
 P8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5HiRw4Vbmz1rrJh2dozRKVeZfGCAzISbQu8r7Z7QixE=;
 b=a9+9n+0dhIr+n7WYogQt1kw1wVlNgW6hOU6tyYgPYn8MtxpIXGv97++QEoteGx2LIC
 7+1iB2HFnWpRF0jRJy2ccP2FUcKdGTd+YqSSu/VCVj62doBIpwGmN1+yFStqaATNy8F2
 +6Kz6A7SiqrFlP+m+oQQi/I6CP62r2aKYDrlv/DozdWBNNYcn7mJN2JQq3Xh2pTIraxV
 yajnVot9QXbZVPchbzpe9vpOwmKejfnh1vGmK383Tpyd4VkQm12eLJNa8iWj9e9hcPRX
 SxsDQ1kCYfY6Ub9rzIl6GrEepH6kAPd4JGIr9H6lYjsSRw6LdzoUVNp+CebKSkOuTrkL
 i90g==
X-Gm-Message-State: AOAM5334Da50BhkxhyFmXjvnN/soKT5epwKFZfSkwHWY+J7qfMErACmk
 hV7hyc4Wrc/PFTWfuXFf9A9vrA==
X-Google-Smtp-Source: ABdhPJxqNP+oRfi6jK3hfh9fSH7vhe1Rb/5oyPMUQ5ccKNJVzZTw0YRcPQZ6iCNpOHvO5UhXj0BfFw==
X-Received: by 2002:a05:6402:548:b0:41c:bf00:307 with SMTP id
 i8-20020a056402054800b0041cbf000307mr19591699edx.6.1649429769508; 
 Fri, 08 Apr 2022 07:56:09 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm8814562ejk.119.2022.04.08.07.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 07:56:09 -0700 (PDT)
Message-ID: <5edc7895-5e51-bf6e-e37a-26bdc2a5db9a@linaro.org>
Date: Fri, 8 Apr 2022 16:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/7] dt-bindings: rtc: add refclk to mpfs-rtc
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 palmer@rivosinc.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <20220408143646.3693104-4-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408143646.3693104-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_075610_786238_A31DC13B 
X-CRM114-Status: GOOD (  14.16  )
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

On 08/04/2022 16:36, Conor Dooley wrote:
> The rtc on PolarFire SoC does not use the AHB clock as its reference
> frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
> this second clock to the binding as a required property.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml           | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> index a2e984ea3553..1ffd97dbe6b9 100644
> --- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -31,11 +31,18 @@ properties:
>            to that of the RTC's count register.
>  
>    clocks:
> -    maxItems: 1
> +    items:
> +      - description: |
> +          AHB clock
> +      - description: |

Same as your patch #1 - this breaks the ABI.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
