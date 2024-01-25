Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF8DC48286
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+faCg51/rpGHvnRkHmAH8dRdad2R48WCBTlKsffTavg=; b=vnnHW2zzoSjPS5
	BlSe8ol4w3SfJBOdyQFmE8ZC9W+6Y79HXmBfIvAYvllbMc4L7qlRxV60R9hKhYLzhkS7xFoZZfr3Z
	DwMuUjq3b1W7GHdGAVUauwMI4QAE5YTJhTI/uxe8Rdy/26/vKnxbdGm0J2QTzGlmih9JQeZ/mb9C/
	2hwOWlFbhSDiZzJ01pobsp3F21uxHzrzDDVTixoI4vfRRyYt4WuXG/QxnywENT0hHeHHeNSQtcDF6
	kdWKoeYiPFfj6I/y8qHBFduXeQZ3SRHhBm2qq/HqOSclgD83hvFhotYr9F8XkXbBihemkbdvvAfhf
	E5syv/HSRfCq9Q6T3Rew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Iu-000000020PG-3k3Y;
	Thu, 25 Jan 2024 21:30:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Is-000000020NU-2vyz
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B51F6231F;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4451CC433C7;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706218229;
	bh=wrgUPoOJ4HD3nsO2w4LJrxQ73MuL5zYEqj4uUDLdhkY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZgVnWqlsIp6YEf9U9yaB4UEMa1CX5af2w3FpOae+3UJj7iJx8WN0kV9pHC+pKxB2/
	 6bWc3v8ZG8i5QELCWMQrXQrSERoHHD80R+ofmm+VbfWoQvKi531fU8RqLvT+ZA33q1
	 dGKLNQ3iBG/HfD/K0EkYl0BAjDNDphufUlzVMuQqlFje9Db/h0Av+GcJdpHaljeVjK
	 MrHFNiIYml7uzsTAutkSvSrUfbjJsTxQutnLGbtSdeF8pE/NObhKLM46VIEfBKh8K3
	 2hqIerJysZiZWD+8AY/+J0bKXSNhy8/82a6FJQpuzktubl50pz3sMEDellBgsoBfSt
	 sMFIZNVpun0QA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2CF59DFF765;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] riscv: support fast gup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170621822917.6239.16632170403831651230.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 21:30:29 +0000
References: <20231219175046.2496-1-jszhang@kernel.org>
In-Reply-To: <20231219175046.2496-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, will@kernel.org,
 aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, npiggin@gmail.com,
 peterz@infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_133030_797143_ADADDE02 
X-CRM114-Status: UNSURE (   8.55  )
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

On Wed, 20 Dec 2023 01:50:42 +0800 you wrote:
> This series adds fast gup support to riscv.
> 
> The First patch fixes a bug in __p*d_free_tlb(). Per the riscv
> privileged spec, if non-leaf PTEs I.E pmd, pud or p4d is modified, a
> sfence.vma is a must.
> 
> The 2nd patch is a preparation patch.
> 
> [...]

Here is the summary with links:
  - [1/4] riscv: tlb: fix __p*d_free_tlb()
    https://git.kernel.org/riscv/c/8246601a7d39
  - [2/4] riscv: tlb: convert __p*d_free_tlb() to inline functions
    https://git.kernel.org/riscv/c/40d1bb92a493
  - [3/4] riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP && MMU
    https://git.kernel.org/riscv/c/69be3fb111e7
  - [4/4] riscv: enable HAVE_FAST_GUP if MMU
    https://git.kernel.org/riscv/c/3f910b7a522e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
