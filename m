Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023A1D59D99
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 02:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCD7BFj5ZX7vCL9C5jKcWQdBllX1MT1xtGjipUrR7kA=; b=4n5sNhBJbUsJM1
	uz3bWgj4w6DBEPdCLX/rNuKegMrh2kFvf3ousYbDUX1Um0hlOPVqH1V/uprZgBFeiPX43hUW1bI84
	/cPW9nRrtuaU+xzVFhmQet17MP7YOkEA34zXtrCIFXXPY3CK1HdjUqySynNRmZ0sPDbuDz7EPshH3
	iOvAJc3GnJPf6IcNAiUuFdfr+4vcmIQg6+3sfyfYAKopZfRozEaC1nbslSqFV8XY+6SI8u56GJWUc
	LxGute9ZoVfWSKRjJs7Vv1gG+Jdj/g4n3q7Im8Y5rn/G3cPWjcxrjb3mHMZUTC7fg6iOgba0RRi47
	300rwf1gB5gN+yoy12vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyl7-00000002xjV-08Yp;
	Mon, 15 Dec 2025 02:56:25 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyl4-00000002xhx-0gQY
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 02:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765767288;
	bh=ePccDOthFyLYtm90K2o9nMjYsKD7YRLlY05U0kQc0FE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=wu7/HYl6TDvK9IYrmfCs1XC9Y1HsgSad5JA2mQHBDs6+WCnldIx4IOfb4wuS7QAi/
	 yDRQ/Op4UM7VbHumZISHA1uUbHVo9sQyXYveBbtNiIL3y6pdrUZram1q+N7aYaD+ND
	 dRLOgOxTaVKCLo55FcxGIsLQGHMqSQ7xrCmi0dWA=
X-QQ-mid: zesmtpsz6t1765767284t6cf729bf
X-QQ-Originating-IP: 9pTzAVsmuC6mHETYV41cHodoDPvc/PLgk8GGdyTolFM=
Received: from = ( [183.48.246.103])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 10:54:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2478898065667183843
EX-QQ-RecipientCnt: 14
Date: Mon, 15 Dec 2025 10:54:42 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>, Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <EE6920993009E270+aT94cmKTM0tHn8Ly@kernel.org>
References: <20251214232938.668293-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251214232938.668293-1-inochiama@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N2msJaiA+ppMoK38P6mvOs1kBiDz8Jf2CIP293VWTRVbv++ahMObJ4vt
	/bvmTHqoJhuUiA0fy1LLqv2cP87jWGXItZA2quUcC5CtxL7bMNH6tTADQzq7wxOPzRIH4AS
	/4A5vNEE3tchovlvWJB1xe8g1iUYqN989t0iRKkw4PUFKXy7qpkVj3ho4xVtLDNEwAynpiU
	BlTlZWAkxSJjANZ1avdJ/2SVPaC2b8+rv91Lt4MSJoP69++ohTk02hQnFC4AwK+LG3mP0No
	StffNkG/cnHzpM+tpIWG8uivOsH+Wy4tLTEHznaOv1dNCHVMtQnm6+E3fkHg52ObywKrcu3
	fjkORVJKYHKWxw4G64e1VjWRCkksimfTYQ+mlwovNcVYktHUIn2Lhc1PsBWpCQa4sBgKCN9
	l60y/h17lTzZuXBoG6j3pBtd/gU5qTXNsKr5G0IMJgX8ENAoMx+Ro6ZhQoj6FTxqceClZUH
	a2GdCompGjHeq7t0Q+gpbuthR9z8pTR2RucE6MxuYXCiuIp/3EuphqhqYFxx4kJcfZxl2dP
	2COm/JAwVi58IV7E5IBxlo1WDt+PFJ8sgaEaY/4srRKyodGH9urvh6cCRtsjh/jhpXdsG2T
	2ZNSq7DBBP1kBACoaVnfs9rZqYUxEdFSDod22VBypaEHgO+/KbhjIFakJYBxWLdimfjvhVE
	8BEsu83mtYMqRZpYhy1aJ+3Lea9IyuLAcBTvRn2LurqR4RSYYFqM8/aRam+LbpXhIxRmCSt
	g7+aIJ8zk0QKX1FnFCyAi0GnQTWFN/mV++3jWgIh04HbZUi6W6401UIlkdtrk19FMYY4z7C
	sZvetOeyB3l1ISJ2AZGCTFX6SOsl8ahaP6iASbEV271sP0kgbx57i1mRBxw+S1maKa0dHTB
	hViKXKMXpxCK7YmW7B3W9XVPFjHUxP0PGk/ckC3Yj/0fjnKIUh0DkqtwJAB7fH++I8SmqSG
	GT6GlOOFdWBAhKJnh3iTS0HnpqDYlw2UormhO/VRkyy+nvMPlPUgFjpHBkZ8uQ8f7ptk/vv
	Ks0JUIb2EPAQow3RwfpN2pozw0BR6etQvCoQq3uZTcEVwqRJkcRZ0WA63ITLkDaUuwPbODV
	uZok5l9HLlAN+Q8Ay1ursU6G/9+OL/zJg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_185622_771842_7A2B4CD5 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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

On Mon, Dec 15, 2025 at 07:29:37AM +0800, Inochi Amaoto wrote:
> For build spacemit common clock driver as a module, the build
> process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> build will fail.
> 
> Add these missing hints, so the driver can be built as a module.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Thanks.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
