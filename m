Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B67CC432BE
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 01:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A1261075
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 01:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10A1261075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58d0m1o7QML45jqshJdZcOXdwrPfvJItLR+WZmZP3Xg=; b=W/P6HniwBTNCsy
	qroqlp3FctWmQXBrR1jTx+VMJLm8OJxd/pZToFKpWZ8FPvTQ0WXDSjqIbhpmxjEGBEKb3Wj5IlgsN
	SEWO+ldF23WMvosKamET9hvaxvoFXcgB+c41LHyO3EXulihcpW4Pfo+RFrDC/YRxoTMuMx0N9NFVI
	P9kdkdFAowERBB99lYC0uXbpDH0CulCN3SKr0mlf52ddfFwg0tnSh37Ft/nzPENaHtWYE8pBPYeL1
	UJN5ND8AO5MtPU6ehLrRAOOjrwGsQDll4jfNBEyfC2xhl5TZmlvzbeFcb2yAxGnLeaCyi9SU0DhFa
	2q2n6pWZ437WrxABC6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLF4i-003VCI-VO; Wed, 01 Sep 2021 01:30:00 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLF4g-003VBq-9a
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 01:29:59 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso1604914ots.5
 for <linux-riscv@lists.infradead.org>; Tue, 31 Aug 2021 18:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e7d5LjRjv/FxWQd5I6d33tUIdmNpt47w5kqmkdntcuc=;
 b=HnOcwV+h+5b1XKaUHfoPgpyTPgFkthvqUyHMUVBH2gR9j5nLg3QQrbXtmxTh11AEB1
 HEXJx8IjReAsqCKqTBLeYymNeChRHpgPz7DJZiwda3kSmTieb70jr0nuKsWAYgws8nw1
 fXnBznLikHts03VAS8XLcR9Khu9cMYISZ50e0CzTqz0eFBXjk1ooGSlUStAd0f0AX64J
 w2ZPxFgtvf/5ifT1jo6u/Awx6vVp/bhaoKsSmq334Nf7HBojQsR52UFhhn2X5IjKRs/i
 +cv6otSz81X8Q8bTwkQX3HIs0wNe/GhG81YQQmq4wpOaZUzY9qxCLVRuN8Oa1HSD+XqI
 pWWQ==
X-Gm-Message-State: AOAM531PEwOUuIovIu9vDY2F+M6bFD06XfE6zpbOMDnzUVwVIlWJODep
 q92bhqvo3Bca4y9gOesgXw==
X-Google-Smtp-Source: ABdhPJzBDFJDVzRlaPUw+CRMfKPXCEl+gtanjAG1ln+T+b5zLvTvzhoVApRz+cSE4BL+u8dcr+Urwg==
X-Received: by 2002:a9d:5e05:: with SMTP id d5mr28375862oti.61.1630459797200; 
 Tue, 31 Aug 2021 18:29:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v11sm4356634oto.22.2021.08.31.18.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 18:29:56 -0700 (PDT)
Received: (nullmailer pid 997400 invoked by uid 1000);
 Wed, 01 Sep 2021 01:29:55 -0000
Date: Tue, 31 Aug 2021 20:29:55 -0500
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v3 06/11] dt-bindings: timer: Update SiFive CLINT
 bindings for IPI support
Message-ID: <YS7Xk/Np2yc1/wrb@robh.at.kernel.org>
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-7-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830041729.237252-7-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_182958_381844_81DF085D 
X-CRM114-Status: GOOD (  19.47  )
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

On Mon, Aug 30, 2021 at 09:47:24AM +0530, Anup Patel wrote:
> The Linux RISC-V now treats IPIs as regular per-CPU IRQs. This means
> we have to create a IPI interrupt domain to use CLINT IPI functionality
> hence requiring a "interrupt-controller" and "#interrupt-cells" DT
> property in CLINT DT nodes.
> 
> Impact of this CLINT DT bindings change only affects Linux RISC-V
> NoMMU kernel and has no effect of existing M-mode runtime firmwares
> (i.e. OpenSBI).

It appears to me you should fix Linux to not need these 2 useless 
properties. I say useless because #interrupt-cells being 0 is pretty 
useless.

> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 20 ++++++++++++++-----
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  2 ++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    |  2 ++
>  3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a35952f48742..9c8ef9f4094f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -43,6 +43,12 @@ properties:
>  
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 4095
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  interrupt-controller: true
>  
>  additionalProperties: false
>  
> @@ -50,15 +56,19 @@ required:
>    - compatible
>    - reg
>    - interrupts-extended
> +  - interrupt-controller
> +  - "#interrupt-cells"
>  
>  examples:
>    - |
>      timer@2000000 {
>        compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> -      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> -                             &cpu2intc 3 &cpu2intc 7
> -                             &cpu3intc 3 &cpu3intc 7
> -                             &cpu4intc 3 &cpu4intc 7>;
> -       reg = <0x2000000 0x10000>;
> +      interrupts-extended = <&cpu1intc 3>, <&cpu1intc 7>,
> +                            <&cpu2intc 3>, <&cpu2intc 7>,
> +                            <&cpu3intc 3>, <&cpu3intc 7>,
> +                            <&cpu4intc 3>, <&cpu4intc 7>;
> +      reg = <0x2000000 0x10000>;
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
>      };
>  ...
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 5e8ca8142482..67dcda1efadb 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -105,6 +105,8 @@ clint0: timer@2000000 {
>  			reg = <0x2000000 0xC000>;
>  			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
>  					      &cpu1_intc 3 &cpu1_intc 7>;
> +			#interrupt-cells = <0>;
> +			interrupt-controller;
>  		};
>  
>  		plic0: interrupt-controller@c000000 {
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index b9819570a7d1..67fb41439f20 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -168,6 +168,8 @@ &cpu1_intc 3 &cpu1_intc 7
>  						&cpu2_intc 3 &cpu2_intc 7
>  						&cpu3_intc 3 &cpu3_intc 7
>  						&cpu4_intc 3 &cpu4_intc 7>;
> +			#interrupt-cells = <0>;
> +			interrupt-controller;
>  		};
>  
>  		plic: interrupt-controller@c000000 {
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
