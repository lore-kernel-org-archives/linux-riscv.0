Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78ABD185C6
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7YmMDaOUBbLw3btOjoQWnCa3bO2Y9CR51Y7sSA29yw=; b=colvs3tavC9Mf4
	qPkh6+4fQn8wt1hmvN5B4b2WTEJPgZDbkOlqfimrFv74KPRlqJRaOiWBphcPiX79oQiPdtcWc/29w
	hf6E0veJXE1KcpQCfYfIUskIT6665hfzxCa/ngMW7rxQCPl8Cm2UcSfDbhoYXfL/U+eEfopn+ijs8
	TMLJRIM2R89npXfNd3OA7uX/uH/FuXNpf+G/yGFBKZ9x68lN09vE/0i4LbWJXjjFw++svud//pfVW
	v9LdvN1mdPMb/0mMUwjB9qSTsgJnkVfzcQYX5pBw3yFCMOD6Gk24FdFVPD48LdWebGEE5YkVMFq6M
	AHxNeWqjz3NtgurigUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnrm-0000000GnQs-1Q1M;
	Thu, 08 Jan 2026 11:07:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnrj-0000000GnPN-1WGe
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 11:07:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrR-0006Ib-0m; Thu, 08 Jan 2026 12:07:25 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrQ-009fT1-25;
	Thu, 08 Jan 2026 12:07:24 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrQ-000000005Vi-2KUV;
	Thu, 08 Jan 2026 12:07:24 +0100
Message-ID: <e7fa69f1febc37062a59f566be97537a3a1e6ee0.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>, Stephen
 Boyd	 <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Thu, 08 Jan 2026 12:07:24 +0100
In-Reply-To: <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
	 <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
	 <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_030743_399132_F2A3CA3C 
X-CRM114-Status: GOOD (  19.56  )
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

On Di, 2026-01-06 at 08:43 -0600, Alex Elder wrote:
> On 1/3/26 1:26 AM, Yixun Lan wrote:
> > Due to the auxiliary register procedure moved to ccu common module where
> > the module name changed to spacemit_ccu, then the reset auxiliary device
> > register id also need to be adjusted in order to prepare for adding new
> > K3 reset driver, otherwise two reset drivers will claim to support same
> > "compatible" auxiliary device.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> This would ideally be merged with the previous patch.  Maybe
> Philipp can negotiate with Stephen to have that happen.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
> > ---
> >   drivers/reset/reset-spacemit.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> > index e1272aff28f7..cc7fd1f8750d 100644
> > --- a/drivers/reset/reset-spacemit.c
> > +++ b/drivers/reset/reset-spacemit.c
> > @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
> >   
> >   #define K1_AUX_DEV_ID(_unit) \
> >   	{ \
> > -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> > +		.name = "spacemit_ccu.k1-" #_unit "-reset", \
> >   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
> >   	}
> >   

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged via the clock tree.

Note that the commits for both patches 2 and 3 will fail to probe the
reset driver when bisecting.
If you don't want do merge the corresponding changes to K1_AUX_DEV_ID()
into those two patches, to make this series (runtime) bisectable, you
should add a warning to both their commit messages that the reset
driver will be adapted in the following patch 4.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
