Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67165EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkFa8F4HuU8zh2JVBxmDe60aFiZNaXiAPK7pedQyMjk=; b=Ed/iZOgTe3/eaF
	PDk+ZYGI0UEvU/4MoSjUXjZcn/nbflpAcn+L8U9mGuuYT95emUjm8MCdZLJsBQeENx8PdAWM5lG2y
	xaX4hxFksFf9kcP/AlKlo929mGEhexIsESl5PoHLMzBks8f6gCvXmNIhnlpSwtcWsqd+hDu6zYGz9
	MjOI5rYn24nNv+OV0tpOwj5WeKI6RyEqHnp6pPllEl2etKsHA+7srR/RHsluqrCMWIE3Tivg5ryra
	N5pNv+cMRYv2dldVNitMLqeqnWhSaw/HQBbkKy8vO03vlCwBTNuE9Y9rtN6drqgMzVyyTAlRRXlHg
	ySNXirjcqhGEMVUwUYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoCI-00AUkE-3A;
	Mon, 26 Jun 2023 15:32:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoCG-00AUjj-2V
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:32:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fa96fd79feso13229435e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793527; x=1690385527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UotEKVGu4UicdFRFt8vn+mqKSPhJyyY8erAKccSLFS8=;
        b=OiVPY0SKcCbKeSILoHCmY/qT1E319c5b9eIcoYOSF8c1k8vSUoewSPFxtd2GMDUSEv
         7qGqpG+l3PBAgiP4ckxQoCzKIvwXF4hlGeP8/yyCjrqZFc00KH1/HH4JMwxrZdC4V2qg
         j333CfYYVQwgPNSX/ctAvOS118+Lrxb2KYg1Z5oPJFl3WSzUqKVvQDjimxbpRrdUg4TK
         60Ly4FS50ydNH0ooiZm4eoSmwxmn9YxoCYyCHx/52wHZSCKaZ6aMFIxzO3HghTfGGuLi
         iiQ3RB+WJZyxlAwMqw5RdxqQDku5fLPBVeLuZW2PwkFphHG0/rmutptD0oEBQbUY+/dh
         l1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793527; x=1690385527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UotEKVGu4UicdFRFt8vn+mqKSPhJyyY8erAKccSLFS8=;
        b=dmBhmNlXspW9bmE/L4TqNlZUwOWI9jVawiaybsEADfMuXVhRzAscgWOh1pxkfJ0HYJ
         179DrRYdM9OogR8LZV+g4IDP+QQkvMah2ij6caUfCGTykzPED1s5P9gHqcHgUXpVDgjg
         XqeYspIax8gIJvjHrQQUSGNhHrIkWpD2vVWzLOvzelNZvvuQjdjoUiMBSWiF9Llt8SH1
         jY2HFAycYH1pLjZ7B1A39HgD5Ya7Ntn49+7VMZtKxzN76eKwSe0IGmjj6bE8bgvbBPA+
         oHMSyOFKNtZgQ8jfB4D2atE4ckVPUhJxLk/sVBEcTyziLETEi5Gwiz62U33MVL35tKZk
         VHew==
X-Gm-Message-State: AC+VfDxXLn45c3xXIPfGMT9CVOC6cJo415n2WCdmU05bBHipQiM/Q7Pj
	fmXC24SqjHMDX7ZHzfXHD3j7vQ==
X-Google-Smtp-Source: ACHHUZ5Go2QzsyA7PJ5u3USfatgPyu7gSb79h4oB9qw8x8KLefKL4zc8Uq/5/48twyYJ9y10B561jQ==
X-Received: by 2002:a7b:ce98:0:b0:3fa:7478:64be with SMTP id q24-20020a7bce98000000b003fa747864bemr10432370wmj.1.1687793526846;
        Mon, 26 Jun 2023 08:32:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f23-20020a1c6a17000000b003eddc6aa5fasm10864959wmc.39.2023.06.26.08.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:32:06 -0700 (PDT)
Message-ID: <92171465-d2ba-c3ba-aa55-0f705e924a0f@linaro.org>
Date: Mon, 26 Jun 2023 17:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
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
 <20230626110909.38718-2-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_083208_843160_47BF1C0D 
X-CRM114-Status: GOOD (  13.58  )
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
> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../sound/starfive,jh7110-pwmdac-dit.yaml     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
> new file mode 100644
> index 000000000000..bc43e3b1e9d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac-dit.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Dummy PWM-DAC Transmitter
> +
> +maintainers:
> +  - Hal Feng <hal.feng@starfivetech.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pwmdac-dit
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  sound-name-prefix: true

Drop

> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false

Instead: unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwmdac-dit {

pwmdac?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
