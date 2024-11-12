Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B612D42BA2
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR9yvsfA+KYnktkiuNg9ilRW4cY19KNH5pK0YoJ+PtY=; b=G254osKKUKbA08
	KfERIMVDpt9BnqncNqoadHL3rHwcVqNgDSQdP9SFAEShc+bZ3qiCPz0WIFxba1q+MKlkUxbBCpQiP
	tp1ubJkvRFSWr3IRxsU1CQknXq4qAY/Nhd1UrWoQOL5r/3Gk9zD8TTQcW7kmzfinEmxlNg1oqyS/V
	L9Wu7MPHLUa9Q0LFxlGul4gHQGVLT5qZH3eoITAKXGXNYjzobJ+lGftVmnGbCxNIHZgnicUHrmRjO
	w8VKN9ojwr55M/uqUnBsIVOKSX0ksnNycVmc8HTkdtTN3o3fgSVDFw1GPoZZPRhwQ50XY+hAfj/5Q
	ifk0Nfj3pwS4hBEsWaqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtM7-000000043k5-38LR;
	Tue, 12 Nov 2024 16:03:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtIT-000000042pf-0rZj
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 15:59:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07F13A41DF3;
	Tue, 12 Nov 2024 15:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CB1C4CECD;
	Tue, 12 Nov 2024 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731427155;
	bh=BleI3g/9Mgelj0hSQNkzA4/4uDaRN4Z/XLhqKzmcEOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYOBihfFEvWfaR9x6HoxpRiixjrLPzdHw3AC7d65JT0zJmFcqRaDU3DqumpVMuP3U
	 L+dKz61++MfqjLtTY8YrAE+kOlFaGCXB6xfFwbOymCnKB0chgXMfkf9+lPjXgMO5+S
	 cwZyeqY6VIAYir3vd2tPSscqw9BxZ/kEXtl8m0ZE7gFkcjlNef36otxZHhOX4dsyVl
	 y8BRMr1SGH7a0VdwTaoU7QGu3Cob6eoURtLb6XqbXddsLah+3aeWxixUn/tyBgIxiT
	 1mLoTxCaYtAYx9MyyXv4FzmlKk6pu8kBQOtIC8XOE+OciASiGo53fIb9IshrIi4kjj
	 B9gyxnpKVOfxw==
Date: Tue, 12 Nov 2024 09:59:13 -0600
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, unicorn_wang@outlook.com,
	conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
	krzk+dt@kernel.org, lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: Re: [PATCH 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <20241112155913.GA973575-robh@kernel.org>
References: <cover.1731303328.git.unicorn_wang@outlook.com>
 <1edbed1276a459a144f0cb0815859a1eb40bfcbf.1731303328.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1edbed1276a459a144f0cb0815859a1eb40bfcbf.1731303328.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075917_401187_8737FE85 
X-CRM114-Status: GOOD (  18.87  )
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

On Mon, Nov 11, 2024 at 01:59:37PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding for Sophgo SG2042 PCIe host controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
> new file mode 100644
> index 000000000000..d4d2232f354f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/sophgo,sg2042-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 PCIe Host (Cadence PCIe Wrapper)
> +
> +description: |+

Don't need '|+'

> +  Sophgo SG2042 PCIe host controller is based on the Cadence PCIe core.

> +  It shares common features with the PCIe core and inherits common properties
> +  defined in Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml.

That's clear from the $ref. No need to say that in prose.

> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-pcie-host
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: reg
> +      - const: cfg
> +
> +  sophgo,syscon-pcie-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the SYSCON entry

Please describe what you need to access.

> +
> +  sophgo,link-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Cadence IP link ID.

Is this an index or related to the syscon? Nak for the former, use 
linux,pci-domain. For the latter, add an arg to sophgo,syscon-pcie-ctrl.

> +
> +  sophgo,internal-msi:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Identifies whether the PCIE node uses internal MSI controller.

Wouldn't 'msi-parent' work for this purpose?

> +
> +  vendor-id:
> +    const: 0x1f1c
> +
> +  device-id:
> +    const: 0x2042
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: msi
> +
> +allOf:
> +  - $ref: cdns-pcie-host.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - sophgo,syscon-pcie-ctrl
> +  - sophgo,link-id
> +  - vendor-id
> +  - device-id
> +  - ranges

ranges is already required in the common schemas.

> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    pcie@62000000 {
> +      compatible = "sophgo,sg2042-pcie-host";
> +      device_type = "pci";
> +      reg = <0x62000000  0x00800000>,
> +            <0x48000000  0x00001000>;
> +      reg-names = "reg", "cfg";
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
> +               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
> +      bus-range = <0x80 0xbf>;
> +      vendor-id = <0x1f1c>;
> +      device-id = <0x2042>;
> +      cdns,no-bar-match-nbits = <48>;
> +      sophgo,link-id = <0>;
> +      sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
> +      sophgo,internal-msi;
> +      interrupt-parent = <&intc>;
> +    };
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
