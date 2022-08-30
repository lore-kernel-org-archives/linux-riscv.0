Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B58CECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRXZW3eq6CMMwq3J6LwT3bNZRFaWEY4NbxRROOBx+4M=; b=ZwzPkEEYIX5fVr
	BQGCanMwyDmE7FwyVobE+fo3WVTd9WV7zau9cYlOdfAuiDQ9x7+tv2WXWDu5YEB6WW3eJh1mALWxF
	j7tFXeP+o0jlDqdosVm2M5rVb+62iPCja4/iiHKRGOlhcM/GbkgIIR0FqY5CrgU42fDE8G5yXCgvy
	atxqDfj+i4+1ZP+GdMJUORf4xRVExAUJUPqdlnLZL8xHmNiRU3Wz+WfzERnlf0RqQIgl1l7dCdQc4
	Pzj3aLlfuvSrmZH09ne2yW5iuHu80K5rEyfTVEutla5u1lg7nz0xU6SQFiSd8IFbtziOFSs9z8O8V
	5OMDXx5gDWkQjP5cSd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2N6-0002hB-M5; Tue, 30 Aug 2022 14:37:44 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2N4-0002ft-3m
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 14:37:43 +0000
Received: by mail-lj1-x22f.google.com with SMTP id bn9so11581103ljb.6
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=S7F9EmKhAxxlR+AEkU5K8Cyl9dGbdduAx/ZasRGJQAw=;
        b=kixapq35uVt4DzdUz9BbgA9n3vUIV7izZddPnm1MWYzS3VY72nTrczIB17rUlvUCxV
         XKDOGRYQI7cwYzV4oOXMXzaKgcn0uqtrGMV+gqqkc60BylWldlJ3V1uVO2GP3JXsyoDv
         s/QD1tdIWmdWVVuFdFM2Oef5KZXFvQnh50xnzzebENuNuztfq0bh4+9bmhXGuOVu8mjT
         5GJ7w+YcZwqMesnfiEoxw4ZfaMcgDfmKhLZQbeXVVXMpJidc4A2iyDO8/aboHFVLT+kT
         tEtlEGMV4wP7yUx2z3fHlL2/NUhkJuFYebQJfu26jaTNb6SGAtH30fAGyJH+TLG5vjbA
         ln2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=S7F9EmKhAxxlR+AEkU5K8Cyl9dGbdduAx/ZasRGJQAw=;
        b=lcxfucwQyxJThQ4zSxWJA5UMarxxiFGat7LiQOk1cC02+94mHC4jwYkXtrpoUAxjeT
         CkmiD1egBsOGkhS+AY9LVEChlmrIFUqW4e8wKDlQmSePuh4fhajJa3FC6qsrR4gsqGHi
         ghzDh4gUpf77pcHCYJdBKl+knAiyXwJEt5HULhNWNPKrpP36UmHy3jGbKreNGE9k3pXo
         69yIU2uREBo+7EIHObyAzNyrfnRQKCkPZLzPzQY756NBjZT0gxcmR0TBCFys9KVeN6L9
         Rp5GuJbKRhG5GjDoGD+uGuM4u64MuIKwXvsVM7Oe5vKSYMN55oKrWxZebTrQj46Sb7yQ
         xhcA==
X-Gm-Message-State: ACgBeo2AORwQ4gkpHVVJpqw8pjdkV/t5rFtepHf8JkNGv3GbxCy5iB1k
	CgLpoebCBZpnVlScMSIH4s1GCgApXtId3BsOdDw=
X-Google-Smtp-Source: AA6agR7PccUNihvG+BB4x1t3fmKV5KUECGFzGTU7UR1DHggFInARzwQIRqnDF8wEfYC1iIDZ6xekDQ==
X-Received: by 2002:a2e:bd8b:0:b0:264:8256:c23f with SMTP id o11-20020a2ebd8b000000b002648256c23fmr3305328ljq.508.1661870258088;
        Tue, 30 Aug 2022 07:37:38 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512092d00b00492ed031aacsm1629189lft.173.2022.08.30.07.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 07:37:37 -0700 (PDT)
Message-ID: <a3a8e2ba-a6bd-6e66-fd04-e3a46661a34d@linaro.org>
Date: Tue, 30 Aug 2022 17:37:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Shravan Chippa <shravan.chippa@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril Jean <Cyril.Jean@microchip.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Vattipalli Praveen <praveen.kumar@microchip.com>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Hugh Breslin <hugh.breslin@microchip.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-3-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830101803.1456180-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_073742_188199_DB76CA83 
X-CRM114-Status: GOOD (  13.82  )
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

On 30/08/2022 13:17, Conor Dooley wrote:
> Add compatibles for both configurations of the Aries Embedded
> M100PFSEVP SOM + EVK platform.
> 
> Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 485981fbfb4b..04ebd48caaa7 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -27,9 +27,12 @@ properties:
>  
>        - items:
>            - enum:
> +              - aries,m100pfsevp-emmc
> +              - aries,m100pfsevp-sdcard

Usually sd card is pluggable, so what is the actual difference here? For
example this one:
https://shop.aries-embedded.de/evaluation-kit/m/m100pfsevp/445/m100pfsevp-250baab
has eMMC and SD card...

>                - sundance,polarberry
>            - const: microchip,mpfs
>  
> +

No need for line break.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
