Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD93C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 02:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXU+t9eCU3j5lKP0bOq604xDiGlF14RFUUy9NnvMYVk=; b=tlQcroWUM6yzTd
	KcVtuh5DGGAsY0YcT3n8QyeMvev+vwhatMaMOQwoxEJfVFBsk+5ldaEsTAcfzpZ1eE5gygxoG1MbM
	FBVyFmqNbOGB0CVAe8bQ3jQaE5Ei4aIKOMRfSlz+DLxK08OjmvHQvj2VoO+ME3g8WgVke9ftSKAqw
	WVeRyYoejmm+9L8TwgJqZ8mtQW3BYel/R4HbnV6kcoREyhYxKezh7DzLAl6FFh7HSs+/FrPYNULoN
	fnKvFlOy3MIhpM+jrW1IlGzQWAb4CTp7YysndQicqSBFbxM0yPkDBbe6WZ0G1ZnPoB41oAcV/28Oi
	fTyi5PFufrDKp8NM/9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2N3C-000jfV-0A;
	Fri, 26 May 2023 02:19:30 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2N38-000jer-38
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 02:19:28 +0000
Date: Fri, 26 May 2023 10:19:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Wei Fu <wefu@redhat.com>
Subject: Re: [PATCH v2 0/9] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <ZHAXHs03kXNgp0QF@ofant>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_191927_037361_ACDC7129 
X-CRM114-Status: GOOD (  22.29  )
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

Hi Jisheng
On 02:45 Fri 19 May     , Jisheng Zhang wrote:
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> tree files for the core module and the development board.
> 
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.
> 
> FWICT, one issue I'm not sure is the cpu reset dt-binding: IIUC, the
> secondary CPUs in T-HEAD SMP capable platforms need some special
> handling. The first one is to write the warm reset entry to entry
> register. The second one is write a SoC specific control value to
> a SoC specific control reg. The last one is to clone some CSRs for
> secondary CPUs to ensure these CSRs' values are the same as the
> main boot CPU. This DT node is mainly used by opensbi firmware.
> Any suggestion about this reset dt-binding is appreciated!
> 
> Thanks
> 
> Since v1:
>   - add missing plic, clint, th1520 itself dt-bindings
>   - use c900-plic
>   - s/light/th1520
>   - add dt-binding for T-HEAD CPU reset
>   - enable ARCH_THEAD in defconfig
>   - fix all dtbs_check error/warning except the CPU RESET, see above.
it would be nice to have a URL reference to v0
https://lore.kernel.org/all/20230507182304.2934-1-jszhang@kernel.org/

> 
> Jisheng Zhang (9):
>   dt-bindings: interrupt-controller: Add T-HEAD's TH1520 PLIC
>   dt-bindings: timer: Add T-HEAD TH1520 clint
>   dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
>   dt-binding: riscv: add T-HEAD CPU reset
>   riscv: Add the T-HEAD SoC family Kconfig option
>   riscv: dts: add initial T-HEAD TH1520 SoC device tree
>   riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
>   MAINTAINERS: add entry for T-HEAD RISC-V SoC
>   riscv: defconfig: enable T-HEAD SoC
> 
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../bindings/riscv/thead,cpu-reset.yaml       |  69 +++
>  .../devicetree/bindings/riscv/thead.yaml      |  29 ++
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  MAINTAINERS                                   |   6 +
>  arch/riscv/Kconfig.socs                       |   6 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/thead/Makefile            |   2 +
>  .../dts/thead/th1520-lichee-module-4a.dtsi    |  38 ++
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  32 ++
>  arch/riscv/boot/dts/thead/th1520.dtsi         | 451 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   1 +
>  12 files changed, 637 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
>  create mode 100644 Documentation/devicetree/bindings/riscv/thead.yaml
>  create mode 100644 arch/riscv/boot/dts/thead/Makefile
>  create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
>  create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
>  create mode 100644 arch/riscv/boot/dts/thead/th1520.dtsi
> 
> -- 
> 2.40.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
