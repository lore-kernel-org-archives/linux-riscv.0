Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A7606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LydYWjTQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DoGzN0Vd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cDGaHmmdiKRJ+q6cI0dv32zDvH3AKqIXQbxxT/h0oeg=; b=LydYWjTQ007iX/+0BKElyEqOBr
	od8eRcRNaRHTtcmzEDMmdlLpHg5GOynW3d0tQ2jdS0MvDt+ynbB/jJG0YQp8f/I4OA0o7soq3scrm
	BAOETaXmNEBV30rvm926vu2uJ4Q0QOiygzLgDivRRuBvnetRlWwUB/7ZvOFYbrB2TiHcSav57qG0a
	I9pOFQrWZGUQsbLnuCzUQ8RLCIIj2jvlZpdXt9SRPm7mN/HugMYn2Z0WSeoWYXLS4E9ODS0iGdiBr
	p62CqTCmiAqkx84t30U/AihXGHwYcSc2nZa/x8aWOig9F2tdaafGL9G8t49nwVmdothv195v37PM+
	ZFSw0jfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp0i-0000000DpHM-3x6t;
	Thu, 22 Oct 2026 09:22:56 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJp0f-0000000DpFv-3L0x
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 09:22:55 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 702952004FF;
	Thu, 22 Oct 2026 11:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792660971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wmcDPWEKLBzrIxX+Ibo0uWDTHVsLEg1YsLnub8SYKk=;
	b=DoGzN0VdYhpldqdi1+jz3OLnJPSPBDW6+JRbBvThzUgPuMdkhOQp6tpedhuDd7SUVh3elc
	fMMabeWe1g8WjTDHf56FZ38Q9uHEwHCu9U65sQhrAD3JyWOmCjBkuBbxEs8OSdrdVjfgst
	56vAZ9rXpJ+82xyjbPmGGKZfPzB5jwYj7Y0wBYewZwAAZ3hrjpod5FF+av1SMZySTYHD1R
	USMPWCS9XVQiGGhETKvlKgPydypyG/Kz0/wPvkv7hYCw4atPBGJvVJ6R5BfFAOn9V56Ikx
	N237xCVoQd5yJEb2B0nVdc+VDpAb8/aLc4RDd4aXU+//uK1aMjuTVprMDbUh1Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792660971; a=rsa-sha256;
	cv=none;
	b=GoYrNGzPnyZ80vQRqYm1ZdPrusvwI0iwA/D/e+tLVzpBo67HEqm4NULHNbRP6mIHdU6I13
	Zw+VjX2D3c7GcQWQ2HfphXbiqiWXSfJ8t0yZlRVIYAtp5S1qe4dxWafEAZo60rj7FO2BA7
	lIctvFrRGTtmxAvafcURsF64W1qu+qyLy0u9QDKuzmiQnyCOKwhT1KJCFwWC5g2RkDV+jc
	xBqveLsQXYXXUfmjrT0QjyKl+udzM8tMuZqXLfudWGYoJjpir8XW68Da7rwQBG0Ue1eObE
	GeZ/pkS+G0+D4chqyV6Eyjwo9ctjbr7ELgNhZ4sXLNOGsOVuerhsQiPRZ38VLQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792660971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wmcDPWEKLBzrIxX+Ibo0uWDTHVsLEg1YsLnub8SYKk=;
	b=DFxMgagx3VDAvleH0DdLcAiesq/JJe8gxfeFnhPYLtAHu7tEyyyvFSiYgWmnzlr/hoWOym
	dG6BxplaEByLQzBLjoANNbWbT2NxTt1QkviLMgt644ty+rWXKVSoloqUTihCw9GQgko1Sf
	uHUFmuatBvcFLc6Kbhx+mnvQAjQIXip+24zGQeW2L7N7O+W30ttoHwAyeINbLyxfDYkVOm
	F0e40HVUpWom7ZM9i3oh1ukfmACay2y7dbL9xrtJauc50kTjv0/vuOC26ObD773IwApaCt
	NcCb75Db5ojo4VD2A0e8T1wKXazqQAQTNw3HyBw/uHpPIZxeSeO1tciYK9HcLQ==
Message-ID: <ef0957a4ceaf754989f8a7132cb6276686244d24.camel@pengutronix.de>
Subject: Re: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley	
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu	
 <zhiguo.zhu@linux.alibaba.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney	 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Thomas Gleixner	 <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Samuel
 Holland	 <samuel.holland@sifive.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>,  Anup Patel <anup@brainfault.org>, Icenowy
 Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Date: Thu, 22 Oct 2026 11:22:51 +0200
In-Reply-To: <20261022-a210-init-v1-14-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
	 <20261022-a210-init-v1-14-5e438f972d24@iscas.ac.cn>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_022254_172881_A890549E 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Do, 2026-10-22 at 03:53 +0800, Han Gao via B4 Relay wrote:
> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> 
> Add the ten A210 UARTs with their clocks, resets and interrupts, using
> the snps,dw-apb-uart compatible.
> 
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
> index bbad51a3edb0..a07b67d10633 100644
> --- a/arch/riscv/boot/dts/zhihe/a210.dtsi
> +++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
> @@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
>  			#reset-cells = <1>;
>  		};
>  
> +		uart0: serial@2014000 {
> +			compatible = "snps,dw-apb-uart";

Prepend a vendor compatible if you need two resets, similar to
"starfive,jh7100-uart"?

> +			reg = <0x0 0x02014000 0x0 0x400>;
> +			clocks = <&clk_peri PERI1_UART0_SCLK_EN>,
> +				 <&clk_peri PERI1_UART0_PCLK_EN>;
> +			clock-names = "baudclk", "apb_pclk";
> +			interrupt-parent = <&intc>;
> +			interrupts = <321 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			resets = <&rst_peri1 PERI1_UART0_PRST>;

This looks to me like it should be

			resets = <&rst_peri1 PERI1_UART0_PRST>,
				 <&rst_peri1 PERI1_UART0_S_RST>;

instead.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
