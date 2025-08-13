Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EADCA0EE0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 00:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OZM00PZWifZWpZKcFb4yG6XZNzdYxrhSi50j8SYRPw=; b=ZccGg4VrBQDqsk
	N05p4rR6kZEZe9er0UWn1rj+b2TSyjfsSJPKFKNUzTrRD9M/2FRZFEJRlLQsrZyodL2RDZJhbBjg/
	AfhF8l4VsfU1j1HxaDsXdyGow89xLmrA2JEbBHOTHoQH6pIjRE2qv9rYAbFMtgZ+qmsw0XUtzagFs
	i/G71+712IVBH4r6HAbCAdk30X1Sp5o1VGDIm3RKR0U9MDpsmYM6RR3IHsTeHnct7pHIMH9JYk6qX
	OcpxY3M/jdgCY6z5Dwit/SFJfTISSPlP+BH4b9U1C1/Qetq/2/uegjhYwPACrNYeXFXZuMMdBZHxY
	O2LPPG3IUXhEcB4Moiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umLdm-0000000FOsP-0TUk;
	Thu, 14 Aug 2025 00:16:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGWi-0000000EjgB-3MJp
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 18:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 901AF601EF;
	Wed, 13 Aug 2025 18:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DA4C4CEEB;
	Wed, 13 Aug 2025 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755110923;
	bh=h9+TOUuSmuwiGeeFq/t+i5nPgsw7wfFmCtzB/voaBMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZlohB5ixOlaz45evaXnl7qDy32fDEOZ6BGbTSFAhliWdtw+dZVDpifkSuuPhDxJe
	 qE79KLFwqPMsz/kEyNXXYVLKpdGbpvayf3zBw2YGtzhQFc6od2+os7ZR2eBNfGTwDJ
	 na5LyNI6j3CJw+NUGqoK4nAsWBAmwRoUuW78MxkzKT5OnVNPo7swvjGlQ8i49M0wgG
	 lcCEPQ8qrjCWoLfwcycPTKi6gjkiS+1BZejCq4nNlwOUlpr55JdRdgsM93vk3jHzMC
	 gSQ/5iCyG5+2TAmkgqM33xcPgOp+/KWxvPl+qAhlnYirYAAhGE4KSoYPszSX7ne3S1
	 nxjTiH7GJV3Qg==
Date: Wed, 13 Aug 2025 11:48:41 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH] reset: thead: Scope TH1520 reset driver to VO subsystem
Message-ID: <aJzeCbARIRltiYE1@x1>
References: <CGME20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6@eucas1p1.samsung.com>
 <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
 <aJrTq775sXTrsepl@x1>
 <aJxGnnwlE1sWarXa@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJxGnnwlE1sWarXa@pie>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 13, 2025 at 08:04:40AM +0000, Yao Zi wrote:
> On Mon, Aug 11, 2025 at 10:39:55PM -0700, Drew Fustini wrote:
> > On Sun, Aug 10, 2025 at 11:14:19PM +0200, Michal Wilczynski wrote:
> > > The reset controller driver for the TH1520 was using the generic
> > > compatible string "thead,th1520-reset". However, the current
> > > implementation only manages the resets for the Video Output (VO)
> > > subsystem.
> > 
> > Looking at Section 5.4 on Page 451 of the TH1520 System User Manual [1],
> > it does seem like we would ultimately need 6 separate nodes for reset
> > controllers:
> 
> Yes, this is true. And another six nodes for clock controllers (there's
> already one).
> 
> >  0xFF_EF01_4000: AP_SUBSYS
> >  0xFF_EC02_C000: MISC_SUBSYS
> >  0xFF_E404_0000: VI_SUBSYS
> >  0xFF_EF52_8000: VO_SUBSYS
> >  0xFF_ECC3_0000: VP_SUBSYS
> >  0xFF_EF04_0000: DSP_SUBSYS
> > 
> > Maybe we should take this opportunity to document the bindings for all
> > the resets that the REE (e.g. Linux) can control?
> 
> It's worth noting that with either mainline U-Boot or vendor U-Boot, no
> core is configured to run as REE. IOW, AON_SUBSYS could be accessed by
> AP cores as well.

Interesting, I didn't know that the AP cores could access TEE resources.
> 
> I think introducing read-only clock support to Linux could help us to
> correctly describe pvt clocks which are now replaced with a aonsys
> placeholder and resolve issues like what is described in 0370395d45ca
> ("clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED").
> 
> Futhermore, there may be downstream projects, e.g. U-Boot, make use of
> these TEE-only devices, which could benefit if we have these devices
> documented and described in devicetree, too. Thus I think the AON clock
> and reset controllers should be documented as well if we're going to
> document every reset/clock controller in a batch.

I think that does make sense to document the AONSYS clock and reset
controllers in the DT bindings as they are part of the hardware and
described in the t-head documentation. It would be great to be able to
make use of more functionality in the t-head sdk like the ability to
reboot the board.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
