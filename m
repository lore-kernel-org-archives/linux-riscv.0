Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C45D0E6F4
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UNoRV/ttZ+fM7cPAC+ckejozaM6nOMBey7mPBlxvS4=; b=n0006+Ylkx1BRG
	H8dbz1nl7nJhTRQMtmbivSXj+c4Jqh3iKfjfyCzzF4JLpnBchdb5w49TujbwEtV/KA68O22F/7He9
	ddzznt0r7Xg+f78vVhtqAt5H8JjaJVlVWV5RAVdOsmE/M8ZWD6d61NHSe4E1os5/cOkODwIZtlSbM
	x1LRAabaHSVp6cIgh2eFDyUEXGuaUONHsD7+v+Bn+OIeHfASMHd/PkwMvTGddLxr8Gl6xFhGsZjPg
	/06NEzExeUu8Ipkx3OPA4VLwXoweDnTPoCAryu/X5Ke8FU/EIVUhjXgYVFEV+ggPdMGHztNDUCzbn
	dFDNVFx4MoFXkAX05xOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qtU-000000076M2-2K8B;
	Mon, 21 Oct 2024 11:48:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qpP-000000075ZN-3urJ;
	Mon, 21 Oct 2024 11:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38968A42771;
	Mon, 21 Oct 2024 11:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AA8C4CEC3;
	Mon, 21 Oct 2024 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729511042;
	bh=AJ/DqPzoLPYjvF0DStKqvbOtkyW/e+moS4T9f9nXyqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPFG2UnDVHfwXTPxm6/dIYV2yc8SrdzSZjAUbW5bfUU9txzgGGCDLhEveKdAqHc+0
	 WfC7DIo7X1e7eisVg7uwKVasVx6+hUkKkSuQXaVpEOTy/FvGJzco3VnSNoTv+92scF
	 WWJgX+rwjhW3AOlhM5b7gtA1pCqvF3KEEGbdSl/steiVuxGqvQrdMP9mbvWm19ezzU
	 j+syt2dsRwW6p3fHyFmxQ+isz8rl6180ifHI2cbt49Yck1ecLQXqEra4QJ6ty695Fc
	 WkaoG2t9iBRyZjxmo2sydyVzk6imdEtruIvB/ceaODruCdKixQ3QGkvpsBSImK8qwq
	 gbhSxRwyxfYow==
Date: Mon, 21 Oct 2024 12:43:54 +0100
From: Simon Horman <horms@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v4 0/3] Add the dwmac driver support for T-HEAD
 TH1520 SoC
Message-ID: <20241021114354.GF402847@kernel.org>
References: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_044404_196712_1B6CA1EE 
X-CRM114-Status: GOOD (  26.25  )
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

On Sun, Oct 20, 2024 at 07:35:59PM -0700, Drew Fustini wrote:
> This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> RISC-V SoC along with dts patches to enable the ethernet ports on the
> BeagleV Ahead and the LicheePi 4A.
> 
> The pinctrl-th1520 driver, pinctrl binding, and related dts patches are
> in linux-next so there are no longer any prerequisite series that need
> to be applied first.
> 
> Changes in v4:
>  - Rebase on next for pinctrl dependency
>  - Add 'net-next' prefix to subject per maintainer-netdev.rst
>  - Add clocks, clock-names, interrupts and interrupt-names to binding
>  - Simplify driver code by switching from regmap to regualar mmio
> 
> Changes in v3:
>  - Rebase on v6.12-rc1
>  - Remove thead,rx-internal-delay and thead,tx-internal-delay properties
>  - Remove unneeded call to thead_dwmac_fix_speed() during probe
>  - Fix filename for the yaml file in MAINTAINERS patch
>  - Link: https://lore.kernel.org/linux-riscv/20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com/
> 
> Changes in v2:
>  - Drop the first patch as it is no longer needed due to upstream commit
>    d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
>  - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
>  - Add thead,rx-internal-delay and thead,tx-internal-delay properties
>    and check that it does not exceed the maximum value
>  - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
>    delete the .remove_new hook as it is no longer needed
>  - Handle return value of regmap_write() in case it fails
>  - Add phy reset delay properties to the BeagleV Ahead device tree
>  - Link: https://lore.kernel.org/linux-riscv/20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com/
> 
> Changes in v1:
>  - remove thead,gmacapb that references syscon for APB registers
>  - add a second memory region to gmac nodes for the APB registers
>  - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/
> 
> ---
> Emil Renner Berthing (1):
>       riscv: dts: thead: Add TH1520 ethernet nodes
> 
> Jisheng Zhang (2):
>       dt-bindings: net: Add T-HEAD dwmac support
>       net: stmmac: Add glue layer for T-HEAD TH1520 SoC
> 
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml | 115 +++++++++
>  MAINTAINERS                                        |   2 +
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 +++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 268 +++++++++++++++++++++
>  9 files changed, 657 insertions(+)
> ---
> base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
> change-id: 20241020-th1520-dwmac-e14cc8f8427b

Hi Drew, all,

This series is targeted at net-next, but it doesn't apply there.
I'm unsure what the way forwards is, but I expect that at a minimum
the patchset will need to be reposted in some form.

-- 
pw-bot: cr


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
