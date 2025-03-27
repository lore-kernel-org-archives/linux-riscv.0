Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0068BC36010
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/qIQcOuKW1p+PeLl5qyzI5dubz0GH46PM3Ff5K1pPk=; b=gI0xVkX/UY7snN
	bPCk5o+HMftDUX4E/TaRpKM0rzeSR48i05gWe2PJaHdwCfbcaMgjSUdc/DSQqgxwKZI+qsOma0xdw
	EdgPq3N5yQwCa5sj71R4j0ttcKWbKTw6xjmBQzVv9G9rSOsLNRp9Z6lhnur21xGXRR4HjPEqlE3vZ
	PnXG3Kq1/z6ENOeM9MFUQoww+M/JKWL1uDdLIieRJ32/1gfT45HmzdbJw8U2Hpxim33QSoYrvvpvn
	WAgafkHCGMnS+F4DlFjJCUU2jo69JVerxqnQJeiFC8wOrv2NQYH3qPTiHkuBvCmW8mF4bMbmWK4rO
	5toAi9CMmbAH1u6uAPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqs-0000000A4JQ-2dEy;
	Thu, 27 Mar 2025 03:24:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqo-0000000A4Ct-0CU6
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A48DF6116B;
	Thu, 27 Mar 2025 03:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C1EC4CEDD;
	Thu, 27 Mar 2025 03:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045853;
	bh=3gfnIph9uCsIesz2/eZBjY5uUxhC49Y5OAMyxkMwM84=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OdE/nR9CI3klUBzJkvcwzubPo2JqLkWklfyMGrcOkG9z/eP4JW4TCyCOA9/FBkAj4
	 zsdaPtS8fhB2iEUTpM/+dOGlBLCzJwSkCROx/KKDFWYEHIpkwnnwOZwBeABO6Dnths
	 fNL0C/zo4frO8Qfnll4nfuqTjG+P5grE1gNxqkuVbwHkDLxoJNM/uQAB3Df6qdSvbo
	 ZfccBKE/g9tU2H6PvVfWJVUfhbmzYL24YMHR5jzhhdZQw8Mi27QsxqRKlkEkskFZpX
	 89zv6YOYf+TOvtgfPV+/in0Eed5cpTXR7/QtStwK/gi+dHAwcN9vj/N8OJTKmKcT/K
	 Stvx3wIylkpYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6EE380AAFD;
	Thu, 27 Mar 2025 03:24:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: migrate to the generic rule for built-in DTB
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304588926.1549280.13236108388930132139.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:49 +0000
References: <20241222000836.2578171-1-masahiroy@kernel.org>
In-Reply-To: <20241222000836.2578171-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, devicetree@vger.kernel.org
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

On Sun, 22 Dec 2024 09:08:25 +0900 you wrote:
> Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
> DTBs") introduced generic support for built-in DTBs.
> 
> Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.
> 
> To keep consistency across architectures, this commit also renames
> CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.
> 
> [...]

Here is the summary with links:
  - riscv: migrate to the generic rule for built-in DTB
    https://git.kernel.org/riscv/c/82e81b89501a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
