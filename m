Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8227FC678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHzMEm/u3iQKWdQu9CEJnvzefE1/rWSt99w4gUcvrxs=; b=vHIEMQLk41II+w
	ei6nKvggHnWHphnF2KWAXKr/GnjWkTTEeoafOzOed4ogERvrVdF6GGhJc/uqP6od8lf+9sthDLByv
	HUre2EcnHVaH4jFRVPlxxWYlbN8dgpK9xBF23G8mPPWTUTfFFQh/OX+b38jTcDrSNOoYZcNEI8CeW
	8shTJHghhLVtRR7PBGgkGzw+oHqmAUQ1rv7piAwoAhAPpbMYNoTQneCAWS2+oWALmtqd+j6e1+Mh6
	rRGy2lbcAddyYivV7U+csFFl5fpAoqU93sQAbqGsfAJHp6MiznyYapDtzBllZF0h6hJbMIHVFahZ5
	V4XgSvYn8+CgovCWFvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwM9-005rlj-LD; Wed, 08 Mar 2023 16:09:33 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwM5-005rjC-O1
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 16:09:32 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 396B63F11D
	for <linux-riscv@lists.infradead.org>; Wed,  8 Mar 2023 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678291766;
	bh=jxEkW8OFX3baFTB/CKLudkQuvhDNrRf95y5rQkRLsGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=eyW/8nofgUFcTirYPvjZNN5tzG13OiiHcNT/UjW3PibbRfEvyY0MQZpTKJBByca4C
	 7p6XHBEkoElNIrx+I1nh3Cno3KMWj9CQZ6H2BECi9cFb8H76avmUjRwfhhcVNYb4ri
	 J2TU0198xJsSzandzB0CsmzRmZCEXfkx7yT3s6b1+al61mE8gHYwamff2YAnJI/h0r
	 OOpDfcawt6xSstGWc2vYYEzxsbX55ES7FDcppikHnW/70RdiscCNPcRiH+KP6Rthd+
	 00sOGBWhyHcJjb1Bh9UFpzoPMVPxZ2AfnUYi8VVJ3UfiHrsJTcd23x8Lp+iPLrVdg8
	 1bXaphw6d8vJQ==
Received: by mail-qt1-f198.google.com with SMTP id o10-20020a05622a138a00b003bfdabf3b89so9404207qtk.13
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 08:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678291765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxEkW8OFX3baFTB/CKLudkQuvhDNrRf95y5rQkRLsGE=;
        b=pUapfBpuTiGVz86+mI9hDSPadpgdEZN99fjsxpZzebk8WSDgJY0jPE8p0wsKLy8hVi
         NDLHBIQUgHdgjemkkdQa+OaBh/8+2CGhNE42U2njy/UvM6wjne1FfEfCb9pvDMW7zeZ8
         gqQAXeRscB9qsx3E1JNfle6MOM1ONmerw+MEcr1kWv5/WsHFbMuDo2CY0MMKbN1trGVG
         Eyde6Z1tEg9WPUiQvJV9bbvdXjmAxWHnLcGM8XcS5GHYM/nOtTMQUCNYTZK505tSK8LN
         ijHAWgJ3sdmeUjwehZNoYBij/nHCjRJ6pFEusD0gL9Z7ik/NA8pQg5V+6JmOc+O9Z2eE
         oamw==
X-Gm-Message-State: AO0yUKW45CZI3JcqKUExFvzVob/tXhmkftEHHB2Wqe9wJ6wG7EsnoJU+
	OpCGmbS1afXg1f2rpJGOrzyjOx21y5HjxdpipHUvZ+DbIGdT/qTzGmiRfNKzmyBhCbC8imDrOu0
	1Fwe/HnEvyFLOao8CzuA2xc5NOeaSGfSQz3j5f6KbpmH9htZWM6iMkP2gWk39IQ==
X-Received: by 2002:a05:620a:8416:b0:742:9899:98fb with SMTP id pc22-20020a05620a841600b00742989998fbmr4036586qkn.7.1678291765342;
        Wed, 08 Mar 2023 08:09:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9rDdUme+19ci4Y+eeQIQ1S8Pps6PmhEkfVr/t2a1f+TOq5hvLfQHCft/Xi0WgN485LzYzwIKfwYQUqflfbMR8=
X-Received: by 2002:a05:620a:8416:b0:742:9899:98fb with SMTP id
 pc22-20020a05620a841600b00742989998fbmr4036581qkn.7.1678291765113; Wed, 08
 Mar 2023 08:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20230308034036.99213-1-xingyu.wu@starfivetech.com> <20230308034036.99213-4-xingyu.wu@starfivetech.com>
In-Reply-To: <20230308034036.99213-4-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 8 Mar 2023 17:09:09 +0100
Message-ID: <CAJM55Z9-BK1zPop_C9JX8qGLpzGXPzizUSyEtaevwbQ4NT2xaQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: jh7100: Add watchdog node
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_080930_213375_0262D8E8 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, 8 Mar 2023 at 04:42, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add watchdog node for the StarFive JH7100 RISC-V SoC.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 000447482aca..1eb7c21a94fd 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -238,5 +238,15 @@ i2c3: i2c@12460000 {
>                         #size-cells = <0>;
>                         status = "disabled";
>                 };
> +
> +               wdog: watchdog@12480000 {

I don't see anything referencing this node, so the label can be dropped.
With that fixed:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> +                       compatible = "starfive,jh7100-wdt";
> +                       reg = <0x0 0x12480000 0x0 0x10000>;
> +                       clocks = <&clkgen JH7100_CLK_WDTIMER_APB>,
> +                                <&clkgen JH7100_CLK_WDT_CORE>;
> +                       clock-names = "apb", "core";
> +                       resets = <&rstgen JH7100_RSTN_WDTIMER_APB>,
> +                                <&rstgen JH7100_RSTN_WDT>;
> +               };
>         };
>  };
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
