Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C59C369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDK4EcuZJYzcSgHa2cLqpGsTJd5x+bWaZaw6XYMOTz4=; b=Hp/rDY3lmGBABq
	7/gAedPvWUncsnbml50ss4HLcjweB0Lj/DJJ8H0yELWiuzEnUcvyXVK1u+FLZNhPjiZaOG5JqeNz6
	EsTwnVmL/UrrOVEqbarvHyG0w/qcDH0+/wsgny8vweMLso/a+VN2wnMnRaduiH66BpEn+Xo55DeaG
	O2qzHSJfL7PKKk1gxyWgoHvvyE1xuWOwms/iJeCH3d2nfUDvlJhrAUMNy9Qbs03CMTIGH5xsxo7mv
	R5NYhbBGHkInQT9BJW0KG1xYTuRvAQ9PYwSWAfyPOTKAzajxa5WJwbq0QB6wdkSTJqzfMen29uIp+
	eq/WFxDd2TV44iWrohaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nQB-00000000imv-0PeK;
	Mon, 07 Apr 2025 14:25:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nJQ-00000000h6M-2Sna
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81F1B49CF5;
	Mon,  7 Apr 2025 14:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2DDC4CEE7;
	Mon,  7 Apr 2025 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035536;
	bh=GolMPkoFdH8ez2BCh2rarCfeNX23XY2yQI7bA6iqZKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmKPTvNKo7GH841Ti6r12nXy0r591k3cCRhCheNVDeGjMLe7DE1T7RrIltDkwUISM
	 HmSPJhvd8shdr77+OT3M9ObmjOznvTxdAv973uZ8R4yWn235nHN1dUbEUUJrNzMz3c
	 /1HL3yjjEUHKMig9/ZJ85XPBjT7Wsxel76i7thVSJFr8loqm+QLyelvtQ72d5IyR73
	 c6oee/XjjzuFiAv1ECR3WewFHG90oPEE5TLQn0/f6nlc9REetB6OUEAaHG3g4mgZin
	 HuBH3d4uVxRdzfgATFW6uifZg8EW8MeVbzV/gpqljNoriCd4oThWx5TI1FaiiVY1Li
	 v+N0KNmU9xIbg==
Date: Mon, 7 Apr 2025 09:18:54 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
	daniel.lezcano@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	tim609@andestech.com
Subject: Re: [PATCH 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <20250407141854.GA2277442-robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-6-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-6-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_071856_665244_6282AB69 
X-CRM114-Status: GOOD (  19.24  )
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

On Mon, Apr 07, 2025 at 06:49:33PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine timer.
> 
> The RISC-V architecture defines a machine timer that provides a real-time
> counter and generates timer interrupts. Andes machiner timer (PLMT0) is
> the implementation of the machine timer, and it contains memory-mapped
> registers (mtime and mtimecmp). This device supports up to 32 cores.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/timer/andestech,plmt0.yaml       | 42 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/andestech,plmt0.yaml b/Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> new file mode 100644
> index 000000000000..e0ea3ce86b76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/andestech,plmt0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes machine timer
> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - andestech,qilai-aclint-mtimer
> +      - const: andestech,plmt0

Drop the fallback.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 32

Here and in the plicsw, it would be good to describe what determines how 
many interrupts there are and what's the mapping (index 0 is ???, index 
1 is ???).

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    interrupt-controller@100000 {
> +      compatible = "andestech,qilai-aclint-mtimer", "andestech,plmt0";
> +      reg = <0x100000 0x100000>;
> +      interrupts-extended = <&cpu0intc 7>,
> +                            <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 645d7137cb07..d1e1b98dfe7b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20730,6 +20730,7 @@ M:	Ben Zong-You Xie <ben717@andestech.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
>  F:	Documentation/devicetree/bindings/riscv/andes.yaml
> +F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
>  
>  RISC-V ARCHITECTURE
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
