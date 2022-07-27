Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE17CC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iv4HOsaccDNS2W12zZ1HtGUSqplwpf3MAUJp83wMOU=; b=1E3EiiY6Efci8j
	4swI55RU2AQe0ZjLR9GUzFwTx68Bbh0Es0M0t3g22UZ7e8EcbfuG2KTpQ3LaiEPpt2xnr65hqiZMS
	FbOdPVjIEER1a3gNtBF2zAsbZzU1uUjnwAIYPeDsZuOQt0852CKoWFdUmn0HKvHMr8VoVpd8/fbeV
	m/mD2sIcyVQV/SVp0FPd8IqNjYAEjS1fu2InKIriNXloylHej1zObMrXhTUrBgoKj3VBtkZ+JUMYd
	O4ZFveB1MjV59+orOoTw+zoN9dueJsgkh3aZDnIY/dfn5PfNv90Z/R9l5IhYaF2RRUdwMoj5uje58
	Nk+XglvwFSx02ThPZ0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfpV-00DIwr-Gw; Wed, 27 Jul 2022 12:07:57 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfpT-00DItK-EQ
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:07:56 +0000
Received: by mail-lj1-x22f.google.com with SMTP id w18so8510003lje.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P+2FHV1UyVrnsYNntWHopzv4+MXcff3Of4ioJzVnCGI=;
        b=AnjWDI8tr9bmZBYUFMj9WPOl3m53p4x/SYpzv83Z2ehj6b2z5tMohFMPs66mns4vtc
         F/SNUthfL0SBnMR6A5PHNawbqprmZHCGM8GPGB15ac2wkhyNqIl1KNLdyBx61K+BAUNL
         jocFxnN7BpnKnJ6SSfKw6fW/CS1mnG4kGf3tr9tXRV49p8zNvIPdzlwfffMHUsqkw5jR
         vUEDwdjzBSf7aCCkIaQBkGOMv6Hh3n6kPErwGpbNTbtC015ZZXyQLxlpQDEWD0bnXXNz
         y30vudbTCmTfC10TrgUQx+B9RbsZ6WMfh6Ukm66KrPi9H8m7J2ALrcwfnlnV1kDfRvY8
         lKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P+2FHV1UyVrnsYNntWHopzv4+MXcff3Of4ioJzVnCGI=;
        b=CblgeJO82/mzA5DBIg80t+0ZXMI8d2hmhk/Dab0k/0uisrHjWrohtEIpQDYOkRdq3W
         +e7/zwLBGD6sQ0tIg+a38yjGp9rpLxiWjN2MGvu03ypX5oeNcoZg4xHzf9KD0rursoIv
         CSWxrByFDdr2Yu/ibg7kPPhBSci4jaraOr/lIogZgkgic6JzfQkG3AwTkHFsAImSDuaG
         s6YZ6WuAtlLrKKDn/IUTikZW/jvi5xn800zifRbKavmlt7WvPLR9F/6Wf6dMw5qihUZY
         ar/XkC9MDjVFyTA077LqbSEiexnFBDvCLF+VAwCKKOewjEcn9KIUo1Y/itgVkIV8oCEw
         1qTA==
X-Gm-Message-State: AJIora8fO3C6RcLQa/6jJIu91n/K5gRvnj8bCrPksqyJxJ+svrhMQZa8
	x34m9cpqhKpC+lTyYHssvtQWOg==
X-Google-Smtp-Source: AGRyM1tefcSIkMswKYXFzdVt4s4uRUWesrNpwAbExSgtNMXR5q2dqpfuBJJUEyVR9BHyqpbYoCJv5Q==
X-Received: by 2002:a2e:8898:0:b0:25d:fc17:5efe with SMTP id k24-20020a2e8898000000b0025dfc175efemr7083795lji.132.1658923672053;
        Wed, 27 Jul 2022 05:07:52 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id b14-20020a2eb90e000000b0025dda2c8013sm3912287ljb.28.2022.07.27.05.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 05:07:51 -0700 (PDT)
Message-ID: <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
Date: Wed, 27 Jul 2022 14:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property
 riscv,timer-can-wake-cpu
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727114302.302201-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_050755_520317_A47CDD87 
X-CRM114-Status: GOOD (  15.29  )
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

On 27/07/2022 13:43, Anup Patel wrote:
> We add an optional DT property riscv,timer-can-wake-cpu which if present
> in CPU DT node then CPU timer is always powered-on and never loses context.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d632ac76532e..b60b64b4113a 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -78,6 +78,12 @@ properties:
>        - rv64imac
>        - rv64imafdc
>  
> +  riscv,timer-can-wake-cpu:
> +    type: boolean
> +    description:
> +      If present, the timer interrupt can wake up the CPU from
> +      suspend/idle state.

Isn't this a property of a timer, not CPU? IOW, your timer node should
have "wakeup-source" property.

Now that's actual problem: why the RISC-V timer is bound to "riscv"
compatible, not to dedicated timer node? How is it related to actual CPU
(not SoC)?


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
