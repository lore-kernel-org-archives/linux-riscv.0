Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45134E81E03
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v00afiIz+hquYgQlo9wyJ0TIbCIaxCakBCWEbbqeVQs=; b=04WJKx7c60uHEZ
	piJ+EklQZ9JPFPNJV0SawvMYFSh2wDYl+6Mp6Ukezwh4xwJLUnV5lwnk661dAMgHYOLMQeJQNeHcF
	JsrcVx/XWjfqDtLBIAdE2b3g/mlyTb3dzw1vHx/bn2DEZvE2CWzXPPX1QiLHe+J8zGveSERJSRq0u
	9PBa+xO9MP4ewOFIUtZtTqSHTmfgf967JGtKGElze5WuQss1MLOenNBOWad0g8LZKvJ1PQcaGBaEP
	h6ijPL0u6Qn3TwvX9j8qjXsWssMnwhH7ACpG3jU0oV3fmB3NHC6y2vNONXpwjFB72pQaTTiVN3tO9
	ml2pOpo20RXizq2BimKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qom8Y-00613g-0v;
	Fri, 06 Oct 2023 14:49:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qom8U-00612f-15
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 14:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D44060EF8;
	Fri,  6 Oct 2023 14:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0605AC433C7;
	Fri,  6 Oct 2023 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696603741;
	bh=umqG2Vr+mTf5yJgKR+T2964HJLMvzddkT3m/kr/44mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c73mGCajUXAGcjUUoGTiOHC+FjsVgS0OAbOlyqoMLosKXDk/FTXTkpFhXgii7DRFP
	 d9N7Td4bdhVXhZA7nqL3wxxmq/9crn2J9M5hsuF4ebVWpxa/+hCke6FZxjy9ZPF7Qi
	 VcYhKMEARDV5ppl9gxb0T4v5t3XvDh7cXEvfMT5B40Jkttm4hLcAXJujVRaSJTQVnT
	 yWncdZq92rhlt1i1d5HoE2opBDHYIJtGfZ4nL4hYq8pd469CgGcog/Xv0dmM+18MXe
	 4OkZA1iFybkUIs0eLRZSJ7i4hgXkm2Sf8K2Ec2BqBojgYiJ7l54vUymadadqYx00Y0
	 EpSd2iDGr5k3g==
Date: Fri, 6 Oct 2023 22:36:51 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
	devicetree@vger.kernel.org, guoren@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v4 08/10] riscv: dts: add initial Sophgo SG2042 SoC
 device tree
Message-ID: <ZSAbgxZItMsEHfio@xhacker>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
 <ce56aba64ccd237e5d9248b9b9ed937ffb8894c8.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce56aba64ccd237e5d9248b9b9ed937ffb8894c8.1696433229.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_074902_469503_8588AE7C 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, Oct 04, 2023 at 11:44:06PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Milk-V Pioneer motherboard is powered by SG2042.
> 
> SG2042 is server grade chip with high performance, low power
> consumption and high data throughput.
> Key features:
> - 64 RISC-V cpu cores
> - 4 cores per cluster, 16 clusters on chip
> - More info is available at [1].
> 
> Currently only support booting into console with only uart,
> other features will be added soon later.
> 
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Acked-by: Chao Wei <chao.wei@sophgo.com>
> Co-developed-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Co-developed-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> 
> Link: https://en.sophgo.com/product/introduce/sg2042.html [1]
> ---
>  MAINTAINERS                                 |    1 +
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 2000 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi      |  325 +++
>  3 files changed, 2326 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 97cb8abcfeee..fedf042e5fb4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20067,6 +20067,7 @@ SOPHGO DEVICETREES
>  M:	Chao Wei <chao.wei@sophgo.com>
>  M:	Chen Wang <unicorn_wang@outlook.com>
>  S:	Maintained
> +F:	arch/riscv/boot/dts/sophgo/
>  F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
>  
>  SOUND
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> new file mode 100644
> index 000000000000..b136b6c4128c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -0,0 +1,2000 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
> + */
...

> +		intc: interrupt-controller@7090000000 {
> +			compatible = "sophgo,sg2042-plic", "thead,c900-plic";
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			reg = <0x00000070 0x90000000 0x00000000 0x04000000>;
> +			interrupt-controller;
> +			interrupts-extended =
> +				<&cpu0_intc 0xffffffff>,  <&cpu0_intc 9>,

-1 may not be correct, is machine external interrupt(id: 11) supported?

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
