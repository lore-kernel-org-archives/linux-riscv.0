Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514F8CDD555
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 20:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9gjwQmCczMALQMSsPJFkFeh1NqcyODEfudkgua4UX4=; b=osVcOw/VToAVB8
	ylGaLhDBGAvAIygm5KTIrJpOt2idDx53pTfehS1Vxy13GBxgHKQwOvQWm0prEneD1x2sugDhr4LhU
	r0TORBb/10+RnOymUrQr2I/+9SyoZj+7Z0jSOrEV79I/94Kq8qhjSL3ycB3KdGbGoruNVIhRM+aYQ
	R0p9T12gzqB/l4A9fjh0suI9Xs8o/tjYYUtMu+MuXr76aR0JNr5geM95AKqpUSUh5g3dUOioSOvzc
	fRC7Tuej6ok2IfU69jvxVSToLkzssSwCLsMildVbxE9iD351hQ15BMYT5Jd31CWN1VJRodcqPv+wN
	54QmKgwi/B7UHJQ8dssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sr1Pd-00000008x3B-3CpD;
	Wed, 18 Sep 2024 20:36:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sr1Pa-00000008x26-20SQ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 20:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 837BA5C5AC5;
	Wed, 18 Sep 2024 20:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA26C4CEC2;
	Wed, 18 Sep 2024 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726691789;
	bh=jLXGdlNCFg+BK+lLlFr6ileb70P/yCxiVQtZsN+AUXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZV2bbYBX/93/uV2gwgeZp4D2BYXt/WRbYyl/xATC9j8CgNVw+2Ck1agp4CFaLxUiX
	 wmnp4l1nCcenVzCzXgmsf2n4gr8YkF31K1wPtHGGhXuJJKv8vRnE5ZdqL5HGcJM4YG
	 rA9e+EWsoYW9JrMD2IkUWIA6OEzfAE7CUXGLICuARnltLKZJ1OJaiwcIRigS7TZNUV
	 0UdntAK1CgNzMi0fur4kyJiEDZ0edoBjgyIAbsFhOrp9vEKs88/PuDZ5zHRZeD+8Ry
	 lnkvVYPDzA+dtFaRTWqqqTYdJEy/uLQolMmuOT8kU9M4vtDpiSwn25aX+LJkdW5pCz
	 bmh5aRHEdGXoA==
Date: Wed, 18 Sep 2024 15:36:27 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	m.szyprowski@samsung.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v1 2/3] dt-bindings: mailbox: Add
 thead,th1520-mailbox bindings
Message-ID: <20240918203627.GA2069046-robh@kernel.org>
References: <20240918134901.193033-1-m.wilczynski@samsung.com>
 <CGME20240918134926eucas1p1df23a583b356505939d4c5501bd6c80f@eucas1p1.samsung.com>
 <20240918134901.193033-3-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240918134901.193033-3-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_133630_673661_0E510046 
X-CRM114-Status: GOOD (  20.45  )
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

On Wed, Sep 18, 2024 at 03:49:00PM +0200, Michal Wilczynski wrote:
> Add bindings for the mailbox controller. This work is based on the vendor
> kernel. [1]
> 
> Link: https://github.com/revyos/thead-kernel.git [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/mailbox/thead,th1520-mbox.yaml   | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> new file mode 100644
> index 000000000000..f446fae76398
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/thead,th1520-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-head TH1520 Mailbox Controller
> +
> +description: |

Don't need '|' if no formatting.

> +  The T-head mailbox controller enables two cores within the SoC to
> +  communicate and coordinate by passing messages (e.g., data, status,
> +  and control) through the mailbox channels. It also provides the ability
> +  for one core to signal the other processor using interrupts.
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-mbox
> +
> +  reg:
> +    description: Contains base addresses and sizes for the mailbox and remote ICUs.

Drop. Redundant.

> +    items:
> +      - description: Mailbox local base address
> +      - description: Remote ICU 0 base address
> +      - description: Remote ICU 1 base address
> +      - description: Remote ICU 2 base address
> +
> +  reg-names:
> +    items:
> +      - const: local_base

Just 'local'

> +      - const: remote_icu0
> +      - const: remote_icu1
> +      - const: remote_icu2
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt for the mailbox controller.

Drop description. That's obvious.

> +
> +  clocks:
> +    maxItems: 1
> +    description: Clock phandle for the mailbox controller.

Drop

> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +
> +  icu_cpu_id:

Needs a vendor prefix and s/_/-/.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: CPU ID for the ICU.

Constraints?

Nowhere in this patch is ICU defined.

> +
> +  '#mbox-cells':
> +    const: 2
> +    description: Number of cells required to encode the mailbox specifier.

You need to say what each cell contains.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - icu_cpu_id
> +  - '#mbox-cells'
> +
> +dependencies:
> +  clock-names: [ clocks ]

Core schema already does this.

> +
> +examples:
> +  - |
> +    mbox_910t: mbox@ffffc38000 {

Drop unused labels.

Standard name is 'mailbox', not 'mbox'.

> +      compatible = "thead,th1520-mbox";
> +      reg = <0xff 0xffc38000 0x0 0x4000>,
> +            <0xff 0xffc44000 0x0 0x1000>,
> +            <0xff 0xffc4c000 0x0 0x1000>,
> +            <0xff 0xffc54000 0x0 0x1000>;
> +      reg-names = "local_base", "remote_icu0", "remote_icu1", "remote_icu2";
> +      interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> +      icu_cpu_id = <0>;
> +      #mbox-cells = <2>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7331b30deef8..49198b2ed2e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19719,6 +19719,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/pdp7/linux.git
>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	drivers/mailbox/mailbox-th1520.c
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
