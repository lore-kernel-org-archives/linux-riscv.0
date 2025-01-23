Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421C3C02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 21:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDj7xDaE4pf0fjIDIa50BcZq3pmAvtvHMOAwBI7UKtg=; b=W/yya+WoNnJSAZ
	7iJ9YQYi8cCT/uxK/r4RsIjgpQtD+bx3hIvoUaw5v0y0uaDJH/MpPXiGO0NKXPicnh0sWI24COjd5
	w40dmACMLi4b6N292B6Kf1PruG22XQVl9G48H3hgZ7yoWtROsEfD5X/hlYbxqXQVCLvtOW1HadnpK
	CTglLfwPiWrvOTmKeOiVzg/MPEU9jtoa7IMhmU5PHqY11uV4yf07rq+vgI31qpSS0EVP6Soswac6n
	0peovpfRleaNOUPG4zvJiuBoqTifHQGAZ79WmaqI/8gFlhpV33hGY7o136zvczipQslcG4DGQQEDr
	4lBvZRWF3o02s1lGzE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4lk-0000000DJjk-1JV6;
	Thu, 23 Jan 2025 21:29:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4lh-0000000DJjO-2Dhd
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 21:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 472D25C5AC1;
	Thu, 23 Jan 2025 21:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1F9C4CED3;
	Thu, 23 Jan 2025 21:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737667780;
	bh=FEs7jQ869xS1Q7igMZTQDDuVl1J0onigxN6VNDB8Jow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbwi+ctq44Dg0Y4cj9ZrNxVPLEKbRBScbEi43bABcv+nEooXfABtGgi4RotLU7Ch4
	 7YcHD9nzVmDEHWpGsTep7UtFer7VG2v3CfA6Qog3eO2QB1NPeNS1AiP8FA5A/qwEWx
	 Z4a98jwlH+6YdolG2+CzqQXsCJg/MS3Lq33GFywyQ63T5PCZLCJSAKobhF8LQm0D9V
	 BWbxNTcsqybGgWFiTBMPes+8CEgOIda9NtlKXZpxW33Kto1Lp3rx695qyTNfHGPyhf
	 69HOkH5PTmphh1tQoqVXmaFuwBzTP4LKV7+fDkmqULV0lQdjbkd1EblLAc3iplK1D2
	 GRATt+p71dLog==
Date: Thu, 23 Jan 2025 15:29:38 -0600
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	unicorn_wang@outlook.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, tglx@linutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com,
	samuel.holland@sifive.com, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2042 MSI
Message-ID: <20250123212938.GA390972-robh@kernel.org>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
 <c9dd12c3ad77b13dcdfbf4accd51e92e6ea2a4a9.1736921549.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9dd12c3ad77b13dcdfbf4accd51e92e6ea2a4a9.1736921549.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_132941_658827_D18584FD 
X-CRM114-Status: GOOD (  15.32  )
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

On Wed, Jan 15, 2025 at 02:33:23PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding for Sophgo SG2042 MSI controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../sophgo,sg2042-msi.yaml                    | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> new file mode 100644
> index 000000000000..f641df191787
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 MSI Controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  This interrupt controller is in Sophgo SG2042 for transforming interrupts from
> +  PCIe MSI to PLIC interrupts.
> +
> +allOf:
> +  - $ref: /schemas/interrupts.yaml#

Drop this.

> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-msi
> +
> +  reg:
> +    items:
> +      - description: msi doorbell address
> +      - description: clear register
> +
> +  reg-names:
> +    items:
> +      - const: doorbell
> +      - const: clr
> +
> +  msi-controller: true
> +
> +  msi-ranges:
> +    maxItems: 1

You need #msi-cells.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - msi-controller
> +  - msi-ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    msi-controller@30000000 {
> +      compatible = "sophgo,sg2042-msi";
> +      reg = <0x30000000 0x4>, <0x30000008 0x4>;
> +      reg-names = "doorbell", "clr";
> +      msi-controller;
> +      msi-ranges = <&plic 64 IRQ_TYPE_LEVEL_HIGH 32>;
> +      interrupt-parent = <&plic>;
> +    };
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
