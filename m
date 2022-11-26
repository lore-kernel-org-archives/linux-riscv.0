Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762FAC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URKk8PsElXgcQ7hW8W6xrUuf8R8R9bnpNH3Wwv5o5/A=; b=NlD25AFqThpZD4
	SODMQpcBatlFWBwTJ9GQGSCt+JhjsdqIJuNQIi6Ut0tm7fcvF3hDd050c1dHTD7IGHYjhpFjb6Y3O
	XKLgixSukYILYk2JhD25rbYQsk5AVhyOF9KQOsw7dNpas0j+hAEBKs8vrtxwg16TUeDvH2LhD57lf
	5Bs5Q/QA0IOzjiducXA1DNjoHcppIWDjOidW9c5MlWktwehH+prTRjlkDm1QuCftSVETEYGNoInyS
	qgEZjytAy0fByKX94+7KTVyq67nUOPGGeklhiNWSOtuVTOaM4VMYoz4EgYcDnTp/mV1Rs5z1CryYQ
	T99OCFUoZRiUjy5ylc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oysMT-005UZV-Ss; Sat, 26 Nov 2022 10:24:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oysLx-005URC-Aw; Sat, 26 Nov 2022 10:24:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AD0B60A0B;
	Sat, 26 Nov 2022 10:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4A0C433C1;
	Sat, 26 Nov 2022 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669458247;
	bh=AkDR3oNI7rYW8PrF+zx6xgX1DzCDcfyJR4GUZe9yXrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boT6wd1t0uPTV/gqYWlt7gAI1wyVyxWPb4Xjm9HaGtz3ppPMB1rjF7q7zROBgxTAA
	 BsDWfN8JEhg91m20UDlHrC0SB+/uI1tjY6yn9pcQVo4e0yrBMoF7vd+AsAYiXy7iq9
	 pYIi/onxuWKLWTAYnc+BHfP4srYj+KvBVwYHdaSp6aWUEOd9X09059kWqZUQtVI+3L
	 oUmFh95ksY+8zGOsH5+3PERqUVLriAkSi9rXNyq6F4WDDiWuwQ5W6FLy/qzKFlsXnl
	 6dAXRdAGw6C71T26zlJARniNJ0JPlnJt9WHfDYJ7x919G+Fg+yc2cqkye5DuOZj68n
	 ybnbR8G40f8jw==
Date: Sat, 26 Nov 2022 10:24:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 00/12] riscv: Allwinner D1/D1s platform support
Message-ID: <Y4HpQCw74uuVWjSE@spud>
References: <20221125234656.47306-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_022409_510532_2F56E0C4 
X-CRM114-Status: GOOD (  17.43  )
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

Hey Samuel,

On Fri, Nov 25, 2022 at 05:46:44PM -0600, Samuel Holland wrote:
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1 and D1s-based boards. Many features are already
> enabled, including USB, Ethernet, and WiFi.
> 
> The devicetrees use bindings from the following series which have not
> yet been merged:
>  - In-package LDO regulators:
>    https://lore.kernel.org/lkml/20221125040112.18160-1-samuel@sholland.org/
>  - Ethernet MAC binding fixes (not a new issue with D1):
>    https://lore.kernel.org/lkml/20221125202008.64595-1-samuel@sholland.org/
>  - RTL8723DS Bluetooth (has driver support, missing documentation):
>    https://lore.kernel.org/lkml/20221125040956.18648-1-samuel@sholland.org/
>  - TI ADC101C ADC (has driver support, missing documentation):
>    https://lore.kernel.org/lkml/20221125220903.8632-1-samuel@sholland.org/
> 
> $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-musl- dtbs_check
>   SYNC    include/config/auto.conf.cmd
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb
>   DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb

Ran this last night, so before I go mess with your timer stuff & forget
there were a good few warnings about surplus-to-requirements address &
size cells. Other than that,

sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sun20i-d1-lichee-rv-86-panel.dtsi:24.32-36.5: Warning (unit_address_vs_reg): /dmic-sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sun20i-d1-lichee-rv-86-panel.dtsi:18.13-37.4: Warning (avoid_unnecessary_addr_size): /dmic-sound: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sun20i-d1-lichee-rv-dock.dts:30.32-42.5: Warning (unit_address_vs_reg): /dmic-sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sun20i-d1-lichee-rv-dock.dts:24.13-43.4: Warning (avoid_unnecessary_addr_size): /dmic-sound: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sun20i-d1-lichee-rv-86-panel.dtsi:24.32-36.5: Warning (unit_address_vs_reg): /dmic-sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sun20i-d1-lichee-rv-86-panel.dtsi:18.13-37.4: Warning (avoid_unnecessary_addr_size): /dmic-sound: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:616.20-636.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@5450000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
sunxi-d1s-t113.dtsi:666.32-675.7: Warning (graph_child_address): /soc/tcon-top@5460000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

> The only remaining DT validation issue is that gpio-fan is missing a
> YAML conversion, although one is on the list here:
> https://lore.kernel.org/lkml/20220126200350.3633576-1-clabbe@baylibre.com/
> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb:0:0: /fan: failed to match any schema with compatible: ['gpio-fan']

Documentation/devicetree/bindings/hwmon/gpio-fan.yaml

I actually didn't see this error on next-20221122 :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
