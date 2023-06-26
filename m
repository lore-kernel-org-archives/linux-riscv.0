Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766DAEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izcMrRcARhPCotfzNhNzYKRSO6g5Hco4OjQu/Z8zNdo=; b=iywqGSDKRUFhTk
	6d5JJXGif2hw8jtTAsOW206nYan1I1iFmZpBJtLRYfwbK89kEEEDwoek399grshPF9by4n3IIwWjs
	c2dq3IqhppSTmJMzsYEnjRjyISBf/aHt6Gn0nBqQ69e787B6YToxFlwT0iAkodIURO5LPfMPNs/I9
	zkBpQI5ySaezjHCfkdB7ZOg9noIiIWEH/0rVHkbH6wyNv46bJ/tYU9qX0Qi083HgpRHq4W9M7TJa1
	WNrH+Pwo9j2b08rbSdfJfPiCBryTFQcdeG+eMzvZVcgZq/iOAXWeYkDE6j8qyKjycSmQyGXx05EgB
	eI0uJTKJtYQuGgIhur2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoF8-00AVW0-0R;
	Mon, 26 Jun 2023 15:35:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoF5-00AVRn-1e
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:35:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-313f1085ac2so1087277f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793699; x=1690385699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyXF+o9wj/oq2REDkSaZZ6G7zdUVUsRy4dXWDEbehBk=;
        b=ZTfd1hsUwLmVqTbM925y9XW95cMMxMS9/Yt3r3RwEzpvz40wTPkuNAXbM7jPD7j95K
         KHjljdtVdCDEAEth1RrsZWhG9VUohTDguirwqJgMrQzf2jq6GlwW4RVwNlub/+4KxLI/
         p4fj6qOCoOYg1FwnWlMm9Co5YOrmTBl/VHwhiu9LOvswlGA8lVBU8L1Lwt/V7oagEXTG
         nfxNrnk7s7UflcPglLPNmjp/eqollpE+12cRJUzThGTXXezmpyKDhr3L9ICldQLXnyLA
         D054E+8e+x153t0fLPXqMLQP8qHZBxVJxZHmz6OMX+9ex/i9c4tplT3CpmpiZBkF/ndm
         u27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793699; x=1690385699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyXF+o9wj/oq2REDkSaZZ6G7zdUVUsRy4dXWDEbehBk=;
        b=NcnL6nxpeSRKL5VxMgqyoV5NqUz9sYr0KfGt3gBsed4T9YzgK4ZzHFZD0OWcqDT2Qu
         mwyr3AKIKm9K+51PBjpQzwp80M5YaeDnJR1uRoMjW1IonXFUvKIfYjIKxje7ewIxzGSs
         thms7vqAgnCoHfOS2TEdNkcLb0kCh/13ywR2W+MUet/RAz/xVY1TQ1PkeeRvDlompgj6
         Q/JLN6lWEui0VUeFYCABpGy22RXDaxF5v65JjUgfYYCPhAxeZWRggKcNLgdCKTi37oM4
         F5Go2G/LxaMlX2Z16BCXaja5azVtNIW1lU4ONoXroCuP0wAc2GU6/p6e+aBpgFFI7xJe
         fjOQ==
X-Gm-Message-State: AC+VfDyAZ0I3rluTyoT1NDOqB5nBBGd0f62i89hWd3c9gCQyhTmus/d3
	2A2lVsmOQz+9Fo8qrZADTq9crw==
X-Google-Smtp-Source: ACHHUZ61yHu8nog+sCkK52c4zYTdKwCHOnJ1SgnrNj39cUUfGFLp8MGAJGP8r88trdeyUAaTpd5tgA==
X-Received: by 2002:adf:ea09:0:b0:313:ecaa:1e69 with SMTP id q9-20020adfea09000000b00313ecaa1e69mr2673383wrm.11.1687793699463;
        Mon, 26 Jun 2023 08:34:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g8-20020a5d46c8000000b00300aee6c9cesm7718559wrs.20.2023.06.26.08.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:34:59 -0700 (PDT)
Message-ID: <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
Date: Mon, 26 Jun 2023 17:34:56 +0200
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
X-CRM114-CacheID: sfid-20230626_083503_558905_1137D5AF 
X-CRM114-Status: UNSURE (   9.67  )
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

On 26/06/2023 13:09, Hal Feng wrote:
> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.

...

> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwmdac-dit {
> +        compatible = "starfive,jh7110-pwmdac-dit";
> +        #sound-dai-cells = <0>;

BTW, I don't see any resources here. Neither in the driver. I think you
just added this for driver, not for a real hardware.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
