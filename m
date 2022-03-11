Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A03C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 03:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=z2mf0CxzmCRsfyXAZBfHsZPlaDxhkTHqRieP779xkMY=; b=yV8iMs2e0ppzTJmoN9XxoBtSLD
	e1mu2r4BAPP3qhjx+HvgIL55ZIMmprxC3TQ9/sM84FJq6pdHsBJNc2bfC9CtSzxY6W/gQ28DfUkmT
	17zTqhjXt/pkwYqSQfagyFsaf8XA6oj+3Z4E52Z4UAZUQX05P4lFIeQ4azMnbUyT19enCLccy3dNv
	jgUMagT5uLQfRMQOU9urdArQurJ3On2suSzp8tsz9jQSw0Q8AOlRxqyHsYWHIoxUQL6adAAf/cmjD
	MO9PeW5w/D9Y+voAqevM1c14ZV5a8u0wiQ53JJj46XO+Z833wbTnEhNTo+zqxQK2Q0OD2koEmykt7
	POBPlWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSVk5-00Erzh-QG; Fri, 11 Mar 2022 03:15:01 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSVjt-00ErvZ-1s
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 03:14:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id e2so6602583pls.10
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 19:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2FqWSjkXuo5S9mesJxoz3NDkdM5WB3sWHU6io9eY7fk=;
 b=JQ83gMdtJ8abAR5h7+idsAWzxiZol4eLzOdZjVDWrebCaG/Vbex5HMwHcvgDRvL1lk
 d87AF/jaKWvGGVRtKm/QeQQJSiQaR+zx/ykXsPAhYGD0wYvTwkcGOjLTLX8IIgcACB3E
 glTddo1PAPLJZG29IEdnATCiBAGXdCsO8RwWmjBNridFgRXsguSxBGUM5fhuysu6qCcN
 NuHVBGL3a5XX+io/Gp1e3KpizUVYVAWMYFxxRHw5qQXGeirIJCMJLCCaQt4uQpI0rcCI
 Cs1rm8fGOW3lqkvPIVoWmeWhSsOAAzfMdnYbVqoaqM0+XwdnBqOj73G4my/kVvFuZ+p2
 wnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2FqWSjkXuo5S9mesJxoz3NDkdM5WB3sWHU6io9eY7fk=;
 b=Szdqz1FJZNGCN2Gh//w/c81tpIAiLE02BF5s4qtNuLcQHFFlgMg9XYgz7yM1o56L16
 JzCK2cB/rFH6b8vgucZM+v3J+i2yo+LncyfqE3nuNGz921LclCtF9+mLfb+RLzLQsYmn
 FPP8MFmkKbaZn7eEuiuPdoRhdzlkb8H3S8EqUXTvpfb6Q6Rcq/kDAz1oo+mf904VhHgD
 O+Mn/vdPH9Ib1BCPekPtEIyQqmr0YQ8ROElybQSypdENHGJBusAu3OVXKe8VIz1LMaqE
 HmCSXbGWPDZL2FvMBnc8G0c86m8E0kIvMC+sM4d+CNx/Vr/Kk7bo9318xNWh29UYTY9o
 eh7w==
X-Gm-Message-State: AOAM530JbNki+BRLOk/oKw7uDsHvtdrIQpHn86u6331/XyiC49TcB7pv
 cxS3hGc52wq7eEL4bKA1BfKUCw==
X-Google-Smtp-Source: ABdhPJxDNSPztcFWbjAxP2vLau7vxHCY/ogScAPVFQ6aIwReOrOag3ZvU3eB4x2JYdPBlmhtuOZCSQ==
X-Received: by 2002:a17:902:b189:b0:14d:6f87:7c25 with SMTP id
 s9-20020a170902b18900b0014d6f877c25mr8505020plr.31.1646968487048; 
 Thu, 10 Mar 2022 19:14:47 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l9-20020a655609000000b0037589f4337dsm6865189pgs.78.2022.03.10.19.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 19:14:46 -0800 (PST)
Date: Thu, 10 Mar 2022 19:14:46 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 15:54:41 PST (-0800)
Subject: Re: [PATCH] MAINTAINERS: sifive: drop Yash Shah
In-Reply-To: <20220214082349.162973-1-krzysztof.kozlowski@canonical.com>
CC: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com, Paul Walmsley <paul.walmsley@sifive.com>,
 thierry.reding@gmail.com, 
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, 
 sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@canonical.com
Message-ID: <mhng-b01b9acc-de77-4d1d-9cdc-f3830a6c569a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_191449_121118_6B9FAF74 
X-CRM114-Status: GOOD (  16.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Feb 2022 00:23:49 PST (-0800), krzysztof.kozlowski@canonical.com wrote:
> Emails to Yash Shah bounce with "The email account that you tried to
> reach does not exist.", so drop him from all maintainer entries.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     | 1 -
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       | 1 -
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 1 -
>  MAINTAINERS                                                 | 6 ------
>  4 files changed, 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index e04349567eeb..427c5873f96a 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive GPIO controller
>
>  maintainers:
> -  - Yash Shah <yash.shah@sifive.com>
>    - Paul Walmsley <paul.walmsley@sifive.com>
>
>  properties:
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> index 676b2160bada..605c1766dba8 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive PWM controller
>
>  maintainers:
> -  - Yash Shah <yash.shah@sifive.com>
>    - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley <paul.walmsley@sifive.com>
>
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index 2b1f91603897..e2d330bd4608 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -9,7 +9,6 @@ title: SiFive L2 Cache Controller
>
>  maintainers:
>    - Sagar Kadam <sagar.kadam@sifive.com>
> -  - Yash Shah <yash.shah@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>
>  description:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebf7a75a6bec..87eeac970ca2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7090,12 +7090,6 @@ L:	linux-edac@vger.kernel.org
>  S:	Maintained
>  F:	drivers/edac/sb_edac.c
>
> -EDAC-SIFIVE
> -M:	Yash Shah <yash.shah@sifive.com>
> -L:	linux-edac@vger.kernel.org
> -S:	Supported
> -F:	drivers/edac/sifive_edac.c

Looks like that leaves this unmaintained?  I'm happy to volunteer, I've 
got the boards lying around somewhere and sort of feel on the hook to 
keep this stuff alive given that whatever's in there is partially my 
fault.  That said, I'm happy to stay out of it so if it's OK to have 
otherwise unmaintained EDAC drivers that works for me so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

> -
>  EDAC-SKYLAKE
>  M:	Tony Luck <tony.luck@intel.com>
>  L:	linux-edac@vger.kernel.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
