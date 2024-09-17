Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD3CAC595
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK+1gIf7XnyQKp57ixX7lHDYYjKUzKGWFEfirAHM6Ds=; b=noLsuQiXf6p7NC
	HtXmjG6BNU9NDA84siXtJKjsaP9hjDtjL4amojBqWV0k5kJGBY7ySVm/Bou1yZA94U7d3j4bOpYU1
	nkt1zlORVnHHa6B9BoPHF0C6tgA5BjJQqI9FPDr6Hsns4aaZUdGklYXtg8iXz+q/2TNXnWey6FrfT
	N1GCWmjxBrKuVU2J9SIaBZTMs3/quhAqwvSBy+gsTOWPt/cvnw+yfLohm9q+kjx6m9wcKcuke8vOY
	wBm792WSmupvOkMUWyh2qO6dx6fo3Jduih2klKkleJBHd0tc4bm/f5MWJdFLUGbJMaj9bqin/n8LR
	fyv4gdreuMZcg8y04AWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqcGY-00000006dkc-2QlP;
	Tue, 17 Sep 2024 17:45:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb60-00000006VVZ-3xFO
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 16:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C403A426F7;
	Tue, 17 Sep 2024 16:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F86DC4CEC7;
	Tue, 17 Sep 2024 16:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726590631;
	bh=lQqntmL1ttZKhZMDncdN8GbOYQhtpcwCxUa/bELgZ7A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m8Vly7DMbQMpC5+BEW3lWDDeCIYAxmVQ9Nd/AqGWWgp0ff1Ti4Zl/N1cqc6E0QK+h
	 6MFHM7DuLMKLyDSi62fB8QrM0COs9cyu4WpVYTVjtq/q5xoKSj8jvutfH8MELthWRH
	 N37om+8jgLA3HVZEGmx3QXXOlocT5IikUzoNPFpFRTVuHXKgI124RlXCgptdz03OnY
	 tqRNWyPQtmGYa7qsvTqM2ulbQJSy9O5EKwyM6ktomEHocn0sP9KlXXtKx0hocVr+BM
	 rj8PGM7AnssTWgl0nvhy5ZrevJJRdQpd/EAX0iOseDIgIwwJ03aDVSB0G5+bnValis
	 KYWkQ62R9e3tQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 722603809A80;
	Tue, 17 Sep 2024 16:30:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] selftests: riscv: Allow mmap test to compile on 32-bit
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172659063303.214459.9757060664956145084.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 16:30:33 +0000
References: <20240808-mmap_tests__fixes-v1-1-b1344b642a84@rivosinc.com>
In-Reply-To: <20240808-mmap_tests__fixes-v1-1-b1344b642a84@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_093033_150593_DCDBCDF4 
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 08 Aug 2024 11:41:40 -0700 you wrote:
> Macros needed for 32-bit compilations were hidden behind 64-bit riscv
> ifdefs. Fix the 32-bit compilations by moving macros to allow the
> memory_layout test to run on 32-bit.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 73d05262a2ca ("selftests: riscv: Generalize mm selftests")
> 
> [...]

Here is the summary with links:
  - selftests: riscv: Allow mmap test to compile on 32-bit
    https://git.kernel.org/riscv/c/11c2dbd7f241

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
