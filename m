Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A66C55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 03:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9lfTAjzpca0A+Fe9cE2XWBM1HP6u1joSsP29n+aEko=; b=aAANxknPP+nYcN
	zKok1EX3tCYABBWIMH/dewRPi+uFNFk5ZfUoqb+5MM6MTijqow69cSU671LxekN9bwLwMM1qL+2kT
	Ovf2iSQKTRK5741w5jUwPTm+CWu71qWjI6M7BL2dhvZK8mvL/tXzVlRdtDQw539F794QdYhxQXIB4
	hYihM1HWSf6d9E7Ojzugflyw03ObeUkA5ShB7xB8GJohTQm+nvACdlPDKKYai/upkui1Bdtt2PoFN
	fMhEW8QyTWDEswMcXXEHNPUiVf8yQKJQywLewk2UpFAsXHDbtt487PnRT9SllNI6xa5QJ4mQ0JwEg
	uj9Y/Z1cCV205p0jJlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSUH-00000003BD9-2C2J;
	Wed, 05 Aug 2026 03:40:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSUF-00000003BCz-1XGL
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 03:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C17F600B1;
	Wed,  5 Aug 2026 03:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D2C1F000E9;
	Wed,  5 Aug 2026 03:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785901209;
	bh=II5IA1znNWITelblXFEBESXbEeNGTkmwsKzBA47i+GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OkztZLRikLwIzwgXgxDt2A1+dfi8KgkE79jiMs+9ZiF3ZRR1wv17zHHmWsV5wk2/L
	 9ZjbmpMvSI2lvbMUjNf5Erdl6qt5bUcrD5jef7E8CLanmy51XnB4FSY+jNldSXXZaj
	 3SEyUNMe1l3/dy8Am07Jk4zEBfTYJGaiFqzC1721y6ZViI/n0QHE5VvtvjHyJodPun
	 6V75mWrdcyFugO/LORwEs8PpXkDcvIg093P01uX0DrMSBAF0Szt0w26UJiNbn8wIhc
	 K+7I81tUjvHFlwLsqbZsIHMtxqJ5/oqDAbcrwOWww9JDjG4dmiHHRsHzthKmD9RUb7
	 slfLC51pDAczw==
Date: Tue, 4 Aug 2026 20:40:07 -0700
From: Drew Fustini <fustini@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: soc@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.3
Message-ID: <anKwl/5re7CMFTXF@x1>
References: <al+cTw/+z7xoJXxp@x1>
 <55196187-178b-1f88-0947-1612410372e0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55196187-178b-1f88-0947-1612410372e0@kernel.org>
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

On Tue, Aug 04, 2026 at 08:54:21PM -0600, Paul Walmsley wrote:
> Hi,
> 
> On Tue, 21 Jul 2026, Drew Fustini wrote:
> 
> > Hi, I created my riscv-confg branches to shepard defconfig patches
> > related to the riscv platforms that I maintain. The branches are in
> > linux-next. For 7.3, there is just a single patch for the WiFi driver on
> > the TH1520-based LPi4a.
> 
> Looks like this one hasn't gone anywhere, so maybe I'll just take that 
> patch into riscv for-next.  Thanks Drew
> 
> 
> - Paul

Thank you for checking but this was already pulled by Arnd:
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=6495ae297ceb

It seems the patchwork reply had a narrow scope compared to my post:
https://lore.kernel.org/all/178491121788.3229915.9040423834090729571.git-patchwork-notify@kernel.org/

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
