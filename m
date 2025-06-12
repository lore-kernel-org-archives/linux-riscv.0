Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B9C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=621dK3fv6W75OY2EI6/OlbBpJXq+W0Sw831T6ZYMeXE=; b=eqMoC5442CDTen
	fb04k1G3DCdzD0qe8U9LsHNrpMN9vXAijT22RDeu5PSDR/YWwYcuQ2Rpo77FoA2Kkz6M9p28XNJeU
	8Iwa4G5vH9bah2kauuvXINu3b1txnyOPdvBVGsdoJOWZiWin1T7SOw8Upc/q0d9ErtTNW6WANt+Ll
	GkjmtIIZufUbB4XD5FoKMwicUzkCq0rMNDguT8Lu2Blg/EfdaxE0qaDysCcw/m0n4ryxSXuYEXimm
	SLfTRIpS1hQguwpKREIloSSx5GjYyC0WN/XlS1dgBmCBTewFYmpendGgFFB+sdt86aPEviVkXBV2N
	n2DrIIqYP9hSkwO4sTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqLS-0000000ElzK-34HG;
	Thu, 12 Jun 2025 22:24:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoFM-0000000ESaW-27YM
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBA7E629D1;
	Thu, 12 Jun 2025 20:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8A1C4CEED;
	Thu, 12 Jun 2025 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749758999;
	bh=h3SWo4iyPnxhKBul5w4sXO771QR9wJ/uYDRUrkUV274=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TkiG91Q+sqJi4gKL4uXnOYBHaSYm762U8JZW43mv+NXfxHKO+UELAmA0P6mAbmIJ+
	 R3TNmLP3TS1CUvPIL+kMIl+MmWsp7Z2DMsteka02StNHR1PN08yl86GppCJpf42RYJ
	 5kFfAPKQ9rh4oK2FcUsmlUrJZ0H9VUlNM4CHVgv2ZSWTUkgkhAdVKJ17IPJeD9jSNl
	 FFgj9oGBDkR8R9cE8bDirPkM/lWfv6KGDK0A8pUbCWlETQTqvoJo/iMqzYLQNEfyM6
	 Y6uSaUGs6TgYXkdal/GuHYZNdEA3bVZDsjyX7LDUvRFgWs1GBzsAvssPgO8oudV0Ma
	 T7nicBnd9OyyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCEC3822D43;
	Thu, 12 Jun 2025 20:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174975902950.88969.8261130277132452105.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:29 +0000
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
In-Reply-To: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, jesse@rivosinc.com, andybnac@gmail.com,
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 23 May 2025 01:27:01 +0800 you wrote:
> Fix [1] save/restore vector register error
> 
> Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  arch/riscv/include/asm/vector.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Here is the summary with links:
  - riscv: vector: fix xtheadvector save/restore
    https://git.kernel.org/riscv/c/4262bd0d9cc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
