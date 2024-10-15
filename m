Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ED9CFC267
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 05:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lVOYf93O9Dtk2fe8LcwSWr7frBrWyUzwQIPYPMK7DM=; b=fFcCrEgZQ+aQHt
	3nRbgfDG2VjHRObLGfZNTpWSOiKynpkg77eDS0emSMrfxTwkewLgVp+bJPPwGjKXFWVSWVdmwFsV+
	SCtOp5G99naeSBIezJbc57mEBDTQwsdxW4nis+QfhG7kZb5AY1qnb/lD1LxWgcRM1c6Pms8dMjKJj
	KXi21OK/Mwne4mDLcDKWwZEvNgOnctSzygE1P+a65R0DBB1gAS0TIq0JuUUB0JMqdEgnN2dnMkL6k
	yIwHJp1YQAEgHIzjrgEgWZCQYN88ANQOks3D+hPdk4zp/ScHSjhvfpZ5qf1RXUEphfRor9bQH1PsM
	ZspM4hkszjkyNyChEzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aWd-0000000792h-3HJq;
	Tue, 15 Oct 2024 05:55:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0aWa-0000000792M-2Io5
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 05:55:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C678B5C5C5A;
	Tue, 15 Oct 2024 05:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0225EC4CEC7;
	Tue, 15 Oct 2024 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971714;
	bh=kWLHVvcvN2bSXqY2RMOj0qilVEgJsGNToj1Exm2AhDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQzcS5yC3K7U2OtzrX9rJTMPbuxRjLQ/xE4Arr24JdSI122irbNpZKtg9JFDS5BAR
	 uqtPQrhOmK0ymnIn1cz2zWQyybcNw6N9U4nEJmXGd/WDTQ/Z4GQmxMVoLZfaUg+v2d
	 YDrRQ1Re6eyLMjQxlPf91GZ421QJIZ4rjMtJPRMbMjSLDKuBkPvmKo9lFyK3TMkI7c
	 8jrpWZ5G6dy/ScldF/+n1sVM4+A4R4lBsl76kAYIpc1e5Pd9bhy51i1VwdwwYxZW3K
	 jjUh+LDT3yBvxcu0HPKi+Pl+8/bfG8aApthurePHwd5k9S1/C14U0ME0mvgAMCffWi
	 deWNravhRvZrw==
Date: Tue, 15 Oct 2024 07:55:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
Message-ID: <4ey46hxumhldwrbzalyw6xzn2l52cejggxvg6e3imus3qqzsjn@r55xpxvkpodu>
References: <20241014073813.23984-1-heylenay@4d2.org>
 <20241014073813.23984-2-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014073813.23984-2-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_225516_771498_2A555398 
X-CRM114-Status: GOOD (  14.09  )
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

On Mon, Oct 14, 2024 at 07:38:11AM +0000, Haylen Chu wrote:
> Add devicetree binding documentation for thermal sensors integrated in
> Sophgo CV1800 SoCs.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  .../thermal/sophgo,cv1800-thermal.yaml        | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> new file mode 100644
> index 000000000000..14abeb7a272a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 on-SoC Thermal Sensor
> +
> +maintainers:
> +  - Haylen Chu <heylenay@4d2.org>
> +
> +description: Sophgo CV1800 on-SoC thermal sensor
> +
> +$ref: thermal-sensor.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800-thermal
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  sample-rate-hz:
> +    minimum: 1
> +    maximum: 1908
> +    default: 1

1. Why this is a property of a board?
2. I do not see this property defined in any common schema and I am not
sure if it even should. Sample rate appears from time to time, but not
in context of thermal sensors, so this should have vendor prefix.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
