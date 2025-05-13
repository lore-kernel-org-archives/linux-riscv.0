Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA49CC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9Plz/3X80wgWVihBVn1UMTEKzdAl8U/25EmnBpWxTk=; b=13+GjcwuljY8ZC
	yOtEaeZNNPt2JpfsKdH/qwkH5NAbx2ln0aKITyKwv3ZbpdeKGzVdGJbnNbbtc67J2NTsi66WnPmAw
	cbjKGp7LWhONy/sgDOJd6DodYlg90sS6N/92y/nOmAeJjehZylenl1z0wFAnxDKfDwwY+Efwum59F
	/cbZGREeoLbDSLDknCrLaO3ga5DNF1heN2LulPO0/co8Vmh+7sxJp3soZTKJrQmklRT9J8dXBwVqW
	PjIxCUqoR7AThKO+A7L4C/gWI+SEOnBOdBebnJ9HmhW00lmT28L/Js32gy7NVdWo+2tddmb0tidXK
	0YM6Nn6TV61w81k734Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvzD-0000000DSLi-0Jy7;
	Tue, 13 May 2025 20:12:23 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvzA-0000000DSLD-2ovL
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 20:12:21 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CE4C9343463;
	Tue, 13 May 2025 20:12:17 +0000 (UTC)
Date: Tue, 13 May 2025 20:12:08 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/6] reset: spacemit: define three more CCUs
Message-ID: <20250513201208-GYA518096@gentoo>
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-6-elder@riscstar.com>
 <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_131220_732928_51D3F28A 
X-CRM114-Status: GOOD (  10.91  )
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

On 11:21 Tue 13 May     , Philipp Zabel wrote:
> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
> > Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
> > Define these resets so they can be used.
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > ---
> >  drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
> >  drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
> >  include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
> 
> Could you split this into clk: and reset: parts? The reset changes are
> 
Do you have suggestion how we should merge the patch series in future?
What I can think of 
1) take patch 1, 2, 3 via clock tree, and provide an immutable tag
2) pull the tag, and take all driver/reset via reset tree, and provide an immutable tag back?
3) take the split part of drivers/clock/ in this one via clock tree

> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
