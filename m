Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F992E9411F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shU9ejIxZ49j/SLDNFxJk5FonVkfo2+7a3H9I3XrwXE=; b=rS4BYHCFBG2yfR
	o87OEH4JKkfgdAhfkxJALGx8f8ysYWdr3y7sLLZHpYIXYSaUX4tHvD0uPCUlMcsDvEbGfCcjb1Xwq
	E6saF5Q3SYD9DEEUHOy0tNpZ34ZesMb/vIHwmCVwOgfzofmQ9IKWMuWltBYAjgVmZLp5jTqbXcmok
	IGgbaVPrTs9qbxJCl+NG8fVDsLb+YrI+bQn4QP0yp8g9i33dwQMg1tdrcrg70Dm15cvMK+2cbCy2K
	VKu7vNj5am2dWt0O3R2P51i4Mwz8Vr4cVje+UkX0XjwawxA7b0ngtWYKUfH00WFdqacixZ1JdUY4v
	c1Rc27JF/CLIcS1VizYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUKC-00000004WPw-45dH;
	Tue, 30 Dec 2025 07:39:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUKA-00000004WPM-2feC;
	Tue, 30 Dec 2025 07:39:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A84D40E89;
	Tue, 30 Dec 2025 07:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7842AC4CEFB;
	Tue, 30 Dec 2025 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767080362;
	bh=NTn6YbPV27Pkf9sCKwRoN0qQ6Sjwzp7wJfPziB96wFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgdQZZSVtmZrgfCC6G7YCWLQ/AgOUEYi6rhu6clLLfExDiPa2HuXymjjSe2QKZu0a
	 Hz8k6Qo7woeP3pXKnLC+fy72wwASn6goEou5PZIfc286nHKpavx7bN61WNiVPSq9sp
	 ELA/evwPj0q7dvJoiTKaIWzUIPcnsOx10d0hyhMgnbpuaiw71hC54j2iptx+dcK0c+
	 q9beQj8vNZDK1Iw8xsIgLQprna1JO69uQliMrc0TjkMim9jUL4GYpA5w2d6Iz4ErFX
	 MwDI96/jhAZ+fbuukpau2jfoGjhn7R7BTHyhxAflM9o4UEQ4K2BRn4B0SUDekW96+l
	 g9z6LdaG/n2RA==
Date: Tue, 30 Dec 2025 08:39:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	neil.armstrong@linaro.org, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for Canaan
 K230 SoC
Message-ID: <20251230-jumping-visionary-coyote-c0be31@quoll>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_233922_719350_4FF6C9F7 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Dec 30, 2025 at 10:37:21AM +0800, Jiayu Du wrote:
> The Canaan K230 SoC top system controller provides register access
> to configure related modules. It includes a USB2 PHY and eMMC/SDIO PHY.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../soc/canaan/canaan,k230-hisys-cfg.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
> new file mode 100644
> index 000000000000..77875f2d4f48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/canaan/canaan,k230-hisys-cfg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K230 HiSysConfig system controller
> +
> +maintainers:
> +  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> +
> +description:
> +  The Canaan K230 HiSysConfig system controller provides register access to
> +  configure high-speed peripherals (e.g. eMMC/SDIO PHY tuning) and USB PHY
> +  configuration.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: canaan,k230-hisys-cfg
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  usb-phy@70:
> +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#

So that's why you did not have example there? But where did you explain
merging strategy/constraints/dependencies? How maintainers can now they
can apply this or not?


> +    unevaluatedProperties: false
> +
> +  usb-phy@90:
> +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
> +    unevaluatedProperties: false

Anyway, these are not really real children. Defining child per phy,
where each such phy is just few registers, is way too granular. Instead
define one phy with phy-cells=2.

You also MUST make this device - hisys - binding complete. If you do
not, then my review is: fold the children here, because you do not have
any other resources for the parent.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hi_sys_config: syscon@91585000 {
> +        compatible = "canaan,k230-hisys-cfg", "syscon", "simple-mfd";
> +        reg = <0x91585000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        usbphy0: usb-phy@70 {
> +            compatible = "canaan,k230-usb-phy";
> +            reg = <0x70 0x1C>, <0xb0 0x8>;
> +            clocks = <&sysclk K230_HS_USB0_AHB_GATE>;

You never bothered to test your code. Community is not a testing
service. It's your job to TEST IT before sending.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
