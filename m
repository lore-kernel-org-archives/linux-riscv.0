Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CB1C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnC5q7vjoV+A/UwVMVJj257aiU19o8VAnUa6Nf8PC0A=; b=eXvkPptWrch9BO
	M11gXmdxmumdHdktBmh7AQiN7hI9Vy1oKOzMZ2DIrjsnnuai89+IvRVxEB6XAxm26YcghFAWmyqxZ
	owV3yu7M/h3xbPSX6Z75yC3lAWdxkNiBP+Ha9dFr/whgmcTS2pWBOHX8DQCT/xdrO64oD4l4H/cQI
	nt0OSvfC2B/8acJ2oCf0wy0hfVlXYJhCpcsUgg1kH2JbCAy1RwqhxUmKpPem5n+QsiMlTWafmQh9T
	WJy2X2pW/p7Kez7/7BuOsiSZaALufeMYH17i8pSQUInubdXf0UOiMpmGDJZh5YDS+pwbS2tptOQev
	2avwAX1Bo59tdcHd82vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3r-0020t3-0P;
	Fri, 12 Jan 2024 06:30:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3o-0020sA-1O
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 06:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DF3B61CE5;
	Fri, 12 Jan 2024 06:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E491FC43390;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705041030;
	bh=LbaA4ELxB4Skp90Iisn+iilsYgOn1rWzAtL0zKFTm4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UVQtSdT5l8au0eoMDi0L7Lu1wT9wWdEhEPhjCtFo+7hd1ELxuN8fD/Yjp/x4yeBzs
	 LQfUH9o0NG55zsOcj21PGy9fAc+0mMyi7fJrd58eGsKc5GrIHhSOn1sxv66Ye16qrM
	 6WTO3wHbJAzb7UV4oHH/nTjtYW4kzVQjvJ20fnbOxK+q1+yVDlOzw12aVRL3zyajYp
	 0zbLhQbKf4BqJWf/KXeNCgs9pPIiw5FeNKQ17GNPuvHRveDmBMPmHhsF3NQ5i0zM9E
	 GwOCnS6DDWCP4WRbaXnMbYoDCAxnafIvVVrG1zKB/RSPFjq4QN/uZ6zZSodm6iZcNT
	 Ic4gfqr9oDQeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CDD6FD8C98B;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix an off-by-one in get_early_cmdline()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170504103083.17535.2134276105681461724.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jan 2024 06:30:30 +0000
References: <9f66d2b58c8052d4055e90b8477ee55d9a0914f9.1698564026.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <9f66d2b58c8052d4055e90b8477ee55d9a0914f9.1698564026.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_223032_537210_93782E3B 
X-CRM114-Status: UNSURE (   8.47  )
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

On Sun, 29 Oct 2023 08:20:40 +0100 you wrote:
> The ending NULL is not taken into account by strncat(), so switch to
> strlcat() to correctly compute the size of the available memory when
> appending CONFIG_CMDLINE to 'early_cmdline'.
> 
> Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - riscv: Fix an off-by-one in get_early_cmdline()
    https://git.kernel.org/riscv/c/adb1f95d388a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
