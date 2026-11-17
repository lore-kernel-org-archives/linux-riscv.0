Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774A4606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kixwvk8o;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WicNL6BN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hsaqeYMwsYSWOM0EmiCcqy/J7QeBie3izKLFdyay57g=; b=kixwvk8oAzbquGMDu5+sg2wmKm
	f2XrSyACabTEhJakSMc+f8ClYaZ80+Q7YNBx8/qu2K1A8Z6jl+rDVRuFBFow0Cq1XByRIOfF+DtH4
	/lZDhk+f0btDgYLWzVwRuOyo/G+QnOzdNc/HvbCbBVrkBhzMaGCoGAw731vbPVcMcLBtHvJBtfuJP
	wP1YtJXUevBQQJ++3AzXVNpSCjg2QlywwYJj0sRRLspso6hvmwJseNQ6S10AtEKxxcwjm5dAtIJ4b
	30ehf6hH5h0p7zHXR11pyYJTmnHB8T1SYwWXkuyv06TXt072kc4TQl1xAQHnOACc0QjctkzqxzolO
	Ke1UBUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMpM-00000006VvV-1vh2;
	Tue, 17 Nov 2026 17:18:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMpJ-00000006VuY-1oAZ;
	Tue, 17 Nov 2026 17:18:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EDBD1A00;
	Tue, 17 Nov 2026 09:18:31 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 786703F632;
	Tue, 17 Nov 2026 09:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794935914; bh=SYvZ5kgkqLXULjnML9MOf+soSDEPX1HZBUqNIwR3D1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WicNL6BNEnnoVjSHqcyjLPbIgnbWpMO4Te2V341SC1ciL9bhv9uhGutAw9bX5p3up
	 ovDczLXMsn5EAUbtZgUoC0g1+sOmkDYh1wO8t4UYuBnoNqOuJemgpzhK/lPVUyIES0
	 X0AJG94fC6nE+dDfzdfNoOvAJXsrwdfRCMIq6BAU=
Message-ID: <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
Date: Tue, 17 Nov 2026 18:18:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks
 enabled
To: Enzo Adriano <enzo.adriano.code@gmail.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
References: <20261112-a733-fwclk-v2@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261112-a733-fwclk-v2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_091837_578104_D11F149D 
X-CRM114-Status: GOOD (  26.99  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

the patch itself looks fine, but the comments and the commit message are 
not entirely correct, I think.

On 11/12/26 22:38, Enzo Adriano wrote:
> The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
> consumers, so unused-clock cleanup gates them. With vendor SCP firmware
> running on the E902 as shipped on Cubie A7S, warm reboot then stalls.

Please note that we don't support "vendor firmware" with mainline Linux. 
That was mostly incompatible in the past, and while it might work these 
days, this is not something we control and want to endorse.
So we would be quite reluctant (to put it mildly) about merging patches 
that are solely needed for BSP firmware bits.

> Keep both critical until remoteproc/mailbox drivers can claim them.

I don't think this "until" is an argument. Even if we'd have Linux 
driver support, they would be optional to use (not compiled, not 
loaded), and would only be needed to *communicate* with the firmware.

But those clocks are actually there to drive the RISC-V core clock, and 
also the "RISC-V side" of the peripherals, due to a lack of separate 
clock controls in the SoC in the Allwinner design. So the kernel should 
not care about or touch those clocks at all - which is what 
CLK_IS_CRITICAL does.

> This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
> Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmware
> clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.
> 
> On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
> clk_ignore_unused, warm reboot returns with both clocks critical and
> stalls without them. Vinicius found either flag alone insufficient on
> Cubie A7Z. Power-off, suspend, single flags on A7S, other
> boards/firmware and upstream TF-A were not tested.
> 
> Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
> Changes in v2:
> - Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works with
>    these at 0/0. Keep only the two E902/mailbox bus gates after Junhui's
>    review, pending remoteproc/mailbox ownership.
> - Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.
> 
> v1:
> https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
> 
> Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
> https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech
> 
> November 12 board test: two RAM boots and warm reboot -f returns on
> Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
> Both retained clocks were 1/1; all three dropped clocks were 0/0.
> The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
> byte-identical in v7, where the no-flag control was not repeated.
> Runtime used DT v3 and its dependencies (all four UART v2 patches),
> with the PMIC identifier and pinctrl IRQ-map context adapted to the base:
> https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

I don't think there is any need for those longish test descriptions, 
especially if they pass.

> 
>   drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> index b8f6e8c6e507..f2965daba0d3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> @@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
>   				  0);
>   static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
>   
> -static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */

Please change this comment. Something like the msgbox clock is shared 
between the E902 core and the Arm APs.

> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw,
> +			 0x17c, BIT(0), CLK_IS_CRITICAL);
>   
>   static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
>   static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
> @@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
>   				  24, 2,	/* mux */
>   				  BIT(31),	/* gate */
>   				  0);
> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */

and this. Just note that the E902 might be running on its own, in a pure 
firmware role, or even completely separate from the main kernel.

Oh, and also please put somewhere that this is based on the linux-sunxi 
for-next tree, aside from just having the base-commit ID below.

Cheers,
Andre

>   static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
> -			 0x21c, BIT(0), 0);
> +			 0x21c, BIT(0), CLK_IS_CRITICAL);
>   static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
>   			 0x21c, BIT(1), 0);
>   
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
