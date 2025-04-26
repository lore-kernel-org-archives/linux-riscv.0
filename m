Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE96C369CB
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8F0ROJ3KZLpEzRGDNux8vkFyk279mJgOcJ3OURjkANQ=; b=tnatV/2+Pj7b3X
	Le02dKHziSpYzKWwf4F8Qp41sgZvEbDAJ5KzmFPVeQ/Y11vfkPHWEBXWrQt1/rdq4z6+KOzWyo0Y8
	dDHbC7FISViL4GfvreHaYXczSAU4bfv5H7Dgr3q5dol8VyHUbXNzSWGEDi1A5IBvI5TVipVosJowi
	fnqQWjGkA2obcV7yToKY4IOgRKdFYGwkA7KeUIEtRtdUxcxQdJYs0iZSbG/59M8D6zY+XCblGaG1h
	ZxorHp8IPpvxN0AvgyO4FUdSRzbUzEN/VqHxQufj5/59C4kt2jGOyyS8Gr+0clIBB1f8ljAjZmQCF
	3UcbrGp0UY27JI7CeuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gqM-00000002AjM-49Oj;
	Sat, 26 Apr 2025 14:49:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gqL-00000002Aiz-18wh
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 14:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D32984A724;
	Sat, 26 Apr 2025 14:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489C6C4CEE2;
	Sat, 26 Apr 2025 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745678964;
	bh=TCjIUMQhUHnSLDDQBZcImrdXzq+N5thjBf/twGBfmig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LIkd5rnR5sgsAT9xGm2RZ29iCkLdlLhhuRACunIz02F+phiTirenEhGm3Yqn6/rdD
	 GEgEkPwpj94RxXahsaU15YY4ycebNo0dojDZ8YujYFz8Or51Oxjli/y679Sm9Ou9WW
	 MA2b7djDd4fnQHlVgp8QT1ZwoOMPDE4FuUKc9O98QDTlFGArLdWgXOYTSo7DUazvTC
	 yj+RnGbpuAUStGUikBd2MdfNz4rM/y6cDwm9YJYYwA0iXRNJpF29/c2sS4LznXFgYY
	 1I0xFVsyA1tI57F0/k2Fy/SwsJ/XSVHGa2WVkWz8DdDcx3Iz/pxxZvxsH6cvxhpc2U
	 Nx3lWkUSO1X1w==
Date: Sat, 26 Apr 2025 22:32:34 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/10] Basic device tree support for ESWIN EIC7700
 RISC-V SoC
Message-ID: <aAzugucziBi4Nr-y@xhacker>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_074925_358189_555CF3CF 
X-CRM114-Status: GOOD (  19.03  )
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

On Thu, Apr 10, 2025 at 08:55:09PM +0530, Pinkesh Vaghela wrote:
> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> P550 CPU cluster and the first development board that uses it, the
> SiFive HiFive Premier P550.
> 
> This patch series adds initial device tree and also adds ESWIN
> architecture support.

Per past experience, new SoC needs at least pinctrl and clk tree ready.
> 
> Boot-tested using intiramfs with Linux 6.15.0-rc1 on HiFive Premier
> P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> 
> Changes in v3:
> - Rebased the patches to kernel 6.15.0-rc1
> - Added "Reviewed-by" tag of "Rob Herring" for Patch 4
> - Updated MAINTAINERS file
>   - Add GIT tree URL
> - Updated DTSI file
>   - Added "dma-noncoherent" property to soc node
>   - Updated GPIO node labels in DTSI file
> - Link to v2: https://lore.kernel.org/lkml/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/
> 
> Changes in v2:
> - Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
> - Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
> - Updated MAINTAINERS file
>   - Add the path for the eswin binding file
> - Updated sifive,ccache0.yaml
>   - Add restrictions for "cache-size" property based on the
>     compatible string
> - Link to v1: https://lore.kernel.org/lkml/20250311073432.4068512-1-pinkesh.vaghela@einfochips.com/
> 
> Darshan Prajapati (3):
>   dt-bindings: riscv: Add SiFive P550 CPU compatible
>   dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
>   dt-bindings: timer: Add ESWIN EIC7700 CLINT
> 
> Min Lin (2):
>   riscv: dts: add initial support for EIC7700 SoC
>   riscv: dts: eswin: add HiFive Premier P550 board device tree
> 
> Pinkesh Vaghela (2):
>   riscv: Add Kconfig option for ESWIN platforms
>   cache: sifive_ccache: Add ESWIN EIC7700 support
> 
> Pritesh Patel (3):
>   dt-bindings: vendor-prefixes: add eswin
>   dt-bindings: riscv: Add SiFive HiFive Premier P550 board
>   dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC
>     compatibility
> 
>  .../bindings/cache/sifive,ccache0.yaml        |  44 ++-
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
>  .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   9 +
>  arch/riscv/Kconfig.socs                       |   6 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/eswin/Makefile            |   2 +
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
>  drivers/cache/sifive_ccache.c                 |   2 +
>  13 files changed, 469 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
>  create mode 100644 arch/riscv/boot/dts/eswin/Makefile
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
