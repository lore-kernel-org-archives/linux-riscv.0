Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5475CD5BD0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7w05dBGxspOGJsE9vzsyFppAcOccmXffZIlRSDzP++c=; b=rK89abAiblXF6K
	b8ZcKN52cI6s/5UZTz09SCnkT/vCOVAcVLhZvMuF7rfi10/OXyB3jHmhzbpe0nSgCRBmYu/rFkhAT
	/4VpWSRyHKfTM+NrXD12rteUUHUoDKdqJDY0UIBEGpeGNzbJ1i+mdfMtKmL22v85waxnJCAQ7Cwhu
	9lwZ0ObWkkNf5D94xRElxqEtyRrxg88hxiv9Md+CN75ynCSR50BVkr7+nkK4Rb6YmbICxtEK4XDru
	WM64dJFr9JDyehTe9Av2VOsx3/IMLHqudgPIZgAviih7Cn42ZJ+BqX/KTBCRDP8KTl021LsIUtzjp
	5ESjN303O3USCPfzlz7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRkY-000000095Ha-2STO;
	Sat, 30 May 2026 22:01:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRkW-000000095HG-2l7w
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 22:01:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36d8b644473so242141a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178504; x=1780783304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7n4onNHcUGonSFh3iTX+9p1SOqH/aLpn6mI3I4XkfLM=;
        b=ia2nK6tauhOLFWS/X+bcKKdSlDvu0PicQUE9JOB25/a79psIBWxamlKN7ktdcbqwwy
         Av6DLcsr4UTHKNXGqVWpxrX7KC/CSizMMID3NIPKFvD6Nv+krTAqy2hf7LoKkxKCrfhY
         N5To7dIOOrr0oAe0BDzvOqHuiCsSDDwsE1Vfh+ur9ToEukX8nkt9CyF1EbxCgTyz3tgT
         jkH0wdXqvoorB/sKYe0DKAOKQ5WY6aGnsZVnS2Ph4i6wfBoing+FDw4Gkltgza8uLfl2
         Typ2UVEBUha+WMgk/qDfJFrYQr2xb/7FvgRt5Gr+ByKWwS5ZS/bo8WmYGo8sDrB4j+T8
         6xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178504; x=1780783304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n4onNHcUGonSFh3iTX+9p1SOqH/aLpn6mI3I4XkfLM=;
        b=DmgLDu4SiBXlNBmm0nbTVC0KLj4En6LfTK2iBqQrEDE6GrO+Yc1fQnaziwqqs826hh
         eJ43ZS9eqwbFnguiNuWzsb8Wgf4YD0cVJKEneC4np/UH4bhNPs2z1WHa2dAwq0zMft3u
         nFmjI8D3yHAjF5BjMmgthEdwxomaGh5pd1EEoP2flMVyIaqyOSMuCc4odOMg7mfrKtty
         fusR3tt/SxNX1zL1tXxLv4j6chptgSIJwFunTcJPvHq0K39oiRkdqikauLN9jjEcbSVj
         YUvBs39NMaNTx6q74sNfUC6bLI9xFI390BhA8yCx840UOmabhag0W/Qe9YejfopitfHJ
         WojA==
X-Forwarded-Encrypted: i=1; AFNElJ+avp0tpA1sNRv9Azhm1UYdKJ83xN9d3x3gv/AZTwHWXUxgGtJ+B0Vnq53R2umEO/JgEeNf0Qml1D436Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyENWaCAc/KTR0HyTGGJ/aFFoYpXWA5U69zckIopL+hLCUdnMnv
	vvQUdmQVPJ5rcVER+uLI6pWTlWv8bwz/8PQw/0dfMTGbAiDn4go1gfjH
X-Gm-Gg: Acq92OHHOhjyXRfnbnqX1gaatY8KFEmewFgjWFLASQxlGPFynPVCwow59AmynZbCIEL
	ksGDtgRZwwzQBle4sE8wAcklZEOsuoJViT9VdrCBs8Oi7743vWLTlAbO3Ef4jdrj3CzMRj8SOIU
	I6O6EM+P7p/EULCZnY+JtzITWPJ8E2vSUCsZwoUoUKc6oZNEYBwPKT9rvNOj33rH0CM7ijA+A6D
	xa3PGcTYB6UczGO1PCnIza93COhoslyun2G22+lMY5i+mndUhEPxerZxI6Y6saR04EBQII6Mh7B
	V4JO1BW4mKDqwsZyrX/G0Oiqv0gy9DprWhpxmQ4+fXv5w8ZAFcFZwf2EKdpSzcLGKa583QQi28u
	0vbEPPI0aTwXZOEMsiVejc5v+vv4txj+TNkgyLXr7WaJvfghc/uo+K2r+td7TDGmk4RthlWKD1t
	EW7qVf6xa21Ueoe4I4xz4aKTJ/dIJIk6NhpQ==
X-Received: by 2002:a17:90b:2383:b0:36d:6315:1de5 with SMTP id 98e67ed59e1d1-36d63151e6amr2613775a91.18.1780178503719;
        Sat, 30 May 2026 15:01:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6b7c178sm5814986a91.15.2026.05.30.15.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:01:43 -0700 (PDT)
Date: Sun, 31 May 2026 06:01:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, hanguidong02@gmail.com, 
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 2/5] arm64: dts: sophgo: add initial Milk-V Duo
 S board support
Message-ID: <ahteG0AtGbTLexVu@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-3-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-3-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_150144_695413_7035F646 
X-CRM114-Status: GOOD (  16.77  )
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

On Sat, May 30, 2026 at 01:33:44PM -0400, Joshua Milas wrote:
> Adds initial arm64 support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
> index 94f52cd7d994b..68aace728223a 100644
> --- a/arch/arm64/boot/dts/sophgo/Makefile
> +++ b/arch/arm64/boot/dts/sophgo/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
> +
> +	aliases {
> +		i2c4 = &i2c4;
> +		mmc0 = &sdhci0;
> +		serial0 = &uart0;
> +		spi3 = &spi3;

Apply the same change for the reply on v5.

Regards,
Inochi

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&dmac {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&spi3 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> -- 
> 2.53.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
