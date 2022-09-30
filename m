Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9927C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwtNA7dLk1WwyiV482bo3dx4Z2l5qj06FL3gLbIaLGM=; b=in9PiN4wmq62hT
	OJRdGdaeOLk4iwcYg/8w1iv87UE1Lf73DYjq1YOrywwWZvLGvvnXqsC2311QYTHTkGO0KDCelnjtR
	alYqn+cXloCtLc+nQefZTIc9G0NYaS160v/Gh3OCe636UVRtnvsqT+ebcKEhZF02BBEsA/rPaLLpE
	gxS0uhcs3gw79z5f0VnQRXyrYgc4cBtnoLPh4w6T5NZAfg7QbA+XUqAQCWS16mB9k/sbNXDLzITqk
	y+CPzuHzCE2N4f6kOSoV6BUId0HbLokYba526NwuDu5vhHAvG2rfk13DzOThTlsp7wWh7TyOV8Q+M
	uoI1TUXJN2evb6IMgCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDjX-008igx-M6; Fri, 30 Sep 2022 10:59:07 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDjV-008ifJ-Ds
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 10:59:06 +0000
Received: by mail-lj1-x232.google.com with SMTP id p5so4376158ljc.13
        for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4hzPE9oTqY0sNAFbbyjx8cS0M/EZm+X3v2vFWwcKWqU=;
        b=vHOu28gZ/slIidoNmyLNGLt7JE69UEMTGNGAWTKkHaLClmTVqAidQOmwKnur/460Px
         ViPf7eVqpKBG654mWEePVJGSUuM6vdQwL2NOQr9ZrySEs1hvEkkLw20ev0TNyWv1qUaa
         ipmWGB2IhttXt5NrkcgQC5BI67lAOLe5xRjxpCQGJaPt9xYUpX9SQbZntCYlbE+WIvCX
         JgfXC4DChU4hOlKIaZBYBgb2/EaQ538yLHmKLYDYpAxiiDB79+ax0cW+UnPIamoiOWub
         6PZgIJkw0dIXycpSq2e4gIeuhcbAegWj8Vbu8K4i2U3MfmgIh89THvGV15ZinYhFop1V
         lyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4hzPE9oTqY0sNAFbbyjx8cS0M/EZm+X3v2vFWwcKWqU=;
        b=7FXIJ7Y4qCtdmpWYm9ER1ctG+hJEvgtmKx2CVStCur1P8BZt1EJGOVvjBr3eb+xQhH
         d6fnwOb+ie5MmQXqrHl24wiw7x0x/azFPxCaoi0xdpo1sBi6Xv5xItKSs9xJf9LtZXGs
         2W+MatyUtJ3UqdBHuRBFCvJC54iuDGolMCwp/jUrARDVzQkSHm9/0+NAYuEhCdeIXLqQ
         GwGKfj94gHAA+NDXCi8ylJWv+fBcJJT0E7UM8KU8DlvZntnruOIFxnRWXuGwRzZ3QYuc
         7wZ7AIBccxvaJiuMqvdJMTPvPAoMqnumXkNNwRdzzieW+Vjw4gaEq2aLNaj2PsbzYaZL
         frHQ==
X-Gm-Message-State: ACrzQf1RmuP186vp2h8n/tJNaY7ZjYgBTz3AG/hfuc/ahYGXh1cLq3+a
	N0JBj/7fftOY848iSmwsX1OpnA==
X-Google-Smtp-Source: AMsMyM7/M35hE/mV3r6usdYHywAzNP/Z+T+a0YioD4qkM0GJQ/nt2HYQISleBq7PKvTlVL9mhfKOuQ==
X-Received: by 2002:a2e:2e0b:0:b0:26b:f760:1c51 with SMTP id u11-20020a2e2e0b000000b0026bf7601c51mr2670898lju.494.1664535543106;
        Fri, 30 Sep 2022 03:59:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d10-20020ac2544a000000b00492f45cbbfcsm250893lfn.302.2022.09.30.03.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 03:59:02 -0700 (PDT)
Message-ID: <ff493398-7786-db0d-ae94-b52207e2a56c@linaro.org>
Date: Fri, 30 Sep 2022 12:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 20/30] dt-bindings: clock: Add
 starfive,jh7110-clkgen-aon bindings
Content-Language: en-US
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930055632.5136-1-hal.feng@linux.starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930055632.5136-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_035905_499246_6719E85A 
X-CRM114-Status: UNSURE (   8.96  )
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

On 30/09/2022 07:56, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the always-on clock generator on the JH7110
> RISC-V SoC by StarFive Technology Ltd.
> 

(...)

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive-jh7110-sys.h>
> +
> +    aoncrg: clock-controller@17000000 {

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
