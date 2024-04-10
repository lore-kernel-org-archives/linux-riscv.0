Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23781CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiNGWW09PyoQwU4eDjVXMPUjtMZoDGGp9dEsRAIT0xE=; b=HYnzUodimT3HNt
	NWUh9zZ0EcSZyCFlv2TJQWLCSwWyItm2zL3LqSSGnsszUVA07kJLsGbFXfgMAaw0TMNuCmSsD3+88
	R3wQ7p+i2gqRIkvRvbEkFNOa5voziWCjwNa2nM9IGJ4AmF2PqdRYAEV4aMXnUatTxJ1Spj/Qbci4k
	uPNjeEB3QrDdVfyc9pBov5GE8rmGJoR3G5TiI7ZsAm6RUJkNL/Pg8et8Tk93jGJ5cj0mXmg3TAxl4
	3ar6eHXhkbXoBJeWUti3+fNTN4wuG1uw4969eMKz43ULHHDB608CtxoqXZ0MpHSUPbuWAXdjM7+la
	aJ/t+CYQGS2WbYgoq/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoX-00000007R6x-3pZk;
	Wed, 10 Apr 2024 14:20:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoU-00000007R3g-19J6
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9A6F61DA0;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6366CC433C7;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758833;
	bh=eC+Z9N5ahPdK92RFfh/c+mNGqNL0+z2FsfyJ+SMTgvo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gSgTtKc4jIBQvla84kxwNpeU6lyHv4ZNr0YSikGOIY4aRJaMKZqBxI3F6FPEwqDHB
	 4O0WLOqbqwiZ2c+LI48F9A/FSv5YFTqyLz500eeqx8vqy8P7/9lq/Isfc2eqG/cytQ
	 XBk/B9vueVJPwT5EtfVxir3rssao85wYThEeUMpItManb71hnlHe/eRXXzHRPQcofA
	 sP4vYck9sSS/pu1n7iSUxiYEAl1OEyCxCuuEtjemSHh+7s9DBcS+pKI6H5pe3G5YxE
	 LOg/TORLO2U2bxc9MwF90J85TOxW1TpIPI4ItBvqbp2TJpMKI3XNd1JDMwTi1uCv5u
	 6ht5FKZYXUkXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53B30CF21C4;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] riscv: 64-bit NOMMU fixes and enhancements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275883333.18495.7159115515897564807.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:20:33 +0000
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
In-Reply-To: <20240227003630.3634533-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_072034_408380_BAE38DBD 
X-CRM114-Status: UNSURE (   9.43  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 26 Feb 2024 16:34:45 -0800 you wrote:
> This series aims to improve support for NOMMU, specifically by making it
> easier to test NOMMU kernels in QEMU and on various widely-available
> hardware (errata permitting). After all, everything supports Svbare...
> 
> After applying this series, a NOMMU kernel based on defconfig (changing
> only the three options below*) boots to userspace on QEMU when passed as
> -kernel.
> 
> [...]

Here is the summary with links:
  - [1/4] riscv: Fix TASK_SIZE on 64-bit NOMMU
    (no matching commit)
  - [2/4] riscv: Fix loading 64-bit NOMMU kernels past the start of RAM
    (no matching commit)
  - [3/4] riscv: Remove MMU dependency from Zbb and Zicboz
    https://git.kernel.org/riscv/c/9c4319d69744
  - [4/4] riscv: Allow NOMMU kernels to run in S-mode
    https://git.kernel.org/riscv/c/f862bbf4cdca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
