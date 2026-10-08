Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1936BCA6004
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DsN3giWNvY5tphtOUMUrBhMP1KHcORf9zo6lquy87M=; b=dLzTd00XOmkJim
	qcPoHVqkNYDJ+0XUlH4bOJmcP4v0RJAyORjPz/ICi12OR9JFjAh6VTKDNNAF/15qLoKnFys09Xziu
	TE7AhUKe+QPGUogECwI3m7RUGMwv0kfe1ypbZRW1c/AvOLiUecAaZ8vQQ6Vybxv/OayoM6cLrAE9K
	yHifWOAvKhA797dAnPOLiEZTP9b2yQSlw1DTbdP8ehkHG0VlYxQR1Wvtt0/OiV1/PHkZ+RxtKn5H4
	nPEpt3MMck7Z+u42w8wNOaGwlUa+xzjEb2ZoykJQb8NZ2eTyE5MWTGyzZjqRVz7Us9GN8jkXQClta
	etEpltk+m9cqh0TtkR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe3H-00000003POm-3KiY;
	Thu, 08 Oct 2026 02:40:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe3F-00000003POT-3thg
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 02:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A439960136;
	Thu,  8 Oct 2026 02:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DA91F000FF;
	Thu,  8 Oct 2026 02:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791427208;
	bh=i4lOFLDXonP7XHOPVAKuyjxIsmz1UU6f/87d8eQWzd4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nsbNX8CBCxSqnDeFUNsikP4KoXyWbAmdz4Z06R82U0ZZJ8lLtbjZPTjblisM9OmD/
	 4as/NbKeRHYzu5WKLgx+MeWn3yAibBRt25lA8lBI//HzhQh95CTk1lFlGV+oo3gRY0
	 eTOMvc61wJa3fg05kQgZ6DZJhDHtmijg0i1+GFV1ic6mJ5L/ixeMwOT6oDNUQSKbp9
	 XACX9nMXMyi1JFASD70sdtzp+srsr8ByxRqOURkpOXEQMgxC/mDFDBzW27Tqrl3Du5
	 eowvWxDxv3H+KmQXap5gmKNHaNAswx+/E3q2LQUOEqkWVSsaWHXTttgg/8HPeIECvY
	 WIB3A4+HWRv9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A31C3809A09;
	Thu,  8 Oct 2026 02:40:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179142720678.3779518.13917194238357828513.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 02:40:06 +0000
References: <20260907190750.26303-1-kmehltretter@gmail.com>
In-Reply-To: <20260907190750.26303-1-kmehltretter@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
 linux-kernel@vger.kernel.org
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon,  7 Sep 2026 21:07:50 +0200 you wrote:
> The fixup for load_unaligned_zeropad() runs when REG_L crosses into an
> unmapped page. REG_L is lw on RV32 and ld on RV64, but the fixup assumes
> an 8-byte load: it rounds the address down to 8 bytes and derives the
> shift from three address bits.
> 
> On RV32, a load starting in the last three bytes of a mapped page selects
> the word four bytes earlier and shifts it by 40, 48, or 56 bits, more than
> the register width. The caller gets earlier bytes instead of the string
> tail followed by zeroes. This affects RV32 MMU kernels built with
> RISCV_EFFICIENT_UNALIGNED_ACCESS=y, which selects DCACHE_WORD_ACCESS
> and lets dcache name hashing and comparison and strscpy() use this
> path.
> 
> [...]

Here is the summary with links:
  - riscv: fix load_unaligned_zeropad() fixup for RV32
    https://git.kernel.org/riscv/c/d4f25b097e46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
