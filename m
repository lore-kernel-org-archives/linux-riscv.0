Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C4CEE4993
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Aug 2023 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d7pnO5xfj/O5dTaOV+vSairhFRG4A+UgPasLO+trHc=; b=jkMjcYx7OX4exC
	3nEEvRzy5772Kg/sBiAy6G7xMaGCJNnHA13FlFmCF/sI3+pQsprCuplhx/Ls5Y0dzVgnF+hGaiSRT
	Kq0NUKuFyKQGkDhmBG2cpoTryll2HMQ8Iluwvr7ypM5bmP0f3IJRqjzaWaTUsH1IrindTPAERhb8Y
	PmHLruxAYhP+MAcfLvKMznbefYLDud5V+nt2DHdYgLuLLjv+JgP7SpwgBrIDYJqztLrJVrNeCwxi6
	m4hwiAUaztaZhcpsbBELPopp/kPxp9+2j4Wp+1dBWSlMan0wFxURI5Nkwcma5jLSFNDMkIkDJbLE2
	OOpGjs9q0A8NOaPzeBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXLfB-00Auth-2u;
	Sat, 19 Aug 2023 13:06:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXLf9-00Aut2-1X
	for linux-riscv@lists.infradead.org;
	Sat, 19 Aug 2023 13:06:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99cce6f7de2so239912766b.3
        for <linux-riscv@lists.infradead.org>; Sat, 19 Aug 2023 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692450400; x=1693055200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rHDDd/fo4FzFy4JxsCF4FnZo7ypY9WWX/ip25zUd2DE=;
        b=TS2k2khJrVzHYVVoqjpw36ahhdErsQv8ZsZr3TdH8KKu1CLB4CsNyMSgpy737ci+Sv
         q+KrpKd/uCNWMwakXLpOz67RuTA1AKVl4DzaHdPEP756WrixnLBydXfaC5MykNz5vBeO
         w32gFm4WPSTn/15QpKpq3iWb65M1BoOm7UWfMxV3PpySJyUewKJ61BcgnMMS35zg+XLb
         mb48D/R7GRYFegb750WN+He+C6cn/FBMw2G6IxsMzI8v6OgyEbdMwo7SHbj+7furDB9m
         Cs64hn14OGl40GqMUgThUp40Qq8We4GFPiZP4g36vLwcwruU0Pq5M7tveBET+yLmZyRC
         Pyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692450400; x=1693055200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHDDd/fo4FzFy4JxsCF4FnZo7ypY9WWX/ip25zUd2DE=;
        b=MkxwaW8NX2c/2azc/nohhw7UGe293ICzrB3IUXKf0w/RgLaWADXMeKKYQte1iBf9e6
         mKWs3ZGdlkDKX3zb3Jdwv6WeoA7SeVnd/o+XHK9hSjKGiUpZEezJg7wlX6BysTy+znZZ
         dGHY9STvqWVwUmmAfJssc2W80fRlGbEl44tkkLGqTOzdbEAfcmakV2F4V5wTGz5w3AI+
         osiktD5lua2MMp84gmbd2weHxUsvM13hBbCS6fVG2hF9XKrFZPB69RP7pYAGZHoWwQmo
         phkfFZt4lfTgqE8GwigXZ0ChrsS+nd12YdqlCLatl6nBnkiI3niVrTyJczVgsuIQs28z
         Xm9g==
X-Gm-Message-State: AOJu0YxecHFTX6k80IZKkjAVGr8Kg+gQ5R2Uy71yUtlCQ9wi14XF3kBG
	AId4zFAjxyNlQWN2r+r9GeF7jw==
X-Google-Smtp-Source: AGHT+IFmIuGKAoOzk4W6WrGdbIVA9nfaf1Vt+Us6IpXHHQEoV0jgC2iViYKTYGpTLxfiNXcnvSBOHQ==
X-Received: by 2002:a17:906:76d8:b0:982:c8d0:683f with SMTP id q24-20020a17090676d800b00982c8d0683fmr1528256ejn.18.1692450400016;
        Sat, 19 Aug 2023 06:06:40 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090606c800b0099d959f9536sm2747401ejb.12.2023.08.19.06.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 06:06:39 -0700 (PDT)
Message-ID: <2de9f105-c785-4933-4a0f-c8bc73c63b87@linaro.org>
Date: Sat, 19 Aug 2023 15:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
Content-Language: en-US
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>,
 Jason Kridner <jkridner@beagleboard.org>
References: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
 <20230724-th1520-emmc-v2-1-132ed2e2171e@baylibre.com>
 <ca0b9a19-d7d7-80e5-f47e-f74615cdac86@linaro.org> <ZN1NBE2+HHfatQ/T@x1>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZN1NBE2+HHfatQ/T@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_060643_523865_81003E1A 
X-CRM114-Status: GOOD (  23.15  )
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

On 17/08/2023 00:26, Drew Fustini wrote:
> On Mon, Aug 07, 2023 at 08:29:21AM +0200, Krzysztof Kozlowski wrote:
>> On 05/08/2023 05:14, Drew Fustini wrote:
>>> Add compatible value for the T-Head TH1520 dwcmshc controller and
>>> thead,io-fixed-1v8 and thead,pull-up properties.
>>>
>>> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
>>> ---
>>>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
>>> index a43eb837f8da..57602c345cab 100644
>>> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
>>> @@ -19,6 +19,7 @@ properties:
>>>        - rockchip,rk3568-dwcmshc
>>>        - rockchip,rk3588-dwcmshc
>>>        - snps,dwcmshc-sdhci
>>> +      - thead,th1520-dwcmshc
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -60,6 +61,14 @@ properties:
>>>      description: Specify the number of delay for tx sampling.
>>>      $ref: /schemas/types.yaml#/definitions/uint8
>>>  
>>> +  thead,io-fixed-1v8:
>>> +    description: SoC PHY pad is fixed 1.8V
>>> +    type: boolean
>>
>> Isn't this duplicating existing properties for MMC modes with 1.8 V?
> 
> Thank you for reviewing. Yes, now that you mention it, I do see those
> properties now in mmc-controller.yaml. It seems like the existing
> mmc-ddr-1_8v property would be appropriate.
> 
>>
>>> +
>>> +  thead,pull-up:
>>> +    description: True if pull-up, false if pull-down
>>
>> This explains me nothing. No clue what you are pulling and why do you
>> need it. Pin pulls should be done via pin controller, not MMC.
> 
> Good point that my description is not helpful. The pull-up property
> determines whether certain phy registers are written to. I need to try
> to can get documentation on the phy so that I can better understand the
> details of the pull-up configuration in the phy registers.
> 
>>
>> Anyway you should have here allOf:if:then (move the allOf: from top to
>> behind "required:") which will disallow these properties for other variants.
> 
> I noticed that nvidia,tegra20-sdhci.yaml has several lines related to
> pull-up/down configuration:
> 
> 218   - if:
> 219       properties:
> 220         compatible:
> 221           contains:
> 222             const: nvidia,tegra210-sdhci
> 223     then:
> 224       properties:
> 225         pinctrl-names:
> 226           oneOf:
> 227             - items:
> 228                 - const: sdmmc-3v3
> 229                   description: pad configuration for 3.3 V
> 230                 - const: sdmmc-1v8
> 231                   description: pad configuration for 1.8 V
> 232                 - const: sdmmc-3v3-drv
> 233                   description: pull-up/down configuration for 3.3 V
> 234                 - const: sdmmc-1v8-drv
> 235                   description: pull-up/down configuration for 1.8 V
> 236             - items:
> 237                 - const: sdmmc-3v3-drv
> 238                   description: pull-up/down configuration for 3.3 V
> 239                 - const: sdmmc-1v8-drv
> 240                   description: pull-up/down configuration for 1.8 V
> 241             - items:
> 242                 - const: sdmmc-1v8-drv
> 243                   description: pull-up/down configuration for 1.8 V
> 
> Do you think creating something like that would be a good approach?

This depends. Does your driver implementation will make use of it? If
yes, then it makes sense.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
