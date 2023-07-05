Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB75EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvpWXddWNhEmVOeQ19dLP/V6EmHmbRl2WhKYcaVjqM0=; b=Dmp7epTVPdE/+a
	GrU7zNFFPJZdEmR1nrjj0j7hyxlc7SwVxJ1DHq8Kk3VK6yjLgFBpHYKpP6QX22Dt1sDy28CRXwMzg
	iYIVEi175DzCEuXj0QmDOPB0XGLLK1K1N2MFeLUuyzZy295857vrkUYI4cFkd1blg2iUy7EoOjGSl
	lWSL4Nx/xZlBv5/Ka/gG2Vvx5x6I/7a6la8VL0K/82jK8RSSmfM5Ng1C4wzKkst0CeiiNhV8goY1V
	c9XuHr0/th41XdUG8fugWM5VFUZnaPP/9gpiKwbnCsrN+B6ZO4zT2sDvmKB4Qvwdz2IwhiPKe8Gkt
	xoQPnG9IbKqZf0KFOe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGU-00HONs-2Z;
	Wed, 05 Jul 2023 23:50:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGP-00HOKO-2h
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:50:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7FB76181D;
	Wed,  5 Jul 2023 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2095C433CD;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688601022;
	bh=9NFWdwJNIstdaH0oAEUO6KbS94hWTIY5zq+U3/Spqro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BmCIKFGq9I5f+C9ruqceN42hW1bwMXVJcwLjzh0Nl4Rr7aq/Mp0ZrWvZjJ188Qagc
	 gweAnMXm+J1v0V7CUXZiwK9tb99CLzbasGFu2XGSVtIv45rdnIh43TrXiuRjrl2hHo
	 2HW2SGYeZb5mtCaH6vTipZCZ5K54CSDHkyuD4qG8B+4Wr5EpeWI00d20bhXpefCuic
	 wQZq7GEtIqUmQwoYydr9zT0vfy3nC64o67vy9fSMG0hdw6r4pJJYhBfo42nZeaVLd9
	 bkFPNc6ubnpDKv3z7LDiH7ydK7spYEbatxuVkQUcVnECRgpz4ua/bDS0Ykoewm0o2M
	 FSXm5wGhLaENw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A44CAC691F1;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] mm: riscv: fix an unsafe pte read in huge_pte_alloc()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168860102266.23922.10126828574164842204.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 23:50:22 +0000
References: <20230703190044.311730-1-jhubbard@nvidia.com>
In-Reply-To: <20230703190044.311730-1-jhubbard@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 aou@eecs.berkeley.edu, alexghiti@rivosinc.com, ajones@ventanamicro.com,
 hughd@google.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 panqinglin2020@iscas.ac.cn, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 jthoughton@google.com, ryan.roberts@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_165025_917664_43819478 
X-CRM114-Status: UNSURE (   9.78  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 3 Jul 2023 12:00:44 -0700 you wrote:
> The WARN_ON_ONCE() statement in riscv's huge_pte_alloc() is susceptible
> to false positives, because the pte is read twice at the C language
> level, locklessly, within the same conditional statement. Depending on
> compiler behavior, this can lead to generated machine code that actually
> reads the pte just once, or twice. Reading twice will expose the code to
> changing pte values and cause incorrect behavior.
> 
> [...]

Here is the summary with links:
  - mm: riscv: fix an unsafe pte read in huge_pte_alloc()
    https://git.kernel.org/riscv/c/62ba41d27612

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
