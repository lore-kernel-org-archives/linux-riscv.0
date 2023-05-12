Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4079DC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 06:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWMpZ14J//7xpAnXwdzUIAxdVaRPC+29BeRTaMuguBQ=; b=SxY8zQbUfH/VRh
	0oUr3yuTDjmU4BO6nGbRzaGy7p8xla5I61MFg5zwy+jzvENVE5Tsn9FQeIBl86nuRp0NYvIwMXkPX
	w26Sf9Dbz8GXmR/0m0vIgarWk8oaqQ1bXu3TrOb2VxxwQ2A1SYYxbTpxYbg4a304Nt5XW3+VespHb
	lehD2+05Ao9VPGUQRdwAkSO3uQjpPsLYcu+ysuDAHVHUr81Yintg8ZQuQMNTljrLTEx6w5cZ0T4mm
	ZFe5GAIMRyuzRLvzwfKTMDHJdU/K/weThCHCkhdFSS9mFdIgzur2O3FovixD3qLT4o6qdKpANu+ya
	gCFZH512BYdECLJUqLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMbU-00B7aW-1x;
	Fri, 12 May 2023 06:50:12 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMbR-00B7Ym-2U
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 06:50:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-96652cb7673so1019042466b.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683874203; x=1686466203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20JFakpad4Yi3m+h8m5OwraA4mcgdT8+ns7QsA/uaws=;
        b=qxSFtT4FdVei35mkSk5ccg/ZEvSHMXvhTwLa4N5c1mkkO43MizRI4B6WpC2iUkvG+H
         7Kfl3xJN5zAM+ijd+2oVO+eS9wV24jcgVW/Z7e22vVUhQ6kWGAkAW2TC0hJvA7GVdJ9k
         d1xkvob71ubYiEU8MqdqFx51aDziHDFYRgQeY+nL7DkBzZ4IKFBagfCYhaVd/+oHdWVM
         00Xn3YYwGjhzdwKO0+tC9s3O0inbUS+f0jXKUqZWw6LvkDW2iHlXhtnLEOjmYxdlGEGw
         EdbCSPgkGNudB43+xl5nZvA8dgj0RaVAVEEVIzTmjQtQ5SATp269ouLsv97iGTDhOe4d
         DH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683874203; x=1686466203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20JFakpad4Yi3m+h8m5OwraA4mcgdT8+ns7QsA/uaws=;
        b=QQs0FWxqsCQx8q+g50xuaFfvGdjhdybae/qsaAiWw04mX3mL3+2jmtBzTRm8LQ5Fzi
         kRzD+9fciXmobxM1e6PdBCCQeSjR1FK8K7oC3kKRD3YJwDyXAzlUhlRvr8C95dA0BKQL
         htZH0G/My5ENzJ2RfMxdb1dwWD01iwLkRU/qnQVp0kuMIfMlzLHMl65AKobp++bYUov6
         BaRX6BTgdwZR0rqpeVmbbQpwQR1x+a94PZwgRg+Qn87jB2H/aXXheFOpIn8W5ztqtEjt
         oTVOIL1l5eputVBTRF2zmLQSxeHkM9o2RRqUCkOHq6pgEzmKzP4SQX5InKVz7LAOL2aA
         cKIQ==
X-Gm-Message-State: AC+VfDw4DNODWZbLt1ZMEDvpL/gKs1wHxM+eJajV/L82DrlsMlLwEpIq
	sMD+eBB4QkSgitYPh73Zri9vmA==
X-Google-Smtp-Source: ACHHUZ5OsBthlEQL5vFhxa3LwORFmPmz1h5PHYYWrlOEZU7LcEfzOqX1e05KAA6fXxIZxw4oMXuSNQ==
X-Received: by 2002:a17:906:4fd1:b0:959:8575:2635 with SMTP id i17-20020a1709064fd100b0095985752635mr24906838ejw.17.1683874203648;
        Thu, 11 May 2023 23:50:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id og51-20020a1709071df300b009662c57b4ffsm5048914ejc.96.2023.05.11.23.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:50:03 -0700 (PDT)
Message-ID: <b0133bcb-9c46-643a-5eda-dfdd816296fa@linaro.org>
Date: Fri, 12 May 2023 08:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512-brewery-spouse-86350c9664d8@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_235009_812578_8838604E 
X-CRM114-Status: GOOD (  10.64  )
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

On 12/05/2023 08:43, Conor Dooley wrote:
> On Fri, May 12, 2023 at 08:35:43AM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2023 04:20, Xingyu Wu wrote:
>>> From: William Qiu <william.qiu@starfivetech.com>
> 
>>> +  "#power-domain-cells":
>>> +    const: 1
>>
>> Add it to the existing examples.
>>
>> This part confuses me... why aon appeared here?  Why power-controller
>> disappeared? I don't think that Rob or me proposed any of this.
> 
> Rob did actually suggest this, as the power-controller child node had no
> properties other than #power-domain-cells.

He suggested it for aon, but not for stg or sys... aon is not a child of
sys, is it? Then why power-controller disappeared from sys?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
