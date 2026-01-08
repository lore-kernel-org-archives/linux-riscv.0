Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F50D185EC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3Ex8u2aWzaNTG73HRxExPF0FVUc0i02HLNwoz8Srmg=; b=Z6ADhy9B1+YKsR
	GLRqVcY+YAwrZVek+zuolZ/wDtZrU/QcEkMO9BtdINVWQqgxPAaZTcz4Usdh3Ms7odzgppD2oFESd
	5Cpw6i4mOy5Fxz5NJn/hDNZilPxxx7v+6uQ4UOQt2lq3g0Be6LLNAgIG4ZXobxlIK5oxLBPUlaD4C
	K8+MbQmkP3Z3jPDEUzhqm2hF3BeEun8ZTDucJQ1X4Z9b3ff7UZDR8vbux1pU3YBsSDR2WPgWA4Eja
	JvOBJ/o6UK0UV1Ps0vBPYSq+9Yaw3q/BRh6aZ4Qh99/a8jSeySzUW36BmeRsmdY2sGE4aFd1qQ8B4
	iAfT99IAB7J0d5cLL0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp3v-0000000Gz5U-2PPw;
	Thu, 08 Jan 2026 12:24:23 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp3t-0000000Gz4k-0Oyg
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:24:22 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A82FE340DF7;
	Thu, 08 Jan 2026 12:24:17 +0000 (UTC)
Date: Thu, 8 Jan 2026 20:24:13 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
Message-ID: <20260108122413-GYB4052@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
 <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
 <e7fa69f1febc37062a59f566be97537a3a1e6ee0.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7fa69f1febc37062a59f566be97537a3a1e6ee0.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042421_163054_F46BF415 
X-CRM114-Status: GOOD (  28.16  )
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

Hi Philipp,

On 12:07 Thu 08 Jan     , Philipp Zabel wrote:
> On Di, 2026-01-06 at 08:43 -0600, Alex Elder wrote:
> > On 1/3/26 1:26 AM, Yixun Lan wrote:
> > > Due to the auxiliary register procedure moved to ccu common module where
> > > the module name changed to spacemit_ccu, then the reset auxiliary device
> > > register id also need to be adjusted in order to prepare for adding new
> > > K3 reset driver, otherwise two reset drivers will claim to support same
> > > "compatible" auxiliary device.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > 
> > This would ideally be merged with the previous patch.  Maybe
> > Philipp can negotiate with Stephen to have that happen.
> > 
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> > 
> > > ---
> > >   drivers/reset/reset-spacemit.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> > > index e1272aff28f7..cc7fd1f8750d 100644
> > > --- a/drivers/reset/reset-spacemit.c
> > > +++ b/drivers/reset/reset-spacemit.c
> > > @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
> > >   
> > >   #define K1_AUX_DEV_ID(_unit) \
> > >   	{ \
> > > -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> > > +		.name = "spacemit_ccu.k1-" #_unit "-reset", \
> > >   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
> > >   	}
> > >   
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
thanks

> to be merged via the clock tree.
> 
ok, got!

and, here is my plan, I will prepare an immutable tag for the patch 4 -
the change to reset driver ID, and merge it with the whole series,
then send them along via clock tree.

the tag would be useful if follow-up K3 reset patch[1] need to be merged, since
both will change the reset driver, and with the tag, patch 4 can be pulled into
both clock and reset subsystem, future reset patches can commit on top of it.
even there is no price to pay if above doesn't happen.


> Note that the commits for both patches 2 and 3 will fail to probe the
> reset driver when bisecting.
> If you don't want do merge the corresponding changes to K1_AUX_DEV_ID()
> into those two patches, to make this series (runtime) bisectable, you
no, I do not want to merge changes K1_AUX_DEV_ID() into patch 2/3

> should add a warning to both their commit messages that the reset
> driver will be adapted in the following patch 4.
ok, I will send a new version and add a warning message

> 
> regards
> Philipp

Link: https://lore.kernel.org/all/20251229-k3-reset-v1-0-eda0747bded3@riscstar.com/ [1]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
