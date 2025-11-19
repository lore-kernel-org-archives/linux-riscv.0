Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60EDCF31B8
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 12:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69qHJFZRKrTKiCi/mlChEuP9VaeveSyBT8vLOjdb06M=; b=dceYtWUiRiHzfo
	fxkSopTAagMgBL79Nozuym1cYiiFU+6uzA2PvhJgd9XhuW6dts+/u02Itx3gx0Ed7JGwKeOxn1i69
	NjhiEIgN3Ce4cP2bdQTUHSH1lBplsMebwjCUihMTklLYiV0cstw45lcnMM/dG8qVODdU/8vtvrA5l
	ULfvADtK+9gTWdrKjoAI8k9LNtC00OiDQCLE7qnMx0FcroSgrdbV3Af1CUG1Qpa2R5a28R60ahgkh
	JNWYftczFyxlrdlBaQYVnvHrX1rdC0KqJb6u+B5oErleEwSTcOwUxSSSVHQAc6QoUFL5QTCqEP4Ar
	khCyGyixIa1ixyFqbDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKq-00000003A8l-18ls;
	Wed, 19 Nov 2025 12:30:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKm-00000003A6O-3jij
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 12:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11DD7602CC;
	Wed, 19 Nov 2025 12:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AF3C113D0;
	Wed, 19 Nov 2025 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763555451;
	bh=pV3aaX6iNgAKqE1MoQjwMUxNZdYr7ERloJjy7fJLIoc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EYTp4Djsi3eJAeKx4OU0ujsubTC7IPc+wS1JQBfec8wVdJbgQuDbZ0s+FJnrRYGtT
	 RaU4eQp9m8ASKUXlicBD/1rm57u5bqxp5EgVJzUiteF1JoeM5emJGl32zu3k76hGSP
	 wQluXUo36hjPr9HblRxx5VabgNxwn9JkB2flfom/VYiwclZ7/us67UPR7XVqLjymLR
	 HqiN4XIVlT3IApFym4lnXEIN+BMGOwvHbzkWOH186ZdAZSG9W9YUJ3kVhJMMRZoL75
	 Xp5do217DrNLoPdtWImqWKN6e/zAzdT6EflYzSJbwufR8sWIYzSUw1hNd64ElzdK9u
	 CUPVKBnw9Mkng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE197380AA41;
	Wed, 19 Nov 2025 12:30:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/2] riscv: hwprobe: Add Zicbop support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176355541625.758643.4500342763865705965.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 12:30:16 +0000
References: <20251118162436.15485-1-zihong.plct@isrc.iscas.ac.cn>
In-Reply-To: <20251118162436.15485-1-zihong.plct@isrc.iscas.ac.cn>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 ajones@ventanamicro.com, alexghiti@rivosinc.com, shuah@kernel.org,
 samuel.holland@sifive.com, evan@rivosinc.com, cleger@rivosinc.com,
 zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 19 Nov 2025 00:23:23 +0800 you wrote:
> Changes since v4:
> ------------------
> - Fixed style problems. (Andrew Jones)
> - Updated the selftest gating logic: the cbo.inval test is now also
>   enabled when `--zicboz-raises-sigill` or `-z` is supplied, instead of
>   being skipped when these flags are present. (Andrew Jones)
> 
> [...]

Here is the summary with links:
  - [v5,1/2] riscv: hwprobe: Expose Zicbop extension and its block size
    https://git.kernel.org/riscv/c/22813b82af1e
  - [v5,2/2] selftests/riscv: Add Zicbop prefetch test
    https://git.kernel.org/riscv/c/b291b9de3182

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
