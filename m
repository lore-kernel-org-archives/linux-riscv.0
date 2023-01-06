Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E69C5479D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhL3RA+HGWV+RvuF2fL0ZxuWHHgN2Stz+3Vrs/N0oR0=; b=FJFiOcLTRtYiP6
	JNQVPaMvXCscBHCtRVsjCkaodEQ3/RbynSqkzekPA0YZ95to3YjKVfr3PZHFuL8EPdYxdpzjhQdYW
	ddhpT0KdOCe4gp+guC9cYUhEhXKVM3XKzEJIUXyMayGCpnzySsHfqQhAtBsX8UxM29zutDUZt780O
	fO3pWelJzKVhdCevcG9U2eoqHeSfllp38owWAXRXH0Bu7q4WCfrER+SO0vgApS+gQiKOFdTFWnlre
	GEMObNXR9D1MEU6MlA+ZGneoWbAYcK628GnPA0SdJxgpHlFoAgUWR/UGOLufdVfkLhElKeOlyp9Vh
	DQFb6dsE6I3bErR/VnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDiuV-006xb2-ME; Fri, 06 Jan 2023 09:21:11 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDiuS-006xZT-Jj
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 09:21:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id r2so721460wrv.7
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAfhATkIYXFpgazLFZ+AK9Lq1o03ZdKMm34LM7SHmEU=;
        b=f1UmUxyILCnWGJP6qQZ7GcSBmaoU7z3kYlpph2vCbELXC7Xz7KHHFFxp+kUamJ+2t9
         dm3GhM0EF/kBYDcV4aolDZWukCmIZLXLm0S/7lOnmYDmfWx2bXT8IAoB5M2ySYkW81R6
         OwqTPM8Mmz+pvtNjtE08dy7FSYk83CiICoZ3T0XbLHiHP2uCmXSJx8dpH5opGReUsrBT
         +ZdwGnyizkf+X3ghhIckgWqo99alISOiAjxja7b54BzRqLLQC08qLJ3JV75Owq/K5Cnu
         KEx8+jwyEyu1XmrqlWoxhgk6SsExL+WZ+xYT05K+Yj5/p26r54DSCHzJFSvFUdQ92zBQ
         dzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAfhATkIYXFpgazLFZ+AK9Lq1o03ZdKMm34LM7SHmEU=;
        b=Ix4z3u+RlwtpcSO1U/hsS9gUneo8ln8JljhWJ3ZWT2gvFeELefoFlZsVjhAQmkANOt
         ZLNDoE9zoNNALzi4thvUlsDxi3h+fv2iDDKStOs0m/ZeTcFG/xbxLh6I3qx63667J2CT
         NeRSfr4aQsZ46TqJ3S1JfJusoRO54S1xesFhtDIwQu0ZoNZtXFUDYC22oTHoGYc+yzE2
         esq9Fgta8tw5kEns/gSomH5kfAUeHlYyyyrAjIwYuJYnLeX70Jkkp836FvfxtLgBFlYM
         3eyzM4pkPm1z1+7TwEn9n2MRE6BQFdImdH2yupdigqbF+WsScqaPKNWq9/EAKw53H34e
         Rm/A==
X-Gm-Message-State: AFqh2koY/WHhcPuzCjwfgA4XXnS30IVHupsLbps8ENbIk6eoG25z/cli
	ezhT+98e1QK3++pg2+VnaCVOLA==
X-Google-Smtp-Source: AMrXdXu9fepmPpgEfQ6cshSmsZ+6857dtpUM6/8+Vafn1HbdY34/Rzfs18skEvxTNG6/20H2UhzJ3Q==
X-Received: by 2002:adf:dec7:0:b0:242:115d:bee4 with SMTP id i7-20020adfdec7000000b00242115dbee4mr32938927wrn.16.1672996867159;
        Fri, 06 Jan 2023 01:21:07 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z8-20020a5d6548000000b0028df2d57204sm689153wrv.81.2023.01.06.01.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:21:06 -0800 (PST)
Message-ID: <4d6aec55-c53e-0aba-1168-8a9a80a3b598@linaro.org>
Date: Fri, 6 Jan 2023 10:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] dt-bindings: arm: sunxi: document MangoPi MQ-R board
 name
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-4-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106010155.26868-4-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_012108_681305_7EB38BEB 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?= <szemzo.andras@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/01/2023 02:01, Andre Przywara wrote:
> The MangoPi MQ-R board is a close relative to its Allwinner D1/D1s
> siblings, but features two Arm Cortex-A7 cores instead of a RISC-V core.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 3ad1cd50e3fe0..ce445c5ed81c8 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -843,6 +843,11 @@ properties:
>            - const: wexler,tab7200
>            - const: allwinner,sun7i-a20
>  
> +      - description: MangoPi MQ-R board
> +        items:
> +          - const: widora,mangopi-mq-r

Not documented vendor prefix.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
