Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD11C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDf4RpWA/YAedc7wi4tNc2gWbOJaQmmY/HSk8rd2aDk=; b=MNN0F/ZTsqv6tJ
	azwZz4AlsJg/duArcBCTTcWVPkQc4dr51e7aT4QBBCv9S5RAjlxOiGfu0/eLixtKiZTZjBGym3gxp
	ghk+qNzqXZW403o2jUg5oBO1O5VAar7fAIoG7YyiDlQKRWXw76G0oNmkjmOEDkzWQTIThVuuMKtl9
	OIFdRs9z1szEqFKT6FR8gq3u7yc7etWCd12qGAESdEdR3g0EtNRP5r55dg/FG4SGlMEtA5MHCghdc
	/tddLRSoufzg8imn7H8nMuunpAzPzVrEdj4olNxRsOxAd3+4ZyBypqlQzNRgnnIUMttVcKq1ip33G
	yo2FQnf/RSUEacvZf2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQnc-007Yj2-UO; Tue, 21 Feb 2023 11:27:08 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQn6-007YX0-Sc
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 11:26:39 +0000
Received: by mail-ed1-x530.google.com with SMTP id eg37so11976684edb.12
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHbKR2m+ywXpCXnZM0exqgvtcPw2O6ABggPWu9BvoN4=;
        b=R9+walYXq2Y7zxrm+gnrtxKExw8KYaNL7+C4BwJDnbYDDjPma+voio4V7IMVLXdiRm
         msWk6RRgDsA2bI2SCd0H2bB0uG35IvH0WaHmTpxlIJP7bHrOQN2vx6/Z/XnNv8X79rN4
         ZYCjJJO853MVKF7i8uIzEI19GNlB7DSWsVJn7xjcB3cd/I5dJFQYL152BUZoDqCAmHTR
         kwUrnihYMiXFooHccoQErA/l/rDhn5x/hLQ6x8u4pQlM9ECV0WgyHAQZO0D67z1XbEwG
         409hqVjpwmtzCZv/0OYP2Gh1uBDPS5hzFrgX1de6FTBgB88T76olZTyhZnIqsn/1CaLT
         DxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHbKR2m+ywXpCXnZM0exqgvtcPw2O6ABggPWu9BvoN4=;
        b=NvFIOVnTACG+ArsmEcWcST2AaBdopGPizjGyLHfafsNSvfIwfWfUKMHIvX/GCra8Jr
         x+FpBZEYRDULqbxIBLQe5qw9QqsUkhvWM8iO+/ztk8zDMOZfaOP7L4ALz7lEvTN2x6RK
         Lb3t1SknNbo3TGbncKvQQyoeUxadlpH/Kgzn7MKt+jfpuM/oDhwnr3bL5XAdXosSZ3cs
         89b3SjGm0KQWjHYT5YsoVZrbgswMd3k2kxQYScBp4p2wZTNZMeZfzgVzGV4VKxI2zFSk
         BKYDU35Qfpfn7hK5BrzkcvJu8SGnz8U2L0do+lCFLleGrFhH2KU76d4gWjQpFvfWMh6g
         uBZQ==
X-Gm-Message-State: AO0yUKXOoxcJ9Si9ujKbYUU1ldpAMqeawZ6E3cQWiQMOtIS7tMVjNsS3
	ExQv6UxEIqAUc7u6kuBrZmFxug==
X-Google-Smtp-Source: AK7set/hoEeKJdNyqDj9X+vez8ZgBQcuREJn5JynOD5+WGwCyXxjQ19wOr8kdZ1bzXKag3dBWsvrHA==
X-Received: by 2002:a17:906:1c56:b0:877:ef84:c7de with SMTP id l22-20020a1709061c5600b00877ef84c7demr11356772ejg.61.1676978791367;
        Tue, 21 Feb 2023 03:26:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id wq12-20020a170907064c00b008b17ed98d05sm5975803ejb.120.2023.02.21.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:26:31 -0800 (PST)
Message-ID: <3fb23e7c-aad2-bec1-01e5-299c9b515d6f@linaro.org>
Date: Tue, 21 Feb 2023 12:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/11] dt-bindings: clock: Add StarFive JH7110
 Image-Signal-Process clock and reset generator
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-5-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221083323.302471-5-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_032636_960467_3CE30DAB 
X-CRM114-Status: UNSURE (   7.51  )
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

On 21/02/2023 09:33, Xingyu Wu wrote:
> Add bindings for the Image-Signal-Process clock and reset
> generator (ISPCRG) on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
