Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F40C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 12:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w8hbsOzsVW3Lp28DHhqhx+WvIO5MKvo7/0pR0PrH3Kw=; b=0Nlehtjjflv75hFz1TJkcAJvJd
	nT9rG6Yoz9B9YoLQd2FxjBTpMnUjtfRW1QOY+Q9bZw7Bng5zq/6EmUjNEP65CI+6ckJUkgNes21bZ
	WLAeUVl0oqnxZlnFrhlZaW+OJmODbXcl2gjAOStK8nKgUhYQW6YtHsd2gsHy+VW4Uor7HSyvCzWY5
	sF4rSxoL/3NTT5NptLFf/97XV/JPB7GkDl71BcWj0JHZc4dtoKaNq2KRHLfrijFg4ixO9lt9TgQv2
	vUsrrKwp2YdfmRN8gbz3lEBtg3HE4rjrj4MKpioh5GcMuzaGXyz/qq0QTmhUSLHW6AO1M6JcbsVHP
	h/EnGpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIcH-0000000BFLu-3rj6;
	Thu, 03 Jul 2025 12:00:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHVk-0000000B3I5-2KUA
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 10:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1F84A53440;
	Thu,  3 Jul 2025 10:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41727C4CEEB;
	Thu,  3 Jul 2025 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751539787;
	bh=wY2wfTZ564kxU3kdTgduWjVJsd6vAkmmNurNo83Nc0w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aAZOlH4nEDKkEb6zqJb1QxtLz4Pa37sjKxvukafYYDepwMAn5C5LFEHUcMSQIfgzC
	 S03OJoeuPoeGcxSHkf7ElsVygB4ibRWdcSRUlSgxrQoNQFf4PwZq3dwRT5qUFwhLpW
	 RIOaKONd1uWCZfQPFOSF+b9aCoTE7MVUP/3f7JJKkNNjeAuGiER20ah/UTHYftqIy7
	 GMH0nGZKUQwR21vqTJbZxQZXXSiqyObDDjkwVAKIVsMjjmqffZjAQdGRAQsf3Q+99w
	 JJkrbq0SIOvudi46oWIIqLC21x67fjPuEhl71lc+LvNfoRVy57s94kL31c9guzN7Rj
	 9T2k5+g9JSu6A==
Date: Thu, 03 Jul 2025 05:49:45 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Eric Dumazet <edumazet@google.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, netdev@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jakub Kicinski <kuba@kernel.org>, 
 linux-riscv@lists.infradead.org, Simon Horman <horms@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
 Vivian Wang <uwu@dram.page>, Yixun Lan <dlan@gentoo.org>, 
 spacemit@lists.linux.dev, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250703-net-k1-emac-v4-1-686d09c4cfa8@iscas.ac.cn>
References: <20250703-net-k1-emac-v4-0-686d09c4cfa8@iscas.ac.cn>
 <20250703-net-k1-emac-v4-1-686d09c4cfa8@iscas.ac.cn>
Message-Id: <175153978342.612698.13197728053938266111.robh@kernel.org>
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: Add support for
 SpacemiT K1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_034948_661179_B8EAD187 
X-CRM114-Status: GOOD (  11.07  )
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


On Thu, 03 Jul 2025 17:42:02 +0800, Vivian Wang wrote:
> The Ethernet MACs on SpacemiT K1 appears to be a custom design. SpacemiT
> refers to them as "EMAC", so let's just call them "spacemit,k1-emac".
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/net/spacemit,k1-emac.yaml  | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/net/spacemit,k1-emac.example.dts:36.36-37 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/net/spacemit,k1-emac.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250703-net-k1-emac-v4-1-686d09c4cfa8@iscas.ac.cn

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
