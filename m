Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A923DC2D0E2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 20:37:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F0120773
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 20:37:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ze5waoj7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F0120773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z9X8yf94BUWr0i69GyHZEmEoXwIpUiEnVphKDroUoNQ=; b=ze5waoj7K+MGS+RuWjbu7IjrO
	kZKSO0p3iVpy0Xps/5OhmM9tCoig1IM6NbJM/qSC37mIJKHbWzf9dQmptlDoLP9hg5jZXS3JZeHYf
	jm39d1B2SvPkuvuLptNBdA2pZSWCwjH25l4uIKcWQ2M0+pp1qlKkVXYH27ynwzw0uB5JVT9tWM+/B
	12QU3T5vinhcoYtmTHnAZanSdpeENh9XZncjihiJBfrDjwddjnyIoUaDGPgJsqr4bwiee+fO/kWVb
	x59KzjyIHR9jm6b/WS+gbG/I+IG2De3fM68SPRhSaBwYd8E8PsdFtcNAK8myz2JHH3Je38gYQ5Pwv
	pIo7RCPsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKp2R-0004vj-DL; Tue, 22 Sep 2020 20:37:23 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKp2L-0004uk-Hg
 for linux-riscv@lists.infradead.org; Tue, 22 Sep 2020 20:37:18 +0000
Received: by mail-il1-f195.google.com with SMTP id t13so18621816ile.9
 for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2020 13:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b6PLDdi8fxcl5wdYEMizGD4y37EzcneWERt48cXIEcA=;
 b=KSbVGQ7qTOGVnh5awxL/TW08HfYKhumOszgm9ocaXMHs3y/svSOIFYYu4GJSZFcz8H
 NfQR8oqktzSzgLkI8pXRGPKlNQcf30Kq7K8wPFPsSh3NDtBg7noXL8WBUvcgtoblAQFG
 WSraHyJVpmqajXQ4wdJnHNnfuQB/UKnBY8WrdFwoW1brCbDOD4H/UwZieG9lwTFqFLp7
 G6FXnr5w1E42z7nGECKVJp3JlAD6p/aLtEzmBKj4twGOKo83AXMt7sojSbebzzptSy5x
 QRW9JyRIu8fV3VYONQVR9n1xKAwqbjnZjRCgwZjD23lQczp98XP3Hll4XH7xbs6R41GQ
 petg==
X-Gm-Message-State: AOAM532ll2eghtDObxBiDdqLkIRKvz79JdOqU6kkNkbbXalZew9NK2QH
 AlZP9asfjRyxn0AieEnHmw==
X-Google-Smtp-Source: ABdhPJxILOHU26JjUwj1e2C2a7BUhOjbr/XE/OtmvaSBy6NijsR8Rg+QvKohpCO4W6NfvHoCKokbPw==
X-Received: by 2002:a92:bf0e:: with SMTP id z14mr5944896ilh.288.1600807036582; 
 Tue, 22 Sep 2020 13:37:16 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id i10sm7935475ioi.39.2020.09.22.13.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 13:37:15 -0700 (PDT)
Received: (nullmailer pid 3199568 invoked by uid 1000);
 Tue, 22 Sep 2020 20:37:14 -0000
Date: Tue, 22 Sep 2020 14:37:14 -0600
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: riscv: convert pwm bindings to
 json-schema
Message-ID: <20200922203714.GA3195489@bogus>
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
 <1599734644-4791-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599734644-4791-4-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_163717_679173_01BEB01D 
X-CRM114-Status: GOOD (  25.41  )
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

On Thu, Sep 10, 2020 at 04:14:04PM +0530, Sagar Kadam wrote:
> Convert device tree bindings for SiFive's PWM controller to YAML
> format.
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ----------
>  .../devicetree/bindings/pwm/pwm-sifive.yaml        | 72 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> deleted file mode 100644
> index 3d1dd7b0..0000000
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SiFive PWM controller
> -
> -Unlike most other PWM controllers, the SiFive PWM controller currently only
> -supports one period for all channels in the PWM. All PWMs need to run at
> -the same period. The period also has significant restrictions on the values
> -it can achieve, which the driver rounds to the nearest achievable period.
> -PWM RTL that corresponds to the IP block version numbers can be found
> -here:
> -
> -https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
> -
> -Required properties:
> -- compatible: Should be "sifive,<chip>-pwm" and "sifive,pwm<version>".
> -  Supported compatible strings are: "sifive,fu540-c000-pwm" for the SiFive
> -  PWM v0 as integrated onto the SiFive FU540 chip, and "sifive,pwm0" for the
> -  SiFive PWM v0 IP block with no chip integration tweaks.
> -  Please refer to sifive-blocks-ip-versioning.txt for details.
> -- reg: physical base address and length of the controller's registers
> -- clocks: Should contain a clock identifier for the PWM's parent clock.
> -- #pwm-cells: Should be 3. See pwm.yaml in this directory
> -  for a description of the cell format.
> -- interrupts: one interrupt per PWM channel
> -
> -Examples:
> -
> -pwm:  pwm@10020000 {
> -	compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
> -	reg = <0x0 0x10020000 0x0 0x1000>;
> -	clocks = <&tlclk>;
> -	interrupt-parent = <&plic>;
> -	interrupts = <42 43 44 45>;
> -	#pwm-cells = <3>;
> -};
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> new file mode 100644
> index 0000000..415d053
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2020 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/pwm-sifive.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive PWM controller
> +
> +maintainers:
> +  - Yash Shah <yash.shah@sifive.com>
> +  - Sagar Kadam <sagar.kadam@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +
> +description:
> +  Unlike most other PWM controllers, the SiFive PWM controller currently
> +  only supports one period for all channels in the PWM. All PWMs need to
> +  run at the same period. The period also has significant restrictions on
> +  the values it can achieve, which the driver rounds to the nearest
> +  achievable period. PWM RTL that corresponds to the IP block version
> +  numbers can be found here -
> +
> +  https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,fu540-c000-pwm
> +      - const: sifive,pwm0
> +    description:
> +      Should be "sifive,<chip>-pwm" and "sifive,pwm<version>". Supported
> +      compatible strings are "sifive,fu540-c000-pwm" for the SiFive PWM v0
> +      as integrated onto the SiFive FU540 chip, and "sifive,pwm0" for the
> +      SiFive PWM v0 IP block with no chip integration tweaks.
> +      Please refer to sifive-blocks-ip-versioning.txt for details.
> +
> +  reg:
> +    maxItems: 1
> +    description: Physical base address and length of the controller's registers

Drop description.

> +
> +  clocks:
> +    description: Should contain a clock identifier for the PWM's parent clock.

How many clocks?

> +
> +  "#pwm-cells":
> +    const: 3
> +    description:
> +      Should be 3. See pwm.yaml in this directory for a description of the
> +      cell format.

Drop.

> +
> +  interrupts:
> +    maxItems: 1

Is it 1 or...

> +    description: One interrupt per PWM channel.

one per channel?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#pwm-cells"
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm:  pwm@10020000 {
> +      compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
> +      reg = <0x10020000 0x1000>;
> +      clocks = <&tlclk>;
> +      interrupt-parent = <&plic>;
> +      interrupts = <42 43 44 45>;

Split entries:

interrupts = <42>, <43>, <44>, <45>;

> +      #pwm-cells = <3>;
> +    };
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
