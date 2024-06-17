Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAE0C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T01tEYzzv6s5qaMKHFUkkn5aJO4Lg/e+hThtFWCeBek=; b=13k3X2mGwt4Cpw
	qwbeNQOL+tSOmZvYqZksCmRP4PjKyXiqiXTTiDqcBpIH/NtAL8HhbR3NMUwOyfTN/GNvN+YEsFndS
	iVU8uIy7Yi2RM+f3poSY6zDXvEo5sM/UbnmPhRDGtNfSE5ZM+mGKl1EMwhhhTnfazMcY5+dQb4ztT
	dNA94+8sgrWX5vbyA+yc7WY8k7PqbaO/2JYWmPzHhcj9vuBTyU79BtaFKxrjESZw1vYu7LoYgUURI
	XcANy+nJCQ5EECHiz7KjTBF6aDPb60mFTyosiu9QBGPf6Tl2GTEF1Jbvy2gIeOtGOzZQAyFYYc6Hv
	ld6wucbxNsreO8uc7LoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCRX-0000000ArQr-45ZS;
	Mon, 17 Jun 2024 13:30:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCRV-0000000ArQH-2vpw
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD34160DDB;
	Mon, 17 Jun 2024 13:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D209EC2BD10;
	Mon, 17 Jun 2024 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718631040;
	bh=K1d1FkkEzlQ/UT9ihqbOKIjtW36wnnFLcT/ZvMOVYFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhTGVFmwyz+fliyEfsQwaIqR+ib5wkuWod8Xw3Xd/q/GBJP141ALpYUx3SINa51Sj
	 fogpyLoW6Mi5ApaXiy6PxD5l4ilE7gQ46/LwMOO/4sxJnrAsOnBRcZF6xEYFNr5mVi
	 DIVXZkX8BYLy8ikwhnkKsXFH8VteP+w/QZlyFN6XjzktWaT29cfOUoPewHiSfHgdlX
	 w+N29UD7JhPaXjW8lmBpIRsYlzfyeQV85MizgwCneZIgUtURBMmUYPW5JUdBnBpDUi
	 wnzapWZrPwOUszAFMV4zm8tL3FUcPJBCljoHV5+me/19eQw+vLWS7SjwREOgYujxaY
	 sWoEv1U4NZp9A==
Date: Mon, 17 Jun 2024 21:16:43 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] riscv: dts: sophgo: Put sdhci compatible in dt of
 specific SoC
Message-ID: <ZnA3O14HOiV1SBPV@xhacker>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
 <IA1PR20MB49534C9E29E86B478205E4B3BBC02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240616235829.GA4000183@ofsar>
 <c75601a1-1389-400e-90b9-99c1e775a866@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c75601a1-1389-400e-90b9-99c1e775a866@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_063041_894490_C8E9B19E 
X-CRM114-Status: GOOD (  39.65  )
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

On Mon, Jun 17, 2024 at 11:16:32AM +0200, Thomas Bonnefille wrote:
> 
> 
> On 6/17/24 1:58 AM, Yixun Lan wrote:
> > Hi
> > 
> > On 18:47 Wed 12 Jun     , Inochi Amaoto wrote:
> > > On Wed, Jun 12, 2024 at 10:02:31AM GMT, Thomas Bonnefille wrote:
> > > > Remove SDHCI compatible for CV1800b from common dtsi file to put it in
> > > > the specific dtsi file of the CV1800b.
> > > > This commits aims at following the same guidelines as in the other nodes
> > > > of the CV18XX family.
> > is there any URL of guideline? or did I miss anything
> > couldn't find any discussion about this in v1
> > 
> 
> Not explicitly, the fact is that I had to use a specific compatible on
> SG2002 for the sdhci (it is already defined mainline), I had to choose
> between :
> 
> 1. cv18xx.dtsi : compatible cv1800b-dwcmshc
>    cv1800b.dtsi : no redefined compatible
>    sg2002.dtsi : overwrite the previous compatible to use sg2002-dwcmshc
> 
> 2. cv18xx.dtsi : no compatible
>    cv1800b.dtsi : compatible for cv1800b-dwcmshc
>    sg2002.dtsi : compatible for sg2002-dwcmshc
> 
> As in the plic and clint controllers, the second option was chosen I
> consider this as a "guideline" and reformat the dtsis accordingly.
> 
> > > > 
> > > > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > > > ---
> > > >   arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 4 ++++
> > > >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 1 -
> > > >   2 files changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > index ec9530972ae2..b9cd51457b4c 100644
> > > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > @@ -25,3 +25,7 @@ &clint {
> > > >   &clk {
> > > >   	compatible = "sophgo,cv1800-clk";
> > > >   };
> > > > +
> > > > +&sdhci0 {
> > > > +	compatible = "sophgo,cv1800b-dwcmshc";
> > > > +};
> > > > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > > > index 891932ae470f..7247c7c3013c 100644
> > > > --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > > > @@ -288,7 +288,6 @@ uart4: serial@41c0000 {
> > > >   		};
> > > >   		sdhci0: mmc@4310000 {
> > > > -			compatible = "sophgo,cv1800b-dwcmshc";
> > > >   			reg = <0x4310000 0x1000>;
> > > >   			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
> > > >   			clocks = <&clk CLK_AXI4_SD0>,
> > > > 
> > > > -- 
> > > > 2.45.2
> > > > 
> > > 
> > > Hi, Jisheng,
> > > 
> > > Is this change necessary? IIRC, the sdhci is the same across
> > > the whole series.

Hi,

sorry for being late, I was busy in the past 2.5 month. Per my
understanding, the sdhci in cv1800b is the same as the one in
sg200x. Maybe I'm wrong, but this was my impression when I cooked
the sdhci driver patch for these SoCs.

> > I tend to agree with Inochi here, if it's same across all SoC, then no bother to
> > split, it will cause more trouble to maintain..
> > 
> 
> To be honest, I agree with this to, but as a specific compatible for the
> SG2002 was created in commit 849e81817b9b, I thought that the best practice
> was to use it.

I'd like to take this chance to query DT maintainers: FWICT, in the past
even if the PLIC is the same between SoCs, adding a new compatible for
them seems a must. So when time goes on, the compatbile list would be
longer and longer, is it really necessary? Can we just use the existing
compatible string?
DT maintainers may answered the query in the past, if so, sorry for
querying again.

> 
> > > 
> > > Regards,
> > > Inochi
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
