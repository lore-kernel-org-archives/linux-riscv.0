Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E221C28B20
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 03:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XmE9b4JqFNqK/iEBCrkSzzIWMsnE4Qw3cMXQBUx0P8=; b=AgfUK5v0qm3emT
	FpAdh8dIeNmygbh5IJd64/fqxA9rry4ZDZvHqcSQe1JRj7VfhT0Hbk8Dukxn3eJvcYq9v2vIk72Fh
	40OhRCPNoKsrnYOLxBFeYVtHPE55nRnkzsUL+k6NS1mMjnwf6kB2h1plqtVLRjkn1I8p+mxBwY4gY
	lG6hVcHOZhPvjJBXAQlhtIZLHwTXw94OxZV9QSovjDPoEJACm1D/gs0lu00+oIHbRUPuLKplJUnzf
	+8ZhuVc7sjR+41g24EdrRQVmD/bWhG/oWDljQ0ax3oAT6YE4Kdt/kRdxXcxBoaE53yJ6K6AB6yDrx
	GpDAgo2AE98NsyaqABhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz5NY-0000000GwNh-2Bog;
	Mon, 31 Mar 2025 03:00:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz5NV-0000000GwN3-1hIW
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 02:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4BCDA40A4B;
	Mon, 31 Mar 2025 02:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F00AC4CEDD;
	Mon, 31 Mar 2025 02:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743389995;
	bh=GxI67sniXYs1LInD4chej1qGwsAf613XKZkWZqH/aZk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HqauWL1cwCeDJhogdxw2H4ukxWmrd5pWOBjiIAr/S+FwntCxjMZwPMiqA/Y0oTF/p
	 hbD211vi9vnY4g2DTay9dmS5jJ7Qu3Sz5ph6Mu6bUAPVjlS2ZlDR/vntNww5qOEfbK
	 TL7ZzF/rWWb0BZ5Sw4ckqXaE3E58tiME5JH9lULKHLRwT/HF2zqrTsC13SefVe+/h/
	 JnBDzbPk3VPVLDViNNFnP37FI95dIgceI1Ysf4HvhypnXzP94e2fZ8eTh7wHjakovA
	 nFBiroZh3zsYPsLZHyy+AC9oUpr+B1p/lJELrkOx5Kdi6TKaCs5wL7h881bu/Bb5mU
	 q5QDqe8+GR0Ag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F59380AA7A;
	Mon, 31 Mar 2025 03:00:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: errata: Use medany for relocatable builds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174339003202.3660656.17286197691340909438.git-patchwork-notify@kernel.org>
Date: Mon, 31 Mar 2025 03:00:32 +0000
References: <20250326224506.27165-2-palmer@rivosinc.com>
In-Reply-To: <20250326224506.27165-2-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com, alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_195957_660474_957417A1 
X-CRM114-Status: UNSURE (   8.09  )
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

On Wed, 26 Mar 2025 15:45:07 -0700 you wrote:
> We're trying to mix non-PIC/PIE objects into the otherwise-PIE
> relocatable kernels, to avoid GOT/PLT references during early boot
> alternative resolution (which happens before the GOT/PLT are set up).
> 
> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/sifive/errata.o: relocation R_RISCV_HI20 against `tlb_flush_all_threshold' can not be used when making a shared object; recompile with -fPIC
> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/thead/errata.o: relocation R_RISCV_HI20 against `riscv_cbom_block_size' can not be used when making a shared object; recompile with -fPIC
> 
> [...]

Here is the summary with links:
  - RISC-V: errata: Use medany for relocatable builds
    https://git.kernel.org/riscv/c/bb58e1579f43

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
