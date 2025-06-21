Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB7C7115C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jun 2025 21:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybDAE0gNLRo/ABzLmxy0f+L7jtABdEN/Ny5el1fLung=; b=NDMvFCCwEe7Ce3
	IPJephRRlwYB2vjaQ+odw2NgU93MFSLf+XzngeCPReoJ05qLLXEwuR8k21j5oLvuTIi5wD6Hvr7hG
	6ujiez0uP4F5lYuxomxFaozp0/zEZFNDBtMLnnjHXRkrgGHc/Hv5hDoY/qKaPYjpUDdO3EobgpBKh
	4g765wBglP5rOnQ80GTsZIeF7zsVs7iyixyxE0cr3lvv/MZVSMbAo/pLERIwgW8Mt58LrpQraicx3
	0+cEkeHNoTfxtG1BKMDyROStt64aP7Yp1DBhKosP0q3i4yCAphxfA4ot3hNxAh4IDyzWHQgbS4rie
	yoF9WMUpphXUCBeoPisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5Jp-00000000HjP-1Oyh;
	Sat, 21 Jun 2025 21:00:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5Jm-00000000Hj0-2U01
	for linux-riscv@lists.infradead.org;
	Sat, 21 Jun 2025 21:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3C2D5C51B7;
	Sat, 21 Jun 2025 20:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98C7C4CEE7;
	Sat, 21 Jun 2025 21:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750539604;
	bh=4WspGBe2UN50/5ro6MGwqXsBIUukFUCub7kmgEVQA78=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kzKH9cjUVbv/vD4lGTHuyDtsXhZ7h5gC/DKWkygspQV525izF/qE3DAW1qs/mNFgV
	 bavgFL7egmSp/ijtoaunub+wItuoAxwWhDB3ljvMFCGA3O7duAaKmgynBePGASOJyT
	 t7WVmcL8xbQvffSRXO1SgQicc9ldhtf20N9oaGW3A5pL7bGY2tBn3rNRYOmzWjlnUJ
	 L3758RxIG+1IvCZf6p3hwa+5m2o90RBfGLfbvPCnm85HtDfDJAsupw0i/6048XoHwy
	 r70ylXPVOOU7ZOhTbKJGwEg/xLCdkIhx29/oMe3VTuNDY43RiGpF+DfkZeQy9AHF+r
	 2koi4Jw35TUyA==
MIME-Version: 1.0
In-Reply-To: <20250618121358.503781-8-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com> <20250618121358.503781-8-apatel@ventanamicro.com>
Subject: Re: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Sat, 21 Jun 2025 14:00:03 -0700
Message-ID: <175053960304.4372.5933123695583752824@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_140006_675649_B25A3017 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Anup Patel (2025-06-18 05:13:42)
> diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
> new file mode 100644
> index 000000000000..70ffc88d0110
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
[...]
> +
> +examples:
> +  - |
> +    clock-controller {
> +        compatible = "riscv,rpmi-mpxy-clock";
> +        mboxes = <&rpmi_shmem_mbox 0x8>;
> +        riscv,sbi-mpxy-channel-id = <0x1000>;

Why aren't there any #clock-cells in this clock controller node?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
