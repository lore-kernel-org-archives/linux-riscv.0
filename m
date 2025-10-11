Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE631CCD187
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 01:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fO+5POnHUnhy89MgfyDRYxeQsdz6ACbYhnWMEZ1Osag=; b=QlXGDvx+KdFxsO
	9iI27C699SQGBoJ5oazojFZIk7174Z6vr+22DbrgH+xALNZ2MpL43RaFQd0ck5zqoX6yk6TtNlLHv
	LH27Au7VzxbLaEYdKNGw4gy7jmHfMLtMqP3KBftnsdsg7nrxh83Hs8dmwJXqpbqRMe1ns7B/GnCrC
	J3lDsuSjJos9z52UIj/Ia6ZYECb25BrknS41xFXgWntdfqI1kDzH0rO5hIvcSoKFcotXV4Gf0MD26
	VYu5rCf70/rCP4b7Ohq4euwXqyu12fxBBXUtKemjAli0CLzV+Wi/rNwPDE3iN1XO8WQmBzDTri+rH
	rgqCmq2x2Lp/404VG1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Os8-00000009gDk-38a5;
	Sat, 11 Oct 2025 01:58:12 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Os6-00000009gDH-0R4I
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 01:58:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so3461888a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 18:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147889; x=1760752689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6HW8g44DEIQGTTdP8+kouoeqn7L/RqaKDm2Xldyjzc=;
        b=gZZ6QU0/7RvFe1SlmZr4Wa31wgWM5sG39qi/l/t14KFIolZC8D5qN0FcxCWOkeksXa
         InpkB8Hk0KRABsd2/TovnbQ7c3Qw0BKTW23NSVcCAvs7qLvJp37mC2c2Sbtq7r+lm+RC
         dOJ8H5FuXDMjuP5bCxKPNB7FsSg/GSXIZx/ifD/CJYE9e5iTTR1oSnxqnXucT9kiYXWk
         zKOngGGOtz7FE5EXkKPIXd6OLuo/+Qc03nyZ9tsSzGdPJE9K8hTnB0cu+DQA/AfG4jsP
         07oonjP3aD3mknsf40WeT5r9uBc3qDOdz+CmhzFYqg3UTKGwbAEU4Ft8UtpJBjmGLL2w
         FmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147889; x=1760752689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6HW8g44DEIQGTTdP8+kouoeqn7L/RqaKDm2Xldyjzc=;
        b=ePBUn0voGr94NVurakXzRRnx0mSJzf+YniDjNIwxvy5X1GpWPVg3pfDrgJ0QB4Fog6
         a76WoJTz0HvxU8RvLdCuPuxDxLSOlu/I7MNCa3vWOyDbXwO1R2uFsrUjkJuqcz1T7rbo
         LTds3ZqkuGpk2QXiqFngtlIcMwVryqxl1gJqZQ/39NVDDenjnAeeVaWSIoPf6lkIGIP+
         vqWdt/eckYjJVAFnoCfTmjLkJ1Un1h1hJAtX3Uc9DnqqEc5kcx5ETiowxlppc6MXWBj2
         K/WUrO7tmC3YwhV9lzMUAX6Vht/QJo4Y21X5EwYiPZm5i7u9TTolzvU2k5y5Buk2EqJw
         I1+g==
X-Forwarded-Encrypted: i=1; AJvYcCXVThgdAzYVa/mBF2vnefMo//gx9Mmhp2pKCJ/s0K+cgzYYDqjMBXL1TufQXtgaxvcrKuXfNaeWVsePWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVBykEbpkKyjKt+qgcf1/BfX/USI9ZMD/lU08l1kqKHu0zbtaT
	MGQ0hRhXKdOGinxdu4OKvBsMkbQhr6NWYPwVQqYp1c1cIe0+s8aSw3FJ
X-Gm-Gg: ASbGncuZnI5aHB3HxGfNNFzNkGuazVNs1jXCqFzPT3c/yVkbU5+6pZw8129zQe0akPG
	8gfAbae1BvmpFjvL5kjlbBv1bj0oj6djGvotJKvo/8jZaFXsGEajbl7eVea6IbDQKyQ9hZjf6jS
	Zjd0iYfo6stLdNtcBozHPS37p/+FD/SEC82VeCwrSaQmCVhL9BzPiH9i00gS1AIQ0/MuNUYiF0f
	jklUvE01A8kTUM5JgDk7jgO42/T6zqyKHFQqD7fiKWkpeca9T8BBK1G6quFTVrW3qbixTC+k1v2
	+SPjPW9Z4QgdbH/276hhIOVpWOzgMJ8IBbOHFumr3KFJpR6Vp7Roxu0VYFYihVKTT22ZOx49zeI
	OLy3+FmBJLSjn/2mjOciZTilky7Kf9KSNr6pPYiwUW6hiAf5CKQw=
X-Google-Smtp-Source: AGHT+IFJ8EMUE7lChv4D1+KCffDibjFkTRRBWFD6F1X6h5F7fXOSWuNLu7wYFFrVDYNpkYrbaVyViQ==
X-Received: by 2002:a17:902:ccc4:b0:24c:e6fa:2a38 with SMTP id d9443c01a7336-2902739ad2emr176670255ad.25.1760147889100;
        Fri, 10 Oct 2025 18:58:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034de6c88sm70267895ad.17.2025.10.10.18.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:58:08 -0700 (PDT)
Date: Sat, 11 Oct 2025 09:57:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <jpqvq6vr7ffibgshnqjxxfchdny5f2o4alyzqjort37ogo355j@n3pybh3hj565>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-4-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251011014811.28521-4-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_185810_146423_5F2201DF 
X-CRM114-Status: GOOD (  15.57  )
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

On Fri, Oct 10, 2025 at 09:48:11PM -0400, Joshua Milas wrote:
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |   1 +
>  .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193..49d6ae4724ea 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
> new file mode 100644
> index 000000000000..2ab46ec1fc0e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>

> +#include "cv1812h.dtsi"

SG2000 is different with CV1812H, add a new sg2000.dtsi instead.

Regards,
Inochi

> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,cv1812h";
> +
> +	aliases {
> +		mmc0 = &sdhci0;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
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
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
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
> +&spi0 {
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
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> -- 
> 2.51.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
