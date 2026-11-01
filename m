Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD796607351E
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jgxExi0C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YUlLLBZ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MJzgV+aKglFgI0gfH0eAgdTqCR1lQjl/WSV8wgvVAVQ=; b=jgxExi0CJtMqM0f0R07hg6nX7A
	D5LNU/z9y04BRsiFma9U6xOzpnMtAzUIvBUmPm1WyDrVhdDbwS9QXx8jmTvFICo9egn32NYZWFASU
	POggB6mKvXE3IQCM8leQJvU0NnluXZQwN4q4gvwM9IQf5QFjpMA0PTumKM1JXOyGgf8DzrduUve5j
	fj2nn9mTIPxYZacFiJzS2XbHDOidC9by2LI2HSt6sVZzAxyqQrQTstfftOP4bvSgQyAxo33ng2Jy+
	I2zhCnP/nggQ1Y3iuYrm8HL2YsyE5koqirebE9imHvlEBd4ZxyiOTHHTOP43Rr/F6sehFUH9aYD9a
	VO0EVttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr7-0000000F1Fl-0WVC;
	Sun, 01 Nov 2026 22:16:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqo-0000000F0Rq-3XUj
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2209E6020C;
	Sun,  1 Nov 2026 22:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79751F0093A;
	Sun,  1 Nov 2026 22:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571389;
	bh=kd1+6McIMPpXCjM/eK1XnUd0MHKq5CNasIzBEPub8/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YUlLLBZ6pm30l0+huWgQS5KFcpacV3sIViYlLlgtZBTFchxrnyS8Bp46ptx800GpH
	 ms0tcCCwnBu8jhUpAixHI2ZMpbJ4BXne5Su4dMXO/7bUCVl9AQVIuUBLP4vl7wQZgv
	 rZUklVe7MxMb57TOckoPSQz/SDQn9b5pexQYQ6rnr5y2PQEq0m0iBuIwllJyuFYCPt
	 FgWrKGlFZ3mCBkOH5hjwzxX8senRjOfUuL2jk1ZgZ27JyA3nz0QEa+hdXnKH2Ks7cd
	 yjsnEcGAfd78jUx35wSizQNDIH/DFAduRns5hrtdjcBw963LMRfCTmY/LrgNPoYmff
	 gPp6G7yyQ4ZFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1F138003B8;
	Sun,  1 Nov 2026 22:16:29 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: dts: spacemit: k3: fix IMSIC num-guest-ids
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138858.2624073.15621784518365922237.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:28 +0000
References: <20260817033038.2286436-1-guoren@kernel.org>
In-Reply-To: <20260817033038.2286436-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dlan@kernel.org, devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 junhui.liu@pigmoral.tech, stable@vger.kernel.org, docular.xu@gmail.com
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
by Yixun Lan <dlan@kernel.org>:

On Mon, 17 Aug 2026 03:30:38 +0000 you wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> 
> The initial K3 device tree used generic/placeholder values for the
> IMSIC guest configuration:
> 
>   riscv,num-guest-ids    = <511>;
> 
> [...]

Here is the summary with links:
  - [V2] riscv: dts: spacemit: k3: fix IMSIC num-guest-ids
    https://git.kernel.org/riscv/c/69f95409f005

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
