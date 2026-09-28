Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B197CA5FA3
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgElEoEspWkrl4ec/0gMzTm/3EMCUGLGtNAhQjJyUzM=; b=A1z2Cl51zvYynP
	gEOvyV0Jd7lTSoNnR2MBezGpx2rZWecKW3a4BQO7zFVzeMNZWLUKRBb2ngY472X9vhtKBAEkjLs9Q
	hamuLBzXBuhyaYu+DAFC6pMHdhr/fDjYMVUlU1t96I8auDcCKRb2HaPxoTf7OpIofWHcRMtM+HANZ
	lmqJ3QN9r0G2Q1tBRFRmwb425oYPfTXFxZ7jNHqw7erQliNLyRJR11BA1it42i07nNtGyvkmB/en3
	+1+GnutEoFXbD/KT32wZ3C5WFoDdMLDVXDpd4+0AZQLcEhMVDsPVgGHjSdBiO+VHo6KSjZudO+2BL
	cJB6cIP26zr9tcQb/wLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFwB-00000001IZO-2fcU;
	Mon, 28 Sep 2026 18:18:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFwB-00000001IZG-0HSS
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 18:18:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BD63600E2;
	Mon, 28 Sep 2026 18:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91C51F000FF;
	Mon, 28 Sep 2026 18:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790619529;
	bh=IngvfdjDTuMxuKWaiC5XQNkdziiuEHqoUpcP04yDirI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VDahCbPkV+RSr4vSZ1HWmkwUpQ/kplhol52IB+WLXyrnPMar5mgI7cZhss+Ge7G17
	 go6E0RRqYMg0QqKIiMnQgb5vOpVDpsh9YGKDXc60lR2r5WMPXbKC0dr4AjCw9rIfgj
	 yNzICd4YdTMd0dcx4wh2BbxmbTUVThYBNlXVqq5iF+cQI8wIgK03FE27niBRpoKOJL
	 DN6TTpxi1FyykohiU1CIcPfEA9siwthZ2XQ8FZw/WHPqDBlBo8CKTQmHN3cjaQcneR
	 Le+tNHmx2qpKojmC561RZeS+UTHSJ/q0Wnyt7hlPO6A9HoE9jiQSISLLwBLycEdKGV
	 mTdaWVAHDVOMg==
Date: Mon, 28 Sep 2026 13:18:48 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Ousherovitch <aousherovitch@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>,
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
	linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH v5 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Message-ID: <20260928181848.GA150882-robh@kernel.org>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-2-aousherovitch@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917225929.2494111-2-aousherovitch@rambus.com>
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

On Thu, Sep 17, 2026 at 03:59:10PM -0700, Alex Ousherovitch wrote:
> Add device tree binding schema for the Rambus CryptoManager Hub (CMH)
> hardware crypto accelerator.  The binding describes the parent
> SoC-level node with its SIC register region and one queue@N child
> node per mailbox the host owns, each carrying a reg (mailbox instance
> index), an optional interrupt, VCQ ring geometry (rambus,num-slots /
> rambus,slot-stride-bytes) and a rambus,cores affinity list.  Which
> crypto cores are present is discovered from the SIC CORE_ENABLE
> register at probe, not described in the device tree.
> 
> Register the 'rambus' vendor prefix for Rambus Inc.
> 
> Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
> Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> ---
>  .../bindings/crypto/rambus,cmh-v1030.yaml     | 151 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
> new file mode 100644
> index 000000000000..a0df35bdc371
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rambus,cmh-v1030.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/rambus,cmh-v1030.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rambus CryptoManager Hub (CMH) Hardware Crypto Accelerator
> +
> +maintainers:
> +  - Alex Ousherovitch <aousherovitch@rambus.com>
> +  - Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> +  - Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> +
> +description: |
> +  The Rambus CryptoManager Hub (CMH) is a hardware cryptographic accelerator
> +  accessed via a mailbox-based VCQ (Virtual Command Queue) interface.  The
> +  host writes VCQ command sequences into per-mailbox DMA queue buffers and
> +  rings a doorbell; the CMH eSW processes them and signals completion via
> +  interrupt.
> +
> +  The management host statically partitions the hardware mailboxes across
> +  the SoC's host interfaces at integration time; the set of mailboxes a
> +  given host owns is therefore fixed and not runtime-discoverable (a
> +  mailbox locked to a host reads as unavailable in the SIC availability
> +  register).  Each owned mailbox is described by a child node.  Which
> +  crypto cores are present is a fixed silicon-build property indicated by
> +  the SIC CORE_ENABLE register, so cores are not described in the device
> +  tree.  Clock and reset are owned by the management host; a node
> +  describing a non-management host has no clock or reset provider of its
> +  own, so clocks and reset-gpios are optional.
> +
> +  CMH gates access to a locked mailbox by a hardware HOST ID presented on
> +  the bus with every access, permitting only the owning host's ID.  An
> +  integration must present a single, stable HOST ID for all accesses to a
> +  given mailbox, independent of the issuing CPU (relevant on SMP hosts
> +  whose interconnect encodes the issuing CPU in the HOST ID).
> +
> +properties:
> +  compatible:
> +    items:
> +      - not: {}
> +        description: SoC-specific compatible, e.g. vendor,soc-cmh
> +      - const: rambus,cmh-v1030
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      SIC (System Interface Controller) MMIO region.  The registers of
> +      mailbox instance N are at offset N * 0x1000 within this region.
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +    description:
> +      The "core" functional clock, and optionally the half-rate "core-div2"
> +      clock (present only on configurations with side-channel-protected
> +      cores) and/or the "rt" real-time tick clock.  See clock-names for the
> +      valid combinations.
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: core
> +      - items:
> +          - const: core
> +          - const: core-div2
> +      - items:
> +          - const: core
> +          - const: rt
> +      - items:
> +          - const: core
> +          - const: core-div2
> +          - const: rt

Can be simplified to:

items:
  - const: core
  - enum: [ core-div2, rt ]
  - const: rt

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Host-controlled reset for the CryptoManager Hub.  The hub has two
> +      external, active-low reset inputs -- a power-on reset and a hard
> +      reset; where a board routes one of them to a host GPIO, that line is
> +      described here.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^queue@[0-9a-f]+$":
> +    type: object
> +    description:
> +      One node per hardware mailbox (VCQ command queue) this host owns.
> +      The set of owned mailboxes is fixed by the management host at
> +      integration time and enumerated here.
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          0-based mailbox instance index.  The instance's registers are
> +          at reg * 0x1000 within the SIC region.

Is there a maximum number of instances? If so, 'maximum: N'.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
