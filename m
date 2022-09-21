Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64CCC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GReNa5GhH64khnRUGMQJkXMB0AxWjknkIptC0zykk4=; b=EVfbqIf+0GvB3O
	Dx7JYP+8QqjgpcblfL+KitQ4VwtPsbQmxSsiHYwqbwFhFJu25yCgak9TQqzwSbJK5zmBVQLiG+puR
	fba9sFt9Pj5aANTcI4dacWno4OzuGDiDkk7Oz0ektvKaVjEjJ5GTMVf1mBzcjzaFafWMEssX41N2L
	aCqpFnJrBFJiUc+sFAolK8TT7OSdassYUm+vMz3f53PVdzMLvO8svLiq3YMNtzSeOz8Uwh0igQhVa
	7ht4P3hAfs+a1azAQGhnNcbDYowm5qyrLcovssi7+frPFp3KwwfQG12iyVl/0BI+5wORzcQrJIYqV
	L2/llT7fL2hWhWMXa2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawgb-00AkP1-3V; Wed, 21 Sep 2022 10:10:33 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawgI-00AkHu-Hi
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 10:10:15 +0000
Received: by mail-lf1-x130.google.com with SMTP id a2so8363273lfb.6
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yxhsCHqbjeaUvDSrWwmS/tUjVYbJlbwwcVnNivmxf/A=;
        b=Mx7+v7mLDXYL9fZJN81ZLtHPaaRSjT+E201/j9MMBacZSRokSKMoitW9Kj6QZeFCfc
         5KgqLjmvBVDHm1PQr2blWlEPWQY8I2wreEH0ThGty+Nm1LpGMQbSVt0jjd0+8V+fxWbc
         aZHdCVM+JrKPXIITHE2oz24+bHztTA+QVFxyZcAIgUNZYqopCE77QX1aPYlqWv3hiYpv
         s6hx4P8rHUxBqsam0PFddMEK0cEizIyZuv2ztE/pD8vHs7UDYAWJ714lt8GIgLdXoSpy
         lhxbCCMCjWQAe+yapph8KF6kewtaIxLyW4qJ63h3LZp1MUOmFT3n1RquYE03323Qkbsc
         THQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yxhsCHqbjeaUvDSrWwmS/tUjVYbJlbwwcVnNivmxf/A=;
        b=4AQokRqyyzswMcPIzszoKx86SLVNkwMqKle8FkS1iAMhaYnGMFw2LjLj9PcXE6hYVB
         VBxNCF7tI2sHjEqEb1r2h4OjsztRxp/MaFg2Nehep4aw/hDRjvth2UmXF0FCMVhXNKTl
         EC/fotGQWsjkiTVXS6Pg3uzjXMigs/riFEuwMWbVr3wD4xUKDmddtaKLY/Ik59qVzOpK
         tE5YOOIkw4C4jPbBYqBtH5fQQAUSM98xG66BnfTvsOLaalB7VZbY6E6UaAiAf+0Rrof1
         QoOc1XmfgGvTCaEASJUPEknacuEpfkGmEW3JjJA4zhhtdgWqqBlU++pFC6dfFP1zAVKb
         luOw==
X-Gm-Message-State: ACrzQf1z34KslgNeOTHj1FWiyYGYjU4Zh37xs7Ved4SUxf6/xjah0Kf4
	5BQkn2Ti0WLhipcmeZh2Wd9wQw==
X-Google-Smtp-Source: AMsMyM7miLYxhwhmdAm6xqnhxaOOx6BmPBe4KQD2NDEVZSgjClHYYwttY/drvejnXcRy+vqeDU5rVg==
X-Received: by 2002:a05:6512:68a:b0:49f:4c31:e9f with SMTP id t10-20020a056512068a00b0049f4c310e9fmr10129696lfe.136.1663755010574;
        Wed, 21 Sep 2022 03:10:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o12-20020a056512052c00b00497a41b3a42sm370469lfc.88.2022.09.21.03.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 03:10:09 -0700 (PDT)
Message-ID: <131d9058-a9de-7012-49e0-95e8477edf85@linaro.org>
Date: Wed, 21 Sep 2022 12:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Atish Patra <atishp@atishpatra.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org>
 <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
 <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
 <CAMuHMdXaWz4zP-Zrc4drxwVmbMjmGZHABVbUtO91fZXKawathw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdXaWz4zP-Zrc4drxwVmbMjmGZHABVbUtO91fZXKawathw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_031014_608496_88577893 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

On 21/09/2022 12:08, Geert Uytterhoeven wrote:
>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> index ff6aab388eb7..0ecca775fa3f 100644
>> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> @@ -8,6 +8,8 @@
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/clock/r9a07g043-cpg.h>
>>
>> +#define SOC_PERIPHERAL_IRQ_NUMBER(na)  (na + 32)
>> +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr SOC_PERIPHERAL_IRQ_NUMBER(na)
> 
> #define SOC_PERIPHERAL_IRQ(nr, flags) GIC_SPI
> SOC_PERIPHERAL_IRQ_NUMBER(nr) flags

Right. Let's consider my code just proof-of-concept :)

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
