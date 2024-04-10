Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F1ACD1299
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXWnGNBNhf/PLng4NLaSvvI65He2XC1C27dZRQpt9gU=; b=hWqAy0BcCX33JH
	3gaBMKqApE/O9hKjgzr48PvebUKKoakB65rsYqYkAjjtq3MW3EyzWDDlsPQuyyh85/7qxaCp4lH2d
	zhib0rCQzc/Zm7OXSq3i3LVQEZQZEajXYJ7bu8M8tttNm3W9gWMkuzpN7zGR/KTNfgmr95k4MM6nz
	Ol2sAWcmjRcioy3msgOtu2SQ1UUgKrEZfVD8gndGXw3ESGWE0hWBavwbrxA2+PBNEwBrTNgMzfI1Y
	ANphafmIX6j44ileXm4Lj4njvQziRuFlf3cyvDRN0BtkiOkaJEYaMs4evriSvLMMxc6MgO3JybxrH
	9FgWxqiZU2b2aHQBQX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYeo-00000007OR4-0XLs;
	Wed, 10 Apr 2024 14:10:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYek-00000007OPA-1x1f
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBB1761D72;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57F19C433C7;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758229;
	bh=pA2puDfsXBvwxZQ8Kq+VZtCBdu+BVDgjdRVe7SG11Mc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a7uAUX4KZ/UY8dG3Usm2Qf3HmQzaXTXlc/s1+Udy1KBMBMcibRnHp5KFeTwPM1Ul6
	 u2l0YcUu57K0c8f55z1+4ChI2e89Aa1iZ0mrcxKHFN5+ghDyXbHcd0TjJEmBXJ5OpP
	 yMvETvgC40y/BQWipNVYl3ESaJuE00WPRcUtkQVqN+A/apcjq/Fh316GVcK6Tw9OjH
	 Yi7XZcpBFMgf51JZC05yDDWjQf2BE/KeEeYAbgJ6QJvXT9h5KWMQizW84k3/nY1ycg
	 8P00B+w17yNfPqyaJZyJAV426aR5mQ4mhXk0TuLIvZ6kYvHWHoLAg/Vsj2hxD5ClXS
	 BCdKX1stOCFHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45BCDC395F8;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Remove unused asm/signal.h file
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275822928.12683.16257664003820380019.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:10:29 +0000
References: <20240330111308.2053965-1-shorne@gmail.com>
In-Reply-To: <20240330111308.2053965-1-shorne@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bjorn@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_071030_575503_E6E21F6E 
X-CRM114-Status: UNSURE (   9.95  )
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

On Sat, 30 Mar 2024 11:13:05 +0000 you wrote:
> When riscv moved to common entry the definition and usage of
> do_work_pending was removed.  This unused header file remains.
> 
> Remove the header file as it is not used.
> 
> I have tested compiling the kernel with this patch applied and saw no
> issues.  Noticed when auditing how different ports handle signals
> related to saving FPU state.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Remove unused asm/signal.h file
    https://git.kernel.org/riscv/c/3dfbd2d26b64

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
