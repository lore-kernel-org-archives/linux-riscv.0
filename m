Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8243E77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:From:MIME-Version:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zghdXW3kQw1rWgMjRkIGVnNOY+enYIbLTMVOHiZTm6k=; b=wmHk4Yu3AcCo9t
	ohfPrdLhXrq7lCqyO+L/VcvyQw8Q9YRp+iEotWHafmBwGyocNpxvhFf21zE57TwzMJOv1cH3Kvcxr
	NDHfO9X69wB2vSXj30Kg1ZldO/J1zNaTaXX1VK2dIekC6mWLp3PM+q/lSwGNCbmpbpt4uDwSJVAR2
	2G/rjYQoF+FQVwaAvyjyL0bt1HQe5riKMdmM4t2om+r1WY9HwPD5uMx13wpf8y0Z+96Dras2BhV2k
	k9fXhuw+eWRPtXfc2d4x9ObKOpg1Dlr2dTTFxZXaDqvnVXE9wkxNKHZ+YScF9To+WeEsf8AH3x7Gy
	+inc0Qbp3VeLGOTU1RgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8Xr-00000009igM-36LH;
	Mon, 16 Dec 2024 10:41:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8Xn-00000009if9-0fXg
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 10:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60DE65C5FF2;
	Mon, 16 Dec 2024 10:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BBFC4CEDF;
	Mon, 16 Dec 2024 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734345702;
	bh=mljov7sKFphAAju6hgObLkzU6ii6fcbdLfyoYgfipWs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TGvVKPCXjpQnWXD3XCgdSYz0796+AqWhjBQsUuDnagoHds/uWQGaUKHxZfVLQ8iXs
	 rDVmTTtdVRT2rLgKhKauILmwbz2RtwwVvY7Z0kWfgQbcX5OGhCQRheVQvDaeY0ak/z
	 Pbl3FdZBeGiK3aBQIPCPt/5Q6ma9UpSQXl9/kjlpDKfT8M/Xx8hVbe+8ACTy10n/z7
	 I5dddbyWIOgg57zGySccXn/dxkTTsNmUSV9HeplQs+iObD4+9fDfEe2cXuzEVf46nV
	 jUbsi6kblzap9CC4cHZW+XCO1MtTURTQICo7u8zDxGcNcOFClT15wcJFFU35y8+/4t
	 XupaM2tOmxNwA==
Date: Mon, 16 Dec 2024 04:41:40 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
In-Reply-To: <20241216084817.373131-8-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-8-apatel@ventanamicro.com>
Message-Id: <173434569718.3760744.3925940874684255534.robh@kernel.org>
Subject: Re: [RFC PATCH 7/8] dt-bindings: clock: Add bindings for RISC-V
 RPMI clock service group
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_024143_285578_A35683F7 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Atish Patra <atishp@atishpatra.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Michael Turquette <mturquette@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 16 Dec 2024 14:18:16 +0530, Anup Patel wrote:
> Add device tree bindings for the clock service group defined by the
> RISC-V platform management interface (RPMI) specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/clock/riscv,rpmi-clock.yaml      | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml: properties:mboxes: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/mailbox.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml: properties:mboxes: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/mailbox.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241216084817.373131-8-apatel@ventanamicro.com

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
