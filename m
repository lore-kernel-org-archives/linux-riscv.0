Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AA8C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RWEVDWBsWeJO/46zq1x+YLNwX/Z034F7MvK2q9Cnxs=; b=oAYmtEz0cq5f1X
	YcZZhF8SB4KoSHBmbpavhxLg9rSsZm6xMORB+uqtV4PBAOubh63J8ZaMdy0La8D1OrzAzbhmM9Efu
	Cv+EeB4Canw+OO/gHBZPCdLdhfjrKeWPrLRf5Y5s8FBw/KqUku2lPex5Pnc9I3cUDEGiBvhngXi7d
	YyAt0ajbppKl2ch+WJt1FvAUl5FVt4+aDdw+ho2dJ32FiGFPIi/pbCIUS2ZzrxshWjsjtsRTMvvtg
	hiMRXASsUimQm61aqQ4Dyn1uFansN+7TIdQmtYKVY+GgT8/3/g52NjZN7zZODPrK4hpe31f+IMKIy
	pKL0dJLunEFK62pknrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2Qs-00BSY6-Pu; Mon, 21 Nov 2022 08:45:38 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2Qo-00BSUj-Se
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:45:37 +0000
Received: by mail-lj1-x229.google.com with SMTP id d20so13665439ljc.12
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGxw8oU0grRMxGkzDQfX5OPAjWzxKp/cmBJBZE2lbSE=;
        b=nBNkjGO+UfQSSASIQvgHi9XYpH8VG48D+hGvza3RC74eld+iuol1zjzmv/YIgTXprN
         wpZf6NPPJP7RZr2RQKFh30UG773ELwvUOXvPnT2wltkPyadrnnaDbf70NHRKN2CGtu7S
         LamrjPlYS0TNjgpumKMHj+pZOGF4/AZLbY3ZWP5Yh+ZaFMhqf9LIflxKVRI3tTX5Azwp
         m81UfdeKfFrSWc5UQ3Yd5plB+Gkb9LmwAhzk5TgiH9DtZUKhoTmHVgLo9D6bXgXh7LSd
         M48z6SZmMFnJxT4NHjfPYpG6ad+k24KJwnntnhO0URbdFOI+HDDGBBoXCHhqjqJO2C4T
         /qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGxw8oU0grRMxGkzDQfX5OPAjWzxKp/cmBJBZE2lbSE=;
        b=mNup+v6+RPmyjxG1VYSsYb87qcAMgX9O6xOjaf/TGZRIi4Z04fpDlo20YxIPY5JwWa
         SLjHF9DIV6e3JqyrpWBEOqMA7NkPJd7diBh1YLdkjMRBDvz9JOGylpE7j7qWfZu8+6j2
         qQd5cdmEogafl4EJHta5H4mq88dXyHN+xVMVpkC9Oko/ObAiuZ/snC0fcth0LqnI/vHc
         wqm623YYYrpL5ZjgDg5lfBGnsqIsclLBY5XXnv1ENOxKbiIF1Sv4bxeJUKNOwpaPcwYX
         AMkCX+Oj0zxMH75B/YDluHBLkJSr25Z5S78zLNybZRq2aueBjep7ewPi1Vll/vxlBaJK
         XGlQ==
X-Gm-Message-State: ANoB5pk+AwOkzCFP2dV4hqJFjm5mAfFoveuYR/cv16XBkTeFnoRgCkYh
	iAxLJ3gCUQDpHcbOD9txUAuB1w==
X-Google-Smtp-Source: AA0mqf69rMGUenhpYORaEyxbqbvUN24UYXtECG0wneW+MPaIJDQp7hjHwvwhcIEoBMImVWp9l/bqWw==
X-Received: by 2002:a2e:bc10:0:b0:277:11ec:ff2a with SMTP id b16-20020a2ebc10000000b0027711ecff2amr5745943ljf.163.1669020331540;
        Mon, 21 Nov 2022 00:45:31 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q5-20020a2e2a05000000b0027765fd616asm1376623ljq.20.2022.11.21.00.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:45:31 -0800 (PST)
Message-ID: <5ef383a7-aab2-dd4d-ad60-ac631345f38a@linaro.org>
Date: Mon, 21 Nov 2022 09:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/14] dt-bindings: reset: Add StarFive JH7110 system
 and always-on reset definitions
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-9-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-9-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_004534_972041_31AA2514 
X-CRM114-Status: GOOD (  13.07  )
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

On 18/11/2022 02:06, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add resets for the StarFive JH7110 system (SYS) and always-on (AON)
> reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                 |   5 +-
>  include/dt-bindings/reset/starfive-jh7110.h | 154 ++++++++++++++++++++
>  2 files changed, 157 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/starfive-jh7110.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e97dac9c0ee4..eeab26f5597c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19614,12 +19614,13 @@ F:	Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
>  F:	drivers/pinctrl/starfive/
>  F:	include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
>  
> -STARFIVE JH7100 RESET CONTROLLER DRIVERS
> +STARFIVE RESET CONTROLLER DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> +M:	Hal Feng <hal.feng@starfivetech.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
>  F:	drivers/reset/starfive/
> -F:	include/dt-bindings/reset/starfive-jh7100.h
> +F:	include/dt-bindings/reset/starfive*
>  
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
> diff --git a/include/dt-bindings/reset/starfive-jh7110.h b/include/dt-bindings/reset/starfive-jh7110.h

Filename based / the same as compatible (or bindings filename).


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
