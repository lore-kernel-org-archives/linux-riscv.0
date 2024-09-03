Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B6CCD37AA
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bidyZnD0YuMaB2l92UDuo7arHCDbAy0Q+IK8spX50XQ=; b=iqV/W3b3XLb5sj
	wx2+jMBWhzCxH3t/iI6OZXFyC6gVmRxXnZyGEvCe2YsWLYSa2CW5NCUW9aqXFag0aW+2PExEgqSho
	xpkWxC1NbIOJCjvdSOPu/r6+wkC+5m6N5Fp7adMJlOzhYdqLFNYdfKbs0o8UgPbQE1azk4YVYyyEx
	kt9FlhgWgW/FFaXzWv73iKRf9Pl32T4lECZCYXVUy/9keXoXwpIi9akKVSD4OvksmD5xc5zSVIAL9
	T+SWYaS3g9KuKXFbH6B7PFpVzaLWMnBnaLRGqEiavoqqlWZU57gtxumMsnnR7ruoqCCU1AswwJcaU
	oINyVQ+oC5k4Mp6sY9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slYvD-00000001Z6v-48Ek;
	Tue, 03 Sep 2024 19:10:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slYvB-00000001Z5k-1AI3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 19:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31BE5A43DD9;
	Tue,  3 Sep 2024 19:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97E1C4CEC4;
	Tue,  3 Sep 2024 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725390631;
	bh=cWXGR4w2Vj6v4BISy6xoOQ0UL0iDK6UFZuzaOXitMS4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=byQd17iMj6Es28rAatIJPs77TIhIDYpKeZCcubxC6nx5XTvtbZBKVOk7rt3tcQjh6
	 GCPtFuE+U6gKIrbfP2R3ZWWuVnDSD6BVfhBB36PLrU4UlbeV7PCbIrzRMttxq5+lOh
	 /xcHYPL0RMkwRx6wky9VdNt7+yhQp1TG6lABz4Lxgsv+yp2NNDoNzVTPSuA90ko5XN
	 77ZV/c7tMvYqw4jpvlDn2Wwyoaxlrr4aEjMWGFtXcM3O5ROg6PaHnLcydeXuh5UZGO
	 xAKODkmqIY1X/AuJLS5nzWgoOPFYNh3hERBKYADxItvalEHhYwqfFTymiZOXJTNQeV
	 PrSvbcEf8t74A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AFE9B3822D69;
	Tue,  3 Sep 2024 19:10:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Do not restrict memory size because of linear
 mapping on nommu
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172539063224.409367.11306153899728878438.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 19:10:32 +0000
References: <20240827065230.145021-1-alexghiti@rivosinc.com>
In-Reply-To: <20240827065230.145021-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, david.mckay@codasip.com,
 stuart.menefy@codasip.com, linux-kernel@vger.kernel.org, geert@linux-m68k.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_121033_402642_B573D002 
X-CRM114-Status: UNSURE (   9.63  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 27 Aug 2024 08:52:30 +0200 you wrote:
> It makes no sense to restrict physical memory size because of linear
> mapping size constraints when there is no linear mapping, so only do
> that when mmu is enabled.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/linux-riscv/CAMuHMdW0bnJt5GMRtOZGkTiM7GK4UaLJCDMF_Ouq++fnDKi3_A@mail.gmail.com/
> Fixes: 3b6564427aea ("riscv: Fix linear mapping checks for non-contiguous memory regions")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Do not restrict memory size because of linear mapping on nommu
    https://git.kernel.org/riscv/c/5f771088a2b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
