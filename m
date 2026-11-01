Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB91560A3821
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V/mvya3g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsgCfXK1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2O2t/yS69KN9+MEwSuujCnh/VR1HgfsKjPex2YZY/z4=; b=V/mvya3gSC1gaz7u1FpGABLLud
	XP/ZriQJ463X9JhshZmjPSs2QSngnv2He5vq/GyWOwJ8dqK7xYpT4GZsmlHXC1DoGTdutKVjYz/TW
	4W/NP0gx262IDzeavKTdPIPSVZbCzEfyjTmiI1M+Sfw6CkrOs/j6ZgRfQ2xUm9tT6zLubPi4qT2t6
	l+94cqWkeOZMd/ehHyGYI/apZvV1JyftdnuD9KKJnbZJURik7F8oEkKDlMhpy9SFNQyTjFHUHXz/B
	P5+Yptmz4EuZQIJY8Gf67diGe46uFXJTtN+YaEIEwMMHD929xt60YTFlZLFmCG3S/JRXOdJxstCWP
	2QSEtzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq9-0000000Eyqo-2wsP;
	Sun, 01 Nov 2026 22:15:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq8-0000000EyoR-0XAp
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:15:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 609C760054;
	Sun,  1 Nov 2026 22:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9391F00A17;
	Sun,  1 Nov 2026 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571347;
	bh=JvZMrkFAj4cuxDxTXvU7TjTIfCCUoa7HG949wcMrARU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lsgCfXK18Oengq3LRjoYkZPO+6SC8jlVqgMOxGhbYf6DhhJ7gJLlBe7Y6Ani1CP1q
	 YTl8YzcQmWJpIiYoIDW7/60MUvIeQoGBoRLzYrHbzc/ybAqIrb8JDl5cW4++mQVvJP
	 rRl0pi4jare82zWO8nIdn4//CFelRizT0b2aO6WZojStQm+YFdDbl43GlRLD7vdnWz
	 Lc/MQ2ywPVXyfom7ekn/7yiwaRBvBIOk3IjqGYO5XX1ai9sAcfjDz/mHemiW88S92d
	 3tCwt2f3YzCmtXLFF3ypGGLgnusjSEhmEIowD33VhD/raZLHOZaZkap2soMP0zEtvC
	 17MpR+vLbQXIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0318238003B8;
	Sun,  1 Nov 2026 22:15:47 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] riscv: dts: thead: Add Milk-V Meles support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357134580.2624073.9566786925548319371.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:45 +0000
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, fustini@kernel.org,
 guoren@kernel.org, wefu@redhat.com, rabenda.cn@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

This series was applied to riscv/linux.git (fixes)
by Drew Fustini <fustini@kernel.org>:

On Thu, 01 Oct 2026 15:44:09 +0800 you wrote:
> Milk-V Meles is a single-board computer powered by T-HEAD's TH1520
> SoC with four C910 RISC-V cores. Add the board compatible and device
> tree for the Milk-V Meles.
> 
> Enable UART0, eMMC, microSD, Gigabit Ethernet and the PWM fan, and
> name the GPIO lines exposed on the 40-pin header. Add AP6256 Wi-Fi
> support over SDIO and enable HDMI output through the DC8200 display
> controller and DW-HDMI transmitter.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: riscv: thead: add Milk-V Meles
    https://git.kernel.org/riscv/c/2c8613ec65f4
  - [v2,2/4] riscv: dts: thead: add Milk-V Meles
    https://git.kernel.org/riscv/c/8360e1bcc246
  - [v2,3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
    https://git.kernel.org/riscv/c/a7f2539005c4
  - [v2,4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
    https://git.kernel.org/riscv/c/d43b33e0253c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
