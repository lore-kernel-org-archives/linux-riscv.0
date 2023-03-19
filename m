Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4C1C7618A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNXE6atW9AwaPwP7i+OAHL+Ey6Jg0pMcPVmYZpbbBwQ=; b=lCUMoC/SjAad3T
	aCeiPHcHJs2I42rObbr1bt8hpkteP0o2owbdOCRC4e5Joto4XUErkIz7TFVtMaP0zG7/pvZD2LL5J
	tA76S0gNl+/uBi6iI8iQaRqhDN9XdJZcZz8k0qYWzSIx+dFOqsK2KbmCoNE4P7WxOK5IrVoZtw8pB
	mrhPcerKlVNmwYl2KM94LObbV2xmFvLZ9x1bpJvzrftZ3kt3AdH4Jcr9eWstn/7RYQ+FGFJ6njH4d
	i8m5EjwbrbVxXu8BZKYvBVrSkY/GFLgBLY7mPq+aqQ8+qVkbufZf8EKwzGEamD6VxzS2uRJn7Vags
	CMc7dh9d5185ySW6qwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pds8Y-006gog-0Y;
	Sun, 19 Mar 2023 12:27:46 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pds8T-006gnT-1P
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 12:27:43 +0000
Received: by mail-ed1-x52a.google.com with SMTP id r11so36901259edd.5
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpXswiCO9GB0qu55ryOfXAbsqOrMXNnhgIThuXGMTNY=;
        b=OaWSkRBcfDqZWIslAVamjhJiU3cHzQzosvRanoQ80UIEIXWiE7Snmef3ToMKGRsEDb
         Y2DJ/pRZ43GQ5LHSMf4Nant/F7oWYzoSCczgvmtsAofwXpUDHzvNMJyQ49x90lI/uqHK
         ejW8+O4MFn9sTyWdqt9uEQqTJRGzwDRwQl+BSxZXoEvwBKKuOXoQS/14jhzcx/GILPlB
         +4oDqHzdjmouOSgnR/1XEEJGEyMZ3r1XhKZJTJpCzNQnmbx6mWaJGm+27t08qhz1Q4ai
         uOoczqEUyVmzDPnEMNdTAxHdU2bb+uuJOSeB6i8aEmOqr3VtjU2TJeuMuvnpg42LFdJi
         80kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpXswiCO9GB0qu55ryOfXAbsqOrMXNnhgIThuXGMTNY=;
        b=jMFiXNmCp9sSIkrUm7+rgAd8uZbH8pkiIuNJJTm5mMJMz5PWfbv3tS/vsTyVpmyH22
         jD/tI+gtjOsMIji2P2uoRmmrJLilFiMowBn6Q4ZbJijLEbHKehYEBnrfRVR7NvxFFCSH
         yn7ffc6CqjdWmxQ99rezRPzju7047WyUxhdkf/uYmNOCKCyVSQjvgi2qkydPpRyIPaal
         zSx7XzUFgnCJIDr6XEeSB7rCah4dZAvQVHzW9VVI9pAGAXWpO0jsFwL0/MBzjr0Sgp/O
         CbNo5JHaO10ESMz5c8Fjjy7cjxe2IdAgKC0en0sdi1GhyRq/6N84EzWVS/s72rIo2mME
         Up5Q==
X-Gm-Message-State: AO0yUKVswYLR0dYpHmGqgZKmK1TnAYW/xMNvunnhkfGa+IBoe1pkt9+x
	TZADOOnhJXIbxAr/Cwpcp8I3aQ==
X-Google-Smtp-Source: AK7set9PEnNM5+lFe8SRWo0V5rbiUBCudxT8Q1O2pMeHvat/q7nGBevUPI6NChgGzdYoQQdm9E1nBw==
X-Received: by 2002:a17:906:6055:b0:907:183f:328a with SMTP id p21-20020a170906605500b00907183f328amr5567888ejj.65.1679228859492;
        Sun, 19 Mar 2023 05:27:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b008bc8ad41646sm3155993ejb.157.2023.03.19.05.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:27:39 -0700 (PDT)
Message-ID: <850bc37e-c6d1-2381-a851-965a4cbee8a0@linaro.org>
Date: Sun, 19 Mar 2023 13:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315055813.94740-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_052741_477888_BB0851A0 
X-CRM114-Status: GOOD (  14.46  )
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

On 15/03/2023 06:58, William Qiu wrote:
> Add documentation to describe StarFive System Controller Registers.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..ae7f1d6916af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |
> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7110-aon-syscon
> +          - starfive,jh7110-stg-syscon
> +          - starfive,jh7110-sys-syscon
> +      - const: syscon

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

... or your PLL clock controller was not tested.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
