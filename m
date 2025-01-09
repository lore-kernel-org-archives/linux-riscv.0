Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EA8E7719B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOV6UlqlV6Z1apX2xYfXdqB8j2q5HbhWT9PQM+SQXc0=; b=IU2kGnLRpUr+XF
	VO5CJ5493IOoQ2JAkZ2ANMaOPrxpCEUVA1OmN1V10ZvP/hbc9rv2fBiCgOwKw8uyTloFuovrpFWCS
	uVIJKN7EqWe6KZGJjTU+zAcu+SADDnZjnjLbNgdlXH6g13y3FU0I/lxeACK32PWTh/J71jKFR7K1Y
	gnAAvkD3deGOEKMUfAZtdBIUy6xNzQyQntwFg/7SN9ipokAMsE8jPumFtsXlrJt46ysy0ZnRG4IkD
	AgGx3+WpP/4+Jh0Z9WobtfTimIlxpWsGMmNXj51THj+hQrhsP0cMKUC+2+loQJ2xEVENieM7dvorm
	Cws16cv5biHIOmGDeQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCw-0000000Cdll-2g8C;
	Thu, 09 Jan 2025 16:16:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCt-0000000Cdjl-2rGP
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 347D95C5C8C;
	Thu,  9 Jan 2025 16:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054C3C4CEE4;
	Thu,  9 Jan 2025 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439387;
	bh=0Q6MXujSGz6yICRaj7EkDAKrLg7PVKbwO+jva+Jk/Mo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HF284ZAkF2rZPyTN79EVs+NHha/78Sv9QRIdJ9649jlA6+z3Pi7N5C8rsWaSZ1bor
	 9s1NT3ZjdzT8dSsSRhk9L6akarJOLNDg1OVsBBsBE8gxGGKlty6Ia4CdvqUF1N+h65
	 hM/eJKF7Jvx7NExPVD3blCcWMutSHsT0eRr4ulaXLjOIPoEyIEnl9mcsW09JuCdd10
	 pph1PfVCz03IRzAzdN0FypQn0kwiMlULcudCavL9+TYcSnXOlw98QKOnDWGiN/Q0np
	 wjpQMBPUQASwIR9Du6J8ssct5+SGLAc5GoaJIuxkGifWe5Cag22HnIPZTA5poLZkSI
	 RLmllkl1cs3ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE29380A97D;
	Thu,  9 Jan 2025 16:16:49 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v4] riscv: mm: Fix the out of bound issue of vmemmap
 address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643940874.1375203.8254463448578997209.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:48 +0000
References: <20250103092023.37083-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250103092023.37083-1-luxu.kernel@bytedance.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alexghiti@rivosinc.com, bjorn@rivosinc.com,
 lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081627_753563_2BF172DB 
X-CRM114-Status: UNSURE (   8.45  )
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

On Fri,  3 Jan 2025 17:20:23 +0800 you wrote:
> In sparse vmemmap model, the virtual address of vmemmap is calculated as:
> ((struct page *)VMEMMAP_START - (phys_ram_base >> PAGE_SHIFT)).
> And the struct page's va can be calculated with an offset:
> (vmemmap + (pfn)).
> 
> However, when initializing struct pages, kernel actually starts from the
> first page from the same section that phys_ram_base belongs to. If the
> first page's physical address is not (phys_ram_base >> PAGE_SHIFT), then
> we get an va below VMEMMAP_START when calculating va for it's struct page.
> 
> [...]

Here is the summary with links:
  - [RESEND,v4] riscv: mm: Fix the out of bound issue of vmemmap address
    https://git.kernel.org/riscv/c/f754f27e98f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
