Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FB3C87FD2
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Aug 2025 04:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92a6doHskH/hacA7RrzF53cjWoIB+ncUVxvb664UrnM=; b=y/GXG4lcCA3x5B
	EXEkv5AMhfPz/JlEMLH7N6ZdBJm4a7DpXMid8QPZGwIQiLO81AS2BnEujOQMRpfalnTJlJk/Cx4kv
	50P4MxyNHov5vg0tHBx4VECC+A7sjONcI7TSfzCMyO8szYTuXIO7qT11UGjen9nzmpbxu+EoqckY7
	X8pR5DPY6OT9TuqE0P6zfMwuYYY9pAEESgx4iSGXNPsXDtD2nb6PwcSXXswx12kWA3wYCeTEXKY8x
	jLNGj0nsTZYSOiUXazs0AjiTqqNuNrvuyI+CVUgLMlqzPT+0ea3jAucuFxp29SZ/HI9gU7IjV7UF4
	R/YfgxPvc4iJFELImIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui3dn-00000007A2A-0UOH;
	Sat, 02 Aug 2025 04:14:39 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui3bj-000000079uZ-4BvD
	for linux-riscv@lists.infradead.org;
	Sat, 02 Aug 2025 04:12:33 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e3dbda56a5so6754355ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Aug 2025 21:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1754107951; x=1754712751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ip2rHPlCiGFGcr5YGyF7kmeRLuJtKeayor/PNig1fgE=;
        b=ge3FQk+tyGHqayXt6xbatUoXS6RegsZ8Z5I/OPCvgFhYdartSm5f6f6mkDKjG8Et4w
         rbdi24Ieeaq1r9xEJmbghwewf5cDB7KLk2RVUC08C29zRzmJJyqWoNUDnA0oUzvLfusD
         h1CxXfMJPU0W1lPuL+GeaqTbAwnpHjWcpRNrUd+oigTODXfnr0c9mF9QApB/xTLRTElL
         yhAYTjeJ1yF/XYmstMOScxQwIV/XUFYQ1SVfpZaUs4aQly6PH0aXja8QlkCB6Eaabup9
         zsG63L9GNhEwUhYr2n7yboDr1CxTyckMZw3RyOtoNR913P/gRcSrDLhLTFUsjzU8/fRp
         iwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754107951; x=1754712751;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ip2rHPlCiGFGcr5YGyF7kmeRLuJtKeayor/PNig1fgE=;
        b=Bu/vMkqGx8m99MniC/uWjG8s1005RPP+NbJq4J/iFF1EWamXsk+CTzitEK3PJzll7a
         bbgH/4rsuJHTLx9WDjyPbTDHaogYC2mckle5vvrJvcpYMIfy2Hpw0CBoN6CM+OcuucmP
         OmiJ9akDmJmyVfGHZPOTfPtmrm3+ipLy+4pcmRNkSiAdwSbw9SqNl6Wd+scUpJvM0kz4
         K6IO1hQprozkbeXNjFLpdRWDTXb2R9311Ef0owihFhH/ttF1v6vDkUJlLobs/w72WxUq
         F/jiHtnZiPMgiRPBpR0ce6ro3KjYyl3QRwuBAz+Rj2/eTzTTs9HvUN5SIYyquN4nl6X5
         qqlw==
X-Forwarded-Encrypted: i=1; AJvYcCXubk/CJM+U1uChvvZFZcZ2VIWwf2zICuXAlkL/AlyCnZ6jBNlnQB32yYpysFdWGHLXI1TnP4J1YA8gWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdLQu8nPCZiEqcf/tBgn4mm1BPhilRWeU36UkfqUCMI4Rkv4bB
	kL8i+NWGQu77D0GBay3wpWFEGSvEhPXs+zcBSbsqvfHXvBrjxsQBz75eh9o1iKZQNVY=
X-Gm-Gg: ASbGncvYAs2lIECzU/402NQ/ZhDNRWvs9/vsCZp77AMXTLnNU/DFZd2dT47h2IMOPvc
	sREzXhpEiHUHzVujIxL1qx1Xp7vZa33a+Aof9v44+M8PNvlMuD4Te0ntix509BBikhDLbzkMpBQ
	e9BOE152pVE388k5FYIxuHOq2c2r18bijRyJBHIVrsPcjHzI2hJoV25EgEnFPeLyUw5U5ReOyUQ
	avEjiCqVS+W/xvk+hxGnuaevA+jr7xFZ85NNgMnXuDQq3y8FYdGGD7imMXYlKcOPMFYm0D8K5rR
	1dwQDgEN5e5XAUIp1r2kwE+4zdR2am+/GJINIfs3ice6bOKWnr0TVFDnD4AeZ1k0lILuii7uG4F
	kLK7xnf5WqpB/E2uKZLTvBEWqGN2x9FmeygAGppnYpqBWZX9R
X-Google-Smtp-Source: AGHT+IFWXv/meUt6qnzrJTilZJBXyZAntv/HisFVx8CQALlAxTer9z3pL9Su5iQx9S/dGPdOHi5YGA==
X-Received: by 2002:a05:6e02:2487:b0:3e3:b6ab:f869 with SMTP id e9e14a558f8ab-3e416191ba5mr36293525ab.13.1754107950776;
        Fri, 01 Aug 2025 21:12:30 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55d5da1csm1652544173.65.2025.08.01.21.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 21:12:30 -0700 (PDT)
Message-ID: <612a13d3-d3a6-460b-90fd-c26e47b80711@sifive.com>
Date: Fri, 1 Aug 2025 23:12:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/24] dt-bindings: mailbox: Add bindings for RISC-V
 SBI MPXY extension
To: Anup Patel <apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
 <20250728094032.63545-3-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250728094032.63545-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_211232_131975_A9D52DC9 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On 2025-07-28 4:40 AM, Anup Patel wrote:
> Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
> extension as a mailbox controller.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> new file mode 100644
> index 000000000000..061437a0b45a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
> +  software to send messages through the SBI implementation (M-mode
> +  firmware or HS-mode hypervisor). The underlying message protocol
> +  and message format used by the supervisor software could be some
> +  other standard protocol compatible with the SBI MPXY extension
> +  (such as RISC-V Platform Management Interface (RPMI) [2]).
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,sbi-mpxy-mbox
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell specifies channel_id of the SBI MPXY channel,
> +      the second cell specifies MSG_PROT_ID of the SBI MPXY channel

What is the purpose of the second mailbox cell?

The client can probe the message protocol using a SBI call, if it doesn't just
assume a protocol based on the kind of node that references this mailbox. The
SBI implementation knows the message protocol from the kind of node that
instantiates the channel (for example riscv,rpmi-mpxy-clock has
riscv,sbi-mpxy-channel-id). So this cell looks redundant.

Regards,
Samuel

> +
> +required:
> +  - compatible
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mailbox {
> +          compatible = "riscv,sbi-mpxy-mbox";
> +          #mbox-cells = <2>;
> +    };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
