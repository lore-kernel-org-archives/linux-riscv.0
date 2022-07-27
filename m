Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19775C19F29
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Iu63I2vK6w8RUwz4MSC60Ru9itp7HqLnEUbQQLt/3g=; b=3DUcrSklS0Tr/i
	lRaTCOsLHpr701iB6pbiApiCL43UzVM/W9wKZVh5ud6rrDsXAQCorAigo3SbteGRDK74J7GH7S5K5
	1fxGdshQU2LrKzo6+cSWgPySJDIyR36mtbNPqJfUIZZdSA2PK3HvlNO/KR2sXZVHkRGeZsqnt0wmj
	iELbH7+mzNps1+lBxMA/LU91LhvlttqIXFb7JOAELL9sUIM8Dug/Tk0Yb8Etqqdg0RXsPbRQNebUu
	FriRLY3gQCuRiqoxbq0Mh0a3svtv/451vRMdSyGTqh7+D+YO9ixTRIXP5GfyYZLqWyzVFXzjKMcSL
	jGpkayXQ5I3/Zne+ubSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdNv-00Bn7J-LL; Wed, 27 Jul 2022 09:31:19 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdNp-00Bn3h-MW
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 09:31:15 +0000
Received: by mail-lj1-x231.google.com with SMTP id v21so572017ljh.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 02:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zeWAT08FcjNi/6mJVcT/TjlSTfEQOwkc2kFD8pu/zEY=;
        b=W6lS97CvFZiIocM9B3LOv68rpx+ECF5Axm9n0XY6FRw3bmb73fNj8P9hMZPvY2izNx
         f1VMr5Dqe1NxCrGakk3psch6037uTr266bBRjG8OOW4houM5+2ym4tvZf2sJhP45+1zg
         JUU2IxuBIg4EpkuF9Fv7k4Qi/AOflwf6LpjH2ZFODf623QQw/scTtk4OCLjPLrYoF13d
         xsxZvxa2eBw1ImY8Qzg2FXxAwetBGf5iXfJ7XXeaJWja6b8OmB0pHUaMbFCUjKApeTyl
         Qa5vpuHo6kuV83hE1MRg1H/DNQxzH7Q2b5kiWJ0gD/sBv2nZkpw9uDCn7Bsnv1vwGeOS
         cLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zeWAT08FcjNi/6mJVcT/TjlSTfEQOwkc2kFD8pu/zEY=;
        b=3SczD8OCmQFZiwzeherPuEyj1o7rLr1DkAfvsBewcP5Nu7ouXAuaJEY2xRZL/dw2Ko
         MDIW6A7NnIYlP9XXz8gTh8zi4GN/mCAps6g1huQChlCvH7xrMsfni+9IfXDI33FKLU/r
         j1IHOcTGv0y7f2yPLmkik/JM1RgclgRoyg00J+Tkdaq52zVBGrLV428LALFvxsT3Cph9
         78hXgofMJrINV7CTuvaBPeeFRWxSJHyIkz8jLe+yE8XchOzuokG0hdPQn8Rb/vzZ/E6F
         LRFG8Sfqzcgurz9TMTSQ+btdpJyhBm/D/v6z+F81VruSF5aRQtokBwnhobgxRHWwc7vx
         dYmg==
X-Gm-Message-State: AJIora+c1hs+Kwx8S2i9aSzLS2nYu8Pwb1h3ILyNxuhMRYugOD+7D0bg
	QDzJDOVrfVojIheue9C3FIiRCA==
X-Google-Smtp-Source: AGRyM1u6X5tUd/hcEwrUNz+lGonQh+s1ZYaBuzwNJKriY7vsQBvfJPzuGGMp+qgvoiFA+mq4UxlsXw==
X-Received: by 2002:a2e:bc86:0:b0:25e:118a:d90c with SMTP id h6-20020a2ebc86000000b0025e118ad90cmr3138032ljf.405.1658914272022;
        Wed, 27 Jul 2022 02:31:12 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id v10-20020a05651203aa00b0048a843505f9sm2167344lfp.293.2022.07.27.02.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 02:31:11 -0700 (PDT)
Message-ID: <3e3c0c80-48eb-098d-977d-a1801036fc0c@linaro.org>
Date: Wed, 27 Jul 2022 11:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org>
 <CA+V-a8vb+za1Zckk5aTxz0hKkd5fHQk7gtfV+HR_2YMZ5JuJEQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8vb+za1Zckk5aTxz0hKkd5fHQk7gtfV+HR_2YMZ5JuJEQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_023113_807863_EF97DBFC 
X-CRM114-Status: GOOD (  14.25  )
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

On 27/07/2022 11:00, Lad, Prabhakar wrote:
> Hi Krzysztof,
> 
> On Wed, Jul 27, 2022 at 9:53 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 26/07/2022 20:06, Lad Prabhakar wrote:
>>> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
>>> (RISC-V arch).
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
>>> index ff80152f092f..f646df1a23af 100644
>>> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
>>> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
>>>  maintainers:
>>>    - Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> +# We want to ignore this schema if the board is of RISC-V arch
>>> +select:
>>> +  not:
>>> +    properties:
>>> +      compatible:
>>> +        contains:
>>> +          items:
>>> +            - const: renesas,r9a07g043f01
>>
>> Second issue - why not renesas,r9a07g043?
>>
> We have two R9A07G043 SOC'S one is based on ARM64 and other on RISC-V.
> 
> RZ/G2UL ARM64:
> Type-1 Part Number: R9A07G043U11GBG#BC0
> Type-2 Part Number: R9A07G043U12GBG#BC0
> 
> RZ/Five RISCV:
> 13 x 13 mm Package Part Number: R9A07G043F01GBG#BC0
> 
> So to differentiate in ARM schema I am using  renesas,r9a07g043f01.

What is the point to keep then r9a07g043 fallback? The two SoCs are not
compatible at all, so they must not use the same fallback.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
