Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4CF606BFA6
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rzt9/Zmu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Jc90BoPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sZojBBli3MFGoUkxP7Is1xnPmVBBdPDOt3fuVp22bxA=; b=rzt9/Zmu69gyUUYQf4pYg9zET7
	hs8uDTU2SfgwoURpSxxyk/9U4BHGLYh+kLstLVgfo90luM9ElUTJJVPBy1TNU0A9+RVYp9az1lhig
	r79KNhky7nEb0HU1tg1WAzjmNiFdMO8JNUPbUrCbnLTLjq4CQn5r/IYhAdzRBX8mwma2s+2OQ1YQW
	4SJ60QWEWl1PeT84bq4qCfKaBYaSQ3Pbim43cO7SrABfdzw+yemQvampeI47l/B9MAn+owZYlJ20t
	+qoAK5hp15AYH3GX9IIXoSILha0qUih6uveuoxyGHJef04eXzrXQUJKH7yfOHS4r1eok5HaobME96
	XE8Rm/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCJB-000000028Fz-3o1V;
	Tue, 03 Nov 2026 11:04:05 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCJ9-000000028Eq-1Rts
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 11:04:04 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9D3482000E3;
	Tue, 03 Nov 2026 12:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+j8TmaWLqssBXOiaemL9Pho6D080LRmzK8roZic8Ps=;
	b=Jc90BoPB2m09qPV5RCIggu7BdHaigZs6oobU/kkMRjlBvAQQsER36aTYs+0yA4V2viZn0D
	9IOFnm4MB2MrtSWlBawUEn6m77a+pjGsUtPg2Jh9RvDMzHE/FIrmgZNh5h+CYpDwQXX5jD
	PInHrpp2ZdVA0T8XeRSodcB5WlYvLvfZDtqC4XjERA6LUcs94M6GOmBdnbtPMf01xb1r2S
	V8UrXgvcdt1+KL5bTrDQ9HCOKfB3aIuHHYgna2kvUIW/cTkRIOypRpEYFd3t7W1uC7pkbc
	uMoepfkGQ15NlXW9fEqQeZ0YWY55oxNkfj4tjw//OIhvyTq3DQokuzhZk0pgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+j8TmaWLqssBXOiaemL9Pho6D080LRmzK8roZic8Ps=;
	b=T49uY6iISswxJGUtAIkUg8wnsDsUJizPUO3sawt1f2O1BXLVCYGBQE0ajEGa2gNNV78NU+
	7L3a7hhs8dGEvBValngCo0hBJiDANqQwMUNJ1m1AuYD/9itxmIJ9QhLLMVvQDAdHhM56WM
	MVAMX3PP6axkRUiLIH5TUYZNaPyO39HTUWYtYzkBD07mnDsNGFM3vPECWf9xl/mKUADZWF
	adW5UMzwDpgvLxEBNSteHJYgrp8V+yBmQ/TKlXu460xSGgZuG+Ee3dT9wBJ5G8XrzUWuWc
	qYsITrrpF3dH6XKzKXC2VhO1fw5Co4qtEMi4ZwghwjGwPcpsLFD85oe0ZYwAQw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793703841; a=rsa-sha256;
	cv=none;
	b=Rx6LJC2yTwIOFc6EGkNmrGtrnjTzEvcY++tM/oV8LLfz5QM7h9x9mY4C3Z8S9L588dbilv
	w5jy9BoYMt6EUr0gC+aQLnl4AQnyVCh0BaPd//AMaL9An0sBqQjLfsuv8SyMz/b+3Ww/eR
	ORd0UFW3BHtirreItQZs1ShGIaJeYIj/O2X4sKuiM2G/5OfaQyoVeEH7yHMuuEdyfppaMs
	e6Gded/RTFspCTzgjkOYJSY7invnM7WY447zw7vYzPTRaCrWUNzOc9YNQBk4KVFUiOAPgo
	YlilMSkEuvCt3vgptrFl79cSFb62ExXMV+DvTP9Gm1zdl2L8FrdDFrCSbb/zWA==
Message-ID: <bb3ee3d119d848034fa16943a4df9639b39df98c.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: spacemit: Fix the RCPU2 PWM reset registers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Guodong Xu
 <docular.xu@gmail.com>,  Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alex Elder	
 <elder@riscstar.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 12:04:01 +0100
In-Reply-To: <20261021132130.3026998-1-alan.tseng.cs@gmail.com>
References: <20261021132130.3026998-1-alan.tseng.cs@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_030403_537289_957260D0 
X-CRM114-Status: UNSURE (   4.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mi, 2026-10-21 at 21:21 +0800, Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
> 
> [...]

Applied to reset/fixes, thanks!

[1/1] reset: spacemit: Fix the RCPU2 PWM reset registers
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/?id=168cae7e87463

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
