Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C57C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woFiKW4aGKAssVv77nyvVID0CZxZ7I4vULPpPJRFF5w=; b=135mXUQZcIe/l6
	ysQf4EtcB/5JTay7kTSMNlfbDwmv5KWScveaxvRrED/lFD9Cq3NO03MzRth0SWopkX8qh5Ln90WTt
	a1CylXV0NVfRMVQZPVQ3AzqutM655xc66Wjnpzippv6JKQohX7pZklGt7p41pANSxM/ypdinjuM7v
	NJhoUWOx7NjofH7w6zwgwXN6+75SsPhNmcrxX8R6ewT6UdSmrwdB/eBbLw9uDkhOzR6vahmqImryk
	279a5LhbJtHMhbYCZvjrebF4by4wAS02sZ/ev1GRxRn00JdIanyOJHWZjkeePXBxlHxfnBPXRUGAA
	+c3AdbFt1LrlJSB1dzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I6A-00AIFf-9N; Mon, 05 Dec 2022 20:29:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I67-00AIEI-AK; Mon, 05 Dec 2022 20:29:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id e13so17416646edj.7;
        Mon, 05 Dec 2022 12:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8TDCrFmihYPFCS1WLvyNafX9oJ54bQj/cb+Zm1DGjU=;
        b=qWgIIL327r0YVWFhCA0OLzpuWk5mNK1BcbdEdwozMzEx89SxEE7vveLlwz6raSZ+QJ
         N+glM+ik0iuZ4fLA59mb2HUMgGVMRrtYg6cV9w5J7nE1gF4k1/y9+h/DFPIfBq5PLwNM
         j7FGdYiVHBdlHAGz0jydOQOwyKNgYt7l0UhEw7GzWWwSCWFnvMaqbpsHlkGC+x6J8GM5
         K5tOhZhbItpyFdOGqVKaUtuFZihReor+jNSOXK2qiJWlqypHdT6DndjenySUvtzMRl6k
         FYi0PSGSJX/bRohW9zO747UN+qkb9wxWui1CmE1MIjYhp/E07Kqp9CTveik1fHf4eRle
         mbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8TDCrFmihYPFCS1WLvyNafX9oJ54bQj/cb+Zm1DGjU=;
        b=K5oFcPTs+LTswD+paf5FDMI8D5+qPcK4NuAxJGk5YVqWB0wVQUas7l0P0wopRK5u8R
         XnHA6IHkLjvkg7G0MSzz/RdWQEt7PoxmloElXFZrULslYWqtJthfwLwbVtUQE1yalRum
         AmMxTrchebjIloAi2/EzjeTkgRwgReIRPRhFEbWofGpyK2qDjH9rVnVxrk5pQne8x+Rj
         aVnwnay16hBr0AUnqb5cOMfLNpvF1s4LAXFSL4qqjMnvkpZnmbaPJ9sSOLNAKuBkGPeJ
         GPl3UsQpfd3ysAgrCp695dsnX3RgT1uYJe+KfrU6KizwnPhVDKgOGj2szEHpjC48Wg6h
         kAQg==
X-Gm-Message-State: ANoB5plbqnmh2wWVfPZgjfQoJrqhxSHvC4I5fLz+iZKv0fqvV3FQGzLr
	tJszCiRGtuKyq3cLFhOXq3Y=
X-Google-Smtp-Source: AA0mqf7TjwFhuLtnU9OhAdgp8QbR978XtF8j3+BFCATZbwZH71AApv7bnxIVe/K6DUGOHb6yHMiCkg==
X-Received: by 2002:a05:6402:1045:b0:461:68e1:ced5 with SMTP id e5-20020a056402104500b0046168e1ced5mr10670080edu.142.1670272191819;
        Mon, 05 Dec 2022 12:29:51 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906314e00b007aee7ca1199sm6702198eje.10.2022.12.05.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:29:51 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: Re: [PATCH v2 04/12] riscv: dts: allwinner: Add the D1/D1s SoC devicetree
Date: Mon, 05 Dec 2022 21:29:49 +0100
Message-ID: <8148981.T7Z3S40VBb@kista>
In-Reply-To: <f277a900-422d-cf14-af8c-c173916aaa0b@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221127174107.66e6630f@slackpad.lan> <f277a900-422d-cf14-af8c-c173916aaa0b@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_122955_391098_7266F9D1 
X-CRM114-Status: GOOD (  33.99  )
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

Dne nedelja, 27. november 2022 ob 20:22:35 CET je Samuel Holland napisal(a):
> On 11/27/22 11:41, Andre Przywara wrote:
> > On Fri, 25 Nov 2022 17:46:48 -0600
> > 
> > Samuel Holland <samuel@sholland.org> wrote:
> >> D1 (aka D1-H), D1s (aka F133), R528, and T113 are a family of SoCs based
> >> on a single die, or at a pair of dies derived from the same design.
> >> 
> >> D1 and D1s contain a single T-HEAD Xuantie C906 CPU, whereas R528 and
> >> T113 contain a pair of Cortex-A7's. D1 and R528 are the full version of
> >> the chip with a BGA package, whereas D1s and T113 are low-pin-count QFP
> >> variants.
> >> 
> >> Because the original design supported both ARM and RISC-V CPUs, some
> >> peripherals are duplicated. In addition, all variants except D1s contain
> >> a HiFi 4 DSP with its own set of peripherals.
> >> 
> >> The devicetrees are organized to minimize duplication:
> >>  - Common perhiperals are described in sunxi-d1s-t113.dtsi
> > 
> > So I compared all the reg and interrupts properties against the T113
> > manual, they match, as far as they are described there. The undocumented
> > rest matches what we already have in other SoCs.
> > 
> > I noticed two things, though, mentioned inline below:
> > 
> > [...]
> > 
> >> +		display_clocks: clock-controller@5000000 {
> > 
> > The clocks and the two mixers are not children of a bus node anymore,
> > IIUC correctly this was to manage the SRAM control. Is that now handled
> > differently, or does the D1 generation not require this anymore?
> 
> The D1 family uses the DSP SRAM for extra space during early boot --
> this applies even to D1s, where the DSP is fused off. Since the DE SRAM
> is not used for this purpose, the "SRAM C" aka "boot mode" bit in the
> SRAM controller is cleared by default, thus mapping the DE SRAM to the
> peripheral. So the DE works without touching the syscon registers.
> 
> However, if I set the SRAM C bit, the DE stops working. So having the
> bus node would make some sense. But I do not know any address for the
> SRAM -- there is no "boot" address, and the "peripheral" address may not
> even be accessible to the CPU. So it is not possible to represent this
> with a mmio-sram node like the binding requires.
> 
> So I suppose we should either change the binding to allow a child
> allwinner,sun50i-a64-sram-c node with no address (the driver should work
> fine with this); or leave out the bus, and people who go poking around
> in the syscon registers get to keep the pieces. :)

Just leave out the bus. I think this is just a leftover...

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> >> +			compatible = "allwinner,sun20i-d1-de2-clk",
> >> +				     "allwinner,sun50i-h5-de2-
clk";
> >> +			reg = <0x5000000 0x10000>;
> >> +			clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
> >> +			clock-names = "bus", "mod";
> >> +			resets = <&ccu RST_BUS_DE>;
> >> +			#clock-cells = <1>;
> >> +			#reset-cells = <1>;
> >> +		};
> >> +
> >> +		mixer0: mixer@5100000 {
> >> +			compatible = "allwinner,sun20i-d1-de2-
mixer-0";
> >> +			reg = <0x5100000 0x100000>;
> >> +			clocks = <&display_clocks CLK_BUS_MIXER0>,
> >> +				 <&display_clocks CLK_MIXER0>;
> >> +			clock-names = "bus", "mod";
> >> +			resets = <&display_clocks RST_MIXER0>;
> >> +
> >> +			ports {
> >> +				#address-cells = <1>;
> >> +				#size-cells = <0>;
> >> +
> >> +				mixer0_out: port@1 {
> >> +					reg = <1>;
> >> +
> >> +					
mixer0_out_tcon_top_mixer0: endpoint {
> >> +						remote-
endpoint = <&tcon_top_mixer0_in_mixer0>;
> >> +					};
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		mixer1: mixer@5200000 {
> >> +			compatible = "allwinner,sun20i-d1-de2-
mixer-1";
> >> +			reg = <0x5200000 0x100000>;
> >> +			clocks = <&display_clocks CLK_BUS_MIXER1>,
> >> +				 <&display_clocks CLK_MIXER1>;
> >> +			clock-names = "bus", "mod";
> >> +			resets = <&display_clocks RST_MIXER1>;
> >> +
> >> +			ports {
> >> +				#address-cells = <1>;
> >> +				#size-cells = <0>;
> >> +
> >> +				mixer1_out: port@1 {
> >> +					reg = <1>;
> >> +
> >> +					
mixer1_out_tcon_top_mixer1: endpoint {
> >> +						remote-
endpoint = <&tcon_top_mixer1_in_mixer1>;
> >> +					};
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		dsi: dsi@5450000 {
> >> +			compatible = "allwinner,sun20i-d1-mipi-dsi",
> >> +				     "allwinner,sun50i-a100-mipi-
dsi";
> >> +			reg = <0x5450000 0x1000>;
> >> +			interrupts = <SOC_PERIPHERAL_IRQ(92) 
IRQ_TYPE_LEVEL_HIGH>;
> >> +			clocks = <&ccu CLK_BUS_MIPI_DSI>,
> >> +				 <&tcon_top CLK_TCON_TOP_DSI>;
> >> +			clock-names = "bus", "mod";
> >> +			resets = <&ccu RST_BUS_MIPI_DSI>;
> >> +			phys = <&dphy>;
> >> +			phy-names = "dphy";
> >> +			status = "disabled";
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			port {
> >> +				dsi_in_tcon_lcd0: endpoint {
> >> +					remote-endpoint = 
<&tcon_lcd0_out_dsi>;
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		dphy: phy@5451000 {
> >> +			compatible = "allwinner,sun20i-d1-mipi-
dphy",
> >> +				     "allwinner,sun50i-a100-mipi-
dphy";
> >> +			reg = <0x5451000 0x1000>;
> >> +			interrupts = <SOC_PERIPHERAL_IRQ(92) 
IRQ_TYPE_LEVEL_HIGH>;
> > 
> > This is the same interrupt number as for the DSI controller above. Is
> > that correct, and can the drivers handle that?
> 
> Yes, it is correct. Currently, neither driver uses the interrupt, so we
> will just need to keep the sharing in mind if/when that happens.
> 
> Regards,
> Samuel



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
