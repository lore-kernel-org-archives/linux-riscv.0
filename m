Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1463C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDzcLexeUOsQjd2asBFjZdHQtjyCk7xhJEiaEX8AKvs=; b=TU4FU2gPnEMNWI
	7mmEkolFUssTo0ywlZeobvWg5r+dH51QmAYuchR3Hj+Iw8L/s71cofjFKnLJ3BvRczesZD7lrHLcg
	6rdG0Eok3Y9AJnRDAZNfwmRMUC7F1SLDEtF2eWNHGWdDnfr3hR9GTJihvELes2ix1pq7liDeseSAG
	TfUaEdU6VZDMnmiJi+OIWJkk3PE//hbIW0TNsXK09/rc+xalA71rXQUBEfv4Ju+JkUcgM08Y47CVc
	IrK5CS9OBBqNS7bcL1vkWqjT+czUM0kDdA1g4PvASQd9CVAQHEohZv/znCtFYrqDjeTWVANBIMPnT
	CufcZYvIdevFu5CaB3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiezz-0000000CQBG-0ojM;
	Thu, 13 Feb 2025 19:35:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidyY-0000000CFF8-1Iqg
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1A275C5581;
	Thu, 13 Feb 2025 18:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF95C4CED1;
	Thu, 13 Feb 2025 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471414;
	bh=LbJsYBJf8L7DxxyGxGKNRl8qtKpCXI3bcWDOVFwM90o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=raI6eUC3hk1EOIYdriSkOYSsyVIHfIQU54wKk+5d/JOH1+XbNKiMwLYlgrkR1e8af
	 1vE3W0RP7KG4Sc3ynWEVQWmblFK82eTURqrYOBbt0IWq6toebsqwR6ezVSyfcQrOLK
	 vX/gHHAOFUkh9vIO67CLL+foZlpXRfero1qvFGmBQsFhqTaeyWu9knpaIuCAxFdkeD
	 GD4TgSJ2J5Hkr0QhiU8aJ91HvrSxyy1H2TpZj32ZBAcslDALng3tK5D3daYSCxmTtU
	 jPkERF2mps28ThQKIslys4xgLfT8ZwnP7Je2WH4bsORza2NioETZ1BiFMuPqYw2j9o
	 97x+HfYaaZdfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C94380CEEF;
	Thu, 13 Feb 2025 18:30:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned in
 arch_cmpxchg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173947144300.1330575.4364486946556377842.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 18:30:43 +0000
References: <mvmed0k4prh.fsf@suse.de>
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_103014_419214_6988B040 
X-CRM114-Status: GOOD (  10.78  )
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

On Thu, 30 Jan 2025 10:25:38 +0100 you wrote:
> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current.
> 
> Do this in three conversion steps.  The first conversion to long is needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.  Then convert to int and back to long to always sign extend
> the 32-bit value to 64-bit.
> 
> [...]

Here is the summary with links:
  - riscv/atomic: Do proper sign extension also for unsigned in arch_cmpxchg
    https://git.kernel.org/riscv/c/431a3bbd3249

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
