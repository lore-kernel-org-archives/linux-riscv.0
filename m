Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECEDC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 04:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hF6C6av/M5X5On5sBjMcrSim4AdHe2f8uRUIeKsGLuE=; b=WnzlbQT6YK/y0e
	36cqcEU9zRhEbsU4er7hcoRHtK33+AwBkJyvdeMXni/5sUFttGQjtDbMBIsdpi26vjpbVsweqaDUf
	4EMx8Ly6feY/j7dxhFyOzz70WNuxYuF6pFSVVISJ373r0SA0IzhqLJxV7jFbOO7Zb8JMZ8OEA7VtG
	Dz7piZuZ1PYXKhuCtXp/z7MFCeEmRi6sBtSPgTquKNVQ6enTup+HW2KhvZiQaE1jTRTcyS5Ngj+Ix
	YN8DOCram8phd59YXoaceqyKdU9pHAbdVFleg9GBlbwhikDy9nqd7gkr3ev5Sx0nJFCXXuY7H3VoM
	NkuMOVksz9hCgXd9P1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQY0-0000000DZCK-1b48;
	Tue, 18 Jun 2024 04:34:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQXx-0000000DZAr-05XR
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 04:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F77D6144B;
	Tue, 18 Jun 2024 04:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812B6C3277B;
	Tue, 18 Jun 2024 04:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718685255;
	bh=cVWaqdmlVB3MhB8ZS2KfEGlzyVZFQobqyrEiIiYPoSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTi7MVJlvd3DqJpnKOKwG1xNN9+M3Gsd6MebltbzdgYOGnNyiv6Qeq+xhqfRbROut
	 SMeCl95OGHDBKyeXsKqzjZiu8nRdzT8VF3nwmPVGyANifUQ4IVXBEyLiZbRBuA+r0p
	 kkJXl0ojinTkXRpSpsx3wYcxcPeHcuHbPZKbHXToNiDVwXn/Rz1XfUQPLNhFqQRota
	 Ji/Wh9lpLMGRuNhNmj0DSutuZbOngGorasQOGUjC3tgjSPUjrrJ+nW6aPnlpo7rFMl
	 BobHJwR5iAtT1Vvtyk20SeGII31d7mB1TqYIv6xVcD0QEwS+Lp2lQuDtie5Zzz8Zc+
	 WZdChbx6OiHBA==
Date: Tue, 18 Jun 2024 12:20:13 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/6] riscv: dts: sophgo: Put sdhci compatible in dt of
 specific SoC
Message-ID: <ZnEK_cg1xLbKOUAD@xhacker>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
 <IA1PR20MB49534C9E29E86B478205E4B3BBC02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240616235829.GA4000183@ofsar>
 <c75601a1-1389-400e-90b9-99c1e775a866@bootlin.com>
 <ZnA3O14HOiV1SBPV@xhacker>
 <20240617-exuberant-protegee-f7d414f0976d@spud>
 <6a993b58-3d9e-4f92-bf47-7692c9639314@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a993b58-3d9e-4f92-bf47-7692c9639314@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_213417_211320_EA2BA7E2 
X-CRM114-Status: GOOD (  36.16  )
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

On Mon, Jun 17, 2024 at 10:57:54AM -0500, Samuel Holland wrote:
> Hi Jisheng, Thomas,
> 
> On 2024-06-17 10:40 AM, Conor Dooley wrote:
> > On Mon, Jun 17, 2024 at 09:16:43PM +0800, Jisheng Zhang wrote:
> >> On Mon, Jun 17, 2024 at 11:16:32AM +0200, Thomas Bonnefille wrote:
> >>> On 6/17/24 1:58 AM, Yixun Lan wrote:
> >>>> On 18:47 Wed 12 Jun     , Inochi Amaoto wrote:
> > 
> >>>>> Is this change necessary? IIRC, the sdhci is the same across
> >>>>> the whole series.
> > 
> >> sorry for being late, I was busy in the past 2.5 month. Per my
> >> understanding, the sdhci in cv1800b is the same as the one in
> >> sg200x. Maybe I'm wrong, but this was my impression when I cooked
> >> the sdhci driver patch for these SoCs.
> >>
> >>>> I tend to agree with Inochi here, if it's same across all SoC, then no bother to
> >>>> split, it will cause more trouble to maintain..
> >>>>
> >>>
> >>> To be honest, I agree with this to, but as a specific compatible for the
> >>> SG2002 was created in commit 849e81817b9b, I thought that the best practice
> >>> was to use it.
> >>
> >> I'd like to take this chance to query DT maintainers: FWICT, in the past
> >> even if the PLIC is the same between SoCs, adding a new compatible for
> >> them seems a must. So when time goes on, the compatbile list would be
> >> longer and longer, is it really necessary? Can we just use the existing
> >> compatible string?
> >> DT maintainers may answered the query in the past, if so, sorry for
> >> querying again.
> > 
> > For new integrations of an IP, yes, new specific compatibles please. New
> > integrations may have different bugs etc, even if the IP itself is the
> > same. If there's different SoCs that are the same die, but with elements
> > fused off, then sure, use the same compatible.
> > 
> > I expect the list of compatibles in the binding to grow rather large, but
> > that is fine. No one SoC is going to do anything other than something like
> > compatible = "renesas,$soc-plic", "andestech,corecomplex-plic", "riscv,plic";
> > which I think is perfectly fine.
> 
> And you can do the same thing here for the SDHCI controller: if you think sg200x
> has the same controller (and integration! e.g. number of clocks/resets) as
> cv1800b, then you should keep sophgo,cv1800b-dwcmshc as a fallback compatible
> string. Then the driver doesn't need any changes until/unless you eventually
> find some reason they are not compatible.
> 
> It's better to have a SoC-specific compatible string in the DT and not need it,
> than find out later you need one and not have it. :)

Good idea, this solution looks better! Thanks for the suggestion

> 
> Regards,
> Samuel
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
