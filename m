Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B190C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Es8vDQg5GjqzLkNo2sD/jNiOIZIY0tgPadIE2g/cSrA=; b=ZIu9rlXMXao7KjDCRitGTFiRpv
	HKR9cFSCL4ChSuH6CP4ICTTBbS0kv3AitcW/Mt6NbuOC1AroplUgNP6tZi/SxAdPqLsAyUktRxBUp
	fA7D/B6WleOkhvxlRo8dxLVyhb4CEroxhvqBYpwRLrRCQvHegKCzKTpn4wOZL41MC7TIWw9CQ02D+
	3rNslpPHpFVberFZyGXc+BwbOItCAPO9RkWuuUYg9q/psHHmXoq+Qfjn/Tf47CE8n5q5Zp1pOw95R
	4qrS1PRf6LT/wTrAEpBU777SxDfvuHVAEflXQNV/XRtevFraiR3MiqgQq13q0lmly1VWx7CH/RIKl
	vch6kB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChio-00000007iXj-32qq;
	Thu, 30 May 2024 15:29:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChil-00000007iWy-0E2n
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 15:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9909660917;
	Thu, 30 May 2024 15:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB4EC2BBFC;
	Thu, 30 May 2024 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717082977;
	bh=Gi2b4tAeapnVFAVHATW9DZyWTw7+azG8pibOfQ/C8e8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=vRP95coT68pAHJGBDi9kVMTJ79uAxqNsBKkOE7p29gfV0pBjoJlkwJDsQn8qnUevx
	 j/BWVwTSOHbEz6cNq3tQ6JsSgd4RNTrmK3YTK4ARwD+WfahSqquHNcXLySqnILMPFQ
	 SKCLHykULGRWDBwl/LIVAT6TxMXiXIL7qPJPATG+gZVAvfCG0SAGyMQCh0X+b7lZId
	 Ilau25M9Vr7x40oj/UCveD5JnyisJIUhvp7NmF4PlqzcFCuqNQR2XeHJREN17NwS8K
	 1arLemDqGbB2LiXhzTlZO+E1Ah3jD+HKdU6Auz53G2IRp9wDBzp+MqYHeie6qncroH
	 Vu8kMXAzmFpUQ==
Date: Thu, 30 May 2024 10:29:36 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-pm@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <SEYPR01MB4221BD44992A23E2B0061023D7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB422119B40F4CF05B823F93DCD7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221BD44992A23E2B0061023D7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
Message-Id: <171708297616.2297193.3978844021510397590.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: sophgo,cv180x-thermal: Add
 Sophgo CV180x thermal
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_082939_182318_FF476A3E 
X-CRM114-Status: UNSURE (   9.54  )
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


On Thu, 30 May 2024 13:48:25 +0000, Haylen Chu wrote:
> Add devicetree binding documentation for thermal sensors integrated in
> Sophgo CV180X SoCs.
> 
> Signed-off-by: Haylen Chu <heylenay@outlook.com>
> ---
>  .../thermal/sophgo,cv180x-thermal.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.example.dtb: temperature_sensor@30e0000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/sophgo,cv180x-thermal.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/SEYPR01MB4221BD44992A23E2B0061023D7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com

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
