Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC68AC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aih5kqLY9c8XPL3sljhVR5A3oIQCeXrMAK0eY4+79+E=; b=exXKtz6fX9KOyx
	h/yNf5GCTxpS95ki1igKPZe02vyN0yRJMJ0OEZhoFij7XVs3kqmp45tRYq4Pgf2vv1OMCXF5Dq5Mb
	p5Qgl9FsN8goaW4uq/EunRgdBPWOb6H6PhzYnBzUJhz2fSFBsPgF74zuccUK/QEe/nj3im0jz1+xT
	0XyEHp2Bmfg/G3NoOa2DSj7UtGfc3YCLhUxxTW3kE4DKP8qX0HrzartB14CZGj0r0M7PXevv+ctaV
	4tU4yDjaugl1e4JuWPKRHi4yVtiNsIMBNF7IERy+h8VAzhxbIRpeMDCeazRaiaVCvci/XnqHoyXNu
	8DJCt3IS2oUw4B3V0M7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNID-00BCtu-0I;
	Fri, 12 May 2023 07:34:21 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNIA-00BCtT-24
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 07:34:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-965d2749e2eso1407006666b.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683876855; x=1686468855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eilBLb177UVgpGk+F0uFPS6/DUTRyUaIRLjAc8Wl1D0=;
        b=hlrfZhzKl4nMEXFYP3AGGg5wcsVT5HS/5rHm8m6pqpOH/YdU17ClD+11Bu6MNJpUQa
         NKY/37p//cVRjxHOkTW3PGjINPeW6h/vHH8WSxBFt2ftJ3NcG8CV3XkR6PoJRBloCvas
         0EKQQ+RyYBGv7YAPrxz9rR40MzbZYSe0n5UhRxFdkXWuDY5N4c27dZ5uWD0ZZ6+JuxlL
         9KtB44TR6rwFbf3twMYkYA6w+4p208dGHvadpOV0yhoKw46EvNfhRAVlHs5fBGjCxp2O
         fgRT3EuqB5SAXyjaJgbr1H+ajaQawEclbJPbBU0AcE6/Pl8r5I/hgu9lpzOU9FoMHwWO
         TzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683876855; x=1686468855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eilBLb177UVgpGk+F0uFPS6/DUTRyUaIRLjAc8Wl1D0=;
        b=mHOQgJ9Opj6p4wWYIj4f7MieXcCgklk/BQ8xOXlV/t+NgDxE17AwXhNSUoRD6ejypg
         rBbm7H6LgfakMX3NtXI1yzDFvTn1bqy0k08Uvhq9Ag3mDP+45pp4F1QKFrIWbzcVQELc
         94+DFzhd9071nf+4ABVEt4AGsY6+gJ3cMxI/QvtVDXfB7iP7ZThebyp7f4wgsofsL2Er
         GOws+/sgUriedH9gfz8CPjPpeCpXgntulgWPdNo04ZK8Xs5HADjBfXbOcO6GGK6yqfko
         LK2wxHUSA0Fzz89HVAywTsc/tuD+9MUg8RU601DzQyg3F9UrTCnTfbpaJzy7CXCy9PxI
         xsNA==
X-Gm-Message-State: AC+VfDzif6CZ4QkTgB8voy+hx+Gms00ZOY7CWEqm/fbKivRjrJT+jOP8
	zacwaukKa/WHRFYGPcVycNmv9A==
X-Google-Smtp-Source: ACHHUZ4+w2QnVRBUsAsAQavc5TsVbAgzReHgL4m1JE3cKr9nam4C+gXbZPLev77DaI9BrK+LltyTxw==
X-Received: by 2002:a17:907:2687:b0:94e:16d:4bf1 with SMTP id bn7-20020a170907268700b0094e016d4bf1mr19157985ejc.66.1683876855620;
        Fri, 12 May 2023 00:34:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id ig2-20020a1709072e0200b00965f31ff894sm5056588ejc.137.2023.05.12.00.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 00:34:15 -0700 (PDT)
Message-ID: <17bbb2fd-5df5-0f66-9a28-385c50b0d82d@linaro.org>
Date: Fri, 12 May 2023 09:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
 <2fb8c88a-dab5-791b-eefe-c983decad5e8@linaro.org>
 <20230512-brewery-spouse-86350c9664d8@wendy>
 <b0133bcb-9c46-643a-5eda-dfdd816296fa@linaro.org>
 <ebc3a1e9-06cd-7316-8cf3-945bec910a7c@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ebc3a1e9-06cd-7316-8cf3-945bec910a7c@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_003418_689274_B09FD64E 
X-CRM114-Status: GOOD (  11.65  )
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

On 12/05/2023 09:24, Xingyu Wu wrote:
> On 2023/5/12 14:50, Krzysztof Kozlowski wrote:
>> On 12/05/2023 08:43, Conor Dooley wrote:
>>> On Fri, May 12, 2023 at 08:35:43AM +0200, Krzysztof Kozlowski wrote:
>>>> On 12/05/2023 04:20, Xingyu Wu wrote:
>>>>> From: William Qiu <william.qiu@starfivetech.com>
>>>
>>>>> +  "#power-domain-cells":
>>>>> +    const: 1
>>>>
>>>> Add it to the existing examples.
>>>>
>>>> This part confuses me... why aon appeared here?  Why power-controller
>>>> disappeared? I don't think that Rob or me proposed any of this.
>>>
>>> Rob did actually suggest this, as the power-controller child node had no
>>> properties other than #power-domain-cells.
>>
>> He suggested it for aon, but not for stg or sys... aon is not a child of
>> sys, is it? Then why power-controller disappeared from sys?
>>
> 
> The power-controller is only for aon, but now just use power-domain-cells instead.
> The sys only have the clock-controller child node not power-controller.
> And stg has neither.

OK, I see. Stuffing all of them in one binding suggests that anything
can be anything, but you actually have different devices with different
features/roles.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
