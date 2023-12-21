Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7E2C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxQYqGZiGfUVyzICcO7DuN8MEPBeuEJOKAybV8I/L/I=; b=xBbQH9ORwJitzI
	g5ZtO25rVdxpTw5PTpupt7BcgIHcYsH4mrBNfBNEGGrzXOpnB+6rJvQhtvfZ+Bu8zCSbfVkes215d
	JCwagGkUhHRXEqv9XfAEPy9bgMYJ8QsLIyHbzbdS5ooWnJZSXB266Wb2ZAVYTraq0SzhFuHqh7YnC
	HVOdilno2ZqXSFmHdC+Jd5XkLMkp8Pf0D3KrpdwcQ87HDwtDaJunByCQioamBHcGm64eoxqWD+AiJ
	EIJNUC9p8QdPnKc55fmgTtgoxxX3qwYU7N47b0/FJgC6mYICpx3SDAXiPdwChzv6Wb10yjcl2SUf4
	Wd5eSXp0BZlquVOapJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFIz-002GI3-2I;
	Thu, 21 Dec 2023 09:25:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFIv-002GGB-39
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 09:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4A176B81F9A;
	Thu, 21 Dec 2023 09:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24674C433C9;
	Thu, 21 Dec 2023 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703150719;
	bh=h5FfKcmX1h2CBN7uYHKgWA9iWr+dI00FJt+rdcmVXHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a2E0Ar17bKOR0RpDNgWbsS0OvBqldmTW+euxBc6XlIZmxDmn9SAqLOQGUXdxeEOWU
	 /Qd4V3ue4Bbs0W5AoFv1a1/vwaQYZlMupRaA3UXWe78clnRXgviOhJidccodjb+CBv
	 ZtvwSUiotQA5g8S93q6+kc67JXg5n8hxD7NIWF4gR/CCgNIor7xllMoSx3lsVWLe1+
	 pVRtMVhtHXxgWiPfWYDETWhuOaPZXzCm1GGElW/Oa49yXgf7uptIQG+4nMTHINhhIa
	 QBWYmy6HlZ9xSQBo2VzJ/7SxbJYKRGUekIJnUhEmy41IO5z1rlVaAdoQpqJpIhl/UJ
	 xPKKsxWKCKbYg==
Received: (nullmailer pid 2898108 invoked by uid 1000);
	Thu, 21 Dec 2023 09:25:17 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-gpio@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20231221083622.3445726-2-yuklin.soo@starfivetech.com>
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com>
 <20231221083622.3445726-2-yuklin.soo@starfivetech.com>
Message-Id: <170315071703.2898091.9670838272789709931.robh@kernel.org>
Subject: Re: [RFC PATCH 1/6] dt-bindings: pinctrl: starfive: add JH8100
 pinctrl bindings
Date: Thu, 21 Dec 2023 03:25:17 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012522_326102_0ADF33CF 
X-CRM114-Status: GOOD (  12.21  )
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


On Thu, 21 Dec 2023 16:36:17 +0800, Alex Soo wrote:
> Add dt-binding documentation and header file for JH8100 pinctrl
> driver.
> 
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh8100-aon-pinctrl.yaml  | 183 +++++++++++
>  .../starfive,jh8100-sys-east-pinctrl.yaml     | 188 +++++++++++
>  .../starfive,jh8100-sys-gmac-pinctrl.yaml     | 124 +++++++
>  .../starfive,jh8100-sys-west-pinctrl.yaml     | 188 +++++++++++
>  .../pinctrl/starfive,jh8100-pinctrl.h         | 303 ++++++++++++++++++
>  5 files changed, 986 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.example.dts:18:18: fatal error: dt-bindings/clock/starfive,jh8100.h: No such file or directory
   18 |         #include <dt-bindings/clock/starfive,jh8100.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231221083622.3445726-2-yuklin.soo@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
