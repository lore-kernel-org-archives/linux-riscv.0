Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF03606A326
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQikPHFb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlwVJc2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lc3LrrTS4OEKJu2H1E1DImogCtG0gwH5kutipBtw1QQ=; b=FQikPHFbOXlUoAnaZKOSzX1Fts
	ASSDRzt25zztBWdKwc8lA1JLAsKzW+o03xKjMWq19nS0yJuWugd2kIcxdjSaiqiwcG0rE4iDlNS+8
	mAFHlTn8t1eFr1q3nzaXgkRQBLcWSrSkKkkXBPsERcEg0rC9sseyxWdPMU0zLXprtw3qD3sODh1bQ
	5H0QT3FgrHGyCTZMKQxVElI9x/1zJEO288m+HuKaks5sNZv2aQFyJPdLKqFAIucwjGsqgcQEonXJO
	1ZYrIkQgyv9uP2T8u1loODRcweliBYmYGnF3QqH9SQQ/A6DntsaKzS85MYjkwWhOhhZ4/KbMCFreS
	7lWHK1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNds5-0000000F4il-1Stz;
	Sun, 01 Nov 2026 22:17:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrZ-0000000F2uM-440p
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3781040896;
	Sun,  1 Nov 2026 22:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159F41F00A16;
	Sun,  1 Nov 2026 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571437;
	bh=V96lGwQwQmY9ownZq1Q75CdhNhmGv+8yLE3JYgrASiM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MlwVJc2SRLjk+rxKbOxp9tf4nzhdr9onLCTP2HLl5zTBQOiHXXA+GFydsaVMi5W2P
	 JBZ9w3HOiskfEd0RqvW648TC4LTAeoRnr0gN4lhW7JYZeWbfVgixO8rsWkmt0+uR0S
	 42G/D31sR+AI/6oma4rKjzuzBBq7YlpMKLd+zsNWQOpTXInxWl7KUOocRV68W4z5Fj
	 Wc8Qmp1gzoTlRBHnlRH4v7Yz8t/h83QJ0jDrpStFmCn7YAiNBOjP9GLbBBLQlVHpzx
	 ySzfZvJMC/w9DkTPvDwFbRM3Om4djHzgDuXhzm+inIjR+kpvU3S9cawnQfclA3HsdR
	 yHNmymPDOy74g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B96A38003B8;
	Sun,  1 Nov 2026 22:17:17 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on
 OrangePi
 RV2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357143579.2624073.15759180385936074030.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:15 +0000
References: <20260929120227.1791356-1-jberring@redhat.com>
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
To: Jennifer Berringer <jberring@redhat.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hendrik.hamerlinck@hammernet.be,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, legoll@online.fr
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Tue, 29 Sep 2026 08:02:27 -0400 you wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
> 
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
> Tested-by: Vincent Legoll <legoll@online.fr>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: dts: spacemit: set console baud rate on OrangePi RV2
    https://git.kernel.org/riscv/c/789eed2d8bfa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
