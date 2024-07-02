Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF1C30658
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U/GM2HuVIKYKHaPKFdEdOHicmnZurrKgSTKT4vXwpzo=; b=F9j651ogg6z0oNf3yXr5Drq4b+
	KqRgKRMUdy3xqyRp1pLEryepQOE7mmHc/vfQDGKZTnZg1DaypeXwJOeYXzY+AlrMztdh4JIsJyjb0
	pWmad1+0DjzdIinuVFKZUlwfcjFQSCQxej8di2CoNKxkkOL3jo3akMygagEfEN1Pw6v0Ee/bFf0Zw
	k9ZyGvQG4xaqOsKl0nOvIDP4HEDSggEbKbMlPot8v/O0Z7xiLHWsTsETeXmyyihDeceL0s1W5DVV3
	h54IFKw5sgAROVDl/HxRAFdHd/I5ViqFp0wSBDwog5SPxLdNPPSYspYO1uFmGDSa/XuyyjNPeEO5o
	rZ8PVqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdaQ-00000006rYy-1J9g;
	Tue, 02 Jul 2024 13:30:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdaM-00000006rYG-0w6Q
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 13:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A848961A7C;
	Tue,  2 Jul 2024 13:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B8CC4AF07;
	Tue,  2 Jul 2024 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927017;
	bh=8RJtG0gGC00rT2GsXuQEaindF1W2r+IuO/BdBiyjJLM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=BBZ6E/HbkuhYaAn15zmd4Nk0PEd9guaspQwFVcD0y6e80jVg/7PGdlUIVTD5PVn3k
	 NsPx7S9Szi1KiWBb73d4X17sSicGlTJrbJcJsBN3X6cDIZPzmJzp62FJuvN8zLsJBe
	 Hh+zOGX6O7abgbci9xYpqh3fBnCUdw4W0S1LVHdMZuQ5ckD/TLMcDm3qFus0R/DkLk
	 yYiJDpxEGqXsUCXBDddiayVBjuIbuZlOsDUy53i7Uc+UWRp2YydUwvASFOadEtiwO/
	 1us5/GPrfCaWreY3ar8CL+Wj25deHBGbYcweqdZJp8SeE89PG2PMgQbnygxZ/RZXEe
	 K6Q1ba13n7p5w==
Date: Tue, 02 Jul 2024 07:30:16 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-iio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Chen Wang <unicorn_wang@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>
In-Reply-To: <20240702-sg2002-adc-v1-1-ac66e076a756@bootlin.com>
References: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
 <20240702-sg2002-adc-v1-1-ac66e076a756@bootlin.com>
Message-Id: <171992701607.3218867.8675024539411863214.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_063018_383321_D96E969D 
X-CRM114-Status: GOOD (  11.63  )
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


On Tue, 02 Jul 2024 13:52:21 +0200, Thomas Bonnefille wrote:
> The Sophgo SARADC is a Successive Approximation ADC that can be found in
> the Sophgo SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 51 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 +++
>  2 files changed, 56 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-adc.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
Error: Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.example.dts:24.11-12 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240702-sg2002-adc-v1-1-ac66e076a756@bootlin.com

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
