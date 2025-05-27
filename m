Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E4EC5AD49
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 07:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0eqEnykQ+ILFoUoM7xaSO0NoPej6kXi3VCJkHA6bu0=; b=S1mr9Ahr/R6gto
	gAgEd7TvrUOOExwxTEqn4rqEJ4LqDBFNUGEtzofPBgTsfmHbJLUm0AVHemFAx+NGo4Nqea9zNC5PV
	mOch9F9IcC6hb+TZUENKpuQ8E2qsctB7Iho7CfNvtbbm60e5qGdhkDGOxrC7eyzTUU8eCu0L3GqoY
	w1d9Vq5b3UKVVVQqQGtEDiLu5HdttcJ/2/ROovKfdumPwaK4WvW387y5i3my96Nfi2yXc0Zu9LDAK
	VPZHF7klLe1956yo9Yn8jDykW/f4qZJFavTumUsbbsAiiFND6s5EH75ceb0dop6GKxjqLTOqemYa1
	g4nwDP4eRuiswymua00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoQm-0000000A7IX-08Z0;
	Tue, 27 May 2025 07:09:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo9j-0000000A4pl-2mGW
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 06:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 949C061136;
	Tue, 27 May 2025 06:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FD5C4CEEE;
	Tue, 27 May 2025 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328682;
	bh=GyLshxmTVFon2TnwhUpFaApuHuBTyELSnTFqumadByA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wh+b9AkhGc9pqdWY0YH4mmFPkSB41l0YnTQNG7zxMMs9d8hG9ugmazSDX/DESsEdZ
	 Oyir4rLP4YJYCNHOM31HmVMfLsP3RnAkkRAKt7ydjjKu2NzzCQXP2yDbJEOFzggs3H
	 48vnv2INWQw77m7c9yP131Ipo+75Oer5+ptrtUN5FzYWwvuGUjpQrKFjDpVfspwRFJ
	 xrVwnnDqLqep96FxaIh3OSpLr9je7+y7wcZgHwGjAkXF9KJzIFehPuKxEJ1UazYN+E
	 oZD8Vw5wioLTG039XzzgPyfZSpwioReS3vzsuLO8y8hkuG2aGwyz8B+N1O8vs5C2vf
	 QqqH8LkJY2lbQ==
Date: Tue, 27 May 2025 08:51:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <20250527-energetic-pink-cricket-a282fd@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
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

On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> (MBUS) that is not their immediate parent in the device tree. This bus
> uses a different address mapping than the CPU.
> 
> To express this topology properly, devices are expected to use the
> interconnects with name "dma-mem" to reference the MBUS controller.

I don't get it, sorry. Devices performing DMA through foo-bar should use
dmas property for foo-bar DMA controller. Interconnects is not for that.


> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..533cf99dff689cf55a159118c32a676054294ffa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-mbus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT Memory Bus controller
> +
> +maintainers:
> +  - Ze Huang <huangze9015@gmail.com>
> +
> +description: |
> +  On the SpacemiT K1 SoC, some devices do not perform DMA through their
> +  immediate parent node in the device tree. Instead, they access memory
> +  through a separate memory bus (MBUS) that uses a different address
> +  mapping from the CPU.
> +
> +  To correctly describe the DMA path, such devices must reference the MBUS
> +  controller through an interconnect with the reserved name "dma-mem".
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-mbus
> +
> +  reg:
> +    maxItems: 1
> +
> +  dma-ranges:
> +    maxItems: 1
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true

No improvements.


> +
> +  "#interconnect-cells":
> +    const: 0

This is not a interconnect provider, but DMA controller, according to
youro description.

> +
> +required:
> +  - compatible
> +  - reg
> +  - dma-ranges
> +  - "#interconnect-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dram-controller@0 {

Either dma-controller or memory-controller, decide what is this.

> +        compatible = "spacemit,k1-mbus";
> +        reg = <0x00000000 0x80000000>;
> +        dma-ranges = <0x00000000 0x00000000 0x80000000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Nothing improved.

> +        #interconnect-cells = <0>;
> +    };
> 
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
