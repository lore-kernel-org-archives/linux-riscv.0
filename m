Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5566AC432BE
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 01:25:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16CC460FF2
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 01:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16CC460FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56CwRNSv4Q1foYm59zbQCqKhQig5z3gxe0wlD7CBuSE=; b=Yx2t1JQVYbuXmi
	VuCb4iBmyF5ELDbecgHecTU3VpcBW2AbNUgr09u1qA+9mlyQXBzPEAno2Tz2Wd25xqGc2a5NmQ2s4
	emJmU8nH6MY+k+B+UwmrOkdj7RibW8DCTNOUWBF2pV8xoKA6PaSmVh/4XwtI+r64k2iAsekA3hw+D
	1YzCLQejsAEJUMKYm9NjldgioGp/M2NpLuycWTdOAR3mj+oRoTPzR32MZCe5MjheI6CojX9ACDMjX
	lOQzXsfIFqmMlwIb10EvidYs9NaN5qN5Kvi+9o4SQjxxymNrmqH/H+diZSMQpATLgsDTmt7zS6lEu
	uAn4wqcaTxX4KvaHMEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLEzT-003Umg-Cv; Wed, 01 Sep 2021 01:24:35 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLEzO-003Ulz-Oc
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 01:24:34 +0000
Received: by mail-oi1-f180.google.com with SMTP id r26so1749432oij.2
 for <linux-riscv@lists.infradead.org>; Tue, 31 Aug 2021 18:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VJN6Yn8anNyePkxZIH0sbBuDiAsFTMzSe4iTlv6qQOw=;
 b=DbTEQ+/dr2/veJQoGCLzuYLIIDfKVaDYGrNNhPAMHfbfS6+IscrSTNxWHySFkv4dpm
 h0UNZ0ajnXzsKcUnUpAHxNJGsyFdLxJ4DonShU7U37S6t5/C8CKATnerWfASNAa9Edyf
 LRdSCUWMNCSJhMoXLbqlLBmmecAH6OrVOikCHPPXbFlDz2669dcVw3ILj2mP+NIgv8RU
 WBfzoWb556YESKIpBdvE5rbkMJe9VwqeA8cXU8NgL7C6X3KglR8bgyDtPJ87NARaChtd
 jtFSh6HEltKkzLrI4xhzOEUyOwpGZy7qh1TiH5fkqISzfpZ/5F6oZV9VPIjzOJyIJgpH
 pCqw==
X-Gm-Message-State: AOAM533cqqLl+Za40LWMGlAWHcaYdbhbAxbdoN+bTPIyKIddenury7BC
 FpJ671kVSTnpuqy8VLr4Mg==
X-Google-Smtp-Source: ABdhPJyvzKX814iG5ZL8LMATnBzH0VmFI/oubUGGa/PHFQpVoPJj+dYVcpNcvUnZWp34KIDDfP1J1w==
X-Received: by 2002:a05:6808:690:: with SMTP id
 k16mr5361611oig.152.1630459469893; 
 Tue, 31 Aug 2021 18:24:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k23sm4055216ood.12.2021.08.31.18.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 18:24:29 -0700 (PDT)
Received: (nullmailer pid 990302 invoked by uid 1000);
 Wed, 01 Sep 2021 01:24:28 -0000
Date: Tue, 31 Aug 2021 20:24:28 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [RFC PATCH v3 05/11] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
Message-ID: <YS7WTPRYJWnPu2ii@robh.at.kernel.org>
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-6-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830041729.237252-6-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_182430_849831_7257CD22 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, Aug 30, 2021 at 09:47:23AM +0530, Anup Patel wrote:
> We add DT bindings documentation for the ACLINT MSWI and SSWI
> devices found on RISC-V SOCs.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  .../riscv,aclint-swi.yaml                     | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> new file mode 100644
> index 000000000000..68563259ae24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V ACLINT Software Interrupt Devices
> +
> +maintainers:
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  RISC-V SOCs include an implementation of the M-level software interrupt
> +  (MSWI) device and the S-level software interrupt (SSWI) device defined
> +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
> +
> +  The ACLINT MSWI and SSWI devices are documented in the RISC-V ACLINT
> +  specification located at
> +  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> +
> +  The ACLINT MSWI and SSWI devices directly connect to the M-level and
> +  S-level software interrupt lines of various HARTs (or CPUs) respectively
> +  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
> +  parent interrupt controller for the ACLINT MSWI and SSWI devices.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - riscv,aclint-mswi
> +
> +      - items:
> +        - enum:
> +          - riscv,aclint-sswi

All this can be just:

enum:
  - riscv,aclint-mswi
  - riscv,aclint-sswi

However...

> +
> +    description:
> +      For ACLINT MSWI devices, it should be "riscv,aclint-mswi" OR
> +      "<vendor>,<chip>-aclint-mswi".
> +      For ACLINT SSWI devices, it should be "riscv,aclint-sswi" OR
> +      "<vendor>,<chip>-aclint-sswi".

s/OR/AND/

There must be a compatible for the implementation. Unless RiscV 
implementations of specs are complete describing all clocks, power 
domains, resets, etc. and are quirk free.

But don't write free form constraints...


> +
> +  reg:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +  interrupt-controller: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +examples:
> +  - |
> +    // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):
> +
> +    interrupt-controller@2000000 {
> +      compatible = "riscv,aclint-mswi";
> +      interrupts-extended = <&cpu1intc 3>,
> +                            <&cpu2intc 3>,
> +                            <&cpu3intc 3>,
> +                            <&cpu4intc 3>;
> +      reg = <0x2000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +    };
> +
> +  - |
> +    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):
> +
> +    interrupt-controller@2100000 {
> +      compatible = "riscv,aclint-sswi";
> +      interrupts-extended = <&cpu1intc 1>,
> +                            <&cpu2intc 1>,
> +                            <&cpu3intc 1>,
> +                            <&cpu4intc 1>;
> +      reg = <0x2100000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +    };
> +...
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
