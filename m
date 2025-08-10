Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E582C87FCF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bK2tJQRvroT9l4E8s9tRGlldB/P+X5B0f2SgE2W8wJ0=; b=NV2wg7XM5/C2En
	/AcQqWz/Zr+rhzBPpOruHzMuic/n/ct8qhCU5MYZhBqMJRg5+bdMCUxG4g4ic3GcyNsP3/9z0f4rJ
	pJK8m/vW7YxM+NaToVwpS9kZM/sGO283dLf1jHdctkkPHuVNUpkFzsXfsDChZczBfpFMhSon7d4AT
	pveFwLdcdr7H4fjzQ2ajOcgg4o5GpCxaOi9CPY+j+WcOrVwurZ8xehVDD3BGZzGtCUZtWL0J1iGxA
	u2Kq744rggE+TkP/dYhqdSc2CKuuyd1voNAzsUEe8Dp/5pq9OJbNR8DDKC6driqkeiqfPYCgrWK2H
	3A/8XEj3Yv7IR0O1qCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDQ0-0000000617s-083R;
	Sun, 10 Aug 2025 21:17:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKt-00000005zYn-2lcd
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A65143DD2;
	Sun, 10 Aug 2025 21:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CC3C4CEEB;
	Sun, 10 Aug 2025 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860331;
	bh=4I9I7RuWJ60qaM2pPz9O6+4tlk0mUd5Zz6Z6dLSxXgg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Mn1cEHXxgSXuqRhGUpKlOJIVubu5qDnDP2LXRFGtMut7PRd5GdakEucMEf2DqeYz7
	 RDqBvR+31AhfprLTEEka2QILFje+l3sZecwbxKK5zs3DH4M1n4tjB0WAkXeJGpa+SK
	 lhmnD+RLaJg8O53Gp4GVRqJrv7/gkCfUe1SD81TxH44DyfG1R6lJqvqznEpwwXRYan
	 e32YP63mu72RdBxv3Gl2OWkn//HUMWNX8M2J015KYr50kdqrIgAHjw+iOJ2auygygV
	 /jnjfpJAw1aCSOvKT5rLaJGcj1kUdTTgglpOTXFUEBEh0mO5qo4bGz8yegvUJqKjcJ
	 O+seXdQcM/rOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BA139D0C2B;
	Sun, 10 Aug 2025 21:12:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] Optimize GCD performance on RISC-V by selecting
 implementation at runtime
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034374.1221929.15171575812600532444.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:23 +0000
References: <20250606134758.1308400-1-visitorckw@gmail.com>
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141211_725429_E7D43C78 
X-CRM114-Status: GOOD (  10.30  )
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri,  6 Jun 2025 21:47:55 +0800 you wrote:
> The current implementation of gcd() selects between the binary GCD and
> the odd-even GCD algorithm at compile time, depending on whether
> CONFIG_CPU_NO_EFFICIENT_FFS is set. On platforms like RISC-V, however,
> this compile-time decision can be misleading: even when the compiler
> emits ctz instructions based on the assumption that they are efficient
> (as is the case when CONFIG_RISCV_ISA_ZBB is enabled), the actual
> hardware may lack support for the Zbb extension. In such cases, ffs()
> falls back to a software implementation at runtime, making the binary
> GCD algorithm significantly slower than the odd-even variant.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] lib/math/gcd: Use static key to select implementation at runtime
    https://git.kernel.org/riscv/c/b3d5fd6f82dd
  - [v3,2/3] riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
    https://git.kernel.org/riscv/c/26b537edc533
  - [v3,3/3] riscv: Optimize gcd() performance on RISC-V without Zbb extension
    https://git.kernel.org/riscv/c/36e224168721

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
