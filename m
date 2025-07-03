Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A20C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9gPwRvLziZ23MW0+Iwnieqcl3Ajn0nwGnEQxAdUbfU=; b=3IHkWC/K26qnin
	jh667e7p8FPqmCDYy8a8QD44+n0epHmy/ZIdgirUp9MwtTfdanislwOeEu93uTMBAR9fE5EcKkzvC
	NRv2Q9oMmEAifJnD/r2HYrKH3UaS7icrfdCCIULl9uRhPrpmj2UBtvxJ2n5wjdz6M9pVMNq4ZU7Ko
	CEv9EL/f610m2M4JMLif3u4NcIMFKpEduTdXwTlP3+ouGepqUkZphKhgBO2bkyZKcoTAwkPqi9RIw
	GKS+FD1uUelrxS1tE7nILJ9zTzeQgemgeSZeKx9MqErfsd+vUuyaxWRL4NMjaKjcq3A/hH/wXRXaF
	yv10V9pacPPx0f2i5ppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEMB-0000000AVr7-0m3L;
	Thu, 03 Jul 2025 07:27:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEI0-0000000AVCO-3Svx
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 07:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7697145A33;
	Thu,  3 Jul 2025 07:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B18C4CEE3;
	Thu,  3 Jul 2025 07:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751527404;
	bh=s5RWJAg4D/dfrnb7YGisPOZh4Cfa5pW76OvfehJpRrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LU9bRVZVARclMxuotJzPyZUdWvMWimJM0bCBdp9xQTehCbGFBKnrrZt1NPOIg0FB2
	 l/lkw9utKHcUCu7bzIEtGdTcsnGkUcMcs8fmfbcc0T7v7f2OC1FjsxAxKjQM/lppTS
	 //pVlbiCk+tNBqApDCJVUuo2207S6zsGPYvV5pbv30tOsgYfGgaRs9atP9Is4g07MR
	 bIMHWiHIirevd1HB42xTYFqI3sa9qVp6euIfeVNVD30BWxjrm9Y5Ks7buOYjweVrh5
	 AwKSWS0bHRY9gkfN0Wksk3+fXS7OvZtaEGlMrgT4qj4mGoPXQqupLh63Kc1NS1n/6o
	 MHuMzePyC26Vg==
Date: Thu, 3 Jul 2025 08:23:17 +0100
From: Simon Horman <horms@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <uwu@dram.page>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH net-next v3 0/5] Add Ethernet MAC support for SpacemiT K1
Message-ID: <20250703072317.GK41770@horms.kernel.org>
References: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_002324_903756_A60E6E88 
X-CRM114-Status: GOOD (  23.93  )
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

On Wed, Jul 02, 2025 at 02:01:39PM +0800, Vivian Wang wrote:
> SpacemiT K1 has two gigabit Ethernet MACs with RGMII and RMII support.
> Add a driver for them, as well as the supporting devicetree and bindings
> updates.
> 
> Tested on BananaPi BPI-F3 and Milk-V Jupiter.
> 
> I would like to note that even though some bit field names superficially
> resemble that of DesignWare MAC, all other differences point to it in
> fact being a custom design.
> 
> Based on SpacemiT drivers [1].
> 
> This series depends on reset controller support [2] and DMA buses [3]
> for K1. There are some minor conflicts resulting from both touching
> k1.dtsi, but it should just both be adding nodes.
> 
> These patches can also be pulled from:
> 
> https://github.com/dramforever/linux/tree/k1/ethernet/v3
> 
> [1]: https://github.com/spacemit-com/linux-k1x
> [2]: https://lore.kernel.org/all/20250613011139.1201702-1-elder@riscstar.com
> [3]: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn
> 
> ---
> Changes in v3:
> - Refactored and simplified emac_tx_mem_map
> - Addressed other minor v2 review comments
> - Removed what was patch 3 in v2, depend on DMA buses instead
> - DT nodes in alphabetical order where appropriate
> - Link to v2: https://lore.kernel.org/r/20250618-net-k1-emac-v2-0-94f5f07227a8@iscas.ac.cn
> 
> Changes in v2:
> - dts: Put eth0 and eth1 nodes under a bus with dma-ranges
> - dts: Added Milk-V Jupiter
> - Fix typo in emac_init_hw() that broke the driver (Oops!)
> - Reformatted line lengths to under 80
> - Addressed other v1 review comments
> - Link to v1: https://lore.kernel.org/r/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn
> 
> ---
> Vivian Wang (5):
>       dt-bindings: net: Add support for SpacemiT K1
>       net: spacemit: Add K1 Ethernet MAC
>       riscv: dts: spacemit: Add Ethernet support for K1
>       riscv: dts: spacemit: Add Ethernet support for BPI-F3
>       riscv: dts: spacemit: Add Ethernet support for Jupiter

I'm unsure on the plan for merging this.  But it seems to me that the first
two patches ought to go though net-next. But in order for patches to
proceed through net-next the entire series ought to apply on that tree - so
CI can run.

I'm not sure on the way forward.  But perhaps splitting the series in two:
the first two patches for net-next; and, the riscv patches targeted elsewhere
makes sense?

</2c>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
