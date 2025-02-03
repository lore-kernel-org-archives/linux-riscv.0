Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69183C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbQWe6OBmOQdq+cHWMWXPlMithUMliyFs2FnnlsvwTs=; b=QEmk3MOezmrIfF
	Fs42RSVMGPsRtEK41pHBg7XLxsNzpq4aTKTKlB6M3I9xUCwE5OYhKtIe/Klipc1vcDdtOwKj53QgD
	Vm7TDq1okE8cigBUSnjSCjQEl/zBq0/4BddT7sU3Z2EVWcMCgAp6lBDzgke+wuTn2Sp0VkbSM7FPX
	nQ5DwXUJW4My/NiLxbEyplnHmeG5US4h4CHoxCzl8VYl1fC8UiOR/9Xj7eFjO5SPfqOu6l9wGmdLx
	K+DM7niCD9hJlV/ItLLORhAEZoR2Pr4GaWJYHmWBl8Mc8MaUogvXyS/R4r1aSTXfUF1gew0LAOJEC
	RF9SQlDmkSD7aX9/p28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1zu-0000000GS1R-01oN;
	Mon, 03 Feb 2025 19:20:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ur-0000000GQGG-1g5Y
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 127805C6891;
	Mon,  3 Feb 2025 19:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A335C4CED2;
	Mon,  3 Feb 2025 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610128;
	bh=G71XgD6NBttNoh5ePrRcBF+6xM6ctRI91NRyBpdswK0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZluC7SfbnMeE+VOg8JwLzooSY3dCbr72C9MRFkgwlmd30uv8ConOhriUQ7soaM8y+
	 mef8HwLZhwfSng50uOZgz1nCDsQDdYVt8WKpJVVqaDzef33NLiz9cmPChlqc1SmyhR
	 dBvI2v9l9GEHpvCiOx9jdW738UgsUZHqP2AFr+6AX65hydnqDcbgveKJr1ycS913rm
	 jxlQEef9ETeu2JWrTmDdy2pOvfFnasyhWXahs1tF0jr2YDWg/pmyZftQ0f4z1llkAP
	 bhYBMZayliLbA5y5G9TRmo5/HqBZ1SpoqCWkTZ5p+sScyxpiEYo0wVboG8snoBb9ec
	 O/JQl4tLSoFJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3BB380AA67;
	Mon,  3 Feb 2025 19:15:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND 0/2] riscv: iommu: Add shutdown callback for kexec
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015549.3409359.6278773851647840223.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:55 +0000
References: <20250103093220.38106-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250103093220.38106-1-luxu.kernel@bytedance.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, lihangjing@bytedance.com, xieyongji@bytedance.com,
 guojinhui.liam@bytedance.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111529_506322_47B108DA 
X-CRM114-Status: UNSURE (   7.49  )
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

This series was applied to riscv/linux.git (fixes)
by Joerg Roedel <jroedel@suse.de>:

On Fri,  3 Jan 2025 17:32:18 +0800 you wrote:
> After kexec, the newly booted kernel can not initialize iommu driver
> successfully as no one resets iommu state before kexec.
> 
> This patch series supplies shutdown callback for iommu driver. The shutdown
> callback resets necessary registers so that newly booted kernel can pass
> riscv_iommu_init_check() after kexec.
> 
> [...]

Here is the summary with links:
  - [RESEND,1/2] iommu/riscv: Empty iommu queue before enabling it
    https://git.kernel.org/riscv/c/8d8d3752c0a4
  - [RESEND,2/2] iommu/riscv: Add shutdown function for iommu driver
    https://git.kernel.org/riscv/c/77a44196abfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
