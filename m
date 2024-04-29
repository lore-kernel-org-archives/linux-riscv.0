Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3220C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 02:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=69fSwYwxKWz9DKlHCDlcKVdg7a8oV+bRS8ZOE+IzzqA=; b=ziJKOgSssb/g/l+IwCgHdlktQb
	fzlMmvZvRurl6MT9KCanO2nLZ8SrjbgsUGjV3W2WGW6BYt2U3sNHxDadAZt2/YMfCnzknnkmrgUWT
	gWNCBgMqFWk+MI2e+5LrCpxzDRY99LxneH9T8ThCoOPQsJSz/ww9kyVWb/Gu/IO055f3yWp26jaDH
	lCuiwRnEXbuBHvnCygUUBK0Hzs3vxvQiNG/L24ebyHmA+kKOhPtlq7VJ12t3qnMAybzV6M/0zejgh
	b/82+yyUoBDA7wZmEDNIa9fTeJ7VIfKO74ZA5+ak9fnu1NcHEchj/y6QMH+NnzqaOGFpwKA/EH5qG
	3lacDLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1GgO-00000001Es4-2RmK;
	Mon, 29 Apr 2024 02:23:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1GgL-00000001ErI-0bEG
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 02:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5353DCE0A49;
	Mon, 29 Apr 2024 02:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486F9C113CC;
	Mon, 29 Apr 2024 02:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714357429;
	bh=WYFriNTPWk5Av35BEvQDZ0ykSmc5zyg+ED9bmRoMVrE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Pojz2P2vRZfzYY4NXQ59bMet2uyQGXEwouqIljiQr/MDQ/yTgV2kgqgP0Eo/2x9Az
	 Aqe4Yp2ZceR2JdWH2Br8vvZqF6YONQ45o/IqfCCZtHbpm7WSrI5PdU0pmVSr06+HlT
	 kUzhwn/+gsw9xfbKVt9ONvhBzhBfIdxWA2ISp4K/Lp/pa6d6phgi5uvd033vIZmulR
	 Yvqw6r23cUfumJGPXKun2wXfK9KiMjfF9CQSaMngUZeLJKtrs/YLF4j2v1STngmgpy
	 apiCxBxJikGMKLqppGtsuUztWrkxsgqXaDhvNIrzvzjSUrlzlNFpPVFyKL2FwDSBeV
	 Bu0S557oOR0Ww==
Date: Sun, 28 Apr 2024 21:23:47 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Jean Delvare <jdelvare@suse.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, 
 Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <IA1PR20MB495302443F9B18EB1A0DDF65BB1B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533CA5A5D0036F373308DBBB1B2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495302443F9B18EB1A0DDF65BB1B2@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-Id: <171435742665.8725.14900976847572107188.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_192353_411540_9D7951EB 
X-CRM114-Status: GOOD (  10.22  )
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


On Mon, 29 Apr 2024 08:56:34 +0800, Inochi Amaoto wrote:
> Due to the design, Sophgo SG2042 use an external MCU to provide
> hardware information, thermal information and reset control.
> 
> Add bindings for this monitor device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-hwmon-mcu.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/IA1PR20MB495302443F9B18EB1A0DDF65BB1B2@IA1PR20MB4953.namprd20.prod.outlook.com

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
