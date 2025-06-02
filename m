Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD51C5B549
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QelF5QOZOb05WnXC+HmrFv+U5jyUaQ1JpjX2OopEJY=; b=1uveUJ71JPHyXA
	Va9X6nGMTq2Ti8o7k+Y15c+YMudIN4Ep1kOlwg4SEEodGZlaq5q89g+Ju606jJUYkjBvx0I/oTcaQ
	voChmLsz1lI3rHLTcSjNfWmkExnDj5AEz8ym3zkHgk6BX/SEwQg/hzSzLi2xF4z4GHY2ltQiaoiwX
	JdMxDF9eygO/0QkjfHvtf3h6ShGyUKFaysZ25k3B5bqGB5Yj6QKOaZqK48v9mQFMUN2iF/rZsABNc
	IqVwBCW6Pa1HJHOZp0vXFU9N4slaVOwk/D/GKUjbQu57ekz0dLwbrHX8MpFbujraqiA+Q5ThkPukL
	BHMXzcK7lSJCvV11AKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO8-000000099iQ-1NDj;
	Mon, 02 Jun 2025 22:12:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO5-000000099hO-3hYQ
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D0B54AA38;
	Mon,  2 Jun 2025 22:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E513C4CEEB;
	Mon,  2 Jun 2025 22:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902329;
	bh=Yqcn4giQRzb9AQrWT1Ez4PS7LHxSwznVJasaR+yuL0M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UwqjB+F3PqOV7iKXoJ5tx1uBjdvtybjceIA3+8bSoFfQBULCVMHWD75LEKXATdfUc
	 Kfjs4zZpyIMKc/V4gYa5+0/nvDbWJBo32NrCsOVIOrNVXiyW7riVyjQKGgmqhyBFag
	 gTN5e5vWUAwkeNgXmbFBHKoy5E6KPSwCYhUsn5XXnH5+XXeuzJF+L7VRqHAehQdMG8
	 EUA8eeCZTfmcR9HsUHknf+blaCXgg8Xq/NTaGoFeI1gZVL/mufWse4MeZ2Fooi0Xut
	 l6u1OfW37Kp6SGp1EEnc08U0d7PWm30iQi1g+4NCLoH7qvlyocyk+T33SP/IGL/gFt
	 w0LTz4aaxrQGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0F0380AAD0;
	Mon,  2 Jun 2025 22:12:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890236147.925497.13173014055651849610.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:41 +0000
References: <20250409171526.862481-1-samuel.holland@sifive.com>
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, alex@ghiti.fr,
 ajones@ventanamicro.com, pinkesh.vaghela@einfochips.com,
 pritesh.patel@einfochips.com, darshan.prajapati@einfochips.com,
 aou@eecs.berkeley.edu, lixiaoyun@binary-semi.com, charlie@rivosinc.com,
 cleger@rivosinc.com, ruanjinjie@huawei.com, mcgrof@kernel.org,
 fido_max@inbox.ru, rppt@kernel.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_151209_949842_0D8495A1 
X-CRM114-Status: UNSURE (   8.29  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Wed,  9 Apr 2025 10:14:49 -0700 you wrote:
> The current code allows rel[j] to access one element past the end of the
> relocation section. Simplify to num_relocations which is equivalent to
> the existing size expression.
> 
> Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/3] riscv: module: Fix out-of-bounds relocation access
    (no matching commit)
  - [v2,2/3] riscv: module: Allocate PLT entries for R_RISCV_PLT32
    (no matching commit)
  - [v2,3/3] riscv: module: Optimize PLT/GOT entry counting
    https://git.kernel.org/riscv/c/e9aa38ea39b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
