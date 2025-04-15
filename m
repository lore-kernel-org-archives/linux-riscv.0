Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05840C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHo+7zPD26O62AZSapvzEsVrEuKNYX7yeHj8Kt8aYZM=; b=Fhu1rasYwt5FPl
	17/RKhpqiD9ssWOjeshamigr7TzjxCEq1bF7pYgbCxbpdpjU1KC10Wp8vp+IYzlIzVP48q3oH5Lsm
	ywzWN8ljfrRbN3qHXp1cS57sdpKQAOMWVuK2C3k/yRVVHOLCt6AZ7hUeszrexLOUOqolHI36C1uHz
	iHtCjMLIeHZoxnITaoHwnBzoSWtJK+bkH/ygYv3/oZw5QbSN8+oX1TWkoDrVloLzIxuTjYULiOL+e
	t8smWYSS/CzTDKuinuNxfSMDhg7NPR+Yba6O6/yxt225NmCsxNAj3XiUOcnEufPFBVio3ZCNRb2oV
	dCZIB/p8dXrOkq177e9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bg9-000000050Hr-1YvI;
	Tue, 15 Apr 2025 08:30:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bb8-00000004yuE-3aKc
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 08:24:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bay-0002GN-5b; Tue, 15 Apr 2025 10:24:40 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bax-000O1M-2z;
	Tue, 15 Apr 2025 10:24:39 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bax-0003O6-2l;
	Tue, 15 Apr 2025 10:24:39 +0200
Message-ID: <dbd81c1b07f65edc77329ff479bdf9c790c78120.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/7] clk: spacemit: add reset controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
 sboyd@kernel.org,  robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 15 Apr 2025 10:24:39 +0200
In-Reply-To: <20250414191715.2264758-4-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
	 <20250414191715.2264758-4-elder@riscstar.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_012450_890482_54080F41 
X-CRM114-Status: GOOD (  14.41  )
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

On Mo, 2025-04-14 at 14:17 -0500, Alex Elder wrote:
> Define ccu_reset_data as a structure that contains the constant
> register offset and bitmasks used to assert and deassert a reset
> control on a SpacemiT K1 CCU. Add a pointer to an array of those
> structures to the spacemit_ccu_data structure, along with a field
> indicating how many elements are in that array.  Resets will be
> optional, and if none are defined the reset array pointer will be
> null.
> 
> Define a new ccu_reset_controller structure, which (for a CCU with
> resets) contains a pointer to the constant reset data, the regmap
> to be used for the controller, and an embedded a reset controller
> structure.
> 
> Each reset control is asserted or deasserted by updating bits in
> a register.  The bits used are defined by an assert mask and a
> deassert mask.  In some cases, one (non-zero) mask asserts reset
> and a different (non-zero) mask deasserts it.  Otherwise one mask
> is nonzero, and the other is zero.  Either way, the bits in
> both masks are cleared, then either the assert mask or the deassert
> mask is set in a register to affect the state of a reset control.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
