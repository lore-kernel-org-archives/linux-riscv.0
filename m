Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF2606A31B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mCpWMDLa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=TQiBgo0u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0JKvZQRwbwUeuVUY4HGk0UjT9M08/2nioKy8jPTwbMc=; b=mCpWMDLabyB/MDisxFMjXHnXNR
	kwydcf3O/Ngwhn6wKqqx4O2gQkK3F1fciK09ww+vXtsi+pCwFKGmzaMlXuswOLHvGDvzwEQ2L6fkp
	RsNQvuof1aunIfTeTtJVvD69BA3Z+JWvxara9XFMjRKoRdK+mneBMvUautj2tblQrwhywjhmxWgTk
	oIZxyHbPqeQvqQRRe618FKUxNpZySDK0TRC4TW/BMII0/aX+RzlgWdksKKjPdK2k+OIx5iZcaV8RK
	g+MrMHKbjDyPEW08PCdT991hkMPUFYQtvuPTyt/uRTKok1RjRptF0Cmf0YKTrQA6QXOPYKl5rE9rH
	P9qBzTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyKb-0000000EoHS-1P1G;
	Thu, 22 Oct 2026 19:20:05 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyKY-0000000EoGV-1lRD
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 19:20:04 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E2F7A240109
	for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 21:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1792696794;
	bh=VnTlvi9w4vT9PX72wgTL9hevlcfdOn/hzgPWC/rBkk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=TQiBgo0uZVZLGp7Smlio7yGqhVc9wPVGGNjXQLmWN2auIzFyh/cKWSW2S0VeqYGDA
	 ojjrjZggsoou5RcmdOB2dff5yh/5wwc/08md2TrAFJpC/RMFdhOFjbXAZ2MpuI7jAT
	 LQd8GAGqILk5U8R+9Cclurf3ppcY+xayz/9Beh2FXpb0sXRrhZ5tDcB9WGlAhCYKiR
	 waZbW/LRrHpID6ik4Got++k4aNe1JKwYf6S46jk6H83Kv+oNvG8YJkHfibAVbJ8VH9
	 r2Nz88A3AgFBUfnHFVDkJbXu2KPWviLj9LQ73qnEJO1LtkrpYY/cl5WE735qjf6AbQ
	 24MWorRQ0OO8Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j9bZK2njSz9rxD;
	Thu, 22 Oct 2026 21:19:53 +0200 (CEST)
Date: Thu, 22 Oct 2026 19:19:54 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson
 <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Message-ID: <20261022211952.7293f8b6@posteo.net>
In-Reply-To: <20261022190203.1998156-1-indrek.kruusa@gmail.com>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20261022190203.1998156-1-indrek.kruusa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_122002_662532_5EE72106 
X-CRM114-Status: GOOD (  17.48  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 22:01:15 +0300
Indrek Kruusa <indrek.kruusa@gmail.com> wrote:

> Hi,
> 
> I managed to run this patch series on a Sipeed Lichee RV Dock (Allwinner D1),
> in this setup:
> 
>   - FreeRTOS on the HiFi4 DSP, running a task that contends for the lock
>   - a test kernel module touching the same shared memory, with and without
>     taking the lock
> 
> The series is applied on top of v7.3-rc7.
> 
> What I ran:
> 
>   - probe: 3005000.hwlock binds and the driver reports 32 locks
> 
>   - mutual exclusion: lock 0, taken alternately by the C906 and the HiFi4.
>     Each side added 1 to a shared counter under the lock, 1,000,000 times:
> 
>       counter=2000000 expected=2000000 -> EXACT
>       tripwire linux=0 dsp=0 -> no overlap
> 
>     A tripwire field is set while inside the critical section and read by the
>     other side, so overlap is caught independently of the counter.
> 
>   - negative control, identical loop with the lock not taken:
> 
>       counter=1885761 expected=2000000 -> LOST UPDATES   (5.7% lost)
>       tripwire linux=100302 dsp=674915 -> OVERLAP DETECTED
> 
> The loss rate in the negative control varies between runs (5-19% observed);
> the log linked below is one sample.
> 
> Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
> 
> I put this test setup together with AI assistance. Sources, build
> instructions, ready-to-use images (DSP firmware included) for the RV Dock
> and for the Nezha (untested), and the captured console logs are here:
> 
>   https://github.com/ikruusa/d1-hwspinlock-test

Just out of curiousity, did you also had the impression, that the spinlocks
are quite slow? I did quite similar tests back then using a H5 SoC.

https://lore.kernel.org/lkml/cover.1615713499.git.wilken.gottwalt@posteo.net/T/

greetings,
Wilken

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
