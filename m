Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07344C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Scv5ZxnXPdOZ4SVl3ZhQLQSdEBMEH0Tmb96YVx+GH7w=; b=2vxorB5vCjhbhR
	a8U03lRoYLSoobw24KrfKCe1KF88X4MpOJc8HUUM0baii0U94lCNPez0r9Bc8QpAVJ5408R/rj8Ia
	21UjXyR1KbVwnAaOtjLHtkfmwtyfV09W0u63u0W0ULcLOaEPPgSxuA5tYqdpWRVmrFkbAns0C64I3
	s4PJTt+vp0WfLaKl07jrWAEtFYB11ORg+VBSF8SnFRc9fKveWsVuSPfuQ+v06fApYq+vb+JF16XgD
	ifLDw3APG0J5CKDxfPIrKYoGdwUGarURqvSsiSrqKdn1o8erLlIBRvepSv9wL+Hjim2fWOyOJ7YZR
	LdGZWcFYd1b5VBraOVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YqP-00EEsH-1u;
	Mon, 13 Nov 2023 15:27:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YqN-00EEr5-11
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 15:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 600ABCE138F;
	Mon, 13 Nov 2023 15:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35813C433C8;
	Mon, 13 Nov 2023 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699889236;
	bh=DRPBcEhQyl5dBAyB3ocbVXLLrdNG2CNj1hnyQAWHnHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYHatumpK1ANV48WUwMjoE3E52AEZimGacsM7qM5CtMdYWnLpO64MElZyeVRny1Ts
	 dgte0Jjd2mztihTSm7cR8QfDZClb0X/qCPxHlGx8l3qCqJGb0a0EYvCyNC46vAPK9x
	 1bvAJw7FdItWQ7rhdRpJw6TmVJ0DQdNiwBAbIj+Dx86gLuAdO4/nYT94nPU+qK1gpi
	 n6PZ1irGbhIuqIYwnsM5WPYnw/PY2zCDBKputfvI+H/z1XzN9Bf/J54GAV/EivZpJj
	 tEdCeYgBKvcIJ2ldwk9VjM56jhan8eGRy194Bh1yFTyWepLP1oTxBHwhfIsMg3h/iT
	 ukM7SpElUSf5A==
Date: Mon, 13 Nov 2023 23:14:55 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
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
Message-ID: <ZVI9bzAhPnHhVg8A@xhacker>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-4-jszhang@kernel.org>
 <20231113143224.GA130254@ofsar>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113143224.GA130254@ofsar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_072719_534362_BE9E14EA 
X-CRM114-Status: GOOD (  20.82  )
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

On Mon, Nov 13, 2023 at 02:32:24PM +0000, Yixun Lan wrote:
> Hi Jisheng:

Hi

> 
> On 08:55 Mon 13 Nov     , Jisheng Zhang wrote:
> > Add the reset device tree node to cv1800b SoC.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > index df40e87ee063..4032419486be 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -54,6 +54,12 @@ soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		rst: reset-controller@3003000 {
> > +			compatible = "sophgo,cv1800b-reset";
> > +			reg = <0x03003000 0x1000>;
>                                           ~~~~~~~
> 			        it should be 0x28

The reg space is 4KB, but only 0x28 are used. I think 0x1000 or 0x28 are fine
since the ioremap granule is 4kB.
> 
> while please also note the 0x24 == SOFT_CPUAC_RSTN, does not compatible
> with the reset-simple driver, but as it's not implemented nor used in this driver,

But the functionality of this "autoclear" reg isn't used at all since we also
have "sticky" reset to acchieve the same feature, I.E reset cpusys. And in the
usage case of reseting cpusys, I believe "sticky" reset is preferred.

And except the cpusys reset which has both autoclear and sticky, other
resets are sticky only. I'm not sure whether it's worth to write a new
driver for almost useless feature.

> so we should be fine with this?
> 
> > +			#reset-cells = <1>;
> > +		};
> > +
> >  		uart0: serial@4140000 {
> >  			compatible = "snps,dw-apb-uart";
> >  			reg = <0x04140000 0x100>;
> > -- 
> > 2.42.0
> > 
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
