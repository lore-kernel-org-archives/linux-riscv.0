Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D72EC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqD85WDAcY8uCWp7yboJ41oRJG+agwO1NyeYkdRsx+M=; b=c/K/WW2z4U++/K
	LBzgJPe5dKdlEn7D/hT6/CemKeexgbGTR2yZkWj5P87ayyQ1M87UCLtcxm9bkZOGBepR0Y1B7q8Jl
	2UTKFkOH+AoSnWaiJkm7WCTue+mSb6yblmCmOhTVDUOftEkjpkVreOKZdECSmYUkjEQUGI9ALU9VR
	nLM0E5Z+ZqwsAnZymzN/8acFRrIFQC70/jikYqa4gy2RaHcbxjP1tBywCEq76S+gBnmnqcdlb8olb
	b37YiheC0ub0FpKmKcDN2OQAI8YRqhGfZx3YOhzxrT2eMvdyqqzJ1UnHmBSkg1Ndt0dVbbKhqkHe7
	vUiISnl6RxgSMwrd/Pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XzZ-00E9HU-1R;
	Mon, 13 Nov 2023 14:32:45 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XzW-00E9Gg-2c
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 14:32:44 +0000
Date: Mon, 13 Nov 2023 14:32:24 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset dt node for cv1800b
Message-ID: <20231113143224.GA130254@ofsar>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113005503.2423-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_063242_878623_CE386FE4 
X-CRM114-Status: GOOD (  15.01  )
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

Hi Jisheng:

On 08:55 Mon 13 Nov     , Jisheng Zhang wrote:
> Add the reset device tree node to cv1800b SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index df40e87ee063..4032419486be 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -54,6 +54,12 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		rst: reset-controller@3003000 {
> +			compatible = "sophgo,cv1800b-reset";
> +			reg = <0x03003000 0x1000>;
                                          ~~~~~~~
			        it should be 0x28

while please also note the 0x24 == SOFT_CPUAC_RSTN, does not compatible
with the reset-simple driver, but as it's not implemented nor used in this driver,
so we should be fine with this?

> +			#reset-cells = <1>;
> +		};
> +
>  		uart0: serial@4140000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x04140000 0x100>;
> -- 
> 2.42.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
