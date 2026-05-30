Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BA7CD6E49
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 22:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgwpt7yGLZTHxt9KOE+LqmnH08DB9Ehf8DEyKjvXAlM=; b=kl1fbN9VbNGnWY
	eMVh7F/b9pOY/0WOk3mgD+7WMRg0rP3c8JWDDRTtbJ2BHSu+knZXqGtpSqcLvR2TBdxFLsBBASwj5
	Ju86xyqRO0NvPuR5plvRdrHnuVdKJ8t2ZnwBP3rIhaEU4+CEfLWofmoNhU2prtazF/k+AnhQTW5XD
	3CTDlWBMb/O+fwpBX8HxTDxEd9m8zfB2fZ4BGh8t3hWd/KlCVF0uKCnMq8U3UVT+aGSA2lqluErj7
	jQ4R7Q9dhG2WBx8H9HsiDaaLbyONpamnjzVdR7W0sMLvaBahzWnnZYfMoHAdQbx/5Xb26Mgb5X0f+
	sY0ko5oooSD6NPNWgaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRjP-000000095Cd-1gac;
	Sat, 30 May 2026 22:00:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTRjL-000000095CD-3bJl
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 22:00:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso1106925ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 15:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178430; x=1780783230; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx8cn06GRvGbPjFtz25dkBjZJsL3bsmHBqAxLucbQNg=;
        b=KwuZrcOkB/s41vXnfp3VVv8QadUgoCjwJe8CbrEtuiJi97Dv/AghxAL10NSTltlciX
         yHByxTsfcvY/sbXX/FNGF2vRopCzDJVR5ne9OugAypsEh1NRwTkQaTwyE6EnoiNOvxSn
         8wscBskbbHxsSHu3Aj8Q8/k4RflFLAdUVKg7vdYZYZlpcFavQbZqIvPMmICaDO1igWKU
         Eb0xqiSeytiGSjMIOG/OQKm7A1pbsGYZ3B6JH1gOsZPzSH9IxhZnYFpvAjs506pCHczf
         0OG+SdE3w4ozBA7/orLJevmpwC/JPbDUbqqvJiZF8EZ96ABFHkXp22bsdeHpBNyFQVdH
         PJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178430; x=1780783230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx8cn06GRvGbPjFtz25dkBjZJsL3bsmHBqAxLucbQNg=;
        b=QfrHrKTwaBqHMGOD4eU6V1zKAlOyP/8OOi+S/AOoHWsuEpgwPgMRmWyvYEVkhOt6q6
         uChH2jOSzDNK6z95UwNg+vh37TtiTWtw8P4YbG142HisVukDGhJqQ8Sjd/ydi8HPz6kQ
         wDP0apZjLZsquHt4e44dtZW+HJ36ziHEhsu7SzBuxKLY8rK1UJvS39K4aeOq9ia/oUjl
         fq71YQOL2VyUHLAy8YpDpFkNBkutSvbDM/fS0y4uICeF7030V+qLv22gLEzm7hFKem/R
         1C7XWmWbUX+5UpkQGnE5OBs2voVoAACOr8ZgyhHKpEclDdVzTPxDIlEwbuyzI2bIrgoB
         LZ7g==
X-Forwarded-Encrypted: i=1; AFNElJ824Qmo2z6dxtcHf4I8jn0jakE+hm30q5f4EPWEmJHeO3+pu4k7vlLUUo9aCNLlX6opSM0zFjq/dujMOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKvLZ5ycs5Fax2xuXoZPcYOvei5TpZQHQth6jCIvxolrWURq6u
	NbMflRU8kOztYr0QCZmZzgl8MMnMIcrbXU2UH4Q0Joos0PUnXngJQ6A0
X-Gm-Gg: Acq92OHYVC9vmMHftynPE/BkHFbMmL8cF3zWXGJWfdg5nn8uyhOzjzehmKGgUeU1Qd0
	us9ceGVlwm6OGXrb4O3NQqi0zelSEymHFYH94gFdhlKi72pw1fplm1VdH2ivxURBy/iG3+h6xuv
	xSOEgO1pjZ/Ia2xpoiQ19Fim8vLoJIRUwo+CxMsBVGHiylSWiM9e0H8wj7hfsIs/1YCYLIT9Rq/
	pFf0MK9EMt4HFJvvd52nsA1qxBi/9h/O1YDyeSxhbRNwKXdkgQsAOD1OaWzYY3y19pQvJMFJKvZ
	NWli8ofdhLGfZeTTmTLDCkq++ebjlWJ7VAf9i0qO9nbVpxC6XrKlvhE+ek7DZONra+Z1eOPr59t
	BQn4idwCqgFt3EodQcRKoXJNdrheebgcv+pBmPFmKR7+BaLT8j7b2prq92OHyS7b5fF2NMZQgrB
	zaoj4EKetiYYjuSx9zLzw0IgPTpAk/0kLOQQ==
X-Received: by 2002:a17:902:f651:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2bf3688ab6dmr56121035ad.34.1780178430477;
        Sat, 30 May 2026 15:00:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fdf0asm57301565ad.26.2026.05.30.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:00:30 -0700 (PDT)
Date: Sun, 31 May 2026 06:00:16 +0800
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
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <ahtdkX3ZCraGxVcV@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-6-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_150031_934746_A4FB798E 
X-CRM114-Status: GOOD (  16.72  )
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

On Sat, May 30, 2026 at 01:33:47PM -0400, Joshua Milas wrote:
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193b..58cc6b70d8de4 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
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

Adding all the necessary aliases here.

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

pinctrl is needed, ses sashiko's reply.

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
