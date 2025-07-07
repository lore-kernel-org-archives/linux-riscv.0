Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF47C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWNFgZ1EHx1UpWj10ebNEVeMF5AFM4qkcnxoeU7DWec=; b=Ac7dV+dUZuhQ0d
	U7BwTq2ycfTErhwGAn3KDKSNDe5TqgZ959EiMFBKBTJdEShlsiL5diULiIBJeLc2H17yiQ0d4jucC
	7Rsq9JVigvOMUcGkRdKIvlvm1vfJgzKIS6+wdBUyyIvB4XHl88Q3t6aiBKLEY4vej6eJqzGPBWq26
	HX+zHa5ASuPD2HqpJPIl1qogsoPbxyXP8NXxRhjUiDcwfZ0J+0KG+fSFBz0uiccM2GEftK9KzfNip
	eOKNjQ2ajyyZx/G10xfDN/UB2mU8On6UBnnvq+c3f0eMh4fTvVG+hAjax3WZ13P5g/Kq86z9BGDyw
	Hy/gAWNjqtqVgFrnnieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjq5-00000002FuA-0aPP;
	Mon, 07 Jul 2025 11:16:49 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjO8-00000002CI0-0gZ1
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 10:47:57 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E02023413F2;
	Mon, 07 Jul 2025 10:47:54 +0000 (UTC)
Date: Mon, 7 Jul 2025 10:47:50 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
Message-ID: <20250707104750-GYA474251@gentoo>
References: <20250702113709.291748-1-elder@riscstar.com>
 <20250702113709.291748-6-elder@riscstar.com>
 <33a20f6abac7400c8b4842b99c14ea118def2780.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33a20f6abac7400c8b4842b99c14ea118def2780.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_034756_219691_8B54C9B6 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Philipp, Stephen, Mike

On 11:46 Mon 07 Jul     , Philipp Zabel wrote:
> Hi Stephen, Mike
> 
> On Mi, 2025-07-02 at 06:37 -0500, Alex Elder wrote:
> > Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
> > device is an auxiliary device associated with a clock controller (CCU).
> > 
> > This patch defines the reset controllers for the MPMU, APBC, and MPMU
> > CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
> > and ACPB2 CCUs, which only define resets.
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> To be merged via the clk tree, if Stephen is ok with that.
> 
ok, I'll just go ahead and prepare a PR for this,
and leave Stephen to take care of the rest..

thanks all!
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
