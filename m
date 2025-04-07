Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5539FC3600C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 02:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hC0p5SxF7XZFGh0Yzahvg2kGYurDRw/Qb7ht57hb6zY=; b=h1ISvt0p0QP7vq
	fRuCp7bHRKI/vZ7Br3z6bjS9G8yAP+6cn9pwCCiaaP+UDKeyUEP5I6W6K9LjVC5O9pgaebR38/Inn
	fMc0WZ/071BeueKyQwYyidposcx3eBri9v8t73mNg1Cd838q/G8HBpN2fpKojNYYoJVayiCTgeahy
	/lUCWFa2kw6QFwkkQRutxqysvrytjJSihbAAqOgLqfKGZnz95JR6JNljUnDFcFFN+ei9BEFc/5a6N
	abEhBGVdFp0OKiOPtPKA1RaCkIsOsAsPaI3S9IdP33xYxqSg/kHO2DCmuB3zz8B3Q/PVKE9u+0+PJ
	0rJzOjDNT4ogOoN7wILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1bvu-0000000GAdZ-3V6p;
	Mon, 07 Apr 2025 02:09:55 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1bvs-0000000GAcz-1G8E
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 02:09:53 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 406253430A7;
	Mon, 07 Apr 2025 02:09:50 +0000 (UTC)
Date: Mon, 7 Apr 2025 02:09:45 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <20250407020945-GYA13182@gentoo>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-10-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_190952_388403_48080543 
X-CRM114-Status: GOOD (  13.46  )
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


On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> Sophgo SG2044 SRD3-10 board bases on Sophgo SG2044 SoC.
> This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> 1 microSD slot.
> 
> Add initial device tree of this board with uart support.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |    1 +
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
>  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
>  arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
>  5 files changed, 3249 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi
> 
..
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-reset.h b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> new file mode 100644
> index 000000000000..94ed1e3777c3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
you might want to use your gmail suffix? IIRC your outlook account
isn't preferable? besides, it's better cosistent with your signed-off

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
