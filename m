Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45646C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHDCQ1JhaAO1eChDBG9nhH/L7dXwPvuytjnpOGfZkWw=; b=fAn2eics0K37Ax
	HWMxtGloMSdLiqUPbQksqEntsK+d+6HecNyIVDPgjYTqhLTJTEiJQsib/WuV74rqpY966JbZQnkXZ
	/7zZWKvmnsOQVZEShn1jqgZ3ExO6sYssGESGk3cjGatw6uUeQqdr8fuPRCYcwqDUqmextNHgvySn2
	LaEVZ7DA5cPQs5C+6VeZr0+S+HASZ5tKX6i1jBttO5nrYdH5OD7O4dN4Qxu7Enn3KIT4osh1LywRB
	1cX16ISjI0JaFaEEkt54jBO3olgJI19KKK0HCsscc9HMnlvf+0pHy/EzJBMwpvnw6ETEO53jvI46t
	Sgy6XaDxHeFMVTMevLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2xr-00EuiK-0F; Fri, 17 Feb 2023 15:47:59 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2xo-00Euh2-4g
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 15:47:57 +0000
Received: by mail-ed1-x535.google.com with SMTP id co2so5365294edb.13
        for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 07:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ydvsRPVG061WS4UTZVStbsfcU/oL9Zx0nIHQuE4tyA=;
        b=xHv1htd37Mqx8hvLnrTvHhIKTpFqgdOz/1uJyvsbCg+1IPuW59e2MfJdhcJtQ3aWyV
         xUB/T+IXHjLDCvXwC9m29LDgZ+A61/SeNTAAUrd6IJpaDhZJxoEe5LF44aoAoG0mrzUu
         0lOJcKpvLEP5h4rgVdXnUYvWRSgvSOu+eCQTNX3hkJ54KJL6CBHqpmqkLP5mr5eh1brS
         ++TVu9WgIto2kqXvqrncZ44tK7YBoLdTHeaTJ09BtZ2wu03bTVchrrGc3ZuVFHbD6vn2
         ESq5gYkZ6eNaSTUmCDMI6zhEA2eovgrlV9Q83ml6nk9QzoAJwaS7RdSM9QG25SKYHLfv
         1+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ydvsRPVG061WS4UTZVStbsfcU/oL9Zx0nIHQuE4tyA=;
        b=DeGWIY2qwMiTGBrLPJZhqHEs8ksi8YW26CrubRWpv3KWYP0wtAwomGFBwEBlUXyvz3
         7Z/F+NI/rgdhAOllhxu3EURU6eLNQ+H2uHXnYMSkFLEO0QbLFjc8xLSMT4T1LaeLB2eI
         EqrjR6Fqbkg63PprkGGimJQMc2+sy6sdNGRCeiUoy3GrH0Q+dapGuT9IE8s9QSyh2vBI
         0Az5aSQO4Py0iqE5csyQX2br6NzBE99Y5CuWPTQBeH2bvPgdXq0GXigWz2BUZOxsJK8z
         wXQVziNZXYkMy8UmedRyDDvO1gh9s6qCPduRW/+6mTzeFppWSZdB82XXFPMJTyhVP84+
         Pepw==
X-Gm-Message-State: AO0yUKWw/EPgsEvpNrglYqxvhcEfng+cbZHb1zFTpVJHwOf/+gh1pKIC
	KKrB1adXZcp5HG7RavRFd1lRzg==
X-Google-Smtp-Source: AK7set92ggsq7QntNOjYeDE1GS2W9aHhklXHaJSFIAczwRnKnbIvvSu4L4kHtCgfE55Dgzu7wN1V/Q==
X-Received: by 2002:a17:906:9f25:b0:8b1:2eef:154c with SMTP id fy37-20020a1709069f2500b008b12eef154cmr5350244ejc.0.1676648871136;
        Fri, 17 Feb 2023 07:47:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ui41-20020a170907c92900b008af3930c394sm2282740ejc.60.2023.02.17.07.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 07:47:50 -0800 (PST)
Message-ID: <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
Date: Fri, 17 Feb 2023 16:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com> <Y6JB37Pd5TZoGMy4@spud>
 <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com>
 <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
 <Y++B43uCnPQlRYFi@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y++B43uCnPQlRYFi@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_074756_210739_A2A59CDD 
X-CRM114-Status: GOOD (  10.68  )
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

On 17/02/2023 14:32, Conor Dooley wrote:
>>>> Yes, it is.
>>>
>>> Which would then make GMAC1 RGMII RX optional, rather than required?
>>
>> If thinking in this way, I must say yes, it is optional. But actually
>> GMAC1 RGMII RX feeds gmac1_rx by default. 
>> For a mux, it usually works if you populate only one input to it.
>> Does it mean all the other inputs are optional? And how can we define
>> which input is required?
> 
> I'm not sure, that is a question for Krzysztof and/or Rob.

That's a long thread, please summarize what you ask. Otherwise I have no
clue what is the question.

Does the mux works correctly if clock input is not connected? I mean,
are you now talking about real hardware or some simplification from SW
point of view?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
