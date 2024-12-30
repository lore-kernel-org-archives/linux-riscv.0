Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6231BE77188
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 07:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1OSz65riDfhZntUrbkLf9xWiG2+Q6akya8xNYJJjjY=; b=lmXNm54Ur7hpj6
	YQ92Z3/iLmGmhVuNdLlyNHM1oeZkJ7FGtnp9CPJr+6pEn9hLAsCYnt18IaUxlqetpMZQcmZ7aRmMb
	wb26nsuVT+P4vAdUjVRJo2rekjVnwwHhfQxkr3Kahj5Hj6XA/OxtdWRkgqJP6nQwzgJ40dvqUpfDz
	whhEOeNpVPBbBCtEU6b4GqgrrgIfvNQZKzBPe6hvDr0sAneWWzzv+Uz1i3fqTsbtbUcGdOg1wgiG6
	zG8pjEOa2iwjHdTWI8coCxGl7P16TIUEpOO2tIcxc1ikl++/j6SOEjt4vjZLI2W1rMwY0Lo2XNRIR
	jGHckllrIsyAsnm1WMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAbr-00000004loP-0fBh;
	Mon, 30 Dec 2024 07:54:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAbo-00000004lnz-2TmP
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 07:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4CC35A40A7F;
	Mon, 30 Dec 2024 07:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAD2C4CED0;
	Mon, 30 Dec 2024 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735545279;
	bh=183EA7MfCyWxhhzwpT8mT9bghaFpDjOqGIviGpm0Xd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvlVmJTPsEilkeHz2NgEIfo56yDGjFOw+rqKFtEMD86H+dR/pquZbRjNMjMNwmywS
	 K9yF5bxbhXPdF4q4tY0T7Lt6JQWpjiaw6Yp1tAbTrfOgdQjoLgnbRWe1RgFXk1pDm5
	 hRx3n0d+bs6BTXkYSQ/eRZcfT50IbBnazT9lXA5XgqL7Y3QM03LIypZlTa4HA39glp
	 e82iS08bcaoD35Jg5mnILgrJzD+knjtIecoJ3E3huzy/BE03zeou3jhBfFGpS4U+iE
	 ZljgEhmXkp18UNHAvrFiF2h/fj9tSvzRFWu0bEY/Zn0vKaPrYpqZGV4U63YeoLnR1S
	 lk3MYOa9OLJuQ==
Date: Mon, 30 Dec 2024 08:54:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
Message-ID: <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_235440_788171_35B0E90E 
X-CRM114-Status: GOOD (  17.89  )
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

On Sun, Dec 29, 2024 at 09:21:08PM +0800, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
>  include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
>  2 files changed, 90 insertions(+)

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

> 
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ffd4e0b052455bf3dcedd9355d93764119df3d68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  clocks: 
> +    const: 1
> +
> +  reg:
> +    maxItems: 2
> +    minItems: 1

List and describe the items instead.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@91102000 {
> +        compatible = "canaan,k230-clk";
> +        reg = <0x91102000 0x1000>, <0x91100000 0x1000>;
> +        #clock-cells = <1>;
> +        clocks = <&osc24m>;
> +    };
> diff --git a/include/dt-bindings/clock/k230-clk.h b/include/dt-bindings/clock/k230-clk.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..31d1f82fbcff654072ef1a8985a884377d801e72
> --- /dev/null
> +++ b/include/dt-bindings/clock/k230-clk.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + */
> +
> +#ifndef CLOCK_K230_CLK_H
> +#define CLOCK_K230_CLK_H
> +
> +/* Kendryte K230 SoC clock identifiers (arbitrary values). */
> +#define	K230_CPU0_SRC			0


Drop the indentation after '#define'

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
