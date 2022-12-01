Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08515C47088
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2fe+/3UO8y0AMCnkXHzE25Ol9bFpIZCSb9kO+Rj+3I=; b=oyCJLkjPCh7vkH
	2eiGJhSlKttyfj+7YFfzEmGgfTQuivCI6y3I1nUeotwaQIpS4v+VX4GfTTgdvqbpAGYrWDXwiwdDs
	ztudhpya9BLagWiuF3y1uOJ7lwoTUSltRmwP31NvSbIQZ8o6op0IQDXcCOBJtJ4tMORrTMxVXZ1w3
	oxWchCNPRKvq983bopz8Hhxy6V5ArXdx6Id3uF9s3il9UrQ+jCm0EmIJ2j0k5JSNI9yA8lYo7oR9L
	jGOjbhwkT1rloPSBU0k3ZAnIP/NdHChYjjH7cG6H+XzSMWfQQr2TJaf6ydHBuL7Xs2tBoNR/70toi
	qhif3hHOM/Ghoc1aZaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jjx-007jD1-Mz; Thu, 01 Dec 2022 13:36:37 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jju-007jAu-Ng
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:36:36 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-143ffc8c2b2so2171592fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1K37iH9iyFVta8stQEbIxav/5AtugtdvdeJC9IDIXZQ=;
        b=LB3TMWHC1Q/ODI/Lz0hIJqMIbvi3AoDBMwZeYS3zXnnhralfS/Kw/VoY0DW7S2cAi6
         O6zDnPo1Ov6pw7gx5kbNGyfGUUSPXID7A0cT8A+ygPadZf83qn2nFdmTv7dnSrbdxnzI
         0WXNSzwPZXLmFZL+sMvtxNuMqgde4mv2Q6GoKesv7BxEuwgSkkYbPe/IUj0RKIQcTR6i
         SyPjkPFDFgZvDZfssXeqey9GIlt7RjTu8koMLpW8D1g1CLmxeKSEzkyS/j951aGz006S
         YbGpWUjP5tOP3AehUTFVQbfBSw7p0aj83WQckSfsxcaMdubk2BxjJn3c77AtSI8HJKTH
         97Mw==
X-Gm-Message-State: ANoB5pkfq3eCIgOxUnyQjOdR14E2Qs3xAN96SK92owQ1M+B50dgUYzKO
	6fSpXrEzMoGOs7poY/BEnA==
X-Google-Smtp-Source: AA0mqf7RpOe69UtxOJCyqspnx7PZpkYhph5UqVYXm2bLG4LGpD1UvyszRA+XWaFW+lK0FJ4kI4of6A==
X-Received: by 2002:a05:6870:7b89:b0:13c:e644:d7a9 with SMTP id jf9-20020a0568707b8900b0013ce644d7a9mr38397974oab.148.1669901792169;
        Thu, 01 Dec 2022 05:36:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d7-20020a9d5e07000000b0066c3ca7b12csm2059192oti.61.2022.12.01.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:36:31 -0800 (PST)
Received: (nullmailer pid 486292 invoked by uid 1000);
	Thu, 01 Dec 2022 13:36:29 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-riscv@lists.infradead.org, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20221201090242.2381-4-yanhong.wang@starfivetech.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
Message-Id: <166990139276.476262.15116409959152660279.robh@kernel.org>
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Date: Thu, 01 Dec 2022 07:36:29 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_053634_841045_410C5C65 
X-CRM114-Status: GOOD (  12.89  )
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


On Thu, 01 Dec 2022 17:02:38 +0800, Yanhong Wang wrote:
> Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,dwmac-plat.yaml     | 106 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  3 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml:30:16: [warning] wrong indentation: expected 14 but found 15 (indentation)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/net/starfive,dwmac-plat.yaml#
Documentation/devicetree/bindings/net/starfive,dwmac-plat.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
   21 |         #include <dt-bindings/clock/starfive-jh7110.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/net/starfive,dwmac-plat.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201090242.2381-4-yanhong.wang@starfivetech.com

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
