Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BCEC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uY0TqRg9ydLDw8MmoFUjmRYcdlPVB5Z5Mrt3VLz8ro=; b=0WJJvFRq0obcd1
	p8PccBk1b/SAfK08jllCkxRq0UrmtqQGkmSQ+OMeFxWVz+rbYitcr/5+UQdoyLbOg8M+2Vr0KSLrT
	35AtIucPN+DlQCIDzEujAidnfLllUOvRv8rIJxGqh/QUsQbjWhueAICCIf/BHq8VsMWcXiyLNGj0S
	g1X0zrpXYYTZBD2CccPWh79eogp3X8ADtxPloNfWXYMAhjZnwm1fnxq3YZ4/hreWTl9jAxemVn/GP
	ag98DeXX5wm9I44K7A9guZiCeSe4Vp7GeAYKKiKjEQbzYgV8WDFQrnar0ZucnStiP6czZ+a2Ggajd
	9qvyPIemEkDVwRPgClsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVdR-0000000AUZ0-1no2;
	Thu, 13 Feb 2025 09:35:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVdK-0000000AUXH-2Ehi
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 09:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63F695C0324;
	Thu, 13 Feb 2025 09:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD55C4CED1;
	Thu, 13 Feb 2025 09:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739439345;
	bh=jXd6q8MdvVTJsbxDcyPyBVc+ukySTPmELhYgRQ1zVLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydj57RjjLQGej3cV3egCohLYw64CmAREuReZ5ZSKdyHlAP7wp6SnwxEW0C92IhAOh
	 tzyVpKqdVZsaNCSrngFrVmfA0q6d98S0JiNUIxlOBzmtBxdQSPM7W3GCNBWy7xw/Zq
	 rOABdNsSRtNE9FehSGDxIa0IK/LB4pFQrG5ACsVgHf3ExUVN1G4QXEm6uep0MNEEXi
	 UnKmrQBpbPatxyuS0eGWcw9EooABxJTB2s+w4RN5ER2riaNlBzCD9yZIbZVhpgJ7Gr
	 BWYhKaTv6Tv0bgsnmxlKpTd6BLnuBngZaADQknPxssItLk/4shJsWcVpHyQDWKFB0S
	 jsMKrKdVp2qpA==
Date: Thu, 13 Feb 2025 10:35:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
Message-ID: <20250213-cordial-elated-grebe-57aaae@krzk-bin>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <20250213020900.745551-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213020900.745551-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_013546_632154_1BD701E3 
X-CRM114-Status: GOOD (  17.77  )
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

On Thu, Feb 13, 2025 at 10:08:54AM +0800, Inochi Amaoto wrote:
> Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> a simple reset controller by toggling bit. It is a hard time
> for each device to add its own compatible to the driver.
> Since this device share a common design, it is possible to
> add a common device to reduce these unnecessary change.

SoC components are rarely that simple and even if it is just a bit,
usually it is part of one or few registers.

Anyway, there are already bindings for reset-simple and I do not
understand why this has to be duplicated.

> 
> Add common binding for these kind generic reset controller.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/reset/reset-simple.yaml          | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> new file mode 100644
> index 000000000000..77584e23e8e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic BIT Reset Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +description:
> +  Some reset controller devices uses a simple method to perform
> +  assert/deassert by toggling bit. Some SoCs from Aspeed, Allwinner,
> +  Sophgo and Synopsys have this kind of reset controller instances.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - reset-simple-high
> +      - reset-simple-low

It would be one compatible and set of properties describing resets.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
