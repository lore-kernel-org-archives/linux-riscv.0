Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF1A606A321
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ih+toeI6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wt9nOIia
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ou4AZdXYBzfmtwfoCuCgKfiseYG0NXwO0kMVnKe8EdU=; b=ih+toeI6L0TLkwAW1yYlMfXPg3
	+STaNumc5l6m8ExgkdiZJJixcINBYpFrSTDhjQsPwVSai7DiHw162kXzWb7MNkD3TTPSKtt0MelbV
	YFx38LcN3t1spqz1PudU4g40CIM9xccDXGBlqGB9TM7oIc2BKWoJp9uUEJLzwov7gdl4UtQslGbsr
	2igJqbh2jzmuYywy1MhS0e5JisTcnOZpeRp9/5hljAxoSicBArq20OpeFKOJRq/BP5RqynAUD7qAN
	/TfwIapBUEfBI04GHRYOXXlrgmKtIQfojn5VTkd+bzzozNCzdeLR/Yvbix9ehVr/szkRYAdfWKkle
	Y8ExuL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHJg-00000000jxD-3ffV;
	Sat, 28 Nov 2026 12:14:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHJf-00000000jwz-1cTF;
	Sat, 28 Nov 2026 12:14:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D26F44052B;
	Sat, 28 Nov 2026 12:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2631F000C1;
	Sat, 28 Nov 2026 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795868046;
	bh=HBTpZV+qjSb6XbBgWR6yIkg/MnR4dVdFCuL2rBP9/7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wt9nOIiaKhjwYZLG+0W7HSF7jUClvvctnhaEyBZJa6x0EgGL9U9l2miqA2mHOvS+S
	 9auwZJUqxN37ygshplHMbWD1jRNBNItz/Z0F0SHwDroCH1nZS4XXJ2W8Q1/wVwl0Rq
	 QfnVimhRwVrvfTD+iCv0IqHS1ASL6OvnU0qvU2C2534gi0ChKLEnVddNckiRUOmmIf
	 sjZDPOlpbiv/gJ5YhZZvCZSVdKsO2b/Y2UU0JL9Al0i0yzsuTWT0tQ5hLhJHFGYAei
	 yQBANFNVHKbTPVhVoEY1fDSXAAOml3HvMCeF48IAfSXwFey0tYUWrOJ6hPA1faNDZD
	 NlVwrmEX/Z6mg==
Date: Sat, 28 Nov 2026 04:14:04 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 00/12] Add TH1520 USB support
Message-ID: <awrFjAIE96hw0VNV@x1>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Michael Turquette <mturquette@baylibre.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yao Zi <ziyao@disroot.org>, linux-gpio@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, May 07, 2026 at 04:16:58PM +0800, Icenowy Zheng wrote:
> This patchset adds support for T-Head TH1520's USB functionality, and
> enabled it on the Lichee Pi 4A board.
> 
> The first 3 patches add support for the MISC subsystem clock
> contrtoller, which contains some USB clocks.
> 
> The next 2 patches add support for the USB PHY of T-Head TH1520, which
> is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
> the controller itself is a properly configured DWC3 controller with sane
> default register values set.
> 
> Then one patch adds the USB PHY and controller nodes to the TH1520 DTSI
> file.
> 
> The remaining half of this patchset dedicates to enablement of USB on
> TH1520, because of the onboard hub of that board -- its USB2 signals are
> behind a switch that needs to be toggled on, and Vbus supplies for both
> the hub itself and downstream ports are managed via I2C-expanded GPIOs
> (because the SoC does not have enough GPIO pins).
> 
> Emil Renner Berthing (1):
>   riscv: dts: thead: Add Lichee Pi 4A IO expansions
> 
> Icenowy Zheng (10):
>   dt-bindings: clock: thead: add TH1520 MISC subsys clock controller
>   clk: thead: th1520-ap: add support for MISC subsys clocks
>   riscv: dts: thead: add device tree node for MISC clock controller
>   dt-bindings: phy: add binding for T-Head TH1520 USB PHY
>   phy: add a driver for T-Head TH1520 USB PHY
>   riscv: dts: thead: add device nodes for USB
>   dt-bindings: gpio: dwapb: allow GPIO hogs
>   dt-bindings: usb: vialab,vl817: allow ports property
>   riscv: dts: thead: lpi4a: sort nodes
>   riscv: dts: thead: enable USB3 ports on Lichee Pi 4A
> 
> Thomas Bonnefille (1):
>   riscv: dts: thead: Add TH1520 I2C nodes

I have applied patches 1 and 2 to thead-clk-for-next:

  [01/12] dt-bindings: clock: thead: add TH1520 MISC subsys clock controller
          https://git.kernel.org/fustini/c/c9240a577b73
  [02/12] clk: thead: th1520-ap: add support for MISC subsys clocks
          https://git.kernel.org/fustini/c/4f38d7bdaef4

and patch 3 to thead-dt-for-next:

  [03/12] riscv: dts: thead: add device tree node for MISC clock controller
          https://git.kernel.org/fustini/c/8d80d268b429

I fixed the platform data check for usb_suspend_div_clk in patch 2 when
applying.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
