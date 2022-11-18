Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842FDC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 03:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mMarkR2hHSXrT+HatE0m8zTTP5q6D4s/D6sF948VeE=; b=OLetnPVfDX8P8V
	a35xnJZP2CHB7ddcyhh9BFO1Jps/quPnSs1OkthKhFiQguxsgyEH8WcQXC5YGScPBZq+c1jzTUUjl
	VF0qKsUprTY3OXx5IwUGKDPqEtBN7lGo4TnMLyR5Qp4Cn8MRdsGLOMMf1Q6LqFk9bKNkHjLi/jNEf
	2mxdGSgMISKNocFrWDSDgCXM21MwrsU6VgPWDSgTrwXf4kfcftvCNKcFF0W2j3oJexzUVyyAA0vGi
	b0eToe786xHDfSt19eVcG0gSBi9w/H2DSKuBGERHfz8o+RMc6CtBgxV28hxNvBl8r+Ro1BAZA6MJi
	73GgZUmGH0uieQslXYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovsUM-001oOo-I7; Fri, 18 Nov 2022 03:56:26 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovsUD-001oM4-2W
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 03:56:18 +0000
Received: by mail-oo1-f42.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso609429ooi.10
        for <linux-riscv@lists.infradead.org>; Thu, 17 Nov 2022 19:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tfxi4m72wJDyyyRk1r1gIS4usq7HPix4iuACaDy6u/8=;
        b=7UTB3qW+y8fgWvBb3RTpZIhi+K53hp0naOqLyXn5KeeS3/wECrXavyV+aQeNrfTp+W
         +/3BGuY9FfBbGm9OMpbRFXpJNWiyvQGaaEKKIsIrZtuKMqe6oYAUwor97g2/2OCmOo4Y
         3ZmSmbQPkYXUQxZbbYQBXn4SasYuleW0ikEjJ0YFtxZC+SP/gJNj6foXs9K0/6DQjdEI
         hKJ1Matiedzfm5tAy9uVdwYm0urv75cYF8hQ2KAQLt83Ct8J0QOGpIPKKYriPPILEp7S
         jBP5biaPViimgpHHhWRqLuU9C4dH4ezE/0fyRCH+Lm+/b4+3YaCuuUZGEzLsW2JPxNNS
         V3kg==
X-Gm-Message-State: ANoB5pnNeS7qbk9k6jloJ8HzdF7nFbR3EXRii6msy1TQ1n1Otj0emuyh
	aqRjX0OPE1HkCHf4pgNzBw==
X-Google-Smtp-Source: AA0mqf7N7myWgaJT6ZUUlriqZmuzPomf0ckaoERhMXeGZBOJTOq3ZutJEDELIXaz1RGOFiNZqsXuxA==
X-Received: by 2002:a4a:aece:0:b0:48b:f37a:c28f with SMTP id v14-20020a4aaece000000b0048bf37ac28fmr2735429oon.36.1668743775080;
        Thu, 17 Nov 2022 19:56:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g38-20020a9d2da9000000b0066cc0525476sm1090311otb.75.2022.11.17.19.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 19:56:14 -0800 (PST)
Received: (nullmailer pid 397831 invoked by uid 1000);
	Fri, 18 Nov 2022 03:56:14 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20221118011108.70715-3-hal.feng@starfivetech.com>
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-3-hal.feng@starfivetech.com>
Message-Id: <166874355750.392596.1548443526558920682.robh@kernel.org>
Subject:  Re: [PATCH v2 2/5] dt-bindings: pinctrl: Add StarFive JH7110 sys pinctrl
Date: Thu, 17 Nov 2022 21:56:14 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_195617_143671_5ACED52F 
X-CRM114-Status: GOOD (  12.73  )
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


On Fri, 18 Nov 2022 09:11:05 +0800, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add pinctrl bindings for StarFive JH7110 SoC sys pinctrl controller.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
   21 |         #include <dt-bindings/clock/starfive-jh7110.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221118011108.70715-3-hal.feng@starfivetech.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
