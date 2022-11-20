Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF31C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8gClmlZlrIDhjBenO4pT4e5cMYzHq/wvcMYSBnAPVs=; b=x4aCjAbH1c4ntA
	7PXAUfX/sjD/VShcoZj3HlIwovxj7FpPTgkWR6ETH1m1qj0Hccg0zmiEdZOrShkTC3vAf1FHK9p+o
	r4x55wbvUffg/sZkHxsMMZObqYGVXD23Noa0eQ0bBIkKHeAtM2ZzKjTHj+E+lUkbPw2fX7pUwC3IZ
	suB1gx29V2wgefrNJq2jr8GOcLpDz/25XZMspbCqDQgbLU25c9l/EmgYvRFODdtA9Y47CXh2LJRY0
	gV/EK8SZKTKHpRATc7qVnWppBPnf8CPISnBvyl1R/KgoFnlCfE+IjEzf9uPdaFi/sasg9CQgjVj3u
	KsO1rs5It2zqr5k9XPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiCd-003r35-AG; Sun, 20 Nov 2022 11:09:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiCa-003r2Z-AK
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 11:09:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5E11B80AFC;
	Sun, 20 Nov 2022 11:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADF9C433D6;
	Sun, 20 Nov 2022 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668942569;
	bh=vnyH8G1WUbHbEn7eQvky+ZPnOfOJ4emdGiMvxdIUtSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgiEMPVSngYVdZ7fTokegvHRQhWn8tlEaWT0A86kyG7WIt11GOw7N5AkaEYp+sTy5
	 2f552pb6+g4zD+BL0IqVvHcpgnrNc32HZUPC1OBnl6O6OP5P4YhBtI+Aybddao0OD4
	 6neM5gWBr5j+i9oR+t5Gq9mH3n2EZSUXeXgUydZFaBYwBGZ7OugaPWGPrgLvRaTfQ4
	 2SrgomtnHgXi9Q3LT2BBV7C60NKqEOd4IqYgDnmT3p7o7IT3+dmGQgYiV95G9ypQ7v
	 Q39Xu32JzP1L1wlHPCsZ78qcG4Pb8v4aRVTOwIMULtlLcSuFCpQiEPtHd2mDyGc95L
	 +SIoaaVCGE5og==
Date: Sun, 20 Nov 2022 11:09:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 6/7] riscv: dts: bouffalolab: add Sipeed M1S dock
 devicetree
Message-ID: <Y3oK5B2yYL8+JzLs@spud>
References: <20221120082114.3030-1-jszhang@kernel.org>
 <20221120082114.3030-7-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120082114.3030-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_030932_547369_3770B783 
X-CRM114-Status: GOOD (  17.44  )
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

On Sun, Nov 20, 2022 at 04:21:13PM +0800, Jisheng Zhang wrote:
> Sipeed manufactures a M1S system-on-module and dock board, add basic
> support for them.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
>  .../boot/dts/bouffalolab/bl808-sipeed-m1s.dts | 30 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> 
> diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> new file mode 100644
> index 000000000000..42e17e1a97bd
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s.dtb
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> new file mode 100644
> index 000000000000..64421fb2ad67
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "bl808.dtsi"
> +
> +/ {
> +	model = "Sipeed M1S";
> +	compatible = "sipeed,m1s", "bouffalolab,bl808";

These compatibles also need to be defined, in a bouffalolab.yaml in the
riscv/ bindings subdirectory. Otherwise:
arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtb:0:0: /: failed to match any schema with compatible: ['sipeed,m1s', 'bouffalolab,bl808']

Thanks,
Conor.

> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:2000000n8";
> +	};
> +
> +	memory@50000000 {
> +		device_type = "memory";
> +		reg = <0x50000000 0x04000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
