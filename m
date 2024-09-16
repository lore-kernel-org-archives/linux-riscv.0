Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0E6C3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 23:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/DArytrw9qqNXwN5WwdICh3W+3g4OnyJ/TbD0lPmGnw=; b=tMqb5Qwt2XWsbtUuZ2VXnN/lVu
	3oWU9dmYvjSiP5mC4P8chPHEXu5/UYa3p2b31U4g2RG1KSC1PBGv0ORsmLNPcccV89XqylI2cl0hC
	ddJkzgDxKNl/PboS/eBc7xfNtW0Ph9LTYczbFxMzWBtta+MycLgZTv41I32yVdsKdCEJsJy27yGq3
	R6zPamnWDXYpD7ho4Z6hikrwRXb+bP8pjTxRc+BL/R5xeKAHSsfEv5LZwUBOlp9CNvyMFCn87FnY6
	NxTRuxBowVAI7IUhY8GuvV8M4ApKZxA9uYoLKbJuVWFp80CjcUbBG6zM+X1nUJOuLvMoqYeCxHhqD
	NadEICpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqL80-000000054bO-2KMT;
	Mon, 16 Sep 2024 23:27:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqL7x-000000054ai-35NV
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 23:27:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5D07A410EE;
	Mon, 16 Sep 2024 23:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E95C4CEC4;
	Mon, 16 Sep 2024 23:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726529248;
	bh=CCRO+wCGpM7n/fMSVYTlzzCNk4NwhSh8VfIQzH6croc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Z6Ah5+DnVhdPgqnQb2f4eymVwzdCVNMxtZmN+EjfNEwrhcDkbkjQX0vA5WnfRjKCZ
	 chKTOymE81TDc5baty06rv2vSoGrbQaqvQ0l9HajLmxyHQ+Wp5wvzeTWeRmQavSwbw
	 2yNvBP1mzw7mj7d6AxbhDsiUPHOfURD+Kvi6rzFAqxd1DaS3fTcZcPglr9XC1GJbru
	 E3GVRaj8FVzbC210NDcQyEe3a5Z3BAJ2djq5J5l6HX3f6zl3zGXrCEtV/XcBVxWBKU
	 AB+6tqWd5Obg+oZyynFNgtqIiZlhYEaYVuxhJQgHLbGw6n7q3acS5aYN0OqJXmFeUN
	 lKgASO9+8ikMw==
Date: Mon, 16 Sep 2024 18:27:27 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: devicetree@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicornxdotw@foxmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <SEYPR01MB42212A60B191731DF9759B7DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB42212A60B191731DF9759B7DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
Message-Id: <172652924608.1569418.9431223699256668863.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: spacemit: Add
 spacemit,k1-syscon
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_162729_862875_7A4FC622 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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


On Mon, 16 Sep 2024 22:23:08 +0000, Haylen Chu wrote:
> Add documentation to describe Spacemit K1 system controller registers.
> 
> Signed-off-by: Haylen Chu <heylenay@outlook.com>
> ---
>  .../soc/spacemit/spacemit,k1-syscon.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.example.dtb: /example-0/system-controller@d4050000: failed to match any schema with compatible: ['spacemit,mpmu-syscon', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/SEYPR01MB42212A60B191731DF9759B7DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com

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
