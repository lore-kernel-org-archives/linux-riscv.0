Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB81606A334
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kKX1ijm9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWlsXTGV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ELjL98yjppJMSt+0yXt6jDXKVBRwL0Vh0mM8hmrC6kE=; b=kKX1ijm93BC1ueEgdk7xUPijI1
	3Y3TmSImMP2IxXSJ06Q0/5M+5nyb7ovRlI+qxjV36SKh2O/ZGD5zC6XWkzT0QP3PSaeFhezFAha9q
	G2gpoN685VgM6HyqSV1fnXrl7MeOP1I3i1OLKJUAWYclRe//cUsfJheTMDRpNfb5PZ0gVJ2k+lm6q
	LpJ3nDrWdOJoe+iB1Tmj6/rwKKC0QlleckMujHI9D0Lsk6rbGjfMeZjED95WzuOJEgk0gSfej2KLy
	/aG0xGdoVLFPP3Q14Qdn20MQWaieTD8+2FqyD5eg4MyEFB1BY64aMIRJwf347bQV+WTONEAdMO8xQ
	UceJLxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrs-0000000F402-2T01;
	Sun, 01 Nov 2026 22:17:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrO-0000000F2E4-1no2
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9755D6060D;
	Sun,  1 Nov 2026 22:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACE31F000C1;
	Sun,  1 Nov 2026 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571425;
	bh=UARKkxG8v/FxLOwHbeoJk4xGIgzo4xkYbvdWI9tXmCk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aWlsXTGVrdI7jijjtDRDpVp2iW7JbtpN8zW3KaG3LTUEXDnqc/gmpYJDMGSLYrxfI
	 T+zxJhPLwsWmx6EUEMjqIjWZn7ZT7BGqvbxqA/hID2NwI+EHpyzr9oZlL/rmxd/FXT
	 pAJRIt559uJkZ2N4OIT3WzqBZoWyjOL1ykUQOH/xrLuM6+Ipji/sLX6MkbPs5+x0PZ
	 +nraQLUY2Uy9qNbMrxA9H671ALuOk0qGqfqGmZg5eU+XAmpDGjAhik7aIYMppbZ6HE
	 Cdatf7nxg/lUVofezd0mBqPw9JAuna1jOzH7NflXaQKGDpDj+1q4yh4WrY/AwLCuMt
	 DXF4usnxXgVrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401F638003B8;
	Sun,  1 Nov 2026 22:17:05 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: tenstorrent: Assign .num before accessing .hws
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357142379.2624073.14814247366912220033.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:03 +0000
References: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P251MB00013BD9A093C06D2D60E10EC8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
To: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: linux-riscv@lists.infradead.org, dfustini@oss.tenstorrent.com,
 jms@oss.tenstorrent.com, sboyd@kernel.org, bmasney+clk@redhat.com,
 jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, asrinivasan@oss.tenstorrent.com,
 kees@kernel.org, linux-hardening@vger.kernel.org, stable@vger.kernel.org
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Drew Fustini (Tenstorrent) <fustini@kernel.org>:

On Sat,  5 Sep 2026 21:48:35 +0100 you wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in atlantis_prcm_clocks_register() due to .num being
> assigned only after every clock has been stored in .hws[]. With
> CONFIG_UBSAN_BOUNDS and a compiler that implements __counted_by (GCC
> 15.1+ or Clang 20.1+), this triggers an array-index-out-of-bounds report
> during probe, and with CONFIG_UBSAN_TRAP the first store traps so the
> clock provider never registers.
> 
> [...]

Here is the summary with links:
  - clk: tenstorrent: Assign .num before accessing .hws
    https://git.kernel.org/riscv/c/da9f1312b06e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
