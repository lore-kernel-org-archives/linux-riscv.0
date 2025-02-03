Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AC6C02199
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HrqmWKttH2vl7PEeeqTmSu3kCRhzcxtwLbYxPIJ1QY=; b=2D+442LibbROoy
	UtmqLozUbbdrtDUsy0JeAsX5cfEmUn1Msui4XjW8+WU9rRGDtTz6ZL3CO7ubGnDDVj4ENIvlf1vNJ
	K1/hNcMpPIJ5ZuhuoKcS2r+9FDiu82j2TLnN+CAIYhiWnUSx/EnevxPHz/6v6r7JK0SRXqtqQzPE8
	hgSexdkejNqShiQ85WXwv72payoVg5KdDBCdqXbjCbzVHwMzdI8UDhYF7b6/kjcF4qmztN4yfaKPt
	F/Nn3P+kGthsgH4bbw/4cD1Rw7bKU/zKv39VGFQ2IWsGBzcuJ06Hjijta6DCS6jHKqtgJVThZzkMB
	1RzdbDuIBtzIyp9t0iBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4GQ-0000000GiJ8-3hhx;
	Mon, 03 Feb 2025 21:45:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1v4-0000000GQLy-0m3m
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41D42A41C26;
	Mon,  3 Feb 2025 19:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC21C4CED2;
	Mon,  3 Feb 2025 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610141;
	bh=xz0jRw7fKEYg6LFccxDsRd+E/z4UDBdzHD1PSB2cIcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CP9wBOEdlHOYgvjLPcp91qUnJDEZViKBPU60bzI9y4BimssDzee+ISOo3fCR+xGWv
	 s2T+n3riEPV5hZxCWD/xlT5fSS7R5WD8UAcTVqxttDuEEPkcW9KhyzsLiSWCVOnwMZ
	 QAePmdT2lbGGYxd3/GIK/2fQ4rqVNTNW4EX0/m8ZVn723VOkwNOWlJd62GBSTFtdTy
	 8mBP3oXLVXaCfr5BiODU/oNEvaJiPAov1BbT9kC28BA/mFwW+brBtYekBcFjn4OUhm
	 cf1WwRp78zmH5SfhyobW1b5j4n0ZekFT6C+cbkbLpiRQbEwsMFLS+c71oCe7HhqVs9
	 ptLaW263k1jaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E84380AA67;
	Mon,  3 Feb 2025 19:16:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861016800.3409359.5303891262863199475.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:08 +0000
References: <20250113155306.1922992-2-ardb+git@google.com>
In-Reply-To: <20250113155306.1922992-2-ardb+git@google.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, ardb@kernel.org, torvalds@linux-foundation.org,
 masahiroy@kernel.org, linux-s390@vger.kernel.org, re@w6rz.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111542_281935_379BA576 
X-CRM114-Status: UNSURE (   8.27  )
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
by Masahiro Yamada <masahiroy@kernel.org>:

On Mon, 13 Jan 2025 16:53:07 +0100 you wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
> 
> [...]

Here is the summary with links:
  - [v3] kbuild: Strip runtime const RELA sections correctly
    https://git.kernel.org/riscv/c/71d815bf5dfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
