Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD56FC44529
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 18:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjYxZz7FNvOpNwuTErn85gqKp82jnI366UbCrmpP+so=; b=H7/3AdcXYRtEtA
	Q8y+qilpQq+7JmQlt0JsrRpT0B71DZOMVaxr2KwwvIAcrtWs8gjeQHvK0RU6wmTY1waiMIkxM0TS+
	73Vo6eAmGizCbEPTiyR9j+2O1CAxuOtMIvL96y6uKqVVFwobrT0bvaHPDOiQfzvTiw8F41JyIkZIV
	ShaaRUGprndE5qwMn9DY/WKNNfvjOB8E0PqdlhogO82TE9BKpLWT8jxHxi8WcENN2FjRUBcQ82izC
	/nHZMMe1LFbNUtmsbqZJo6lp71h4PvyWevlifvOIM5eSXC2oJiGyozevxUOBWs8ibPMtLpeGWXIqZ
	VHqCPS5sMRHV9SexhuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsgX-00000007dsV-1suW;
	Mon, 20 Jul 2026 18:25:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsgW-00000007dsN-04aA
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 18:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ECA760051;
	Mon, 20 Jul 2026 18:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A4C1F000E9;
	Mon, 20 Jul 2026 18:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784571946;
	bh=8dn3DGV/HSINz76pb6geCJZCEdVzeK4RpPwE7ezZEAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8DJaNg9n7n/XnuT1qRB1HSjKGmHl/cuwxU+AP73mi43T6zAV+jWxIBO6MeEbJoD1
	 rgrDHpyw1XlYTOhtLJQUXjx1VcEvykk3ZHe51pp1oRnCX5aVs0He0PGfCnqKBI5J+a
	 V+Dn5tig2sGxY2dGOAOiakUBdpu8Vme6ZWO+kNXexhq3MSrqFWSiX2yz3j3WgIOU5C
	 ii6TXsDYuPA2rsrTI2qCudDYVBPJWM5RgUsp7erY3zw3QqZwX2jBQOzNFl1Vw+Kots
	 VHjdembM3EwboHD+giCGuS9FvuxrzC7Hg36Gi66W7cAsPuxD64hdo3cFLdkwgCV9H/
	 rfpT0UVWAUULA==
Date: Mon, 20 Jul 2026 11:25:45 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 1/5] riscv: dts: thead: th1520: remove pclk for I2C1
Message-ID: <al5oKdC22LIlLbSm@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-2-zhengxingda@iscas.ac.cn>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, MoeLeak <i@leak.moe>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2026 at 03:45:11PM +0800, Icenowy Zheng wrote:
> The I2C1 node added previously to the th1520.dtsi file has two clocks
> set -- one "ref" clock (CLK_I2C1) and one "pclk" (CLK_PERI_APB_PCLK).
> 
> However, the CLK_I2C1 clock is just a clock gate with the
> CLK_PERI_APB_PCLK clock as its input. In addition, when it's gated,
> reading registers from the I2C controller returns fixed value (the last
> read value) for all registers. These facts indicate that the CLK_I2C1
> clock is the true APB clock fed into the I2C controller instead of a
> dedicated reference clock.
> 
> Leave only the CLK_I2C1 clock as the `clocks` property of the I2C1
> device node and remove `clock-names` property, which represents the I2C
> controller only takes a single clock both as the APB clock and the
> reference clock.
> 
> Fixes: 2f60e3516330 ("riscv: dts: thead: Add TH1520 I2C1 controller")
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 94932c51b7e39..db23624696b73 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -415,8 +415,7 @@ i2c1: i2c@ffe7f24000 {
>  			compatible = "thead,th1520-i2c", "snps,designware-i2c";
>  			reg = <0xff 0xe7f24000 0x0 0x4000>;
>  			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_I2C1>, <&clk CLK_PERI_APB_PCLK>;
> -			clock-names = "ref", "pclk";
> +			clocks = <&clk CLK_I2C1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			status = "disabled";
> -- 
> 2.52.0

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
