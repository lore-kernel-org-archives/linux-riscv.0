Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD36C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=brJFZ8AQVfadYbWD4qRPk9EQ8X0gi8AyA6pumWXHn8g=; b=U1dsaoa2E8YU1bpmpuIA4nEXtC
	PkVKpeP6IJ+oSVKVTI5l2AmmA90tlGj9X4TDFKUFVDs1ieqkDDEdYA4MF1QlETO5oIizBVpYh7daM
	qFPSNqgLkC05zskRhxNWyxBc9LtZRsZo3IbFVQqDbqSLkGcTVE/EHsPLkkTQyb82CqgdieQRtVA1J
	6jkyEU3xmFyNZYMMbC7z9t7JPU14owB1ufa+ru3CQT5w3Kr+oTf2tnyD7KugtM8naKPmOQVNzjelC
	Iz49QG+uW8H28+fwQanbyeIo68QaVTBxS/m/41UAp5WLkfJ69Yr++ror+q51bfhm9J5ezMXFzax3M
	gKyDs0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexyP-00000002Ydh-2KvW;
	Wed, 01 Jul 2026 16:39:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexyN-00000002YdO-3lZM
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 16:39:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1895F6001D;
	Wed,  1 Jul 2026 16:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA6B1F000E9;
	Wed,  1 Jul 2026 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782923978;
	bh=i2S2b9gwlzlrq71xUZnAbbsrQZGU2konPvu0kspaKrc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=TOTlHssS4K3aSspdhrVxeLftNotWdK7iHpbdaKmIjM4RlIP1tQpKAnW8SMm6VCRat
	 /39KMMz3+qgUW5Naj0+z7EEn2VMW7tj4PGoQW44+mu/3BS6defuPfg0W5coObmn/WU
	 AcF1n9KzA0Hh3hEUNDIjrdVU5sm0pegEydrZsMFQl2gRLji8CiW3poGMOtDItqDytl
	 mUMq3BfN/jtR1F3yM4y/+Nakjjewv7zf3/Y+OU+eWvLkQXAnuXm/4XxVbUz1D7B9DK
	 coxemdeSqIbktji1xhEiS38VZ8Am6tF49pdaGEb8EIqqpYPs3TCAhXNf8YLCiz+/TI
	 om/TA0lzfDh9g==
Date: Wed, 01 Jul 2026 11:39:37 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Sumit Garg <sumit.garg@kernel.org>, 
 Jens Wiklander <jens.wiklander@linaro.org>
To: Xing Loong <xing.xl.loong@gmail.com>
In-Reply-To: <20260701132514.186953-3-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260701132514.186953-3-xing.xl.loong@gmail.com>
Message-Id: <178292397672.969186.6837238120896509616.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: firmware: add mbedtee,rpc binding
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


On Wed, 01 Jul 2026 21:25:13 +0800, Xing Loong wrote:
> Add YAML devicetree binding for the MbedTEE Trusted Execution
> Environment driver.
> 
> The binding covers two platform configurations:
>   - ARM/AArch64 (TrustZone, SMC): two reserved-memory regions
>     (rpc-t2r-ring and rpc-t2r-shm) plus a GIC SPI edge interrupt
>     for TEE-to-REE notifications.
>   - RISC-V (IMSIC): three reserved-memory regions, adding
>     rpc-r2t-ring for REE-to-TEE command submissions; no interrupts
>     property (T2R notifications use IMSIC MSI allocated at runtime).
> 
> Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> ---
>  .../bindings/firmware/mbedtee,rpc.yaml        | 221 ++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mbedtee,rpc.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mbedtee,rpc.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701132514.186953-3-xing.xl.loong@gmail.com

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
