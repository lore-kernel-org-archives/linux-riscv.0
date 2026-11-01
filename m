Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8560701DE
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQGj+DIE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0LOEbRv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dkezfHrcYrxYl74aHO5KBLk6//ZBXHurNfog7otSsao=; b=FQGj+DIEuxyp43lIbWqWYX8YmI
	J60CXjjg17olc4y0COLX/U2EWlwMif+GU6FtPS6o1vIi2Lm0RlsiHBxdoba7ds/gNvrZ/zqJ3tyMF
	rM8C9PP2BVQq2h+i4jvpxNtXGColVNbQzVFINVoLLvlcQHXT16pnBXBfI+ejsVpRFjHoVpfdFUAJb
	wa6zhCyH3ELlj/dXAzL2KQaytyM8ZZ0I2x7vQbkRJnpfzoMVoB5BKXInZpbhoEjHzU6PEx1SiheYA
	8NHYXhpcy0VMdIkvu8p/BeqlLew8+PWmGh7x/MabXOlo78ij4slU6q2xtn8X5JKvozzT0kVIj+y5Z
	8ThbI19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqt-0000000F0gb-3dRh;
	Sun, 01 Nov 2026 22:16:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqa-0000000Ezke-2IJa
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D45FB60617;
	Sun,  1 Nov 2026 22:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8632D1F00A1D;
	Sun,  1 Nov 2026 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571375;
	bh=pqV79QmChFOf3bbPGI4+7921MVE85dKKWV9jL57f3sM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=P0LOEbRvwTcNBUSW901O5u0IbTsFAS0u7tlHAilX4zpQhlj7rov3kTzRYxOrtXJkq
	 +kLlB6UyHSdCxIZGfBJQPBLWPHsIw97WryXY4R57r+FehjA0yUzJg9yHCqGZu5/j7u
	 qF/Ye8qIspqZju8mEmIBaczCeiWVktuLMbCu4tTlypu/S5LEtFoYvRsLOGiwJOxDK2
	 fhKyBYx4IL+DOEPxJrlBKp6SmfV9nsobQTiRrZDMrgZQPiFYfY0ahvxyOCsHSIIgxn
	 7zGTWtOhm+EOfESSKUksCnsHptg+CLBeRTvGHiV3Lmw6GrMNWHipG3V8ozR5jeBUhV
	 pcMZBgzINShfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D49838003B8;
	Sun,  1 Nov 2026 22:16:15 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Do not reserve memory for coprocessor FW
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357137404.2624073.6489638020939885844.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:14 +0000
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chen.wang@linux.dev, inochiama@gmail.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 me@ziyao.cc, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org
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
by Inochi Amaoto <inochiama@gmail.com>:

On Mon, 21 Sep 2026 17:08:58 +0200 you wrote:
> Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
> the end of RAM. It is not correct because:
>   - FSBL can be configured to load FW into a different region
>   - if no firmware is loaded, the reserved memory is wasted
> 
> As explained in [1, 2], FSBL should reserve the region at runtime.
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
    https://git.kernel.org/riscv/c/6645398c4621
  - [2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node
    https://git.kernel.org/riscv/c/60e4cafd3090

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
