Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EA1C4828D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aGaEv7it9zG7iVDEP28UOUgvo9BmBCaaZFGdixhza4=; b=tARz6VdWp1aU3p
	1YFpkOdCGpe6/ORjyU3y8rJf00WQb1U7nA9EJ4LHBAMBRLBYqU3nJ3ssXdhmVj63TtWujYuYQRsaE
	zv+FSDfYAEkx2k0md45/HjXS0h4TxX+1kk6jnkzcIwxpf5MGfXrbxf0UqjpHlUNIVT1xxLvheD+Qq
	Imks8PnX/Z+puwvgLRpzML/Q33rWhK1hs2tfde4cveQLBvqEumhV4a30aVhFyg9kJMfTaH4CQnf6g
	GRHnxOmECRJ7LzidfxQkMzd6LrZJEjvTE6ZLgsM7Lf2GalIn9cMYu82hrZpw9kVJSMhvHavnXKYla
	32b6aWDyMiB2ufStv7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2hr-000000048SM-2LFc;
	Mon, 05 Feb 2024 17:24:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2ho-000000048RN-0HbJ
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 17:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B129CE0B6C;
	Mon,  5 Feb 2024 17:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F6EC433F1;
	Mon,  5 Feb 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707153865;
	bh=57+vuhxR0ZRTmvixqiWFdIkVcetZmOf0Jc6VS8ZKuy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qML3bQ/m6US6eH59hVCWopHioCg9bU6f3BfZhxldrz/Q1oicATvG99hkjxhvnQFP9
	 z8V5RDoImB0E+4jJHovqJMvYqnaj+NfqEUr76TMvcCAg9RTnulsB9H1LSYofRmd+Cq
	 DPMZIenghAfPCTqZ5sO+BKA8L6RBQoByNvOiI02mu7pWsXgXUv2ywUY2sKtKXN/+3Q
	 yDSrnbRD1h9JJxQwwAfmC/UjEXYDRfWAoNAEuYpzoIaz4CcgD+R6K/a21pWjzO6tCy
	 gatRjuZ22zSTh19PgzTyZRIThD06c0eMZE0frsJOvE908c4ECMbI2oSWtmas+hPevp
	 Rvgm1PvcW2osQ==
Date: Mon, 5 Feb 2024 17:24:22 +0000
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v9 2/5] dt-bindings: clock: sophgo: add RP gate clocks
 for SG2042
Message-ID: <20240205172422.GA3643653-robh@kernel.org>
References: <cover.1706854074.git.unicorn_wang@outlook.com>
 <fcdd83addcd9af159a0bebf2a14543168bd59a07.1706854074.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcdd83addcd9af159a0bebf2a14543168bd59a07.1706854074.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092428_481774_15359024 
X-CRM114-Status: GOOD (  15.29  )
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

On Fri, Feb 02, 2024 at 02:42:02PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the gate clocks of RP subsystem for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/clock/sophgo,sg2042-rpgate.yaml  | 37 ++++++++++++
>  .../dt-bindings/clock/sophgo,sg2042-rpgate.h  | 58 +++++++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
> new file mode 100644
> index 000000000000..69ce3a64f66c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/sophgo,sg2042-rpgate.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 Gate Clock Generator for RP(riscv processors) subsystem
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-rpgate
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/sophgo,sg2042-rpgate.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@10000000 {
> +      compatible = "sophgo,sg2042-rpgate";
> +      reg = <0x10000000 0x10000>;
> +      #clock-cells = <1>;

No input clocks?

> +    };
> diff --git a/include/dt-bindings/clock/sophgo,sg2042-rpgate.h b/include/dt-bindings/clock/sophgo,sg2042-rpgate.h
> new file mode 100644
> index 000000000000..8b4522d5f559
> --- /dev/null
> +++ b/include/dt-bindings/clock/sophgo,sg2042-rpgate.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_SOPHGO_SG2042_RPGATE_H__
> +#define __DT_BINDINGS_SOPHGO_SG2042_RPGATE_H__
> +
> +#define GATE_CLK_RXU0			0
> +#define GATE_CLK_RXU1			1
> +#define GATE_CLK_RXU2			2
> +#define GATE_CLK_RXU3			3
> +#define GATE_CLK_RXU4			4
> +#define GATE_CLK_RXU5			5
> +#define GATE_CLK_RXU6			6
> +#define GATE_CLK_RXU7			7
> +#define GATE_CLK_RXU8			8
> +#define GATE_CLK_RXU9			9
> +#define GATE_CLK_RXU10			10
> +#define GATE_CLK_RXU11			11
> +#define GATE_CLK_RXU12			12
> +#define GATE_CLK_RXU13			13
> +#define GATE_CLK_RXU14			14
> +#define GATE_CLK_RXU15			15
> +#define GATE_CLK_RXU16			16
> +#define GATE_CLK_RXU17			17
> +#define GATE_CLK_RXU18			18
> +#define GATE_CLK_RXU19			19
> +#define GATE_CLK_RXU20			20
> +#define GATE_CLK_RXU21			21
> +#define GATE_CLK_RXU22			22
> +#define GATE_CLK_RXU23			23
> +#define GATE_CLK_RXU24			24
> +#define GATE_CLK_RXU25			25
> +#define GATE_CLK_RXU26			26
> +#define GATE_CLK_RXU27			27
> +#define GATE_CLK_RXU28			28
> +#define GATE_CLK_RXU29			29
> +#define GATE_CLK_RXU30			30
> +#define GATE_CLK_RXU31			31
> +#define GATE_CLK_MP0			32
> +#define GATE_CLK_MP1			33
> +#define GATE_CLK_MP2			34
> +#define GATE_CLK_MP3			35
> +#define GATE_CLK_MP4			36
> +#define GATE_CLK_MP5			37
> +#define GATE_CLK_MP6			38
> +#define GATE_CLK_MP7			39
> +#define GATE_CLK_MP8			40
> +#define GATE_CLK_MP9			41
> +#define GATE_CLK_MP10			42
> +#define GATE_CLK_MP11			43
> +#define GATE_CLK_MP12			44
> +#define GATE_CLK_MP13			45
> +#define GATE_CLK_MP14			46
> +#define GATE_CLK_MP15			47
> +
> +#endif /* __DT_BINDINGS_SOPHGO_SG2042_RPGATE_H__ */
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
