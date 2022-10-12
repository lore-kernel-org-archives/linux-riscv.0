Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD3C43217
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1AZqGEcXnf78nkPsjguLY5ikPjSbEZNWQouixRGjk8=; b=PJ5goWk4OK/jsF
	+A1W41YykutYmTPh3QlYE36TLItyzUZ78eWwGBuXhEsrG8s+TZeeXsgoiZLWr/QXtBr/x2zPSvwOW
	4Q2jgb+CU9mwz68DhfAyGa5JS5ILrJD2S/u+Y7F9SGOvNHAft0xpRKS94TmYwX/ZlVzdPgIkps5MP
	6Q/5zllnEpEtku3pu1Uei5eNpPTzxfyZ4Li/LByQUERlpEhV68B/yvjbzmG2mDgujWc1TEdYSBvbe
	dHJF3SPzJ3HjYYsKdgDsTGlqMQFjkwBadpF+UYyb4Xv5Rf8SwXlRRNqCxhRKPaWXp2VRoU2FzLPiV
	heU9nhkBoH4J+LBG0Ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidof-008Zt9-BK; Wed, 12 Oct 2022 15:38:41 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidoc-008ZrS-AL
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 15:38:39 +0000
Received: by mail-qv1-xf33.google.com with SMTP id i9so11152738qvo.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 08:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+NMoPOZq1erzKnfhYuGIlvnqtWcZGNnxl2pMMZiBdo=;
        b=Lz+j6HeJDCFOKr1Gyj43KK/P7fM0J4lk/iKn6dVTn+y8wEIYuHfAh5SyfCA8cJWXhY
         obM6zp6Ht3x/RTCY18QHtftkGoImtad9ussJ+nBB6PIRujcV9ZF0ToMVFfYrz+uHJyE7
         O//8XUzkLvspmUOeE2JoBqBQBcO2ByxXbSDnawaDVa9lyljOqF8Nz/iHhC9J119RmLXI
         c+5t48cJNJRzvuxh441WXhpgdKnpqzzUmU4EioMXHDK5qgeeO8/JrWImvlCVnDVAFvk2
         vlAcmZCnHC+XdxOJ6l+Va0KmA13NT4iQFf8tNrTrDNbrGO2uouR5BVVtGumAzxTYgWb8
         ZBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+NMoPOZq1erzKnfhYuGIlvnqtWcZGNnxl2pMMZiBdo=;
        b=Fc0fLt+0eNprF0MakZXXj3lIfHshYlvNiWWxtNiaekwNIYiJOTDoNsOwoT+7m2O8pj
         YiSdwAdGfjn3KJ0QhZ6B+yO86kplTSSECTDm7YzIgN3WTo8bifphIpraEQIfUfXsgpLV
         O7RLhDg7tbRGQTIDlcisAc6pydfWbPd5hPKR0rlSmguI/UKr13Oqd6rRvuBSx7qd6U8b
         +23LdwH0oRov2OhcWo1YsiROKNMPeoOHtT94sx9WXrWmUahJC8PG9goeFXmUifJ52cot
         55TnaH7akSRIyaV4xB2oeBt4BVAoY137lHGsi+4zc7TUTdVRG95uuqO6DRZ8BNWnZGPH
         aC6w==
X-Gm-Message-State: ACrzQf0W/LvRflUe44huYCGzVLG54B4Dn7TYy9bldc6vXvSZHBeVU/U8
	IkoWi7MAJmLn6en4BwT9nL9MTg==
X-Google-Smtp-Source: AMsMyM6FgPeEeq6o1hXq7OPXCciAymFLlQ+QAF+otIX2xa/uUftSe2ABcXLoRVZM1hDWaM/wexNsPQ==
X-Received: by 2002:a05:6214:1d01:b0:4b0:b782:15a6 with SMTP id e1-20020a0562141d0100b004b0b78215a6mr24569885qvd.43.1665589114407;
        Wed, 12 Oct 2022 08:38:34 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id m15-20020a05620a13af00b006cfc1d827cbsm15705502qki.9.2022.10.12.08.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 08:38:33 -0700 (PDT)
Message-ID: <57e454f4-6767-bf42-8337-ce1f486137ca@linaro.org>
Date: Wed, 12 Oct 2022 11:38:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RFC PATCH 0/2] RZ/G2UL separate out SoC specific parts
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vD1+kbby8rbZqYv2Ux1GaT=7n7V9qHJS3Djv-fKdWrAQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8vD1+kbby8rbZqYv2Ux1GaT=7n7V9qHJS3Djv-fKdWrAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_083838_389850_140BB760 
X-CRM114-Status: GOOD (  15.32  )
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

On 10/10/2022 05:41, Lad, Prabhakar wrote:
> Hi Rob, Krzysztof,
> 
> On Thu, Sep 29, 2022 at 6:24 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>
>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Hi All,
>>
>> This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
>> so that this can be shared with the RZ/Five SoC.
>>
>> Implementation is based on the discussion [0] where I have used option#2.
>>
>> The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
>> identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
>> created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
>> (r9a07g043F.dtsi)
>>
>> Sending this as an RFC to get some feedback.
>>
>> r9a07g043f.dtsi will look something like below:
>>
>> #include <dt-bindings/interrupt-controller/irq.h>
>>
>> #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
>> #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na
>>
>> #include <arm64/renesas/r9a07g043.dtsi>
>>
>> / {
>>    ...
>>    ...
>> };
>>
>> Although patch#2 can be merged into patch#1 just wanted to keep them separated
>> for easier review.
>>
>> [0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/
>>
>> Cheers,
>> Prabhakar
>>
>> Lad Prabhakar (2):
>>   arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
>>     to specify interrupt property
> 
> Can either of you please review patch #1.
> 

Why? This is a DTS patch, isn't it? You should CC rather platform
maintainers, architecture maintainers and SoC folks (the latter you
missed for sure). You missed them, so please resend.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
