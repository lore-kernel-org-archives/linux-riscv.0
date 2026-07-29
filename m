Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED67C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxPLhstx050hkI7zRvemq4dzIHBAFFcrped5MdN2tYA=; b=AzaZnX4n5jBv5S
	NgkuQCZLKl+T0ph4pVb8UDD7AZ4chmQkpolQRruoJpbzoAPVViTPc6gOmPg8rhwat2rxqNWPLi6Jx
	TyCfixmZYwKplVV0r1alvQ22AEkfF1Ee2Eywk8lplD+v5FdNAYnt9PGv5jilQnJj8MGkvEuuZ/O5Y
	BkYCoKmGG/Ly6YLiatdLoAAhrwPv1L/L2dO4jYj8qHg6G7ZNMxhLNOBP5lNDip6ZMRh6jXnxRVWc6
	wU5rXoP2kECvt0jH9oLGM7C8JXaxMhAvEOKITWq1hiIk3he/kXtKPoBbmodTgrWh9yeqc6iz1Ov9v
	0oSLh/eaiTxQfkKph8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0zh-00000007RSj-0kYB;
	Wed, 29 Jul 2026 09:54:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0zg-00000007RSb-1Da6
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 09:54:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 106274374C;
	Wed, 29 Jul 2026 09:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6094A1F00A3A;
	Wed, 29 Jul 2026 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785318871;
	bh=LVcDA3xezlmTl1NajKjqRETDsHsLNfimeEju9cIQEX0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=F8PmnrTG9vWE4KhJExVOol4GWqwd64EU0COppIy71qbYl7g1r7SiwmvxCs0OMAAPT
	 XvFiCJaB7m3vqW7xWDOyC3mGNemvbhFLA7T/i6cWeM9OFMVaDDu9VOYdvAKe3GyDEP
	 X7QtKnQLBFlOW0BarvJv96ZtJ2D7LD58Nt95nLJCmXBJav6Sv4+CnU6/9GmBXNeIyB
	 dzUp6n/oLycEU6As/yErwkBlN/YVgcamBKxIIZKpXEDpk5lXf5r2YFwY0oiZmRMxME
	 3634fzXXAp2gSVaM6OZmw0KCxqg6MzLIlCdelHEg3T1DMw0Cx8Eyj5P5UVZ8v19MmR
	 6QG7ctLhUm3gg==
Date: Wed, 29 Jul 2026 09:54:29 +0000
From: Yixun Lan <dlan@kernel.org>
To: sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <20260729095429-GKH76518@kernel.org>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-2-aurelien@aurel32.net>
 <20260728211959.4174F1F000E9@smtp.kernel.org>
 <amnJsOiWSfuBR1ps@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amnJsOiWSfuBR1ps@aurel32.net>
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

Hi Aurelien,

On 11:36 Wed 29 Jul     , Aurelien Jarno wrote:
> Hi,
> 
> On 2026-07-28 21:19, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [High] This problem wasn't introduced by this patch, but wiring it up to cpufreq makes it a serious hardware safety risk: the CPU supply regulator (`buck1_0v9`) has an overly permissive maximum voltage constraint of 3.45V, which could physically damage the CPU.
> > --
> > 
> > --- Patch [1]: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter ---
> > commit 4e25fb96470d1ad37415e03a27de699ef1f0da26
> > Author: Aurelien Jarno <aurelien@aurel32.net>
> > 
> > riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
> > 
> > This commit enables CPU DVFS on the Milk-V Jupiter board by including the OPP
> > tables and wiring the CPU nodes to the CPU regulator supply.
> > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > > index b61f5995ec771..3c16d0c20050e 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > [ ... ]
> > > @@ -107,6 +108,38 @@ &combo_phy {
> > >  	status = "okay";
> > >  };
> > >  
> > > +&cpu_0 {
> > > +	cpu-supply = <&buck1_0v9>;
> > > +};
> > [ ... ]
> > > @@ -209,7 +242,7 @@ pmic@41 {
> > >  		dldoin2-supply = <&buck5>;
> > >  
> > >  		regulators {
> > > -			buck1 {
> > > +			buck1_0v9: buck1 {
> > >  				regulator-min-microvolt = <500000>;
> > >  				regulator-max-microvolt = <3450000>;
> > 
> > [Severity: High]
> > This is a pre-existing issue, but by wiring up the CPU supply for cpufreq in 
> > this patch, does it introduce a severe hardware safety risk?
> > 
> > The buck1_0v9 regulator retains a very permissive maximum voltage constraint 
> > of 3.45V. Because the safe physical limit for the CPU is 1.05V (as defined in 
> > k1-opp.dtsi), could this permanently damage the hardware if a kernel bug, opp 
> > misconfiguration, or privileged userspace requests a higher voltage up to the 
> > board-defined maximum?
> > 
> > Should the board-level constraint be clamped to the safe physical limits of 
> > the CPU (e.g., 1050000 microvolts) to prevent the regulator from supplying a 
> > destructive voltage?
> 
> This looks like a valid point. Yixun, I believe the commit a5d7000e1a17 
> ("riscv: dts: spacemit: Add cpu scaling for K1 SoC") should be drop from 
> your tree until this is fixed, or at least it should not be pushed to 
> v7.3 if the regulator issue is not fixed.
> 
Instead of dropping this patch, I'd like to get it fixed in tree, I don't want
to hold on this patch, it's generally tested

> I'll try to submit a patchset fixing that.
> 
Yes, please, I think we still have time to get it in for v7.3

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
