Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE98C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cQJhKwClAbli2zqh19I1MKodegTn/W3HLWFP5w60Ko=; b=t9v5+WQCd9k2fw
	hbJCQiqYk2KLvG/Yujxh22bhkZ3/G7IsPnF9tAQfjHsDPEOxVWtlrkCU5lvi7qMGZNpCFJlMfA75o
	9t3tK1hxjgj8F5cd/xtFSJxe/o7pJP6nZKQV0kMvPvuPDZ03pI5DrdX04xmJ+GHTvYjP1SNIWQIVN
	UHdcsM5IMKI1Z0j6OmfCxuw53Y5z+v2ojGDfGOCtjuJa3PehWxyZDw9dP6XCkYeVa6kFJd7PJys52
	hNiU9XN030oJwQlavBHxTt+0/PyXH62F2ibuf1d3CQp0NQS9lSbF7xmAfuzxOSetyRKKH+aFnrf1y
	lTJX3KJOVdM8l72/L4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vHn-004k6A-HF; Wed, 07 Dec 2022 14:20:35 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vHB-004jR0-G5
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 14:19:59 +0000
Received: by mail-ot1-f46.google.com with SMTP id cn2-20020a056830658200b0066c74617e3dso11341368otb.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 06:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0xsqqRAAwkCH90xN5tDo0UY2Z+9ZzZVHejNWkAJfeY=;
        b=oZnCHb97Qutg5kI9sUiR+9L162bZWX4/1c+AAhH9wmBh1reBKqQlr6DvCYTmFg8hGc
         euv2sWpKnNjouYnXPGRVwA67meTBBaVa6n9jd3pOY3qkdJdwmd8Ec9K7mv2HlLZqclv/
         ltg9pv6hj4p07KBuOBzRhDPg3R94XTwkgFR9dbhuXmY7abME+2qtW8WDcoixLnQWsMuk
         V7ETUs6cVY62Zq7MaArEdNF3fjWJmmiOukNumVhfhk82M9nZ+qM8Whgj1TC+8psDPy9H
         ln+sI4cvr8HVopYummW07C4g764T5zQTtA9rv4EJWEWxB6PyWTTcDBJiRE2GGUbQvDz/
         Gc0Q==
X-Gm-Message-State: ANoB5pnA9K3wSd75H+1zNtMIsh7+8G24dPrEn52t/YYkkJzIPAdGul8K
	jlLFItUZazHFmna6xK93BA==
X-Google-Smtp-Source: AA0mqf5uSaAugZRJi+A+E/uxyhpPDRKenpx8oRR0Qkl8Aa2el1QUalmTuXET2L/0ToRRdW9ZonSPSg==
X-Received: by 2002:a9d:84b:0:b0:66e:f6cb:99ec with SMTP id 69-20020a9d084b000000b0066ef6cb99ecmr6303505oty.330.1670422796137;
        Wed, 07 Dec 2022 06:19:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m22-20020a056870059600b0013c8ae74a14sm12204892oap.42.2022.12.07.06.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:19:55 -0800 (PST)
Received: (nullmailer pid 2124811 invoked by uid 1000);
	Wed, 07 Dec 2022 14:19:49 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org
In-Reply-To: <20221207131731.1291517-2-william.qiu@starfivetech.com>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-2-william.qiu@starfivetech.com>
Message-Id: <167042222472.2111911.2050446708831690640.robh@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add bindings for StarFive
Date: Wed, 07 Dec 2022 08:19:49 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_061957_570028_ECDA12D1 
X-CRM114-Status: GOOD (  13.14  )
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


On Wed, 07 Dec 2022 21:17:29 +0800, William Qiu wrote:
> Add documentation to describe StarFive
> designware mobile storage host controller driver.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../bindings/mmc/starfive,jh7110-sdio.yaml    | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or directory
   21 |         #include <dt-bindings/clock/starfive-jh7110.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221207131731.1291517-2-william.qiu@starfivetech.com

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
