Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59CFFED3EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG7BalPcEs1ISPkeqUbvzjtH8F85MaagqVroJ1DKF1w=; b=LvMX72JVeoEmNLy3uh8UC3qPKL
	qSoQxj0GQXIHvPV9QaA1llD1Cjdp1+akwo9BoKImcIGZ6M01yFg8mrcT1hJx2JbmJ3MC45ZgaQL3c
	zai+mecUT1R7GMBOEnQD6zbDWplLLE24tIkeW++3SsaLOOmmWAs4vKIIt1YO9WjsxY84kHc4+Y80i
	8DwEEzeyxgTD7Jm5UIW2gR3Q6r2V91YlAMPDeVYd+LmXdl/l9J/m6ibxnXWUHId9NuM8jXfh1okcm
	bXr5v9fWr8eWBfZGSRE0znDd06ug7Kv1EzdFUkE4w7UHgt1c2DJySqEoxMkW2jeVGXvNdvWiDCrGo
	p6lJ36Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJsy-0000000DYnF-2IjB;
	Fri, 24 Apr 2026 17:00:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJsw-0000000DYmi-29Fk
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 17:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E8F543C97;
	Fri, 24 Apr 2026 17:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080C8C19425;
	Fri, 24 Apr 2026 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050009;
	bh=xmAOUoANTj5Fy6Q6Q7e6qCJjfEsxwi+gOHX4xphQ07g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dT6hJ6hPEd/TB0iXlKfHCCFW+tpqRYPQS2roQSvnrzHMzE/GRQYxLKzq+lpgxNMsH
	 vAk/h7DSTFbmt5uPrcLj/dKOxdubFqrPd0a5/iysPLkzRpzXdb+SgiTl8gOpwByHzh
	 v3EursNsF/k0+KXgOVFKu+h5OuuQGOy+0dtsubQEzZCmWE4JhqLezBFvWjVN2ZT565
	 mTcpinnOqdgIUEH5nbz8bU49I0hXyKt3Bz7Wtns0HitzvNsgspPDz8lp+zH060wB15
	 ww7xTywuWnaUgIT0ZhnqKI1xO8iouNpflzRVSTTK2PHjdjzpzvxVQ/SaNW8DKDmGq6
	 M/nl0zymKvtdQ==
Date: Fri, 24 Apr 2026 18:00:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 19/20] riscv: dts: starfive: Add StarFive JHB100 pin
 function definitions
Message-ID: <20260424-anvil-mocha-86cd01d7401f@spud>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-20-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260424111330.702272-20-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_100010_600855_2E84C080 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5145983170874904448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5145983170874904448==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="re5CKRJFQkYCTInl"
Content-Disposition: inline


--re5CKRJFQkYCTInl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 04:13:29AM -0700, Changhuang Liang wrote:
 +
> +/* Function Selection */
> +
> +/* pinctrl_sys0 pad function selection */
> +#define FUNC_SYS0_DOM_HOSTSS_AUXPWRGOOD0		1
> +#define FUNC_SYS0_DOM_HOSTSS_AUXPWRGOOD1		1
> +#define FUNC_SYS0_HBLED					1
> +#define FUNC_SYS0_PE2RST_OUT				0
> +#define FUNC_SYS0_GPIO3					1
> +
> +/* pinctrl_sys0h pad function selection */
> +#define FUNC_SYS0H_ESPI0_DATA0				1
> +#define FUNC_SYS0H_ESPI0_DATA1				1
> +#define FUNC_SYS0H_ESPI0_DATA2				1
> +#define FUNC_SYS0H_ESPI0_DATA3				1
> +#define FUNC_SYS0H_ESPI0_CLK				1
> +#define FUNC_SYS0H_ESPI0_CS				1
> +#define FUNC_SYS0H_ESPI0_ALERT				1
> +#define FUNC_SYS0H_ESPI0_RESET				0
> +#define FUNC_SYS0H_GPIO7				1
> +#define FUNC_SYS0H_ESPI0_VW0				1
> +#define FUNC_SYS0H_ESPI0_VW1				1
> +#define FUNC_SYS0H_ESPI0_VW2				1
> +#define FUNC_SYS0H_ESPI0_VW3				1
> +#define FUNC_SYS0H_ESPI1_VW0				2
> +#define FUNC_SYS0H_ESPI1_VW1				2
> +#define FUNC_SYS0H_ESPI1_VW2				2
> +#define FUNC_SYS0H_ESPI1_VW3				2
> +#define FUNC_SYS0H_SCAP_TRIG0_A				3
> +#define FUNC_SYS0H_SCAP_TRIG1_A				3

I'll be blunt here, I hate this. The sheer number of repeated numbers
between each pin of a function suggests to me that the approach is
wrong.
At the very least, the number of defines could be significantly reduced,
but the whole approach of using pinmux is called into question here in
my opinion.

Conor.

> +
> +/* pinctrl_sys1 pad numbers */
> +#define FUNC_SYS1_ESPI1_DATA0				1
> +#define FUNC_SYS1_ESPI1_DATA1				1
> +#define FUNC_SYS1_ESPI1_DATA2				1
> +#define FUNC_SYS1_ESPI1_DATA3				1
> +#define FUNC_SYS1_ESPI1_CLK				1
> +#define FUNC_SYS1_ESPI1_CS				1
> +#define FUNC_SYS1_ESPI1_ALERT				1
> +#define FUNC_SYS1_ESPI1_RESET				0
> +#define FUNC_SYS1_GPIO7					1
> +
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT0		2
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT1		2
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT2		2
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT3		2
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT4		2
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT5		2
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT6		2
> +#define FUNC_SYS1_HOST0_PORT80_DATA_OUT7		2
> +
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT0		3
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT1		3
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT2		3
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT3		3
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT4		3
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT5		3
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT6		3
> +#define FUNC_SYS1_HOST1_PORT80_DATA_OUT7		3
> +
> +/* pinctrl_sys2 pad function selection */
> +#define FUNC_SYS2_UART_CTS				1
> +#define FUNC_SYS2_UART_RTS				1
> +#define FUNC_SYS2_UART_DCD				1
> +#define FUNC_SYS2_UART_DSR				1
> +#define FUNC_SYS2_UART_DTR				1
> +#define FUNC_SYS2_UART_RI				1
> +#define FUNC_SYS2_UART0_TX				1
> +#define FUNC_SYS2_UART0_RX				1
> +#define FUNC_SYS2_UART1_TX				1
> +#define FUNC_SYS2_UART1_RX				1
> +#define FUNC_SYS2_UART2_TX				1
> +#define FUNC_SYS2_UART2_RX				1
> +#define FUNC_SYS2_UART3_TX				1
> +#define FUNC_SYS2_UART3_RX				1
> +#define FUNC_SYS2_UART4_TX				1
> +#define FUNC_SYS2_UART4_RX				1
> +#define FUNC_SYS2_UART5_TX				1
> +#define FUNC_SYS2_UART5_RX				1
> +#define FUNC_SYS2_UART6_TX				1
> +#define FUNC_SYS2_UART6_RX				1
> +#define FUNC_SYS2_UART7_TX				1
> +#define FUNC_SYS2_UART7_RX				1
> +#define FUNC_SYS2_UART8_TX				1
> +#define FUNC_SYS2_UART8_RX				1
> +#define FUNC_SYS2_UART9_TX				1
> +#define FUNC_SYS2_UART9_RX				1
> +#define FUNC_SYS2_UART10_TX				1
> +#define FUNC_SYS2_UART10_RX				1
> +#define FUNC_SYS2_UART11_TX				1
> +#define FUNC_SYS2_UART11_RX				1
> +#define FUNC_SYS2_UART12_TX				1
> +#define FUNC_SYS2_UART12_RX				1
> +#define FUNC_SYS2_UART13_TX				1
> +#define FUNC_SYS2_UART13_RX				1
> +#define FUNC_SYS2_UART14_TX				1
> +#define FUNC_SYS2_UART14_RX				1
> +
> +#define FUNC_SYS2_I2C8_SMBALERT				2
> +#define FUNC_SYS2_I2C9_SMBALERT				2
> +#define FUNC_SYS2_I2C10_SMBALERT			2
> +#define FUNC_SYS2_I2C11_SMBALERT			2
> +#define FUNC_SYS2_I2C12_SMBALERT			2
> +#define FUNC_SYS2_I2C13_SMBALERT			2
> +#define FUNC_SYS2_I2C14_SMBALERT			2
> +#define FUNC_SYS2_I2C15_SMBALERT			2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT0		2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT1		2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT2		2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT3		2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT4		2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT5		2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT6		2
> +#define FUNC_SYS2_HOST0_PORT80_DATA_OUT7		2
> +#define FUNC_SYS2_JTAG_MST_TDI				2
> +#define FUNC_SYS2_JTAG_MST_TRST_N			2
> +#define FUNC_SYS2_JTAG_MST_TMS				2
> +#define FUNC_SYS2_JTAG_MST_TCK				2
> +#define FUNC_SYS2_JTAG_MST_TDO				2
> +
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT0		3
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT1		3
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT2		3
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT3		3
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT4		3
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT5		3
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT6		3
> +#define FUNC_SYS2_HOST1_PORT80_DATA_OUT7		3
> +
> +/* pinctrl_per0 function numbers */
> +#define FUNC_PER0_I2C0_CLK				1
> +#define FUNC_PER0_I2C0_DATA				1
> +#define FUNC_PER0_I2C1_CLK				1
> +#define FUNC_PER0_I2C1_DATA				1
> +#define FUNC_PER0_I2C2_CLK				1
> +#define FUNC_PER0_I2C2_DATA				1
> +#define FUNC_PER0_I2C3_CLK				1
> +#define FUNC_PER0_I2C3_DATA				1
> +#define FUNC_PER0_I2C4_CLK				1
> +#define FUNC_PER0_I2C4_DATA				1
> +#define FUNC_PER0_I2C5_CLK				1
> +#define FUNC_PER0_I2C5_DATA				1
> +#define FUNC_PER0_I2C6_CLK				1
> +#define FUNC_PER0_I2C6_DATA				1
> +#define FUNC_PER0_I2C7_CLK				1
> +#define FUNC_PER0_I2C7_DATA				1
> +#define FUNC_PER0_I2C8_CLK				1
> +#define FUNC_PER0_I2C8_DATA				1
> +#define FUNC_PER0_I2C9_CLK				1
> +#define FUNC_PER0_I2C9_DATA				1
> +#define FUNC_PER0_I2C10_CLK				1
> +#define FUNC_PER0_I2C10_DATA				1
> +#define FUNC_PER0_I2C11_CLK				1
> +#define FUNC_PER0_I2C11_DATA				1
> +#define FUNC_PER0_I2C12_CLK				1
> +#define FUNC_PER0_I2C12_DATA				1
> +#define FUNC_PER0_I2C13_CLK				1
> +#define FUNC_PER0_I2C13_DATA				1
> +#define FUNC_PER0_SMBUS0_SMBALERT			1
> +#define FUNC_PER0_SMBUS1_SMBALERT			1
> +#define FUNC_PER0_SMBUS2_SMBALERT			1
> +#define FUNC_PER0_SMBUS3_SMBALERT			1
> +#define FUNC_PER0_SMBUS4_SMBALERT			1
> +#define FUNC_PER0_SMBUS5_SMBALERT			1
> +#define FUNC_PER0_SMBUS6_SMBALERT			1
> +#define FUNC_PER0_SMBUS7_SMBALERT			1
> +#define FUNC_PER0_MIPI_I3C12_SCL0			1
> +#define FUNC_PER0_MIPI_I3C12_SDA0			1
> +#define FUNC_PER0_MIPI_I3C13_SCL0			1
> +#define FUNC_PER0_MIPI_I3C13_SDA0			1
> +#define FUNC_PER0_MIPI_I3C14_SCL0			1
> +#define FUNC_PER0_MIPI_I3C14_SDA0			1
> +#define FUNC_PER0_MIPI_I3C15_SCL0			1
> +#define FUNC_PER0_MIPI_I3C15_SDA0			1
> +#define FUNC_PER0_MIPI_I3C0_SCL0			1
> +#define FUNC_PER0_MIPI_I3C0_SDA0			1
> +#define FUNC_PER0_MIPI_I3C1_SCL0			1
> +#define FUNC_PER0_MIPI_I3C1_SDA0			1
> +#define FUNC_PER0_MIPI_I3C2_SCL0			1
> +#define FUNC_PER0_MIPI_I3C2_SDA0			1
> +#define FUNC_PER0_MIPI_I3C3_SCL0			1
> +#define FUNC_PER0_MIPI_I3C3_SDA0			1
> +#define FUNC_PER0_MIPI_I3C4_SCL1			1
> +#define FUNC_PER0_MIPI_I3C4_SDA1			1
> +#define FUNC_PER0_MIPI_I3C5_SCL1			1
> +#define FUNC_PER0_MIPI_I3C5_SDA1			1
> +#define FUNC_PER0_MIPI_I3C6_SCL1			1
> +#define FUNC_PER0_MIPI_I3C6_SDA1			1
> +#define FUNC_PER0_MIPI_I3C7_SCL1			1
> +#define FUNC_PER0_MIPI_I3C7_SDA1			1
> +
> +#define FUNC_PER0_MIPI_I3C4_SCL0			2
> +#define FUNC_PER0_MIPI_I3C4_SDA0			2
> +#define FUNC_PER0_MIPI_I3C5_SCL0			2
> +#define FUNC_PER0_MIPI_I3C5_SDA0			2
> +#define FUNC_PER0_MIPI_I3C6_SCL0			2
> +#define FUNC_PER0_MIPI_I3C6_SDA0			2
> +#define FUNC_PER0_MIPI_I3C7_SCL0			2
> +#define FUNC_PER0_MIPI_I3C7_SDA0			2
> +#define FUNC_PER0_MIPI_I3C8_SCL0			2
> +#define FUNC_PER0_MIPI_I3C8_SDA0			2
> +#define FUNC_PER0_MIPI_I3C9_SCL0			2
> +#define FUNC_PER0_MIPI_I3C9_SDA0			2
> +#define FUNC_PER0_MIPI_I3C10_SCL0			2
> +#define FUNC_PER0_MIPI_I3C10_SDA0			2
> +#define FUNC_PER0_MIPI_I3C11_SCL0			2
> +#define FUNC_PER0_MIPI_I3C11_SDA0			2
> +#define FUNC_PER0_GMAC2_MDC				2
> +#define FUNC_PER0_GMAC2_MDIO				2
> +#define FUNC_PER0_GMAC3_MDC				2
> +#define FUNC_PER0_GMAC3_MDIO				2
> +#define FUNC_PER0_GMAC1_MDC				2
> +#define FUNC_PER0_GMAC1_MDIO				2
> +#define FUNC_PER0_WDT0_3_OR_RESET_OUTPUT		2
> +#define FUNC_PER0_WDT_SECRP_RESET_OUTPUT		2
> +#define FUNC_PER0_WDT4_RESET_OUTPUT			2
> +#define FUNC_PER0_WDT4_RESTART_INPUT			2
> +
> +/* pinctrl_per1 pad function selection */
> +#define FUNC_PER1_SPI0_N_SS_OUT_0			1
> +#define FUNC_PER1_SPI0_N_SS_OUT_1			1
> +#define FUNC_PER1_SPI0_SCLK_OUT				1
> +#define FUNC_PER1_SPI0_TX				1
> +#define FUNC_PER1_SPI0_RX				1
> +#define FUNC_PER1_SFC0_N_SS_OUT_0			1
> +#define FUNC_PER1_SFC0_N_SS_OUT_1			1
> +#define FUNC_PER1_SFC0_SCLK_OUT				1
> +#define FUNC_PER1_SFC0_IO0				1
> +#define FUNC_PER1_SFC0_IO1				1
> +#define FUNC_PER1_SFC0_IO2				1
> +#define FUNC_PER1_SFC0_IO3				1
> +#define FUNC_PER1_SFC1_N_SS_OUT_0			1
> +#define FUNC_PER1_SFC1_N_SS_OUT_1			1
> +#define FUNC_PER1_SFC1_N_SS_OUT_2			1
> +#define FUNC_PER1_SFC1_SCLK_OUT				1
> +#define FUNC_PER1_SFC1_IO0				1
> +#define FUNC_PER1_SFC1_IO1				1
> +#define FUNC_PER1_SFC1_IO2				1
> +#define FUNC_PER1_SFC1_IO3				1
> +#define FUNC_PER1_SFC2_N_SS_OUT_0			1
> +#define FUNC_PER1_SFC2_N_SS_OUT_1			1
> +#define FUNC_PER1_SFC2_N_SS_OUT_2			1
> +#define FUNC_PER1_SFC2_SCLK_OUT				1
> +#define FUNC_PER1_SFC2_IO0				1
> +#define FUNC_PER1_SFC2_IO1				1
> +#define FUNC_PER1_SFC2_IO2				1
> +#define FUNC_PER1_SFC2_IO3				1
> +#define FUNC_PER1_SGPIO0_M_CLK				1
> +#define FUNC_PER1_SGPIO0_M_LOAD				1
> +#define FUNC_PER1_SGPIO0_M_DATA_OUT			1
> +#define FUNC_PER1_SGPIO0_M_DATA_IN			1
> +#define FUNC_PER1_I2C14_CLK				1
> +#define FUNC_PER1_I2C14_DATA				1
> +#define FUNC_PER1_I2C15_CLK				1
> +#define FUNC_PER1_I2C15_DATA				1
> +
> +#define FUNC_PER1_SGPIO1_M_CLK				2
> +#define FUNC_PER1_SGPIO1_M_LOAD				2
> +#define FUNC_PER1_SGPIO1_M_DATA_OUT			2
> +#define FUNC_PER1_SGPIO1_M_DATA_IN			2
> +
> +/* pinctrl_per2 function selection */
> +#define FUNC_PER2_FAN0_TACH_I_0				1
> +#define FUNC_PER2_FAN0_TACH_I_1				1
> +#define FUNC_PER2_FAN0_TACH_I_2				1
> +#define FUNC_PER2_FAN0_TACH_I_3				1
> +#define FUNC_PER2_FAN0_TACH_I_4				1
> +#define FUNC_PER2_FAN0_TACH_I_5				1
> +#define FUNC_PER2_FAN0_TACH_I_6				1
> +#define FUNC_PER2_FAN0_TACH_I_7				1
> +#define FUNC_PER2_FAN0_TACH_I_8				1
> +#define FUNC_PER2_FAN0_TACH_I_9				1
> +#define FUNC_PER2_FAN0_TACH_I_10			1
> +#define FUNC_PER2_FAN0_TACH_I_11			1
> +#define FUNC_PER2_FAN0_TACH_I_12			1
> +#define FUNC_PER2_FAN0_TACH_I_13			1
> +#define FUNC_PER2_FAN0_TACH_I_14			1
> +#define FUNC_PER2_FAN0_TACH_I_15			1
> +#define FUNC_PER2_GMAC2_RGMII_RX_CLK			1
> +#define FUNC_PER2_GMAC2_RGMII_RXCTL			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_RXD0			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_RXD1			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_RXD2			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_RXD3			1
> +#define FUNC_PER2_GMAC2_RGMII_TX_CLK			1
> +#define FUNC_PER2_GMAC2_RGMII_TXCTL			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_TX0			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_TX1			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_TX2			1
> +#define FUNC_PER2_GMAC2_RGMII_PHY_TX3			1
> +
> +#define FUNC_PER2_GMAC2_RMII_RX_CLK			2
> +#define FUNC_PER2_GMAC2_RMII_CRSDV			2
> +#define FUNC_PER2_GMAC2_RMII_PHY_RXD0			2
> +#define FUNC_PER2_GMAC2_RMII_PHY_RXD1			2
> +#define FUNC_PER2_GMAC2_RMII_RX_CKO			2
> +#define FUNC_PER2_GMAC2_RMII_TXEN			2
> +#define FUNC_PER2_GMAC2_RMII_PHY_TXD0			2
> +#define FUNC_PER2_GMAC2_RMII_PHY_TXD1			2
> +
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT0		2
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT1		2
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT2		2
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT3		2
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT4		2
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT5		2
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT6		2
> +#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT7		2
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT0		3
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT1		3
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT2		3
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT3		3
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT4		3
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT5		3
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT6		3
> +#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT7		3
> +
> +/* pinctrl_per2pok function selection */
> +#define FUNC_PER2POK_PWM0_CHANNEL0			0
> +#define FUNC_PER2POK_PWM0_CHANNEL1			0
> +#define FUNC_PER2POK_PWM0_CHANNEL2			0
> +#define FUNC_PER2POK_PWM0_CHANNEL3			0
> +#define FUNC_PER2POK_PWM0_CHANNEL4			0
> +#define FUNC_PER2POK_PWM0_CHANNEL5			0
> +#define FUNC_PER2POK_PWM0_CHANNEL6			0
> +#define FUNC_PER2POK_PWM0_CHANNEL7			0
> +
> +#define FUNC_PER2POK_CAN0_TXD				1
> +#define FUNC_PER2POK_CAN0_RXD				1
> +#define FUNC_PER2POK_CAN0_STBY				1
> +#define FUNC_PER2POK_CAN1_TXD				1
> +#define FUNC_PER2POK_CAN1_RXD				1
> +#define FUNC_PER2POK_CAN1_STBY				1
> +#define FUNC_PER2POK_GPIO_PASSTHRU1_IN			1
> +#define FUNC_PER2POK_GPIO_PASSTHRU1_OUT			1
> +#define FUNC_PER2POK_GPIO_PASSTHRU2_IN			1
> +#define FUNC_PER2POK_GPIO_PASSTHRU2_OUT			1
> +#define FUNC_PER2POK_GPIO10				1
> +#define FUNC_PER2POK_GPIO11				1
> +#define FUNC_PER2POK_GPIO12				1
> +#define FUNC_PER2POK_GPIO13				1
> +#define FUNC_PER2POK_GPIO14				1
> +#define FUNC_PER2POK_GPIO15				1
> +#define FUNC_PER2POK_GPIO16				1
> +#define FUNC_PER2POK_GPIO17				1
> +
> +#define FUNC_PER2POK_GPIO_PASSTHRU3_IN			2
> +#define FUNC_PER2POK_GPIO_PASSTHRU3_OUT			2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT0		2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT1		2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT2		2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT3		2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT4		2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT5		2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT6		2
> +#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT7		2
> +
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT0		3
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT1		3
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT2		3
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT3		3
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT4		3
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT5		3
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT6		3
> +#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT7		3
> +
> +/* pinctrl_per3 function selection */
> +#define FUNC_PER3_GMAC0_MDC				1
> +#define FUNC_PER3_GMAC0_MDIO				1
> +#define FUNC_PER3_GMAC0_RMII_RCLKI			1
> +#define FUNC_PER3_GMAC0_RMII_RCLKO			1
> +#define FUNC_PER3_GMAC0_RMII_CRSDV			1
> +#define FUNC_PER3_GMAC0_RMII_PHY_RXD0			1
> +#define FUNC_PER3_GMAC0_RMII_PHY_RXD1			1
> +#define FUNC_PER3_GMAC0_RMII_TXEN			1
> +#define FUNC_PER3_GMAC0_RMII_PHY_TXD0			1
> +#define FUNC_PER3_GMAC0_RMII_PHY_TXD1			1
> +
> +/* gpio func sel value */
> +#define FUNC_SEL0_GPIO					0
> +#define FUNC_SEL1_GPIO					1
> +
> +/* vref value */
> +#define JHB100_PINVREF_3_3V				0
> +#define JHB100_PINVREF_2_5V				1
> +#define JHB100_PINVREF_1_8V				2
> +
> +#endif
> --=20
> 2.25.1
>=20

--re5CKRJFQkYCTInl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeuhkwAKCRB4tDGHoIJi
0o7ZAQCsahVAkp2ZRTw8TTY7D+qWkWQSlPSDNlOXyr28l3K/YQEA3LR2rLo1rcZK
xDGHw8slg0mRk1Njvfjo4MA9GJTsww0=
=s9as
-----END PGP SIGNATURE-----

--re5CKRJFQkYCTInl--


--===============5145983170874904448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5145983170874904448==--

