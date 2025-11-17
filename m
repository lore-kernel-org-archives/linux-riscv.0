Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEC3CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A0iq6BRVimoUSrv/z0Gmg83bcDkhRt0iYT3SvKKmaZk=; b=Gbwy1bVlUqKz+PljUx+EjOYHat
	oV/FqOvKlDLT2ZMMrLV2PzwhAf9Ph9O767ZnQFJyKSxLyAHdi3fVi5q4LnLU3w4FK5bNKLIn6NdX5
	OfduYvd8Z+m1BXVnjSO1+dgCMlrpqkIQ2xrq2MeJcR1hPwQj1r9d3cXPMkA12ajZjfeHeDE3peC3h
	gRzCrBfQF7S9UUtwC81FWvTOiCls1zJoQgLtWLdt3hSgB5rcoXx5f/5MY3dM2hzvZwu4fQWko5I3A
	SWnGaTkVh+uiWKAJXmOp7mUAmuYGqukC2IQ7wv+fjhB9iFUnN8AQzhxt4Ra3fZlb/+gS5QqoUa4b3
	sjg4AyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3x8-0000000GcF6-2R5U;
	Mon, 17 Nov 2025 18:27:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3x5-0000000GcEj-3oG2
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 18:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 407A4438A0;
	Mon, 17 Nov 2025 18:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F8BC2BCB1;
	Mon, 17 Nov 2025 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763404067;
	bh=KgWGDtm7Lix+RRL3J6skSv7OaO3bi5ZBiY3XQ0yIU/s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=t4JNfmpCwKuVCmYdu9cVztWn9iyvXZS9loTn2vM3pB1nQgTmPISqZGejupmoyD+cO
	 MrVmKcRm/aarV0ejHW5T3vhKw65MvtdIEyDYCaJi/Or9xAVFkyiRTraUQvckhDVwVS
	 Nn1xCcXwAY4Z3p207Eo0p7XwkvotHG9vu3f5gHg+Kf3ha5sqqjqr8Kc6CYI5AcYWNK
	 JnV+LyZg85LiDnxpmMX8CT/zM0iaWzCuBaA3tfmWxfHWEgDdn6pIn+GWdzNQn6CXpy
	 x+JyeoTqqP35At36EHG4mwplB3ULvKFNCJOS3loNb3V4wFElgWZ7YbclJgwCH5n0FW
	 uKSTFmjPE7Neg==
Date: Mon, 17 Nov 2025 12:27:44 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Daire McNamara <daire.mcnamara@microchip.com>
To: Conor Dooley <conor@kernel.org>
In-Reply-To: <20251117-twitter-sternness-f2b3a1506a6f@spud>
References: <20251117-twitter-sternness-f2b3a1506a6f@spud>
Message-Id: <176340406423.422791.14985477842686606616.robh@kernel.org>
Subject: Re: [net-next v1] dt-bindings: can: mpfs: document resets
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_102747_987952_65590CFF 
X-CRM114-Status: GOOD (  17.71  )
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


On Mon, 17 Nov 2025 16:38:18 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The CAN cores on Polarfire SoC both have a reset. The platform firmware
> brings both cores out of reset, but the linux driver must use them
> during normal operation. The resets should have been made required, but
> this is one of the things that can happen when the binding is written
> without driver support.
> 
> Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN controller")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This is the second mistake in this binding, both spotted because of the
> driver being written (although this one sat downstream for a while for
> w/e reason). I wish I could say that I'd send the driver soon, but I am
> busy upstreaming things I wrote and therefore understand at the moment,
> so a driver that I'd have to go understand and review before sending is
> low priority, sorry!
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Marc Kleine-Budde <mkl@pengutronix.de>
> CC: Vincent Mailhol <mailhol@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-can@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.example.dtb: can@2010c000 (microchip,mpfs-can): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-can.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251117-twitter-sternness-f2b3a1506a6f@spud

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
