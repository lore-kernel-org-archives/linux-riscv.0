Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB472CA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrDVndE8iJHOfZYfFGOQC6/dcFfw39nXY01nDlwhFj4=; b=kfKPF8d3cVxn1s
	Z3eS50QAo4ijCcjAjmcSe8CtZMt1QkyHE5k121k8eLuxB5KrwCknr4hY7CeF6zjC55YtUuRUxR2Sm
	5c5o2HjcA3/ngyr/MZvceqRzwAh+w68NslwoZDEEtPbwIj27RK6T10bBXGg8o1nqYWfw9D5MYClC8
	6aH03owCLefX4O/umFkXhjVL92RenmEz1/j6hZfK8LNP/EqtmOBVvmH9Qr8nZQf9dleIu/aOD0Vd2
	FpqGMdKdX2ZvLFuX4s+5VTfoCYeg9tDSZqSyPzpR5Gc5xhSNL5Pl7vJyHqvdgu6JPsgweDcOsY34n
	3rasDe/azFXW/Ct7EHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxSF-002Li2-1f;
	Tue, 12 Sep 2023 07:04:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxSA-002Lgh-0S
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:04:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso56312585e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 00:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694502290; x=1695107090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LYSAyqOGAquE7WJUWpSo20AQyTJGIFtgc4llB7UU2A=;
        b=OXSzZ7ibDHrqyzeQNVleuivCnvXNuiuc3Wlmg1JHfW5DvHkgEaNi+7AFQy1/IyEDKJ
         FZeaiJJ9JpslMrf3SeObNLtFAtY248aLjbNl8iez7PSlOGo38UQqDolr6AuIEmWogScv
         EJqBCShtJQSFNnWOFcWr05lee00vIKf0kFI26knN3L+yBLbUQhI1lQwgZFuBf/OYyZZK
         rui3S2LIt3Aql43oZ3gCDNPChPmYuhEymikpzlrh2MkcvYTxcpJDmDoNVEjx6u/4VUa+
         KRSMMdj2ju71imrGHOaQMQF2R92IW2XyIqXpYPd31/MmD1v3u+8/t1vxRoDnNO5FUtbO
         holA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502290; x=1695107090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LYSAyqOGAquE7WJUWpSo20AQyTJGIFtgc4llB7UU2A=;
        b=rtwr6Tt/AHkymN15WigTsm2gMQUV1yi3fkSJVfomFqZGnCZYQsYR0IZfUaFxFzY2ld
         4o/7MeAB6j2f+KZ4u8xQCMyU1y4OR+exPvxsdK/RFdhAxdSot7+gw9izSAiLJdNpMCFZ
         fz2tXuFa6gJCCuMGVGdrYAKf+L0XhaP579nkWpEz0NzXjwy9Slkvbo4C6vB5VukwgvfS
         /7OanU6Zbg3eZ+tIk6+bxzDR0GL4fjqXjAVzwKBitb2HF5cQGYI5QZa7EYno0xYvHeHT
         xTIlywp/0TtX71SIQJQpBQVGc89CCn81t5MUQwmxUTwfzd7jX1KnvXT+a5OhHrVJwrIC
         cKAg==
X-Gm-Message-State: AOJu0YykCks+nExcjY/IvO0Vz4BySQLWkt8RS9ipgne/v7Wd+9zMjrdA
	bxLwRTxTc+igUtowNIEa2IaKcNzL150IyA2hoNY=
X-Google-Smtp-Source: AGHT+IGDPgmBAH+Gv4gPep6zQB5ZcHI+8juP8EnWdQ5W/MaG4tXyzUAhDYJSgVfdo5qrPdjOy7lXrA==
X-Received: by 2002:a7b:cc8e:0:b0:3fe:687a:abb8 with SMTP id p14-20020a7bcc8e000000b003fe687aabb8mr10368161wma.7.1694502290167;
        Tue, 12 Sep 2023 00:04:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a16-20020a5d4570000000b00317f70240afsm12024520wrc.27.2023.09.12.00.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:04:49 -0700 (PDT)
Message-ID: <9da4efe6-bbff-62af-8d05-b05cf12a4c31@linaro.org>
Date: Tue, 12 Sep 2023 09:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] dt-bindings: reset: Document th1520 reset control
Content-Language: en-US
To: k.son@samsung.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
 guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230912024914.3769440-1-k.son@samsung.com>
 <CGME20230912024917epcas1p4bb4d649f97b592c3245b10b6450d32cf@epcas1p4.samsung.com>
 <20230912024914.3769440-2-k.son@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912024914.3769440-2-k.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_000454_177884_F2CC77E3 
X-CRM114-Status: GOOD (  16.12  )
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

On 12/09/2023 04:49, k.son@samsung.com wrote:
> From: Kwanghoon Son <k.son@samsung.com>
> 
> Add documentation to describe th1520 reset device

Full stop.

> 
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>

This is v2, not v1. Please provide changelog after ---.


> ---
>  .../bindings/reset/thead,th1520-reset.yaml    | 47 +++++++++++++++++++
>  include/dt-bindings/reset/th1520-reset.h      |  9 ++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>  create mode 100644 include/dt-bindings/reset/th1520-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> new file mode 100644
> index 000000000000..6724a9ccdd55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD th1520 SoC Reset Controller
> +
> +maintainers:
> +  - Kwanghoon Son <k.son@samsung.com>
> +
> +allOf:
> +  - $ref: /schemas/mfd/syscon.yaml#

Why do you need it? Which existing file suggested such code?

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: thead,th1520-reset
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/th1520-reset.h>
> +
> +    soc {
> +      #address-cells = <2>;

Your indentation is messed up. Here two spaces, further four. Just keep
one indentation for the example - 4 spaces.

> +      #size-cells = <2>;
> +
> +      reset-controller@ffef014000 {
> +          compatible = "thead,th1520-reset", "syscon";
> +          reg = <0xff 0xef014000 0x0 0x1000>;
> +          #reset-cells = <1>;
> +      };
> +    };
> diff --git a/include/dt-bindings/reset/th1520-reset.h b/include/dt-bindings/reset/th1520-reset.h
> new file mode 100644
> index 000000000000..ec10751814e5
> --- /dev/null
> +++ b/include/dt-bindings/reset/th1520-reset.h

Filename matching bindings/compatible - missing vendor prefix.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
