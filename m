Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082D9C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 06:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2OwVhAEEGRxrk2plfc5W+nT+hT8987ygJyTTVdlE5A=; b=hCzEQ/cgh3xq+n
	Ew3DD/BchB31poxrbyTPzjIft3xxbvpjhJpecIWjWBEVLMfZlyUC5WXk00uis9ZqQgZjmaX2hyXKe
	5mhpwtETT2eALcD5HuYztpxghOYhvqyEU3syfSz+YtndQLxC3B1YNhSen60XXVjJePGoHem/+/AsA
	CQpLo/NHwUMKxOQGX7b1r+kwQ6twZSl1pP7dhx/HNbIbcOBgCbOMaGtnV+VBWFhn3/es0CqExUqow
	3zdnP+4t7UUgUwmwpbRaIN9QrihMJo1PovH5L8+y91P6SqHitn2sJ1xqMt/bmJnT6DrO7Fh5gaKR/
	3ao5k4ck1KpV4BDRGgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuTh-0000000HRFS-1zAe;
	Thu, 08 May 2025 06:11:29 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuSg-0000000HR8E-1uOS
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 06:10:27 +0000
Received: from localhost (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BBFE9343097;
	Thu, 08 May 2025 06:10:22 +0000 (UTC)
Date: Thu, 8 May 2025 06:10:12 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v8 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT
 K1
Message-ID: <20250508061012-GYB505240@gentoo>
References: <20250416135406.16284-1-heylenay@4d2.org>
 <20250416135406.16284-6-heylenay@4d2.org>
 <aBxF81yqPgHP5oA_@ketchup>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aBxF81yqPgHP5oA_@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_231026_525293_822F9041 
X-CRM114-Status: GOOD (  21.81  )
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

Hi Haylen,

On 05:49 Thu 08 May     , Haylen Chu wrote:
> Hi Yixun,
> 
> On Wed, Apr 16, 2025 at 01:54:05PM +0000, Haylen Chu wrote:
> > Describe the PLL and system controllers that're capable of generating
> > clock signals in the devicetree.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index c670ebf8fa12..584f0dbc60f5 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> 
> I found that I forgot to make the nodenames of syscons consistent:
> both "system-control" and "system-controller" are used, and pll should
> be named as "clock-controller" instead.
> 
> Could you please drop the SoC devicetree patch then I could rework on
> it and correct the mistake? 
Sure, I can drop previous DT patch, and re-apply, thanks

> Or I could follow up a clean up patch if
> dropping isn't easy or doesn't follow the convention.
> 
> Thanks for your work,
> Haylen Chu
> 
> > @@ -314,6 +346,17 @@ soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		syscon_apbc: system-control@d4015000 {
> > +			compatible = "spacemit,k1-syscon-apbc";
> > +			reg = <0x0 0xd4015000 0x0 0x1000>;
> > +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> > +				 <&vctcxo_24m>;
> > +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> > +				      "vctcxo_24m";
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >  		uart0: serial@d4017000 {
> >  			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> >  			reg = <0x0 0xd4017000 0x0 0x100>;
> > @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
> >  			reg = <0x0 0xd401e000 0x0 0x400>;
> >  		};
> >  
> > +		syscon_mpmu: system-controller@d4050000 {
> > +			compatible = "spacemit,k1-syscon-mpmu";
> > +			reg = <0x0 0xd4050000 0x0 0x209c>;
> > +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> > +				 <&vctcxo_24m>;
> > +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> > +				      "vctcxo_24m";
> > +			#clock-cells = <1>;
> > +			#power-domain-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> > +		pll: system-control@d4090000 {
> > +			compatible = "spacemit,k1-pll";
> > +			reg = <0x0 0xd4090000 0x0 0x1000>;
> > +			clocks = <&vctcxo_24m>;
> > +			spacemit,mpmu = <&syscon_mpmu>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		syscon_apmu: system-control@d4282800 {
> > +			compatible = "spacemit,k1-syscon-apmu";
> > +			reg = <0x0 0xd4282800 0x0 0x400>;
> > +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> > +				 <&vctcxo_24m>;
> > +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> > +				      "vctcxo_24m";
> > +			#clock-cells = <1>;
> > +			#power-domain-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >  		plic: interrupt-controller@e0000000 {
> >  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
> >  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> > -- 
> > 2.49.0
> > 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
