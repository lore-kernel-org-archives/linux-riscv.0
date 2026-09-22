Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B695DC98302
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xw2a0R8WBIRjBI0dQhcZ/6xbi60WeIOGI5PufKD6NL4=; b=wcARo4qCfjXbynP1b/71YnozWk
	FIZOdMSh2M9Fpola8lw9AG6OV4C8EtPcJfX7bruls2Dwlu9QLbXzgz8Q1pggJ2UcYFZLDunFR1eTn
	2Tl/WQAO9Q3/KleQ+j+DzvmoNaykCOX/VtFKeLrih0m6SwiYDykSLOerkJuXAybu8J0oRmS2pZ8i7
	55RHxC7mEN8NaPgmLu8d6PbgHBfkNQGb4me4N8MZtQAKGcwjwUvrOc4nBuZiFBEyMA9y26qRECxK3
	LHofLJ7enXDxu2mTHok0EbAUNDeonnpPseth7oKmCDx7fFNoWBNAXoumqhNtZi2l/ZtumteGzch4m
	0pOIB+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97x6-00000006blb-2umD;
	Tue, 22 Sep 2026 21:23:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97x5-00000006blU-3yKC
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 21:23:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93BD94400F;
	Tue, 22 Sep 2026 21:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBA21F000FF;
	Tue, 22 Sep 2026 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790112177;
	bh=1ZdkMU9inhU27Sz46y78NDuxZnAhsIJpwSLDKT9rQIw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=CeG8u+eCPy3/q0g3QFP6oCSFYO88fpUB4LTJTZoWvF9k5Aefg7QPsJoZXoeT+KQCg
	 44eGMQeHQRpNjbc0UcsmCIxk6smoZfVxbKtmuWFXrjHBbcLjNnz5xI7NWOQsVku1l4
	 Z0XYcqrTGRTDLl0tNlXZ0usbCinrlpGox6CYlsd9kc+zp6tk0iHxvctyEg9peNbFzS
	 dvc77gGjNtFOTFbGl7JTIiiOaLYMYGALEjkeLZVs9dWOMlELUdzuquR0m/VAho7p2L
	 FLucOgkSzpOvtsdfcNj23GzxbqLnaxaFSbk7xpJLrLVloHr5jzXiEO3jFMdiBcLYug
	 /Cy9HLaUD3Hbw==
Date: Tue, 22 Sep 2026 16:22:56 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: rahul@summations.net, pjw@kernel.org, broonie@kernel.org, 
 aou@eecs.berkeley.edu, anup@brainfault.org, alex@ghiti.fr, 
 conor+dt@kernel.org, lftan.linux@gmail.com, palmer@dabbelt.com, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 linux-riscv@lists.infradead.org, lgirdwood@gmail.com, 
 devicetree@vger.kernel.org
To: Joshua Yeong <joshua.yeong@starfivetech.com>
In-Reply-To: <20260922161156.1088153-2-joshua.yeong@starfivetech.com>
References: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
 <20260922161156.1088153-2-joshua.yeong@starfivetech.com>
Message-Id: <179011214727.1123357.14799717245242010504.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
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


On Wed, 23 Sep 2026 00:11:52 +0800, Joshua Yeong wrote:
> Add device tree bindings for the RISC-V Platform Management Interface
> (RPMI) voltage service group, both for the supervisor-facing regulator
> controller and for the SBI MPXY channel which the SBI implementation
> uses to expose the service group.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../regulator/riscv,rpmi-mpxy-voltage.yaml    |  65 ++++++++
>  .../regulator/riscv,rpmi-voltage.yaml         | 150 ++++++++++++++++++
>  2 files changed, 215 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: /example-0/sensor: failed to match any schema with compatible: ['vendor,sensor']
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: /example-0/codec: failed to match any schema with compatible: ['vendor,codec']
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: /example-0/phy: failed to match any schema with compatible: ['vendor,phy']
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: phy (vendor,phy): voltage-domains: b'\x00\x00\x00\x03\x00\x00\x00\x03\x00\x00\x00\x03\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922161156.1088153-2-joshua.yeong@starfivetech.com

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
