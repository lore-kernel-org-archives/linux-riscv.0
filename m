Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF10C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHraxQOjR/QVIJHNcOweG8s39ydGk/SQqjiD+/YvFxM=; b=Z8JIIUy3W7ZngV
	s+EC2jpdtWrQlqobrTjQENgXlo6wJOMIiHliFWphHx5el9fYtKsl2s+NaV/weMdjVIEZQm4Fmq17M
	8pXpBLvTihOyNcCzjO9YMGOaLIWFnv8bS+NU/oa55vEVRv8ZSn28yHPIFWwR3ji1FVkltwUQdmgLY
	YLSIfm7gVKF5L4S7lgiFIybJMDoZbqhyqwHF26NVF1ui4sm4mtkKOHNRgmbirTNQV4NnUjirK2BPQ
	KsB/m8Q8o4kzaeHdJJRRDWyUq0T5rCsCPsvwoshJVOC21Oz4qH/i9Y1iZo67o+2hEIgo21ySOqlUG
	bysJ0G6jgEdyO04fEx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOM-000KLc-0P;
	Thu, 11 Jan 2024 14:50:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOF-000KGh-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D794B61AF2;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB054C43141;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=mAiijGHiSfZsTFrUYq/Jmg4J9ygxl7AwTDFZGVX0vqc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tHSuOLPKewEXoCsknWKaTh4RYAHl4+uYdYWx5duufMLrcPbfDgXWGNjlNtXn48G0t
	 BDseeq5T3vhQG+6Zye+zLho51hZoSm1bQi/jH1FTZyR4Jx+heS+BFMaqod8dKEHTaj
	 IHYB2vFNZYLquw5uTFYzRf2wYQw7e9mWDCVOrYmILpQGzvpgzZ71RFxUGQeEWPTnw3
	 M3TrDLzroKZVHTpgJSGU/bpYJ0Rp9u872xNsaXCWK0Y00b8b2kfZdjmvfLFbVwurmS
	 Lk9VDXpucd4bkqD0VVuH7pARPR1vN2QN2ku0eI6urTMStZETyWfWpC0rBIHgmlDcmU
	 BvpH9hq4+FPhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C42FAD8C97B;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH --fixes] riscv: Remove SHADOW_OVERFLOW_STACK_SIZE macro
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463780.20080.3843533399150814207.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231211110331.359534-1-songshuaishuai@tinylab.org>
In-Reply-To: <20231211110331.359534-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 samitolvanen@google.com, conor.dooley@microchip.com, bjorn@rivosinc.com,
 debug@rivosinc.com, greentime.hu@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065039_904509_B9649FEE 
X-CRM114-Status: UNSURE (   7.18  )
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

On Mon, 11 Dec 2023 19:03:31 +0800 you wrote:
> The commit be97d0db5f44 ("riscv: VMAP_STACK overflow
> detection thread-safe") got rid of `shadow_stack`,
> so SHADOW_OVERFLOW_STACK_SIZE should be removed too.
> 
> Fixes: be97d0db5f44 ("riscv: VMAP_STACK overflow detection thread-safe")
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> 
> [...]

Here is the summary with links:
  - [--fixes] riscv: Remove SHADOW_OVERFLOW_STACK_SIZE macro
    https://git.kernel.org/riscv/c/a7565f4d068b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
