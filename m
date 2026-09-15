Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B64C88E7F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4lYaQXCoMJkBIw7ZpryApvJv7T8RRMYxePh+f/eEFo=; b=HrEtemFCXaO/FW
	frpYXfhxn4T7XJRmblDgeurCxUGl2XK1Xvvii7SCfBF0XZCoNbC1fsUx2O7eQnauGRqB37AoFljw9
	AJo+ewYgpTxIzppWveQulfgR00nOZ1/y9XvOU2++MuoIje5wiaeBC4vUXl79IhkgZ9WOk3FVZHSEa
	7mGnRXKFW6VClGTWFY74OWJwZBa8auCBl5RrqT/xRlcHmPbCEcAsGhco7y/pDQ+9G3lpX6ctBrwdE
	8NfPKPpd+2s51HGkFlfn2dK9AaBUq9oe0fNtiU9doIFdOvmgAPztBDtiawQ7znjrBTZQwk2//BSwA
	Lne7yLyShFeAqLDTdIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VG3-00000007G15-46C0;
	Tue, 15 Sep 2026 15:39:43 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VG1-00000007G0O-2isA
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 15:39:43 +0000
X-PTX-Original-Recipient: dlan@kernel.org
X-PTX-Original-Recipient: docular.xu@gmail.com
X-PTX-Original-Recipient: pjw@kernel.org
X-PTX-Original-Recipient: palmer@dabbelt.com
X-PTX-Original-Recipient: aou@eecs.berkeley.edu
X-PTX-Original-Recipient: alex@ghiti.fr
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-PTX-Original-Recipient: spacemit@lists.linux.dev
X-PTX-Original-Recipient: elder@riscstar.com
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 127DD2059C8;
	Tue, 15 Sep 2026 17:39:33 +0200 (CEST)
Message-ID: <7f227c6bc72eb93096e77e6158e394b79801e997.camel@pengutronix.de>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Guodong Xu <docular.xu@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Alex Elder	 <elder@riscstar.com>
Date: Tue, 15 Sep 2026 17:39:32 +0200
In-Reply-To: <20260910213442-GKE2346@kernel.org>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
	 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
	 <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
	 <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
	 <20260910213442-GKE2346@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083941_835867_C7453D48 
X-CRM114-Status: GOOD (  16.14  )
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

On Do, 2026-09-10 at 21:34 +0000, Yixun Lan wrote:
> Hi Guodong, Philipp,
> 
> On 10:09 Thu 10 Sep     , Guodong Xu wrote:
> > Hi Philipp,
> > 
> > On 2026-08-07 19:51, Guodong Xu wrote:
> > > On 2026-06-03 09:34, Philipp Zabel wrote:
> > > [ ... ]
> > > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > 
> > > Gentle ping. All tags on this one are collected:
> > > 
> > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Reviewed-by: Yixun Lan <dlan@kernel.org>
> > > Acked-by: Alex Elder <elder@riscstar.com>
> > > 
> > > Could you take it through the reset tree when convenient?
> > 
> > Second ping. This is a MAINTAINERS-only change and carries your
> > Acked-by, plus Reviewed-by from Yixun and Acked-by from Alex.
> > 
> > If it is easier for you, I'd like to ask Yixun whether it could go
> > through the SpacemiT SoC tree instead. Unless you object, I'd suggest
> > we go that way if it has not been picked up by 2026-09-17.
> > 
> Sounds a good plan, let's give Philipp some time to respond, if he still
> unable to proceed by that time, then I will pick it.. just want to avoid
>  collision that both of us picked accidently..

Please feel free to pick it up into the SpacemiT SoC tree.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
