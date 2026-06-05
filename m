Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA83BCD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPMGWL6liRa8xewbVRPqvJN/SyOG6GtUISDyjgB8UTg=; b=KS3LfkqutI8Gq1
	78xhYmF8iA5NJhUQn9DwJbSLjCENCYsdrdUuRfGmvaOwDvn0QJCisPgdmZlM4bhpt/e7Flj9OGBr5
	+y7znbimEHFSa+JOiW/68qcEOZd9jaL1Zn6Z04Q5l7BFfOE3abRnOtY8wOrV+r6D8Huc6CbjTcEOd
	ppXGl7ZUTvy0eIEPGTxWr4flZHZP9RqnrjklXKTNT3P/l+FGsAjFwgt6F8cXA4c6UCAO8K/u++Yo6
	gmY80BZd33barETizlju7c/2N6HP0eOUmrD89P2OEgMwXtTqyTdRr7LPp44J9zTTuBvzmb75zE2/B
	uZcAM2U/GrQrRuZndZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQvs-00000000PF4-19Qf;
	Fri, 05 Jun 2026 09:33:40 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQvp-00000000PEa-22Ak;
	Fri, 05 Jun 2026 09:33:39 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gWx7x26TDz9twd;
	Fri,  5 Jun 2026 11:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780652013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QhLZZ7DF5RQcecWKZHROUBnz5EbLkvAFAJ8ZXow1xg=;
	b=Qhv75Hp5L7mhw4yvb9CtlBJWQgGZJ0hczOCA7bUsBW/xavDLSqRI3Qtd59VcpkyZZFFIoN
	5TGJRbhXsiwhimVe/mfUqrhxDaFSgzCOVRkdqM2kjFVZ7jYr+0+z0bpIl3yGVymhPmnyUF
	XIr4fx10cX6eAV5tV1JWJgxH8K3C+2BWVoRCJMvdi8XkQuWeaDCRaLlykuTQrnGRn1u2xt
	3OCykKdhQHhxmyKt34pr2R74/42tMYdGQl1jpFLbq2BQknDp2eZMp8u+rq4lw28Av9X8Zc
	8LUGDogh3C/U5JE0pg3ZCw5PWyREMgacDMsfWbxIuE2B2awLPQVSrDScA3AO7g==
Mime-Version: 1.0
Date: Fri, 05 Jun 2026 17:33:23 +0800
Message-Id: <DJ10GDDAE672.1N365YARL5KV1@mailbox.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <sophgo@lists.linux.dev>,
 <hanguidong02@gmail.com>, <michael.opdenacker@rootcommit.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Joshua Milas" <josh.milas@gmail.com>, <tglx@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <pjw@kernel.org>, <samuel.holland@sifive.com>, <unicorn_wang@outlook.com>,
 <inochiama@gmail.com>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <liujingqi@lanxincomputing.com>,
 <alexander.sverdlin@gmail.com>, <rabenda.cn@gmail.com>, <dlan@kernel.org>,
 <chao.wei@sophgo.com>, <anup@brainfault.org>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-5-josh.milas@gmail.com>
In-Reply-To: <20260530173347.33533-5-josh.milas@gmail.com>
X-MBO-RS-META: cnakhfhm6eenn8abomp48ddt71ztasak
X-MBO-RS-ID: e6d4df9cfa9ec01b400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_023337_689797_87A1DBF0 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Joshua,

On Sun May 31, 2026 at 1:33 AM CST, Joshua Milas wrote:
> Adds sg2000.dtsi on the RISCV side.
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
> new file mode 100644
> index 0000000000000..412adacc00576
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "cv180x-cpus.dtsi"
> +#include "cv180x.dtsi"
> +#include "cv181x.dtsi"
> +
> +/ {
> +	compatible = "sophgo,sg2000";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>;
> +	};

I noticed that this describes 256 MiB of RAM. The Milk-V Duo documentation lists
the SG2000-based Duo boards as having 512 MB of DRAM [1].
Is the 256 MiB size intentional here, or should the Duo S board DTS override it
with the documented 512 MB DRAM size?
[1] https://milkv.io/docs/duo/overview

> +
> +	soc {
> +		interrupt-parent = <&plic>;
> +		dma-noncoherent;
> +
> +		pinctrl: pinctrl@3001000 {
> +			compatible = "sophgo,sg2000-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,sg2000-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
> +	};
> +};

-- 
Best regards,
Shuwei Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
