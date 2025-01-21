Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC2AC02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heh79JoD6hMVRzVPcfVkn7A6DYuMGkj8z+5B5glD914=; b=G7iFP16jk/nDvy
	jQ5A7fHy5ZpQxHRryICtUsbEU5DeOn63xOJzJUbf+lKNjjqd3sbaFO24nHeHbPWrAf8lqZWzZIItU
	bBZHERY+AHyAtDtpbNaTEn8EjVgB2k74pZUqSEKzD+h7hHhX0A5VNvdpe8kOvr6OE+8OEAyl/Amrg
	s1/Dett8zbU8doFgeNexiXsjHq1CP2LqIlQhIOJFk3oTIYzhd4iKBV6tgVjQqRXDWNRxcpxPinLw9
	AgUNTXJ4xCt/+Woh+47XRxZN1YdTgUcMHjeU8j603PS3RTKzfm9TpKnIqbblQRebBWkkbHbBc6dbD
	M+tYG7MHKGOX4bwqzopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAvy-00000007TBb-3ajv;
	Tue, 21 Jan 2025 09:52:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAvw-00000007TAk-2e3y
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 09:52:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 141DEA41400;
	Tue, 21 Jan 2025 09:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76701C4CEDF;
	Tue, 21 Jan 2025 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737453151;
	bh=PROraVkzIJD81IIiVaOKlfp/Ts8aLobHr6k/3m6C0CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O4xqtr0HGdFA4rJciWtAE6HDzwkBHKo0Bv6xSKW5rOVbR5hxPhxWkUhO7EWu5nrGD
	 MHj0nIDMMkDmLOozgFXX40WAGZa+kMrKO//XpI51pnvmaRHDtAew1NNLp9dsyRi+Kc
	 MTDxLy2C8+BzLBj/3Sjodh+zw1tGb+gcDIeUqvnn+QRc5E6JUhSfB+tk73OE+hXqzx
	 w76vgR9a709da+V5BF7grTVSVTeL92cm1pM3hDmFLFYEpznWSRt6UXPa1A6gWo4T/T
	 zO06ZgOQdf140T4eQEfCyvREMG9Ila6BLH1cNbQ78P5ZMQ+orE6azV7S4dDDaFdZ1l
	 uoily9ER40F1A==
Date: Tue, 21 Jan 2025 10:52:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org, 
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC v3 03/18] dt-bindings: firmware: thead,th1520: Add support
 for firmware node
Message-ID: <20250121-lively-cocky-lorikeet-e0a3db@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172123eucas1p13564bf2d07000506caf44cf55bda7fd9@eucas1p1.samsung.com>
 <20250120172111.3492708-4-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-4-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_015232_817000_7079430F 
X-CRM114-Status: GOOD (  13.55  )
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

On Mon, Jan 20, 2025 at 06:20:56PM +0100, Michal Wilczynski wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fa7c5728f1e..c56a1fb6e02a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20184,6 +20184,7 @@ M:	Fu Wei <wefu@redhat.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/pdp7/linux.git
> +F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml

Misordered.

>  F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>  F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> @@ -20194,6 +20195,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
> +F:	include/dt-bindings/firmware/thead,th1520-aon.h
>  
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> diff --git a/include/dt-bindings/firmware/thead,th1520-aon.h b/include/dt-bindings/firmware/thead,th1520-aon.h
> new file mode 100644
> index 000000000000..7607522289f7
> --- /dev/null
> +++ b/include/dt-bindings/firmware/thead,th1520-aon.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2022 Alibaba Group Holding Limited.
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#ifndef __DT_BINDINGS_AON_TH1520_H
> +#define __DT_BINDINGS_AON_TH1520_H
> +
> +#define TH1520_AON_VDEC_PD	1
> +#define TH1520_AON_NPU_PD	2
> +#define TH1520_AON_VENC_PD	3
> +#define TH1520_AON_GPU_PD	4
> +#define TH1520_AON_DSP0_PD	5
> +#define TH1520_AON_DSP1_PD	6

I don't see these being used in the driver. Can you point me?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
