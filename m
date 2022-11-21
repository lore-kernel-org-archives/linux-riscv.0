Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB21C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEAbIfLPfPhUrc21OVy/IEz1EUm+bFq2z9iSMXrgIfI=; b=KHP+Zk2hNSvaPs
	+3O13PlfsDLlfeO1thRTr75Fxz4PlhwTbDpGOlKquDV/9tetFXDrWT6nUM0cgOs4i/rfDVSbOCn1P
	TpWPTVmijSEZfcnpQHAT6jnKTG6z6qw+9nx7bWF0Fw5/cFdlOGk9UF5/QAtj7E2KnO2Ij3tos68ut
	UC8rah8w+hzDnqxGo4p4KijUV8EVwXUlh0RTLEHWlp/kII4BsXRohfMZoqOMgBUStIsQ8AdIOUGdE
	lx8dYJ7R2h5ogLpv9CT+WkODP+F1Y2lHdyoT0hNasoBXglxtmHz0MTK+NadrPUb/XuhVXZLMfrY/K
	gHqm8pZ5KBYQBloGe+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3mc-00C8mo-P0; Mon, 21 Nov 2022 10:12:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3mZ-00C8dm-WA
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:12:09 +0000
Received: by mail-lf1-x129.google.com with SMTP id l12so18058660lfp.6
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xaQItgrdYIVN8y4IiL78CH906u8RuKnqveTnqxQydIU=;
        b=DfjM+nmHNytVt0a46Z44pTEojQejIbRtaA2L+SmupFELG59tLVOjOYl2AzpvW0h8eJ
         y0UFn50LZOqUqp40AuNIhqRJS0siNvxiR9DhjCAJynrR1ptytTRm1yX4W8kidQz1DMav
         738I4fmthWfJ4VpXFkkjo5k6MsLbZIeL6jU7KLvQNRwElZjL22fkTPYxYhqx7mBYYrqY
         mhDCveEzdktm4MRuMnueHeeBJj5hOG3I2LjgZOmXNsdi4F9VIL6L/KGPPUVk4IISdAVE
         FZPbE8g12n5N/G7qkpNppfVViNpJ/uL2O15dnzl0MmKh/vH9+pFyc9befqe1mZxyixYX
         DK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xaQItgrdYIVN8y4IiL78CH906u8RuKnqveTnqxQydIU=;
        b=f3Emzc3wDQ6RBNEpO6yb/N4XH3WTM+MvZjfWp3AlO/IySayMcgFaSCiPkOJrYY+OYI
         A3Bo8ohS4uH3F8pcQ5TRXf67C/YpahZ3FG0nP8B30YMZYXZUGlH+XU0f2i28Pdymv51C
         DZvROdNa/Be7eztWERV9+MggCdR8b1yt4VerXVjoG9AZSXR6yHj27Z29iqIbsSMZ9sA/
         vxtKsfeh4N6PuFeOKhPlq6ItidJXwHlJT6b/CDcBPEs49cpLhWUVIZSVsR0QLwR6OBgr
         uqIkSjRH2rHB7rDN30pB28ywqrNpz+uhXSC4LnWmFxAY5TRiiSXa9jZ6LcFB0lBguUSN
         5Seg==
X-Gm-Message-State: ANoB5pnijERmtYTdfCxBSh+JAH208vY9Ebyp6qVxpyfTULt2/5KdFeKa
	1yYGeHbmCJOj/WHX02jddXrQjQ==
X-Google-Smtp-Source: AA0mqf4fGmgMbMZYKx244ev1c3tbLEvPukstzdeWn86r/06SB7n8qvYGFvW3uaoVcEH+KHuEG8NCJQ==
X-Received: by 2002:a05:6512:3a7:b0:4a4:77a8:5ba1 with SMTP id v7-20020a05651203a700b004a477a85ba1mr5241105lfp.569.1669025526220;
        Mon, 21 Nov 2022 02:12:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z19-20020a056512309300b004a1e104b269sm1960165lfd.34.2022.11.21.02.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:12:05 -0800 (PST)
Message-ID: <bc853d76-5b65-676a-040a-edf53034c9ad@linaro.org>
Date: Mon, 21 Nov 2022 11:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/4] dt-bindings: power: Add StarFive JH7110 power
 domain definitions
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118133216.17037-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_021208_060658_A67A7BEE 
X-CRM114-Status: GOOD (  12.60  )
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

On 18/11/2022 14:32, Walker Chen wrote:
> Add power domain definitions for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  include/dt-bindings/power/jh7110-power.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/power/jh7110-power.h
> 
> diff --git a/include/dt-bindings/power/jh7110-power.h b/include/dt-bindings/power/jh7110-power.h
> new file mode 100644
> index 000000000000..24160c46fbaf
> --- /dev/null
> +++ b/include/dt-bindings/power/jh7110-power.h

Filename matching compatible or bindings file.

> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: (GPL-2.0) */

Dual license for bindings.

> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +#ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
> +#define __DT_BINDINGS_POWER_JH7110_POWER_H__

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
