Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0479C3601E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrTFRoigsNJdHlMmU8UpWlMSFF16+otET+DskHDyrf4=; b=XRP16NEYr877zV
	UI7zkaCoLUp3gn3gH7jDD1EL48NKtM0mLjH04IIp2M74qzUs1BmnNZ0bvGnrz3bO6Jm9eIJxlQy6E
	2img8SlYculBOCSWhrYteEnO03SfDou5yIEG3Oe7dANXhhJ6qjR3POzRzV3hlt+HUTiwyY36JnWYG
	fQJmL8uBDSLxGPR0lEmRnuF8q5MIfhgFUu/zbiXk1gdRFDwySGkTziVvpNqNurf39IqAERoaedWzy
	nx/GdWZkGeqam3X5qnGYdsRrruAWbbTYzHVaG3dBqMp05vMbGuTH5Gd0ulQa7Hulj1W1MkDg2836k
	PRu16uWbDv6EtLbboWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp9-00000006B1T-1xYE;
	Tue, 17 Sep 2024 13:00:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp4-00000006Awr-1sBe
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4054A41484;
	Tue, 17 Sep 2024 13:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856D6C4CECE;
	Tue, 17 Sep 2024 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578049;
	bh=1YBVwpwShseYqofpoveS9WJvw66aL8eM1rri7KCuq9k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qMXxXbh5uQTJkNLKeL6UxW+qv5g/NUF8AndGUG4PKxRnVWZhRBZpqjYLAu0UZXh86
	 u+ewsKlufWBoECOvPptovFCU784ng4ZmPPM5L47AnWPlsnOmXNxL5xR0C1Q9YAsn33
	 XJ2xUQpFpR56PzX2tQHq/uCuy9nDdJJo08QsIj7+CGzX5QFFEMmhJC4+3nehIUDLM9
	 2hziyodgBsBeHfLFbkhK+YogK50hNrBmWTckX2w0toDjxzx7c9+O+dBCF88P6ccg1Y
	 6G4XlqSBPUVhb2APb5T1vI6zC7oDHhS2wSs6IescwAANPf7IZf49lvjRn5WBz/yIFn
	 05nx7VfD1amPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712F03809A80;
	Tue, 17 Sep 2024 13:00:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: cacheinfo: Add back init_cache_level() function
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657805102.126252.12300366991345937077.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:51 +0000
References: <20240707003515.5058-1-spersvold@gmail.com>
In-Reply-To: <20240707003515.5058-1-spersvold@gmail.com>
To: Steffen Persvold <spersvold@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060050_576108_965E6149 
X-CRM114-Status: UNSURE (   9.04  )
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

On Sun,  7 Jul 2024 02:35:15 +0200 you wrote:
> commit 5944ce092b97 (arch_topology: Build cacheinfo from primary CPU)
> removed the init_cache_level() function from arch/riscv/kernel/cacheinfo.c
> and relies on the init_cpu_topology() function in drivers/base/arch_topology.c
> to call fetch_cache_info() which in turn calls init_of_cache_level() to
> populate the cache hierarchy information. However, init_cpu_topology() is only
> called from smpboot.c:smp_prepare_cpus() and thus only available when
> CONFIG_SMP is defined.
> 
> [...]

Here is the summary with links:
  - riscv: cacheinfo: Add back init_cache_level() function
    https://git.kernel.org/riscv/c/1845d381f280

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
