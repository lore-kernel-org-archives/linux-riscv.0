Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E71CE7AFD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+bM6K1AapEOFMX7uAkHllSMRq2USTYhT82WBdrqNLw=; b=iTnaK+HFjpZar6
	RgoIQ/vhpF+8tUXDez6k7jfHpK3GwVOOkseynBVOlUL7PCdBlTsBhaODmkr9ADLnDJS4FUjdtWeCm
	pFfuPrFsB3SR41FXXGq8vKpTIG+agG8dsX3/jP0y6+B2NV4CZ4WB3KYn7AKQjjQQsh0izFw4NWx1n
	HYHSyNKTccdsokdQ8icf05v6ca5ovWlVMJNitEvSWvnlhCWTngsyyVNItQ0A+C6ifMs9Obis7FTPM
	vVHsmf9Cf6HIFwYAtAhDt5D1vEmVMexoLcEE4B9LO+eAk8WmT0BQRqTMOSDTAba4NMzz0NMZoC1wk
	AzWQSP5bYKSDyYvuhOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWFT-0000000Blum-1ia9;
	Fri, 06 Sep 2024 10:31:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWFQ-0000000BluH-2gCq
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 10:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AE055C5818;
	Fri,  6 Sep 2024 10:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80830C4CEC4;
	Fri,  6 Sep 2024 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725618683;
	bh=A4c7deV6ZIknQWmVX7wV7TaEk2v1931J+nZxYnmgi2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgJJBX9yutVEx2zdLpiQZ2XQR223NBTCKqOzD/EVInroPSXC0eiTARgNwfrTqntzP
	 WlA6C8USra4b3+cTyHa7+mEpqse4xOvnlX/XWmKYDcnjH0Yy4/BkZQApgM77iAfUYZ
	 SWOxV8pFHG98kEc0zsyhcDaxiylu5sUbORDBj6eiN2bXod5OgU8PVch4zKlDbkjbVE
	 FRmisOnwqWp6RLolWa0UjhJbibizzbvfx4KbkHSaVEBAiI/snda7N8fALES0FFCxUm
	 xfLuLGrQQx2qzfGmAjlz+Ud4baHyszNeuzsMOU2KJVeDOqlGzDYn8/p6YJbK4HGKYL
	 0BX2kWu7UoUiQ==
Date: Fri, 6 Sep 2024 12:31:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@outlook.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add bindings for sg2042
Message-ID: <clq2dwmsks56553cythofgd3x5sw4t6pss7cxup2hrvj2n563g@3ishagojtabx>
References: <cover.1725536870.git.unicorn_wang@outlook.com>
 <6e5fb37472b916cb9d9abfbe3bea702d8d0d9737.1725536870.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e5fb37472b916cb9d9abfbe3bea702d8d0d9737.1725536870.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_033124_744666_9FD25878 
X-CRM114-Status: GOOD (  13.99  )
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

On Thu, Sep 05, 2024 at 08:10:25PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding document for sophgo,sg2042-pwm.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Say something useful about hardware instead. The same in commit msg -
you keep saying obvious and duplicated commit subject.

> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> new file mode 100644
> index 000000000000..10212694dd41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 PWM controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description: |

drop |

> +  This controller contains 4 channels which can generate PWM waveforms.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  "#pwm-cells":
> +    # See pwm.yaml in this directory for a description of the cells format.

Drop

> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false

unevaluatedProperties instead

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
