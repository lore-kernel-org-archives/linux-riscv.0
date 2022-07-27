Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BAFC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n51itQD4UHuJlUzShFGvFwMMv3hloW+x57apfYvMV0E=; b=IZ5nJCRJB0LHbW
	oTt2iMRw15Wvy8J0pmEei61mYZsekocWUZo84QgtQllEQX8gZ1zJGVJep5VBjrogIKGTKwgTGUXa4
	Oo46CYulXMPTm6ssNNEjmTj/egL/53N3RdBR/Q2aichusWaBhzrnfCI8mB8BA5RHl6UL9HlQwzEFL
	FU9mwacyNN27Vgh3ETwwu9DnpfnCHxRaFQ79HqpAmDo8jgPJ91QY7151bwIDoY9dlhzbPj/7coAEk
	eyKew3PU4TFTmOuunVlWDEtEocyt48HEZhFLeePRuZYKDy6yT3EpDw782YlriJlQBW401XQlXGByy
	S4ZC/KazCG9+hhSSoscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdkm-00C3Fy-JI; Wed, 27 Jul 2022 09:54:56 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGdkj-00C3Ao-AY
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 09:54:54 +0000
Received: by mail-lf1-x12f.google.com with SMTP id m12so25256037lfj.4
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ff9uzpMBrXqtRLFs8NSqZkB6LNqgU3H0pEbAZBJ643Y=;
        b=FLtiM/k/98uLhDy19aELtykjXsB8d1jzCKSTQGaTTlgTJ9+Jaee4eIhmeIDeCXxH5V
         bRlkzSag4e/yBVTqxZrKqmv+oeLEayoOujtTbJL8Co5NEkhLCrw4m6OU9FzoMFYhBxv9
         jHu5FbqvAmMHCP+oKPc3OW/saCXX4Q3ZYrj9X8oieH+f29ci+aq5jMGorU9Y4Up8fPd+
         ODutAk4au7sLUN5fgtfTW2Dbwos6Y5R+D46HFXoSg4E2pvN2ieurrpjzwICisVtZ0+qm
         u9nD0eo3iVsYADCwSZw6QfQWNHD5ZiRO7x6OUEZ45f19O2xkY5z4aAXGMyQGgSVSOpat
         LV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ff9uzpMBrXqtRLFs8NSqZkB6LNqgU3H0pEbAZBJ643Y=;
        b=0ZXETOa62FJ5r7Re+jGg46NwfqznV3ZS2kEytunoMzLzPe1Idxt7fQhprSjK75uIf+
         OcaYABR1aRV67E5hZeLSsxabYa2WxXtUn7Ztm5KAAjxvoGdOxT7y7iRoxugF2AO5j46g
         gdNiKyGYHp7Wg2E/kRGxjH3w05FBtnXPANjFabi8JZjZdkuaM+GgwFXgbDdwtrvKA/VB
         tbmlCOvNsjYs/YQ3h6KCux8qdZx9/hQc1c2VPbDgPCYt9yZDkZ94DrnMH2NwlwXPmP/L
         d2iAZTsp2V4T1V/JFJXgrEourQleMDJR8FuzAFZhD78Xneml8ypXRX7qC4n5ZZrbPH4n
         EDJw==
X-Gm-Message-State: AJIora+VWShyMMKNK7Gfbk7ZwxLjZ3w295wOFQbaiMLQ6pAPwyLp+PZu
	jzOWX1k/LRHqnrW9tUVvECRCVA==
X-Google-Smtp-Source: AGRyM1v1YCF4kJczG5ZSx9902fpbqwGosBeUxKcyUZZfWk9h56A0kf1q4gNwb5pRg03vSQ8Ka30Ifw==
X-Received: by 2002:a05:6512:4004:b0:48a:8d72:2434 with SMTP id br4-20020a056512400400b0048a8d722434mr4867601lfb.200.1658915689038;
        Wed, 27 Jul 2022 02:54:49 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id b23-20020a056512071700b0048aa0ab6448sm861073lfs.15.2022.07.27.02.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 02:54:48 -0700 (PDT)
Message-ID: <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
Date: Wed, 27 Jul 2022 11:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
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
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
 <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_025453_421550_9C67BF21 
X-CRM114-Status: GOOD (  20.12  )
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

On 27/07/2022 11:05, Lad, Prabhakar wrote:
> Hi Krzysztof,
> 
> Thank you for the review.
> 
> On Wed, Jul 27, 2022 at 9:54 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 26/07/2022 20:06, Lad Prabhakar wrote:
>>> Document Renesas RZ/Five (R9A07G043) SoC and SMARC EVK based on this SoC.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>>  .../devicetree/bindings/riscv/renesas.yaml    | 49 +++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/riscv/renesas.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/renesas.yaml b/Documentation/devicetree/bindings/riscv/renesas.yaml
>>> new file mode 100644
>>> index 000000000000..f72f8aea6a82
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/riscv/renesas.yaml
>>> @@ -0,0 +1,49 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/riscv/renesas.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Renesas RZ/Five Platform Device Tree Bindings
>>> +
>>> +maintainers:
>>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
>>> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> +
>>> +# We want to ignore this schema if the board is SMARC EVK based on ARM64 arch
>>> +select:
>>> +  not:
>>> +    properties:
>>> +      compatible:
>>> +        contains:
>>> +          items:
>>
>> I think you should rather ignore the RiscV SoCs, not specific board.
>>
> You mean to ignore ARM/64 SoCs?
> 
> Agreed just the below enum, should do the trick.
> 
>             - enum:
>                 - renesas,r9a07g043u11
>                 - renesas,r9a07g043u12
>                 - renesas,r9a07g044c1
>                 - renesas,r9a07g044c2
>                 - renesas,r9a07g044l1
>                 - renesas,r9a07g044l2
>                 - renesas,r9a07g054l1
>                 - renesas,r9a07g054l2
> 
> 
>>> +            - const: renesas,smarc-evk
>>> +            - enum:
>>> +                - renesas,r9a07g043u11
>>> +                - renesas,r9a07g043u12
>>> +                - renesas,r9a07g044c1
>>> +                - renesas,r9a07g044c2
>>> +                - renesas,r9a07g044l1
>>> +                - renesas,r9a07g044l2
>>> +                - renesas,r9a07g054l1
>>> +                - renesas,r9a07g054l2
>>> +            - enum:
>>> +                - renesas,r9a07g043
>>> +                - renesas,r9a07g044
>>> +                - renesas,r9a07g054
>>
>> Did you actually test that it works and properly matches?
>>
> Yes I have run the dtbs_check and dt_binding _check for ARM64 and
> RISC-V. Do you see any cases where it can fail?


Just remove the renesas,smarc-evk2 from
arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts. Do you see the
error? Not from this schema. The only error you will see is that no
matching schema was found.

I don't think you can use such selects...

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
