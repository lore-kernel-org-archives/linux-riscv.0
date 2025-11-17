Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42998CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gc17GGJIFR+QemPV/77ZkXxsuzkq8RKsFMO49b1X8T8=; b=JKH0Z1sFKXXytbggnhHS5BYJ56
	1TWlRWKlAj+xW+si0N2hf+e00oZW3VX99KHLaElzukyHMsREtGvprF4Nyov2oSF16HIG3W6uKo6Bj
	nEXGsTz1v8ha98P22hnJAIko/Ikj/ysn4ZxlIirI84Cy/FHxLvepzALOAmet0DbPwnjsRDgGDlo20
	oBw+F0zGS3Ct1cIuI4iX7i6WTyYZoa9BbXPb8D6zy6zKutbbla7UK4BvOWcMdsHdcBT99ljg9kjcE
	3Q6NFu3oE5KCVnJ7Ig8A++UjEB1NWF2xeR0XyxyNsyiqEOQFUeE+ypr1kXNDbA/UirRjrwgXkY9/5
	4Q2ECiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3FV-0000000GYYk-3Wpi;
	Mon, 17 Nov 2025 17:42:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3FU-0000000GYYR-1TTj
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Nov 2025 17:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=+4rBVlzTN8s50QhdMI7QPH2APd6iyzxI4dgDY1dTklw=; b=MwxtwydMFJzTE0ijpRnVVr9NYA
	vMFK349l83R32HVxHGFsIipUD5vH6QJKTPxV/5BwTOB0YH5ZwyFpjeY6liLRlkVUdggXm64iAQxOB
	tl4BWA2CaWanIk5hMGEmM8Fi6yF+IIoyvFRCBRjRiyrhCKYMstgBG/lmN9gLL0SKv62+ETnlH5e7q
	iYe/EkuS2jIAWTo5E2izhmHbTZvPXiuBZMBgYDDJ32hYObeJx98TwAK+yRu/C3+sTO4YfvO8qxqDV
	ssp5sC0gMBtraB9yUh+YiH2gcJEfJTH9EKhKuUUlOAg4eeEebiJckWZacJtJCPIz4IAvSnj6TQcz7
	0eTPrPUw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Nm-00000007pa1-226N
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B408444A2;
	Mon, 17 Nov 2025 17:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C260C2BCB3;
	Mon, 17 Nov 2025 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401355;
	bh=R0/0GbLQF+TXdGjuffLHHelbqT8ZA3jUtOrLrXjQjE0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iPmC29vrHMSe8PP4KznVu/z28OeeNMFex2mZikL0MIXW46cLMDbamL8N8P7UjZkU8
	 9gSycay76YvC+BI7JqTwhmyJWhp579I/UJdtW0xT86/QjtQKbZD8J4q/wjJzQ0u/ze
	 gDjO+/ljh08wiDct2st6JZKwC+Vizc32WkMaOll/0kDjUjTn6T91jrQtnlb9TUrkAe
	 QtyCLn/UTS8g59QS4SopgMJtepSn7r3Dlq9uUCDFmXOWMo82/a6SQM2oHe4b8pBKHM
	 BadUQlwW7rPXGoT8GkGCtDaa8ojIV6r36XBFpRjfPe9AOY2CzfZVfmA/HDdJUqHaj5
	 VQ/A8J2HzAhRw==
Date: Mon, 17 Nov 2025 11:42:33 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
In-Reply-To: <20251117-depth-sage-ee0829c71c25@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-depth-sage-ee0829c71c25@spud>
Message-Id: <176340135320.214025.1792944827677577860.robh@kernel.org>
Subject: Re: [PATCH v1 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_164714_706111_57234163 
X-CRM114-Status: GOOD (  11.33  )
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


On Mon, 17 Nov 2025 15:35:20 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> the deprecated configuration that was never supported for this SoC.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml: then: 'anyOf' conditional failed, one must be fixed:
	'reg' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251117-depth-sage-ee0829c71c25@spud

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
