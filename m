Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA6060A2630
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YnsYH7LR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMnj3hsa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vs5RU/B+Tb2+e/vPU67Uz6Ce+h/Z4ufuq5fJDpKlXi8=; b=YnsYH7LRIPCN0Q7h3lIzJ52rp5
	4P6+XXTvsdyJpW7byy3ab/KYa2TUzd14QCj1i9T/DN+g6lInshmhK1VkQ0lJFOLXNM/gMBB1e9W9J
	XHU2W6vPQIgHQI4X5uel3bZ78cYzRmHCkvvYDCKGiSPAQiNxuJSInH1dsw4wUZMujBEJxHWtISnQI
	l2jafyWtnSRt+YU0MtUpSvqGQnXbF9sx7lCdNHZhNraz5ovG7aHN0J6JL0lTyg4Tal7zDEpQu7dts
	w3D3hQRdX3xqzM7oPbj45s/LZbE/nOTg9hEm6JGaj8kOu532BJbRHLOqqBZaLkRyXWEnQXqsDHm9r
	V/yROquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqw-0000000F0mg-1VjA;
	Sun, 01 Nov 2026 22:16:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqd-0000000EztV-1Lww
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 996CA60611;
	Sun,  1 Nov 2026 22:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A73C1F01579;
	Sun,  1 Nov 2026 22:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571378;
	bh=M/w8YBijKICyv173+X+mvFtJwUapRf2FeO+G+UMwaco=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BMnj3hsa46AOqOrQT2/Y5wnpFmHLimlftjstHkzvdSw4htP6NG1zM6u+BhYbp/VSw
	 V5PrPc96aMRY3rTe9PQZsWwTmTWqR/mlfrx4McZOajiVeNk2NGFUAf1cYOQ9LM65Hf
	 XbR9n3ByPX5BH9mYn+4glr0tKySkevcoSkHXJm9jO7oIPfR8EooJzqaRfzBNoqkGSI
	 2cA0HdfDULemdO0DZjp8DSGx9LhU5cEuU2CjkjAMOcxQUf7eBKp1YIkf9orV7pRmyn
	 X5NtSU7OSuOd2h+SAf43OmCudbnuM0+XhxatsNeadDNyJQ6abRx09/ufB13bh8EdU+
	 wR+OqXJKjJTbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401E838003B8;
	Sun,  1 Nov 2026 22:16:18 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip: riscv-imsic: Expose the fwnode via the global
 config
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357137690.2624073.10590886013198507782.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:16 +0000
References: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 radu@rendec.net, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, prajwal.n.oss@gmail.com
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
by Thomas Gleixner <tglx@kernel.org>:

On Fri,  2 Oct 2026 17:34:17 +0530 you wrote:
> The fwnode describes a global property of the IMSIC interrupt
> controller that is equally relevant to external consumers of
> imsic_global_config as it is to the imsic_priv itself.
> 
> Keeping it in imsic_priv forces the external drivers to access
> the private structure rather than using the already exported
> imsic_get_global_config() interface.
> 
> [...]

Here is the summary with links:
  - irqchip: riscv-imsic: Expose the fwnode via the global config
    https://git.kernel.org/riscv/c/ff6f8cd2919b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
