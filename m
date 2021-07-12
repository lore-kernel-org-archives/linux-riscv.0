Return-Path: <SRS0=emcE=ME=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA367C07E99
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 19:22:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A391E610FA
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 19:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A391E610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zaVObGQxw3CSYbgtPZq57GYIA9tAPf7DgdfOt0gIq8=; b=i0SZklkwf5RaGA
	nJCUgnDngTYTSBsK3Upgzht5/sIQDnJ4ObFXQkH9F/I1M2UZlkOOq5PsG2OpANaZEii8jS/rFPpEF
	YNscj3vmjQbQNbrJBRLN2fU78K1C4RDnFZZvzt0ctfIn0zN4aMTnVezr9n2EL75q4EAs4XBVCVaXL
	SafRyLSEuOgMDiaDJnK4Q3AvRWjk+bKK6KR3InRIfPJyVng48/gi4R5CCmGFMrw3G1OUipr4VP4/V
	ad45zBWSQ6Az+CTmKmTW8NrJq+TtEzzM5xK8SUKzfWPYE+2j3DIkdOkSd2PvA/o2T2FDxB2YlAcjw
	ZiGWwGs9xO4x2HmGzJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m31VR-008HDJ-W7; Mon, 12 Jul 2021 19:22:18 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m31VP-008HCd-6V
 for linux-riscv@lists.infradead.org; Mon, 12 Jul 2021 19:22:16 +0000
Received: by mail-io1-f44.google.com with SMTP id x10so5260716ion.9
 for <linux-riscv@lists.infradead.org>; Mon, 12 Jul 2021 12:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mDv0toh0cQVMFqilKq+GF6LWR9g5w4GKINdo+Jev2uw=;
 b=hkRPSccUAwX8harw8MH58b6JsWLGrsWqNsawBSDpufpl54XmIV7nYSXja2cNLVgwlo
 tnCtpJa7khFZrJ2X8AG7/79kWETHRKq+bDgdhS4PZoBC8jbjc18RM66+ljb73U8AsaDO
 66eiRGeM38I3S4sHe7cw+Ok9CScpgU/97mBpsMM1bID5HdaYBtzvnkcSv0Jr5RlWCaEi
 hAnd+nQddhs8HtjQujyYQ698QeyfaitGql+6OGV6BM/wAaz5i3I9BoqAuv9sQkD89Gme
 JGR3EjiiofkVWR8hkKEDoGVgP0K3Fqoij0kyh82+V4zNmMC8gQ0mlBb0qlyEMYsSnZBq
 cF1A==
X-Gm-Message-State: AOAM5310eFJHyKibMrnx6yKKEjBG5ipgMosIg3UC4/9k+vpSULivQfqA
 jj9MvjrC5atF3Ikm9rEh3A==
X-Google-Smtp-Source: ABdhPJytLe7NQalz459T4TdlUoU6293ep7Lg1k0viCmW246+EOjRDgIgM8y8fNL9EeOrgI8eS7nU4g==
X-Received: by 2002:a5d:91d8:: with SMTP id k24mr376352ior.84.1626117730689;
 Mon, 12 Jul 2021 12:22:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id j24sm3350224ioo.16.2021.07.12.12.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:22:10 -0700 (PDT)
Received: (nullmailer pid 2333729 invoked by uid 1000);
 Mon, 12 Jul 2021 19:22:07 -0000
Date: Mon, 12 Jul 2021 13:22:07 -0600
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
Subject: Re: [RFC PATCH v2 06/11] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
Message-ID: <20210712192207.GA2322460@robh.at.kernel.org>
References: <20210618123851.1344518-1-anup.patel@wdc.com>
 <20210618123851.1344518-7-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618123851.1344518-7-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_122215_290787_147F561D 
X-CRM114-Status: GOOD (  23.01  )
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

On Fri, Jun 18, 2021 at 06:08:46PM +0530, Anup Patel wrote:
> We add DT bindings documentation for the ACLINT MSWI and SSWI
> devices found on RISC-V SOCs.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  .../riscv,aclint-swi.yaml                     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> new file mode 100644
> index 000000000000..b74025542866
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
> @@ -0,0 +1,82 @@
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
> +    items:
> +      - enum:
> +          - riscv,aclint-mswi
> +          - riscv,aclint-sswi
> +
> +    description:
> +      Should be "<vendor>,<chip>-aclint-mswi" and "riscv,aclint-mswi" OR
> +      "<vendor>,<chip>-aclint-sswi" and "riscv,aclint-sswi".

The schema doesn't match the description.

There's no actual vendor implementation yet? You could do:

items:
  - {}
  - const: riscv,aclint-mswi

But then your example will fail.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  interrupts-extended:
> +    minItems: 1

You need maxItems too. I guess this based on number of cores, so just 
pick a 'should be enough' value.

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
> +      interrupts-extended = <&cpu1intc 3 &cpu2intc 3 &cpu3intc 3 &cpu4intc 3>;

interrupts-extended = <&cpu1intc 3>, <&cpu2intc 3>, <&cpu3intc 3>, <&cpu4intc 3>;

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
> +      interrupts-extended = <&cpu1intc 1 &cpu2intc 1 &cpu3intc 1 &cpu4intc 1>;

Same here.

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
