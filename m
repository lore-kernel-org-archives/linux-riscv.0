Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902D9EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0bzQ/8jt75zqtgpt38/4U2bbpVaszExH2f5bA6YdlM=; b=nrGxOgdYkFkFrz
	ICJ6NIwLZb1Fg+q58WQHpUdxH8kJSUC4/x4tHxe+nNFTtBOLdaMbFbaSD//Vq8HXmgEDOaAg9KXtj
	y2WY3AWnNc4xLbU3hn50zV6HtUZrulhmWN1xrNeGFm0Nj23hACkY2DrC3NribwabXxGBmdp8rmKcN
	e/86btG23AkC0pueyALX2lO0KPfMpuYs2aE2Mp8wJmaRRWP69kbeNTsonrJEwZCxGw7Re0mW3J64K
	rma4QxfAiWCDB2VOF71hykGCOFBsOcPyrId+9m1mneYehjhIMUIvC21Fu4tiWQumg5MK9C1ksQ1cZ
	kuBsdksled6s3w76JWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoGQ-00AVyk-30;
	Mon, 26 Jun 2023 15:36:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoGO-00AVxb-18
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:36:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f9b4a71623so32678515e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793783; x=1690385783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnVw1NqNJcB00wQMw/uTf6e21wRfweiPK9JrGx6RcVs=;
        b=D9mwgzNM/+uNromAIaOtv+8vCdJcxZGi2RkJpT8Xes9k32j6KEUBg8ZKxL33kbAaCO
         YtZd/Iie+psdVOLf1tA7YXJrbVYWhHMNb8fPmHFSN8Y+neyEhjj+RNTCzW2BBsbImRR8
         WU97HivRP0HDcLUv1IKfOgsNrRQ7w1/7iyu+v74DMsxZM2AXR9oH/OWA7Gqo19hwNTRz
         1R9FC6W4bDN38ki+xEOV+cDVd0qR9P5RJy8uVW+tthHX17xTAdMhqmmqwH0QKT7qGpdi
         IYWZ4kBybxrzzyrk9425FfOt8ztGjwmUGNTGzf6I3cJmKfkDX45pKA0ackIBOnIW9MaP
         WPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793783; x=1690385783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnVw1NqNJcB00wQMw/uTf6e21wRfweiPK9JrGx6RcVs=;
        b=L3b14zJS+mQd3Gk5AYNzxapPtTdteF4+DL2uP3TiURsuogZrCOCecO4PVMbHH75hpd
         u0Vf8NRIGIMnmsXBsMWnndAmIsltYp83+K7ZD+BfVXrjdFJFzlrd+YmSGDw3O3lqUIFl
         T8UuyufgVbvNEbhhR4gJGAemweXWCQZgQdhduIzLM4vxcl4GtD8unFYxvAGVzEXwacGi
         sM26sFbiWuM5hKBa9uCroI81lS7WlnFVkZFB5ku21mnO2xlkJYND1r4L/DlasVgPHgKq
         H9OY2j64dFQRxfX3Af4kc+MvTI75qTgzAinyYI8qvruo42tJMjEukkWaF3mLmPb2gvSO
         H5Hg==
X-Gm-Message-State: AC+VfDzP0giDAXzTkg13NPq3dF1oj6sch85hbMgcCZvJIAiytUsdgN/8
	qlGQ7AXLYxcwamlAn+jT52hJfQ==
X-Google-Smtp-Source: ACHHUZ4FEXp87ZB3EcU+bYZN9wHCNNB8g6R8m5tOeOJIbVYlTsm0uefU0pHye2INl7YnnWSdeOC3YA==
X-Received: by 2002:a1c:4c14:0:b0:3f9:b0c2:9ff7 with SMTP id z20-20020a1c4c14000000b003f9b0c29ff7mr15585537wmf.30.1687793782804;
        Mon, 26 Jun 2023 08:36:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s4-20020adfea84000000b002ca864b807csm7910245wrm.0.2023.06.26.08.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:36:22 -0700 (PDT)
Message-ID: <fc726c72-0503-b407-cad1-f24422f02ab2@linaro.org>
Date: Mon, 26 Jun 2023 17:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/5] ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC
 controller
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-4-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_083624_396159_227C0F4C 
X-CRM114-Status: GOOD (  15.39  )
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

On 26/06/2023 13:09, Hal Feng wrote:
> Add bindings for the PWM-DAC controller on the JH7110
> RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../sound/starfive,jh7110-pwmdac.yaml         | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
> new file mode 100644
> index 000000000000..91a4213f2bd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 PWM-DAC Controller
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The PWM-DAC Controller uses PWM square wave generators plus RC filters to
> +  form a DAC for audio play in StarFive JH7110 SoC. This audio play controller
> +  supports 16 bit audio format, up to 48K sampling frequency , up to left

No space before ,

> +  and right dual channels.
> +
> +maintainers:
> +  - Hal Feng <hal.feng@starfivetec


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
