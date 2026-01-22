Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A745CC44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iTpeQgnoz8l/jONZ4PE9JPH+uNziPpirnIVNC1ftczo=; b=SrkdgSazolttC0hlbxcKLlU+0D
	fOBgepz/kHXcMVsP4Wlv/z/Kx5ZlA2P+PWGKk62x8h2fu6qWXsx3hG3D/7UJFWp1KptV+3MV0mAca
	CmBJHP5b66OGa3j2kvIFiKyBKnRAFVq3zGsNynE6ZXejZs2UuBmeVOCfSWimoiBstatTzKblYou2j
	WmvroykaKR3rvxoOPbdecrZ0bUZSiPX64Roc9myL5RikFCmeALAZ9BcECD3q/bHO6PbdOInxQmoj4
	0I4ZOaeTyaxeWFeyKNZ/h8cY3z6OLktfi2cHJX/OSyQnvrMIw/mJZB1yxGK5v22OZIoUsb0ZEpbHG
	nOscof1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virnr-00000006p5v-1S0b;
	Thu, 22 Jan 2026 10:20:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virnq-00000006p5j-3U7X
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 10:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3C6E600C3;
	Thu, 22 Jan 2026 10:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901D8C116C6;
	Thu, 22 Jan 2026 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769077237;
	bh=ONa6ASogMSTJc/W+Ezo8UvIMrfzEIFIzWJuOeuW3Yyc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GmjYxMPwKIN11UUWWnFYmSgOkLFagzruNR1r0j1j5026Sut6c1xdjqi9lHfBUk3LQ
	 if46qrgYkxxaPTN0mk0T26O54kdgForlTYQsm8cYqU9NtkXT4oHs5F7B4hoZ7PQd4c
	 /L/vhzK50eBVeRlJK45JCqDmffEI59JViAwBehA/UldCK1rna0ubpkCxBT7TLIFSZ1
	 cSpfc11KdnI0JSLMpqBJuuN2CkB6KRRLeVxhO6yQdZqEXiz6Deo6PnS8iQzzZUdbLa
	 IPNjJN1sodkysvWoTU1TNwK9o2jTEUHkNQHa2M6CWb9tPBXZTmM8EPJ5SZdJpqNXRx
	 qQpc9uOphQEag==
Date: Thu, 22 Jan 2026 04:20:36 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Lee Jones <lee@kernel.org>, Alex Elder <elder@riscstar.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yixun Lan <dlan@gentoo.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>
Message-Id: <176907723670.1588257.5123730065899244337.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
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


On Thu, 22 Jan 2026 17:43:43 +0800, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
> This allows different boards to describe their actual
> power tree connections in devicetree rather than hardcoding supply
> relationships in the driver.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mfd/spacemit,p1.example.dts:13.1-4 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/mfd/spacemit,p1.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com

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
