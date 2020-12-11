Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A06C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:55:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DDB823ECE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DDB823ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RY32IP5zCWNm1xI26dqzOrUtdlNOhkUxhBoKdJ+6uaQ=; b=gZElRkzV+CrBgZYUeiORe38Sf
	U1jgpJhfczCXQN4Uoz+IfiDogM/BcuBROMZByz5deUQ12O6K3No5Jms7iG0yk2B6YLK19K30d3sba
	tuRG+URfDQEXZOM3DYqNnmuRh/9lDiHzEfn31/z6kGHtH+NfG8BtNAHvkSwh1tFSdUQfrThiNT88X
	xydc0HPwD0EiKpWsTldinxK9xrWaSQ4hNvx20IF6FObva9pb4nAcvdfxO5TC9m89eivz2aLQLqllS
	xzpF8qmTZMJb9sVFclKKccgNXkCN36izvHX7o6HNWGQirdbPoLVCdhCrQakT7J3kLY8BWICJo9yWE
	V5b3RnM1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZWB-00013i-8z; Fri, 11 Dec 2020 03:54:55 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZW8-00012m-6z
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 03:54:53 +0000
Received: by mail-oi1-f194.google.com with SMTP id q25so8389424oij.10
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 19:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jg43q2n1KDadesdGGoPvRtgEcEu/bB0AmQcOaS55oHQ=;
 b=UQBaoTtiijIUi9qxf/LXerpnttamT08mEdDxw7ETWweyp6nR9s+V3NTrG4Se6bLMtT
 aDpfK80x4zPkEE6LmPH7NlxHCfUvP174WlpPhSyjr1+Qs9xkJPOtzc6UeP+3ri0NXcho
 5dNkdQaoM26YpqofgmGV9VhbaGkZW51GeXRFX9ML/ZaZXST+vB3lK0GSOxZ1wkZkV4mp
 RL2PavaUrZwSAxzzFBipCCEp6/aT8q2Eh6ATPgIhU6P4tEHeENZ7JFpq3gHfjORupXTe
 Fb4GqJURlUtYmE3QSz1azCsi4Tv2Zr6+4lT1RCamsBJhCVeyyDjoVQnRlm7CQMKr2Sqr
 saoQ==
X-Gm-Message-State: AOAM530JmrrmnDekcuFmQHQdRjbt2bKXZNxHrh9AGT0KAHPSc132Ffni
 BA1SqYhTu52rMbdiIHPPXA==
X-Google-Smtp-Source: ABdhPJyxsD7fhYNejCAuQal6tfRPHmBDNB2l51iUU5epxUE4gGdgMpqPe/gSgXx9TJRDGTwWA2afwQ==
X-Received: by 2002:aca:1e03:: with SMTP id m3mr7898681oic.107.1607658891426; 
 Thu, 10 Dec 2020 19:54:51 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v13sm1507827ook.13.2020.12.10.19.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:54:50 -0800 (PST)
Received: (nullmailer pid 3614115 invoked by uid 1000);
 Fri, 11 Dec 2020 03:54:49 -0000
Date: Thu, 10 Dec 2020 21:54:49 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v8 11/22] dt-binding: mfd: Document canaan,k210-sysctl
 bindings
Message-ID: <20201211035449.GA3610311@robh.at.kernel.org>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <20201210140313.258739-12-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210140313.258739-12-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_225452_332642_E1D9C915 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 11:03:02PM +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC
> system controller driver in
> Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> new file mode 100644
> index 000000000000..a61d8ea4fbec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/canaan,k210-sysctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K210 System Controller Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description:
> +  Canaan Inc. Kendryte K210 SoC system controller which provides a
> +  register map for controlling the clocks, reset signals and pin power
> +  domains of the SoC.
> +
> +properties:
> +  compatible:
> +    allOf:

Don't need 'allOf'.

> +      - items:
> +          - const: canaan,k210-sysctl
> +          - const: syscon
> +          - const: simple-mfd
> +
> +  clocks:
> +    description:
> +      System controller Advanced Power Bus (APB) interface clock source.

How many entries?

> +
> +  clock-names:
> +    maxItems: 1

Don't need maxItems as it is implied by length of 'items'.

> +    items:
> +      - const: pclk
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Offset and length of the system controller register space.

Drop. That's pretty much the description for all 'reg' entries.

> +
> +  reg-io-width:
> +    const: 4

Why is this needed if always 4?

> +
> +  clock-controller:
> +    # Child node
> +    type: object
> +    $ref: "../clock/canaan,k210-clk.yaml"
> +    description:
> +      Clock controller for the SoC clocks. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
> +
> +  reset-controller:
> +    # Child node
> +    type: object
> +    $ref: "../reset/canaan,k210-rst.yaml"
> +    description:
> +      Reset controller for the SoC. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml.
> +
> +  syscon-reboot:
> +    # Child node
> +    type: object
> +    $ref: "../power/reset/syscon-reboot.yaml"
> +    description:
> +      Reboot method for the SoC. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - clock-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +    #include <dt-bindings/reset/k210-rst.h>
> +
> +    clocks {
> +      in0: oscllator {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <26000000>;
> +      };
> +    };
> +
> +    sysctl: syscon@50440000 {
> +      compatible = "canaan,k210-sysctl",
> +                   "syscon", "simple-mfd";
> +      reg = <0x50440000 0x100>;
> +      reg-io-width = <4>;
> +      clocks = <&sysclk K210_CLK_APB1>;
> +      clock-names = "pclk";
> +
> +      sysclk: clock-controller {
> +        #clock-cells = <1>;
> +        compatible = "canaan,k210-clk";
> +        clocks = <&in0>;
> +      };
> +
> +      sysrst: reset-controller {
> +        compatible = "canaan,k210-rst";
> +        #reset-cells = <1>;
> +      };
> +
> +      reboot: syscon-reboot {
> +        compatible = "syscon-reboot";
> +        regmap = <&sysctl>;
> +        offset = <48>;
> +        mask = <1>;
> +        value = <1>;
> +      };
> +    };
> -- 
> 2.29.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
