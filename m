Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB34CA5FF0
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 23:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoTXyTaQZexpA5Ca32zh/dIXR8eeh5m6+CEeeHgJ8Xg=; b=f1CGp3Qlk1rCir
	1ICjPpEtuNpwsIH+A7SkMV10OXvARjICm9UjNAA/xsTWB7+Tbwf1sQV4mYW/WXFGY7kDDberoqTG/
	Jv/yK71IdoMHDiZtBGFvR4udYEyMq42O32YrnzIJc38/y0rF04tTStASrIWEFZXP6Xisi1RetahSz
	rQLAUP9Q/hDUpE+Faabzrr+fM+H8uhG49RbS0d3VNY8kwqWEDKtSYFZjTn/iU3R5Dqc+CFppgXXaT
	s/AMH0mjdPyizTMMpCvfQBVYmnsijY6dr+I/9zKBdWhYTj/cd+3RBsqIPHG77bvBQVm3BXrZ1YTKn
	G5O6i4jcEiUw+tIPtoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDVgf-0000000FTpV-3CiQ;
	Sun, 04 Oct 2026 23:32:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDVge-0000000FTpL-3mWQ
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 23:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BB0C60200;
	Sun,  4 Oct 2026 23:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF051F000FF;
	Sun,  4 Oct 2026 23:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791156726;
	bh=yxK1/IDpFhO7SOYOWAMdIAxMN7TKC89pAYbNpadasvE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CALEh03MJiZUJBevNqMDG+nWZzVZVOWpsU01PMlqcpbZLnZBf+ExMGY75IHMCd5+n
	 PyQ6xzXObFxzHdIWe4co1InTcMMpiGw8wU+4zPJzpcngsLN9AtdD3bE7jKksY3oPCi
	 AkGurZz6s2b/OeCRm0Dn4ZAFc1GBYoOEaM4J93DX28B1qrcKsIqmTepnJ/OY4/yaUA
	 R7bU+UkEwU9jQI3OyuoNP1cbrqw8jftcjLxTrRC3HFiD5j8AKMj+hR22ZwyVFRaUOk
	 Urs4Mlyo64UrS6W1TBgS/xWXqB+vDjj+iPqLcJO3rwL1mxvy+wpzKHzHTKQ1Idtiqu
	 GjfrpIxdgYHKg==
Date: Sun, 4 Oct 2026 17:32:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Sherman <shermanpauldylan@gmail.com>
cc: Samuel Holland <samuel.holland@sifive.com>, palmer@dabbelt.com, 
    pjw@kernel.org, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: smp: fix non-SPINWAIT secondary hart rendezvous
 for fw_dynamic platforms
In-Reply-To: <amqsOI7Pdg5uH-bO@got-milk>
Message-ID: <56e594a6-83fa-d8d3-b7be-547ee9778326@kernel.org>
References: <20260729083414.39339-1-shermanpauldylan@gmail.com> <51f32966-86a2-456e-9e45-c9bf8add0676@sifive.com> <amqsOI7Pdg5uH-bO@got-milk>
MIME-Version: 1.0
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

On Wed, 29 Jul 2026, Paul Sherman wrote:

> On Wed, Jul 29, 2026 at 05:13:56PM -0500, Samuel Holland wrote:
> 
> > Why doesn't your firmware do that? Can you fix your firmware?
> 
> Is your expectation that platforms exhibiting this behavior should
> be corrected to satisfy the ordered booting contract, rather than
> Linux handling SBI_ERR_ALREADY_STARTED defensively?

For folks running mainline kernels, I think it's reasonable to expect that 
they would update OpenSBI to fix a bug in OpenSBI, rather than patching 
the upstream kernel to hack around it.  Hopefully there's nothing 
preventing them from doing that on this platform.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
