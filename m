Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC775C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:26:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A21610C9
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A21610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJR9164Z9wEUObpNuHch7ukUjVYq7eN7nnm4oS+sNDM=; b=3AMO2KVxxtsLm/
	aD72Y6ZPGC2CCh5kMCbOHI5f7CGntxEt8SgnZBsnZ1zF4doDX/zE1N7HM21shOjrOtyHi7y5yTSnW
	Sttwitap2Lj4TgNPrfiHLbp0AlNrljrUqkCzsme4dMHceIX1ciPPbeo3VcCndUcBYpAtI0qzgjA6j
	qFMg1ynQh46v/v206zo6dTTQjp51ojS2k9NQfFMGO88mLpU5Hejw4MEYn+AQ8F87Yn3bg176tRsvt
	oNzXFsu58ERFRGxBYu9kEbBFJvHbWFtknEa2rVGl6Wvk1c52+qwsrS6q/XmUMNhhNMnblRqih1sHY
	+96IBWZ1aFq7HtOMIKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpvbj-000Xw9-Ea; Sun, 06 Jun 2021 16:26:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvbf-000XvU-Se
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:26:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id f2so14577964wri.11
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4LMS6521uwLvF3d0VH9aHVTLaSPCmp9aqfX/Cw2Qkt8=;
 b=qbMma+/EYBI89XYXH6O5Gn0B1ZxLNxhf+QnPVywlVhDpm4TQtWpC0b58caEwBCMnIC
 rojWchC/QzXkvoo9WoG7CkI/9FQOI/ImTnp8KF9xJ6yXQPr8BDjhDq21NL0nfbd2sizR
 l6tqoyurBVltuw8jmKvNFidWuqunqEb0N01jo5k/NUrcQOzJHlE3WwqvUw62xOA7Jxq6
 Mo3cMHRMrgw9rnd251x5xx6gBnUmLtODkcYSyUYZV0XkokBiAOZV0tPdD1XiycamAGLX
 7nyyz9G+fmLZT4BvvIZ3qaVccg5yRvDDocQocDtbPhUwfwBS5705coTiHcjG9EbA4cG1
 YVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4LMS6521uwLvF3d0VH9aHVTLaSPCmp9aqfX/Cw2Qkt8=;
 b=Zh4qt8hmTMo9ni86WYxIpyp3TiUdSdtVJo83dKqMz0cip2w0r1qkMM6vsMqRpM3Y3e
 +709j/ErAMGEk8Ov1NConHNEAaj8+FBPUlBZxHsX/UAO7aG6CFkWHYvNS0BP+xMUYsgp
 /SFqbq06PDkJL8JWSCQAuufWIUb8Oc1pQmTWDgXYC3yI8XJi6xviio0Pv6+q0+HmRKpY
 dDUx5nNk4QarQfSlHTN4gyYeqpmDErn5hu5CFRPldHcQgq5bgpfJps8w7IGKy8gB8ER9
 Fjm5gMOuMG7NQ8cIf23i8QbA56ofcS0IOD7g6pPSajxx+osp88vXwMo7n+Pn+nc0/9sj
 2UhA==
X-Gm-Message-State: AOAM533qcUPCrONdDAe6RhcIrDpRZBnmUxkZkPDPAMIXkFqcEmAh4ZMU
 LKWILeVUotRANFBFyzwDfDU=
X-Google-Smtp-Source: ABdhPJyerIt5K+ze4U8Rv+TuJdirbauulSeSldhLjdb6CNMv2sLlQ70UGAhvFiVs4ybWr75JK9jngQ==
X-Received: by 2002:adf:fe4a:: with SMTP id m10mr13371826wrs.332.1622996792572; 
 Sun, 06 Jun 2021 09:26:32 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id p12sm13492367wme.43.2021.06.06.09.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 09:26:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com,
 guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Atish Patra <atish.patra@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1
 NeZha board
Date: Sun, 06 Jun 2021 18:26:30 +0200
Message-ID: <2490489.OUOj5N01qN@jernej-laptop>
In-Reply-To: <1622970249-50770-13-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-13-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_092635_994670_D49A482C 
X-CRM114-Status: GOOD (  20.41  )
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

Hi!

I didn't go through all details. After you fix all comments below, you should 
run "make dtbs_check" and fix all reported warnings too.

Dne nedelja, 06. junij 2021 ob 11:04:07 CEST je guoren@kernel.org napisal(a):
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add initial DTS for Allwinner D1 NeZha board having only essential
> devices (uart, dummy, clock, reset, clint, plic, etc).
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Drew Fustini <drew@beagleboard.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Wei Wu <lazyparser@gmail.com>
> ---
>  arch/riscv/boot/dts/Makefile                       |  1 +
>  arch/riscv/boot/dts/allwinner/Makefile             |  2 +
>  .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  | 29 ++++++++
>  arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    | 84
> ++++++++++++++++++++++ 4 files changed, 116 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index fe996b8..3e7b264 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -2,5 +2,6 @@
>  subdir-y += sifive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += allwinner
> 
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile
> b/arch/riscv/boot/dts/allwinner/Makefile new file mode 100644
> index 00000000..4adbf4b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_SUNXI) += allwinner-d1-nezha-kit.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts new file mode
> 100644
> index 00000000..cd9f7c9
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts

Board DT names are comprised of soc name and board name, in this case it would 
be "sun20i-d1-nezha-kit.dts"

> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Usually copyrights are added below spdx id.

> +
> +/dts-v1/;
> +
> +#include "allwinner-d1.dtsi"
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;

This should be part of SoC level DTSI.

> +	model = "Allwinner D1 NeZha Kit";
> +	compatible = "allwinner,d1-nezha-kit";

Board specific compatible string should be followed with SoC compatible, in 
this case "allwinner,sun20i-d1".  You should document it too.

> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200";

Above line doesn't belong here. If anything, it should be added dynamically by 
bootloader.

> +		stdout-path = &serial0;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0x0 0x20000000>;
> +	};

Ditto for whole memory node.

> +
> +	soc {
> +	};

There is no point having empty nodes.

> +};
> +
> +&serial0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi new file mode 100644
> index 00000000..11cd938
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi

Current naming approach for Allwinner SoC level DTSI is "sun20i-d1.dtsi".

> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

> +
> +/dts-v1/;
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;

Since all peripherals and memory are below 4 GiB, why have 64-bit addresses 
and sizes? It just clutters DT.

> +	model = "Allwinner D1 Soc";
> +	compatible = "allwinner,d1-nezha-kit";

Compatible and model don't belong to SoC level DTSI.

> +
> +	chosen {
> +	};

Remove empty node.

> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <2400000>;
> +		cpu@0 {
> +			device_type = "cpu";
> +			reg = <0>;
> +			status = "okay";
> +			compatible = "riscv";
> +			riscv,isa = "rv64imafdcv";
> +			mmu-type = "riscv,sv39";
> +			cpu0_intc: interrupt-controller {
> +				#interrupt-cells = <1>;
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		reset: reset-sample {
> +			compatible = "thead,reset-sample";
> +			plic-delegate = <0x0 0x101ffffc>;
> +		};
> +
> +		clint: clint@14000000 {
> +			compatible = "riscv,clint0";
> +			interrupts-extended = <
> +				&cpu0_intc  3 &cpu0_intc  7
> +				>;
> +			reg = <0x0 0x14000000 0x0 0x04000000>;
> +			clint,has-no-64bit-mmio;
> +		};
> +
> +		plic: interrupt-controller@10000000 {
> +			#interrupt-cells = <1>;
> +			compatible = "riscv,plic0";
> +			interrupt-controller;
> +			interrupts-extended = <
> +				&cpu0_intc  0xffffffff &cpu0_intc  9
> +				>;
> +			reg = <0x0 0x10000000 0x0 0x04000000>;
> +			reg-names = "control";
> +			riscv,max-priority = <7>;
> +			riscv,ndev = <200>;
> +		};
> +
> +		dummy_apb: apb-clock {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "dummy_apb";
> +			#clock-cells = <0>;
> +		};
> +
> +		serial0: serial@2500000 {

This should be uart0 and board should have alias for it. Check ARM based 
Allwinner DTs.

Best regards,
Jernej

> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x02500000 0x0 0x400>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <18>;
> +			clocks = <&dummy_apb>;
> +			status = "disabled";
> +		};
> +	};
> +};





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
