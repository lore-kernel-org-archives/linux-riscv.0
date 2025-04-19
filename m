Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458E2C369BD
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nqAzZ8Zcmd8o+1cgms5GVVRnuMI3MInB+F7bpHDcEc=; b=Zz0SGG+SCiORPR
	TGQGMD1FwPmQXnc/oEfPzyerz/1nQzIjEcltydWTXs57cMUZecK7PpygT8qfWIqzQpSyMTmRUnFI2
	sE2lm7V4U6K/Yxj5fR8J281lO15S7HIkPDVGf8Fb4O2Ib9Jnn/u9Wq+JKO7nPdHMLstMHizJ67L/f
	YcswKprzOGDrI59GShOoCDdm5Dtek+p0TX6OoA6xS6GsRkIWT7OaB1XrjQ014uqibLRF41GQWoEIr
	Yb0xjOJcPNiLcOmF3EEwUd16FfK8WeV18o99lfaViRI0GvM80yA60dHQ0Kh3vg5ysZ6E1rvjROnd/
	dC/yjdMyRO0SitgYhcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6583-0000000185N-2lXs;
	Sat, 19 Apr 2025 10:08:55 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6581-0000000184r-03nv
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 10:08:54 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 02F9A34301B;
	Sat, 19 Apr 2025 10:08:48 +0000 (UTC)
Date: Sat, 19 Apr 2025 10:08:44 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Message-ID: <20250419100844-GYA38730@gentoo>
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <aANwGZCIpMcd47IB@ketchup>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aANwGZCIpMcd47IB@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_030853_078131_2C204328 
X-CRM114-Status: GOOD (  20.81  )
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

On 09:42 Sat 19 Apr     , Haylen Chu wrote:
> On Sat, Apr 19, 2025 at 11:32:29AM +0800, Yixun Lan wrote:
> > Populate clock property for pinctrl and UART controller.
> > 
> > The pinctrl's clock dt-binding patch is still waiting to be merged[1].
> > 
> > The UART's dt-binding and driver code has already been accepted[2],
> > so we now are only sending the DT part patch.
> > 
> > These two patches are abased on SpacemiT SoC tree's for-next branch[3]
> > 
> > Link: https://lore.kernel.org/r/20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org [1]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next [2]
> > Link: https://github.com/spacemit-com/linux/tree/for-next [3]
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> Generally this looks good to me, but I realized that splitting the
> commit that introduces clock controllers and the one that correctly
> fills clock properties for various peripherals may cause bisectable
> issues, i.e. the UART won't function with only the clock controller
> introduced and no clk_ignore_unused specified on commandline.
> 
I don't think you should worry about this, my plan is to apply
these two patches to for-next branch of spacemiT SoC tree, which
exactly on top of clock patches, besides pinctrl[1], uart[2] patches
will go via different subsystem, and this series depend on them
in order to work properly at run time phase, so regarding this, it's
 kind of broken already.. but if take a high picture that they all
will be merged into for-next/master branch, then it's fine


> If this isn't really a problem, for the whole series,
> 
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> 
> > ---
> > Yixun Lan (2):
> >       riscv: dts: spacemit: Acquire clocks for pinctrl
> >       riscv: dts: spacemit: Acquire clocks for UART
> > 
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 39 +++++++++++++++++++++++++++---------
> >  1 file changed, 30 insertions(+), 9 deletions(-)
> > ---
> > base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
> > change-id: 20250419-05-dts-clock-026bfca75e5b
> > 
> > Best regards,
> > -- 
> > Yixun Lan
> > 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
