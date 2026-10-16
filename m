Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1966CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KIZdolVJ98Lgyn+r8fOB/i4u5QtRK6HBqBLG21F0Fk=; b=jOhxtWokTFv1Kf
	RoaAmpCFYhF4rIfmcVSJXCmviXGJWGi3Xcz19W5mKGMeL12CC1ztTVxlymBh41JizbZ0qa3/mnpBE
	oHv/npQpe/oDYPeA/Gc/QiO7Uh4BzYa7yQUWXbHhu3F6wyV0WvLZ1VJyOiwzodSXk1Ev5fI9z5Dw6
	upibBnLccwORfffiQxAatfVCKx51kJZ6IwBABhGzbW48cSqX/dqUylPbXJ6I4GwQPJyZd9QytS5LO
	IaCc6cLCvY3ltJ/v5gbAwWZXKEp/SLDhln8WPvzX9jZQuEtSqMqJfRXkuKsayKYeUXLNPKmTq7Aoo
	8Vzg/UfKB+DHACoLI5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdMd-00000002LD3-2bsA;
	Fri, 16 Oct 2026 08:32:31 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdMa-00000002LBw-3iWj
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 08:32:30 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792139541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0knyNoyrHUCFuffs2H/t39yJ/mOtyuS1kwQgEsHC74=;
	b=KnUu8XTZRdq8NbzqavIzWYLKwagmY5oJY3miK4BGsS6aBc7imVHGCM00QPAi3ygOcsyY/T
	ntn23I/HYuDdQ9peLQf6h0oP0wX0AsOyH4U7j2fyAgnM1LtGuuOQ7KZ1Uo/V/uMLw/roXr
	g70hQA4bntIkpPLcDLcVTY9hA88VXAAId2DXLLQgRfpMbiPgYOCTEZPdEocpDQREmgCLJ1
	yntgZ1x9yjrAYIp6XeuI6FknKykuvI7DYcKO198hccEEloKq1NQIjSqibVkjmxnwLJrOmd
	el0EMk92f0M0ffYNb8O18jYYvD35/zgcfoDhBpOZZO8gNZg6UUzxlRFVhIe/EA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792139541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0knyNoyrHUCFuffs2H/t39yJ/mOtyuS1kwQgEsHC74=;
	b=95CZcwQ2pn/EpknwiDTM0yLyOESuR0oCpjCJV6MIg6/bceDUnbbFYuu7zV6SzIaVGQeoxi
	dMnmsYpF/YSE8iDw==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: misaligned: Fix
 fast_unaligned_access_speed_key init
In-Reply-To: <179213417712.1857356.6461669805362228910.b4-review@b4>
References: <cover.1780002199.git.namcao@linutronix.de>
 <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
 <179213417712.1857356.6461669805362228910.b4-review@b4>
Date: Fri, 16 Oct 2026 10:32:20 +0200
Message-ID: <87v7723v1n.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_013229_089175_66D67A47 
X-CRM114-Status: UNSURE (   3.31  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> Thanks for the fix. Looks good but needs to be rebased (apologies for
> the delay on the review).

It's already upstreamed ;)
d585018a9258efed01514bae369ab3d4f21e7b1a

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
