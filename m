Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B6FC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HV4yI4ZGkcEJvMBe5APkwnuqAc4t3d8fXXPB0gHkBAc=; b=LQhb8bxrEqHNzT
	SdKFHEjPkpn/QSjzqALl1zJJhWbBVTQGi/RSw78Zd60kegnCWrnfdnyXw4+ufABW6NiNKuR7VUBDw
	CJCtrlz+BZFPXQRPDndgTaLacXOsGxfLLsn+z3b0NWwELiBxkdGIdugMIcsjOkm8j47TcQEPy5z7e
	MZ2mANNafJLlVI9LRDwfm9yOSucv/6+EhnSpBgkjcMA6RVLRfKc+MfJarH/5WfWOiYzeauorSrMJq
	WhjiCIDXEB+2emBHir5xxK7vP9A0OEtvabSs11pE6IRQdUGCdPQyNxQc0Yzd6qxhpMW4X2x5rNdTH
	RyLfPJoCE2GTHzkkiRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbcxx-004ex7-Fw; Mon, 13 Mar 2023 07:51:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbcxp-004etX-T4
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 07:51:31 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o12so44875107edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 13 Mar 2023 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678693882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApcfsHN2wN7CiLQkpY6hRDWMeHf0lIJaK00DDrg5fNU=;
        b=kQPrGnxYvasHxYFYfGSGho1RYetKH4JyMKJ3ud5unTPePmdSRjZrRVQ2DDQprphbqa
         +r/m8bdt6bmvlyJDpEICv8tnMoRqoVjoSPb/VHJY+mR5PHDx5Ktfzcfsg4LRlK4ofQpO
         UlW+5VSH/eaEjDfdof4PmhhiDf5LsxDX3AyoauL/4xCkhXbCaNoBmLO0bsH48989iZdI
         10/GL6vzIfjDJvEgL9zKJnluIlENU3y5J8koECXzLnt00hCMy2OgIxN7WhgXAgqhfPg7
         gsivioYUOX8yzoZkH3CxeTHLIp4SkWd0F2piLS9zeaUFVH0oKf4PWk3e0Xz445cQOeNU
         I4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678693882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApcfsHN2wN7CiLQkpY6hRDWMeHf0lIJaK00DDrg5fNU=;
        b=kHkSjpOPc6yOcIc2MYX0hX/0r5zxlGxjeawSO2xXDPdElS89LMI991fG5DcMa9XESw
         OuzxCRWV2JyS/JsYX0x1+F+uNRvxzVHWsEZcDpYK4xgvB10dEvwoyCKu424GJzWSPhmQ
         iSC6qUBDiXES+SlgRpOCP4mKJ5bvDfH47zxtp4eVtM62wXzWU5Q55DtK3r5a2N5vHyPx
         a4Lqbdag4WXZxdeD+2n9wFmh2GAJ696bWsOF+xeVPDpYriRIzL/UqMiuUrpgAz5pkg80
         3a6ZFcwfSZUi30rYYFIujnZl6/czpRA6j++8lycq0M6VxIVNRikwDuF9yiPpR2/7w3o7
         Bofg==
X-Gm-Message-State: AO0yUKXjKCBCOEOJibvxZeymAB5fKlaTYj1n2/PCr2PWHWzpHJJirDOt
	kwflpePNlfpVl6hnwNo9FWzYz6QJTnYxNcXQKCs=
X-Google-Smtp-Source: AK7set/Wdx3mz3K2b03zcdbLEh+zTAXkriPquRH3CNjv2VE6Bjjx7PkESjwthAp40ot+7EmKIeFxmg==
X-Received: by 2002:aa7:c54b:0:b0:4ac:b760:f07a with SMTP id s11-20020aa7c54b000000b004acb760f07amr33049256edr.19.1678693881955;
        Mon, 13 Mar 2023 00:51:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f052:f15:3f90:fcb3? ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2652296edj.79.2023.03.13.00.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 00:51:21 -0700 (PDT)
Message-ID: <834fb899-7a03-ba0a-8302-f64ea58c60dd@linaro.org>
Date: Mon, 13 Mar 2023 08:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ben Dooks <ben.dooks@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
 <167854282659.42837.5915012938593380363.robh@kernel.org>
 <80549148-1bad-9190-c4ea-a9555d15ca38@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <80549148-1bad-9190-c4ea-a9555d15ca38@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_005126_418789_010B34BB 
X-CRM114-Status: GOOD (  16.14  )
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

On 13/03/2023 03:47, Hal Feng wrote:
> On Sat, 11 Mar 2023 08:17:00 -0600, Rob Herring wrote:
>> On Sat, 11 Mar 2023 17:07:23 +0800, Hal Feng wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>
>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>>>  MAINTAINERS                                   |   8 +-
>>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>>>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>>>  4 files changed, 454 insertions(+), 3 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>>>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>>>
>>
>>
>> Please add Acked-by/Reviewed-by tags when posting new versions. However,
>> there's no need to repost patches *only* to add the tags. The upstream
>> maintainer will do that for acks received on the version they apply.
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
>> Missing tags:
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> This patch has been changed a lot and I am not sure whether it's still
> the one you want. So I removed the Reviewed-by tag.

Then mention it in changelog, just like Rob asked:
"If a tag was not added on purpose, please state why and what changed."
I don't see any explanation in the changelog about it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
