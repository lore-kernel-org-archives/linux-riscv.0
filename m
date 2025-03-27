Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C351AC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4ECk4an+hu44IY4W6Ef9V8T+2Ejz9tSXaEkism9+Qw=; b=ktwAkdipj6ab6W
	FKbADcuk6bqQChYIu4+4YLU8o2y3Vv9xmQKwJ+cv2jh2nF9vi5Ilz2ZXWDLqUkjItZWN61Md6cxr4
	rI4b1DD8f3IpH7gVvWaAd5QbEyOHWP5HEjvpIRLsfsMpD7uYyUXJG13fiK9tZZPXmFSQGVGeSi8+7
	G+J+d3Daffx8zWQp5NoyE3VXbNj+P5IN7zIdX03AbIzzlEPOQIjjYAQKOdRbhvT9LVFr/9dWn0jtg
	xtdZOzBt2EBtuGMoF5jNWQUNliRcHmvgoRGQFN15J4dBaaMriMFecYp6syom5jDda/rubw1fvn7yV
	BanTb26pD4TEVStH9BnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf13-0000000A9tN-2RYn;
	Thu, 27 Mar 2025 04:38:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqv-0000000A4Mj-1YIK
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 920A15C6B40;
	Thu, 27 Mar 2025 03:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618A7C4CEE4;
	Thu, 27 Mar 2025 03:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045860;
	bh=wMWHmN2MQVgRzmQkPt5r8hlPOn/v0VaesvBoHxIFvfA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nO5iE8KJ8Xml1kH8rM014XqZ5K9IdLk2Rfd/yqDfPZETcF43acEfPJjFJ20b5RkA5
	 nN18o+cHk/TDTU9msGMKFrcW9Fra/Bwn4T90UVpOlMvZYeBUn0AceaALjwG42KE6bs
	 xskWQa+UkA4MLPOb0CzsQq/VtXX7iz7J9sadb9rBaKDbiklnHIdPIki7BEUV8NsZwc
	 jioUmmZuHP00YpCeYSF32fshXnTueliaAO+RctFpWg9W664jtWG3fhonleWHFGteZR
	 retZbSjnneffz7dQFOHgVtd/ndHsbuwjV8/CnFurP4ZIeQowYesfhfH0H2MySQsqRJ
	 Pyse/AgWEJGjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB694380AAFD;
	Thu, 27 Mar 2025 03:24:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Simplify base extension checks and direct boolean
 return
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304589675.1549280.4837326210822178054.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:56 +0000
References: <20250129203843.1136838-1-yikming2222@gmail.com>
In-Reply-To: <20250129203843.1136838-1-yikming2222@gmail.com>
To: Chin Yik Ming <yikming2222@gmail.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 charlie@rivosinc.com, ajones@ventanamicro.com, samuel.holland@sifive.com,
 cleger@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com,
 peterlin@andestech.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202421_505305_05D83EE4 
X-CRM114-Status: UNSURE (   7.42  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Thu, 30 Jan 2025 04:38:43 +0800 you wrote:
> Reduce three lines checking to single line using a ternary conditional
> expression for getting the base extension word. In addition, the
> test_bit macro function already return a boolean which matches the
> return type of the caller, so directly return the result of the test_bit
> macro function.
> 
> Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
> 
> [...]

Here is the summary with links:
  - riscv: Simplify base extension checks and direct boolean return
    https://git.kernel.org/riscv/c/7f238b12660e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
