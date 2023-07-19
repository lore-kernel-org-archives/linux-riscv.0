Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA0FC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 22:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeRzyS0icatJqz7j5T8BrU2OF9pBwiIgpqJDjtx253s=; b=uMqCME/mpmLBAh
	r2SI8X80Y855o/vHtPHq4fI5sP2xGF+GRzy//H1Cnwb36wj8ZJ+5HNWJi4n8DHsaYzjtIQATFT4Je
	X9uUUYqJkkmdbZG4uZGQbFI8p4R7Ni9kmXB4FTBNV4LIP17+MtSLXQfKq0UuHhb+BYDYpCgk8Wls3
	Wg4PI81ECTC6goyMDbpLl9J3zUJubWq10LEGP/VdvPiIpKvDDUMjeJLrYAUwYkMgHhKmKW5xWIzQ0
	jaGld+tT3UssOIV2gjpvpGeOzywH5bwZ10cJdVsXm7wTeMaL+sGirdSjWjYy46W+cptVSBpPIYMYg
	H2NbraOLNWAtMWXiUSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFfP-0096fj-1Q;
	Wed, 19 Jul 2023 22:29:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFfM-0096es-0R
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 22:29:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BAFB61844;
	Wed, 19 Jul 2023 22:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE06C433C8;
	Wed, 19 Jul 2023 22:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689805742;
	bh=T0Rl94QpvEH/miwFOS4iHM/IaiFlx/fGh1ZwAtgQHk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjwZao8XnSIid5fdLV73IB4OJR0gKp7uKiK5gz743nh82oI+Bz+iJY6GWMEqxYo8U
	 z2mD4ayKrLZx5m6/H2lEkZCJPlFQK+ZEQZGIAIQzcVnno5nxJ45Um4XFNSG5jhlYhP
	 yFuJHaGmN9GItnIYggqEqzilPXhGEz7kOPEWv2n5CXs6/5iA9PP5uNosuNw6wpdTP9
	 sTu5LY+lwiLliIEuIbaxc/+ZiTzW5T87aEk2/IJZ2qR2IYMaLJ4CV4EiQ2CPplawxJ
	 tb2h6tnIe+K/Hi34U11CYI7ksnHDknNx16+sZ2vp1FwgD7G9LVNc3pLVJBUPRWfCh+
	 A4VN+IjfAPpeQ==
Received: (nullmailer pid 887921 invoked by uid 1000);
	Wed, 19 Jul 2023 22:29:00 -0000
Date: Wed, 19 Jul 2023 16:29:00 -0600
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 5/9] dt-bindings: PLDA: Add PLDA XpressRICH PCIe host
 controller
Message-ID: <20230719222900.GA882340-robh@kernel.org>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-6-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719102057.22329-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_152904_278369_3C59FD73 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, Jul 19, 2023 at 06:20:53PM +0800, Minda Chen wrote:
> Add PLDA XpressRICH host controller dt-bindings. Both Microchip
> PolarFire SoC and StarFive JH7110 SoC are using PLDA XpressRICH
> PCIe host controller IP.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pci/plda,xpressrich-pcie-host.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
> new file mode 100644
> index 000000000000..10a10862a078
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/plda,xpressrich-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PLDA XpressRICH PCIe host controller
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +  - $ref: plda,xpressrich-pcie-common.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: plda,xpressrich-pcie-host

What h/w is this in? I don't see why this is needed. You have the common 
schema for the IP block and then the Microchip and Starfive schemas for 
the 2 implementations.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
