Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4C5D715D6
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWgoHN5LDnJ2gP66CDSFvweeioifeZkcjLR1zicjG8c=; b=b/JMsibeItECnn
	N8wkYTX0ao6rgm/J2hOaZmNywmTX0AmOpZyOhELYwq+ambTbR8dIXdXqrwFSnbntnCaIFUefZ7zUM
	ae5vOls1oBvQJEJuSqfLIFT5cgnSSDpQ8sBdsvPYlONpUEi467IOMhThxvO120/X3Z03KuH82Kirz
	IaQUVia+mMowcD363414tXTqWSmahGyCGghhnhhOVZjCdc07CQkg1R2ZNzP8cGnl1VtlrIFpafD72
	fDsX4UgpjXEGsbkUNsOQzRYmJQBm5Z1N1Op7xrXsvcnbEjUSp0t3pPgG9ZHO/lTknDyGNSBjcuyig
	/FwLixpuURjdycJampTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYnR-0000000A5gC-3xPz;
	Sat, 24 Jan 2026 08:15:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYnO-0000000A5fg-40H9
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 08:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9788A44073;
	Sat, 24 Jan 2026 08:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB42C116D0;
	Sat, 24 Jan 2026 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769242500;
	bh=PywAw2DMbolvUVXsSOcJRpn47qYGaoGZYNder+ttOHk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fb+4nXLNATw6Z4sPmcJml8tLbXrO1ZOBKCX+BPFUfdS/j9YDimTNTbzyUSraVZ9vc
	 vPgaMT7ZSoZp+lue7HKA2KINXANR6h2ZY+MMDWND4tRBjYW9btlzNT5JyQxEpU8zpK
	 tcP8Pqe0p9Bn1GfUkkdedRahayyFtBFvcxqm5YCrGnBpZBgPk6aedLR05voRcIgjEm
	 3zTD1gYenX/gsbKZcgQv84QRct+4Qg6ALx+1m+EYLqDRR7H9E9V/BZ0j0HhdQB6tI2
	 ZPyDHqtMf0Oqn0mtRRPLDo6iBhZyMmqGjkfmHrH6BvCvJ7F6mp74MbjGq1l4+2jqoa
	 gwBcPyMjj+8dA==
Date: Sat, 24 Jan 2026 01:14:58 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
cc: Paul Walmsley <pjw@kernel.org>, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, samuel.holland@sifive.com, charlie@rivosinc.com, 
    conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
In-Reply-To: <581a8707-cb16-46d9-b6b5-8fa267383318@kylinos.cn>
Message-ID: <4cd1d9d1-34da-7d96-46ac-a5470cfa85c3@kernel.org>
References: <20251218032614.57356-1-jiangfeng@kylinos.cn> <d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org> <581a8707-cb16-46d9-b6b5-8fa267383318@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_001503_042606_056EBECA 
X-CRM114-Status: GOOD (  15.58  )
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

On Thu, 15 Jan 2026, Feng Jiang wrote:

> On 2026/1/15 10:03, Paul Walmsley wrote:
> > On Thu, 18 Dec 2025, Feng Jiang wrote:
> > 
> >> Optimize the generic strlen implementation by using a pre-decrement
> >> pointer. This reduces the loop body from 4 instructions to 3 and
> >> eliminates the unconditional jump ('j').
> >>
> >> Old loop (4 instructions, 2 branches):
> >>   1: lbu t0, 0(t1); beqz t0, 2f; addi t1, t1, 1; j 1b
> >>
> >> New loop (3 instructions, 1 branch):
> >>   1: addi t1, t1, 1; lbu t0, 0(t1); bnez t0, 1b
> >>
> >> This change improves execution efficiency and reduces branch pressure
> >> for systems without the Zbb extension.
> > 
> > Looks reasonable; do you have any benchmarks on hardware that you can 
> > share?  Any reason why this patch stands alone and isn't rolled up as part 
> > of your "optimize string function" series?
> 
> Thanks for the feedback.
> 
> This patch predates the rest of the series, which is why it wasn't included
> in the 'optimize string function' rollup. At the time, I focused on correctness
> testing and observed the improvement through rdcycle instruction counts.
> 
> Since the series still needs further refinement and may take a longer time to
> complete, I was hoping this standalone optimization could be considered independently.

Ok.  Queued for v6.20.

Might be worth taking a look at David's suggestions for a followup patch?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
