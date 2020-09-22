Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF9FC4727E
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 20:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D54238A1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 20:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SynF0945"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46D54238A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u5fqu2Mw4WTj2e5ulsOz9CySqFgUSJSOPIWiaLp+xMQ=; b=SynF0945AK/3zeFUnMyFnKRv0
	3v6ZyM33P/YkSN+X38aTtgBH2abM2TwEXyRwJbDrH8TA5+790Vlpa+P4bZDb1Vp+bQTiCbL541x7k
	oZ2khjSN3/Z0sAelrFuRWa2ONwFIe2p+lf7R80MPU2Qmm7SWwncCFxwjdAeEDszkK4taIb/iQR5+l
	aUXX42Kc4mk4iYD8+WuyxJx+WwZ9g8fgMOSO70dpIFJMirPYgwhFPd3ZiM+Q0hnasIOBc6hI4I7S2
	NauwGmkcW75tpuJF15rUt8ewkFyJhO2iEOLNQEWN5vw4cpDHJmRhtyoTexQwnPfVXRoU5L74fWVJj
	j2yALG6ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKozj-0004R3-KF; Tue, 22 Sep 2020 20:34:35 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKozg-0004QM-9a
 for linux-riscv@lists.infradead.org; Tue, 22 Sep 2020 20:34:33 +0000
Received: by mail-il1-f196.google.com with SMTP id x18so16194579ila.7
 for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2020 13:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GVXRqEHXrZ3iuCE86AKACwgjvepk2Jk8PvwnmbjbrKk=;
 b=KHQ+INEpQCyOvvuXzX1T4MwVbUTD7676h/F5mnGCTOk1Lt6pMJYcXRWikqocx/ifay
 +ju19XtidkvCqL2X1J9MPYwo5J0XizlaiJ1BY8tjFBZLIWRhSrqVVLsjyo355u8DpjMF
 gtXTmg8BoO0T4Jd/OhlACmraLhGicEgMF1/ldmxCqvgfz8phYoEIM0egqDe1WbbR5CcG
 FJC04T+TvFU1riY3vz48ZdDiifnEOBSqCvfeNCjGhNMrcCEFHJ0w6pQwzdvu+txtsHJp
 WhDhmuJPq7gpGDmHk9Bf5tJEt2Dlh/LbTmJ41kkjMv3V4rr1GNl+Wnq2WEYcInLmeChN
 tYEA==
X-Gm-Message-State: AOAM5309gF1pZIb9stx36NdkTZIsKX4M1npnrelozAMmQEZ/Jzad6SmC
 qKntCskNhup3Pf9l0htfrg==
X-Google-Smtp-Source: ABdhPJztkpG3s/gqZ3SqL0LUOYMffJ8BBUk3C1/1qIyhG4fiknVIIXEF6njrh2KnCmWxFJA9J7gVQA==
X-Received: by 2002:a92:6b0d:: with SMTP id g13mr6189676ilc.242.1600806871421; 
 Tue, 22 Sep 2020 13:34:31 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c5sm1008173ill.1.2020.09.22.13.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 13:34:30 -0700 (PDT)
Received: (nullmailer pid 3195166 invoked by uid 1000);
 Tue, 22 Sep 2020 20:34:29 -0000
Date: Tue, 22 Sep 2020 14:34:29 -0600
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: riscv: convert plic bindings to
 json-schema
Message-ID: <20200922203429.GA3188204@bogus>
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
 <1599734644-4791-3-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599734644-4791-3-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_163432_379400_ADFA3E39 
X-CRM114-Status: GOOD (  30.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, aou@eecs.berkeley.edu, tglx@linutronix.de,
 jason@lakedaemon.net, devicetree@vger.kernel.org, sboyd@kernel.org,
 maz@kernel.org, mturquette@baylibre.com, u.kleine-koenig@pengutronix.de,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com, thierry.reding@gmail.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 lee.jones@linaro.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 04:14:03PM +0530, Sagar Kadam wrote:
> Convert device tree bindings for SiFive's PLIC to YAML format
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../interrupt-controller/sifive,plic-1.0.0.txt     |  58 -----------
>  .../interrupt-controller/sifive,plic-1.0.0.yaml    | 107 +++++++++++++++++++++
>  2 files changed, 107 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
> deleted file mode 100644
> index 6adf7a6..0000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -SiFive Platform-Level Interrupt Controller (PLIC)
> --------------------------------------------------
> -
> -SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
> -(PLIC) high-level specification in the RISC-V Privileged Architecture
> -specification.  The PLIC connects all external interrupts in the system to all
> -hart contexts in the system, via the external interrupt source in each hart.
> -
> -A hart context is a privilege mode in a hardware execution thread.  For example,
> -in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
> -privilege modes per hart; machine mode and supervisor mode.
> -
> -Each interrupt can be enabled on per-context basis.  Any context can claim
> -a pending enabled interrupt and then release it once it has been handled.
> -
> -Each interrupt has a configurable priority.  Higher priority interrupts are
> -serviced first.  Each context can specify a priority threshold. Interrupts
> -with priority below this threshold will not cause the PLIC to raise its
> -interrupt line leading to the context.
> -
> -While the PLIC supports both edge-triggered and level-triggered interrupts,
> -interrupt handlers are oblivious to this distinction and therefore it is not
> -specified in the PLIC device-tree binding.
> -
> -While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> -"sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> -contains a specific memory layout, which is documented in chapter 8 of the
> -SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> -
> -Required properties:
> -- compatible : "sifive,plic-1.0.0" and a string identifying the actual
> -  detailed implementation in case that specific bugs need to be worked around.
> -- #address-cells : should be <0> or more.
> -- #interrupt-cells : should be <1> or more.
> -- interrupt-controller : Identifies the node as an interrupt controller.
> -- reg : Should contain 1 register range (address and length).
> -- interrupts-extended : Specifies which contexts are connected to the PLIC,
> -  with "-1" specifying that a context is not present.  Each node pointed
> -  to should be a riscv,cpu-intc node, which has a riscv node as parent.
> -- riscv,ndev: Specifies how many external interrupts are supported by
> -  this controller.
> -
> -Example:
> -
> -	plic: interrupt-controller@c000000 {
> -		#address-cells = <0>;
> -		#interrupt-cells = <1>;
> -		compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";
> -		interrupt-controller;
> -		interrupts-extended = <
> -			&cpu0-intc 11
> -			&cpu1-intc 11 &cpu1-intc 9
> -			&cpu2-intc 11 &cpu2-intc 9
> -			&cpu3-intc 11 &cpu3-intc 9
> -			&cpu4-intc 11 &cpu4-intc 9>;
> -		reg = <0xc000000 0x4000000>;
> -		riscv,ndev = <10>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> new file mode 100644
> index 0000000..95c8c85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (C) 2020 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/sifive,plic-1.0.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Platform-Level Interrupt Controller (PLIC)
> +
> +description:
> +  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
> +  (PLIC) high-level specification in the RISC-V Privileged Architecture
> +  specification. The PLIC connects all external interrupts in the system to all
> +  hart contexts in the system, via the external interrupt source in each hart.
> +
> +  A hart context is a privilege mode in a hardware execution thread. For example,
> +  in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
> +  privilege modes per hart; machine mode and supervisor mode.
> +
> +  Each interrupt can be enabled on per-context basis. Any context can claim
> +  a pending enabled interrupt and then release it once it has been handled.
> +
> +  Each interrupt has a configurable priority. Higher priority interrupts are
> +  serviced first.  Each context can specify a priority threshold. Interrupts
> +  with priority below this threshold will not cause the PLIC to raise its
> +  interrupt line leading to the context.
> +
> +  While the PLIC supports both edge-triggered and level-triggered interrupts,
> +  interrupt handlers are oblivious to this distinction and therefore it is not
> +  specified in the PLIC device-tree binding.
> +
> +  While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> +  "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> +  contains a specific memory layout, which is documented in chapter 8 of the
> +  SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> +
> +maintainers:
> +  - Sagar Kadam <sagar.kadam@sifive.com>
> +  - Paul Walmsley  <paul.walmsley@sifive.com>
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Don't need this. It gets selected matching on node name.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,plic-1.0.0
> +      - const: sifive,fu540-c000-plic

Somehow these ended up in the wrong order. Should be most specific to 
least specific.

> +
> +    description:
> +      Should be "sifive,plic-1.0.0" and a string identifying the actual
> +      detailed implementation in case that specific bugs need to be worked around.

Drop this.

> +
> +  reg:
> +    maxItems: 1
> +    description:  Should contain 1 register range (address and length).

Drop this. The schema says this...

> +
> +  '#address-cells':
> +    const: 0
> +    description: Should be <0> or more.

Drop. 'or more' is wrong. If there's a case with more, it will need to 
be documented.

> +
> +  '#interrupt-cells':
> +    const: 1
> +    description: Should be <1> or more.

Same here.

> +
> +  interrupt-controller: true
> +
> +  interrupts-extended:
> +    minItems: 1
> +    description:
> +      Specifies which contexts are connected to the PLIC, with "-1" specifying
> +      that a context is not present. Each node pointed to should be a
> +      riscv,cpu-intc node, which has a riscv node as parent.
> +
> +  riscv,ndev:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description:
> +      Specifies how many external interrupts are supported by this controller.
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +  - reg
> +  - interrupts-extended
> +  - riscv,ndev
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    plic: interrupt-controller@c000000 {
> +      #address-cells = <0>;
> +      #interrupt-cells = <1>;
> +      compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";
> +      interrupt-controller;
> +      interrupts-extended = <
> +        &cpu0_intc 11
> +        &cpu1_intc 11 &cpu1_intc 9
> +        &cpu2_intc 11 &cpu2_intc 9
> +        &cpu3_intc 11 &cpu3_intc 9
> +        &cpu4_intc 11 &cpu4_intc 9>;
> +      reg = <0xc000000 0x4000000>;
> +      riscv,ndev = <10>;
> +    };
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
