Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282F1D74965
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5a4g9rFaFJs8zKGqrXtQ6qAIVSPruTarwiQKz1hhaW0=; b=weALZ6LheA3AKu
	7Do7Kdqx+T7VK+JuKeGmMZS1oQmnDmIuUORJOxp5uXiRhCb1ag/I8Pra0VlGWbtAoUwT6a1xKbnH6
	mvMCheDQJtCj18cVYiQQ6uhqVnQyW61PtCLxtksMmmMN3VBTM6/IJHLpjV5lTn4sb0IjGU5hO/hOK
	EKthMd7WdC2bbvzrEo8RNPMeEJYj7HeUy/HX+8PrdJj6JHpEVasqHTodrFiGyYWSgd4dM8aKFjzE4
	xJt3ZqROXccvllYFX+h0h5qY+nWpyvr8dYZTwf6/EOEnYs8IMlWbc+rqBzI3EFmIUClcLsud4wVEC
	r/acR0tGhT2t1A5yYGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbx-00000009ot6-08mF;
	Fri, 19 Dec 2025 08:13:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbu-00000009oqp-1eU0
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16D51423D4;
	Fri, 19 Dec 2025 08:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE87EC4CEF1;
	Fri, 19 Dec 2025 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131994;
	bh=3zl/56H/K24PqgyUMly6UtCFERu1bJrljv0ZNQ1LGu8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cFje/mhqfNnpCP+maKnRb1asxmEumXuGUyJVa28M9MckblO19pu5vnkOYqFrWpzsc
	 K6ppcQ4od/9DN5xE5XKTLOP6IO5dk1NhQROgd/PROGX16jYlqZBLdsrWFYGrvIJlFR
	 A4C0ovSjMHB7Qf8f8Mvnt91qOh5tqzBu1p5AbGBgN3Qx2n4NAWtLfBxqN5tRua7qut
	 Drz+8R1DyTggObcYKgLhWJlvH1kfM7E4vBxlkyit3v3hgq6soApTJ3f8dkKTgS+/oN
	 D2bYS8obb7J4pslp/KTHEb/TIWM7aVyBwMjjFB+IbrVZyBhyJtCB3Pg3lDpqDBy1Db
	 zbzAXt2Og0//w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B933380AA50;
	Fri, 19 Dec 2025 08:10:04 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for the v6.19 merge window (part one)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613180303.3684357.7185705179017766090.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:03 +0000
References: <6b437742-e1c2-f6dd-61c8-fb3de45d3351@kernel.org>
In-Reply-To: <6b437742-e1c2-f6dd-61c8-fb3de45d3351@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001314_479940_AEF27AD7 
X-CRM114-Status: UNSURE (   9.54  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 4 Dec 2025 12:19:20 -0700 (MST) you wrote:
> Linus,
> 
> Please pull this first set of RISC-V updates for the v6.19 merge window.
> The patches here should be uncontroversial.  They primarily involve
> probing support for recently-ratified RISC-V ISA extensions, kselftest
> additions, and cleanups.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for the v6.19 merge window (part one)
    https://git.kernel.org/riscv/c/07025b51c114

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
