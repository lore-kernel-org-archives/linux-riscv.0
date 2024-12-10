Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E933E77182
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zy9hE1MGZSFO0Iof4976Ji/Jje1+Rjh5hz6RvakmEus=; b=AY0MYwwEa62/Vb
	g1SKSn2xbwjKwQoSxCmLzV1h6iGa3nTxN3OCJoVTg7h7WV1xK7ASYnznFYZJgY8+GQtyplpOGgi29
	k5xVNEoujxBm8N9AEBHxMArVNBacMHbYUA57OSJOTV/2UdDMqoAr4N9PWEfBts3ByoNMb1u7gGSL6
	65UNiktdnNfVGRdLwk9TvSzyC8LxQ/ZVioQP/Fo1/5VXtRMb0+5Rw3cxQwX6A/1JAh613XH3uBif+
	Up9+fOkK9Xs86eeRlVy2hqtL0/SxkQ+6LQHUDieIVHlBMPI+frRwsx6ElbwMi4hwM0Z9D0DAr7rIY
	WShqLZduIue4ed6kiepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4BB-0000000CIhI-1vld;
	Tue, 10 Dec 2024 17:37:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL47M-0000000CHz9-3H6M
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 17:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD2495C58C3;
	Tue, 10 Dec 2024 17:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8385C4CED6;
	Tue, 10 Dec 2024 17:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733852031;
	bh=ew+3ZtWBeaC/eFtZKLcAyztF4BPk9mI0PuL1WaDabJQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=T39kgcRf3GFXq4r2FXd0HCkM16w7yJpDM6dZFXf3pqdOuuqPtBo4O6XSg0ZYamK6c
	 uBM6kqoqiwa3v9XO4Um8GxmNm4IJVDVdbjCj4c3zDc2nSa1xCQgZYXtVSkfH1LIYo8
	 KvJina1zVOVksS411aPbRFITFJs7c7OAwDRViN+iBcgKak4I+TQ1zuWJToaL3IXb9C
	 JF5A2p6NaxoDV3vgnC0+tF2+X1Ih17zdfVCYOLgTk67ZwCVCftsO3iXY3w3/dRvI8M
	 7y1VBY9/afIPa/Mb7hjISoSDG/BftkD/w9XpVjT1XWbVCXgrXfxHP3ezku8c3xgA9X
	 /C/Cc1cvfEqkw==
Date: Tue, 10 Dec 2024 11:33:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, unicorn_wang@outlook.com,
	conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
	krzk+dt@kernel.org, lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: Re: [PATCH v2 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <20241210173350.GA3222084@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05998df400a64734308e986069ca0b337618e464.1733726572.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093352_907951_AF563E18 
X-CRM114-Status: GOOD (  17.87  )
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

On Mon, Dec 09, 2024 at 03:19:38PM +0800, Chen Wang wrote:
> Add binding for Sophgo SG2042 PCIe host controller.

> +  sophgo,pcie-port:

This is just an index, isn't it?  I don't see why it should include
"sophgo" unless it encodes something sophgo-specific.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SG2042 uses Cadence IP, every IP is composed of 2 cores(called link0

Add space before "(".  More instances below.

> +      & link1 as Cadence's term). "sophgo,pcie-port" is used to identify which
> +      core/link the pcie host controller node corresponds to.

s/pcie/PCIe/ for consistency in the text.  More instances below.

> +      The Cadence IP has two modes of operation, selected by a strap pin.
> +
> +      In the single-link mode, the Cadence PCIe core instance associated
> +      with Link0 is connected to all the lanes and the Cadence PCIe core
> +      instance associated with Link1 is inactive.
> +
> +      In the dual-link mode, the Cadence PCIe core instance associated
> +      with Link0 is connected to the lower half of the lanes and the
> +      Cadence PCIe core instance associated with Link1 is connected to
> +      the upper half of the lanes.

I assume this means there are two separate Root Ports, one for Link0
and a second for Link1?

> +      SG2042 contains 2 Cadence IPs and configures the Cores as below:
> +
> +                     +-- Core(Link0) <---> pcie_rc0   +-----------------+
> +                     |                                |                 |
> +      Cadence IP 1 --+                                | cdns_pcie0_ctrl |
> +                     |                                |                 |
> +                     +-- Core(Link1) <---> disabled   +-----------------+
> +
> +                     +-- Core(Link0) <---> pcie_rc1   +-----------------+
> +                     |                                |                 |
> +      Cadence IP 2 --+                                | cdns_pcie1_ctrl |
> +                     |                                |                 |
> +                     +-- Core(Link1) <---> pcie_rc2   +-----------------+
> +
> +      pcie_rcX is pcie node ("sophgo,sg2042-pcie-host") defined in DTS.
> +      cdns_pcie0_ctrl is syscon node ("sophgo,sg2042-pcie-ctrl") defined in DTS
> +
> +      cdns_pcieX_ctrl contains some registers shared by pcie_rcX, even two
> +      RC(Link)s may share different bits of the same register. For example,
> +      cdns_pcie1_ctrl contains registers shared by link0 & link1 for Cadence IP 2.

An RC doesn't have a Link.  A Root Port does.

> +      "sophgo,pcie-port" is defined to flag which core(link) the rc maps to, with
> +      this we can know what registers(bits) we should use.
> +
> +  sophgo,syscon-pcie-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the PCIe System Controller DT node. It's required to
> +      access some MSI operation registers shared by PCIe RCs.

I think this probably means "shared by PCIe Root Ports", not RCs.
It's unlikely that this hardware has multiple Root Complexes.

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - vendor-id
> +  - device-id
> +  - sophgo,syscon-pcie-ctrl
> +  - sophgo,pcie-port

It looks like vendor-id and device-id apply to PCI devices, i.e.,
things that will show up in lspci, I assume Root Ports in this case.
Can we make this explicit in the DT, e.g., something like this?

  pcie@62000000 {
    compatible = "sophgo,sg2042-pcie-host";
    port0: pci@0,0 {
      vendor-id = <0x1f1c>;
      device-id = <0x2042>;
    };

> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
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
> +      sophgo,pcie-port = <0>;
> +      sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
> +      msi-parent = <&msi_pcie>;
> +      msi_pcie: msi {
> +        compatible = "sophgo,sg2042-pcie-msi";
> +        msi-controller;
> +        interrupt-parent = <&intc>;
> +        interrupts = <123 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "msi";
> +      };
> +    };
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
