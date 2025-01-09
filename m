Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C69CE77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=be3UAKbvm0CikxX4tO9kgDxBKFypkZfzaD6IeyLPCWE=; b=JPLn9cJa3hWjne
	16DvG0Syy9/RV8e3Ju8b8m7dUdjxXFeJgcQGMBldGLBIZp25aGnKT2glkhhcUA8kWbvCjgZyd1N/k
	ReBRKKTG1DQYj+adGw8KbmytA9BLpjLXPABGxMKVhwn6PcuStEj4h3Hm2GTaR51o3FUWm8TBnj5Lp
	tFDsujMTAYdQFFpjCFZ1ctosSXDkiv+BWkUv+fOIIGSoeRvZrpECN1tfRNx/e+JEfxr4ga9ppWI92
	zFW06Rydx6yl+nltkf//raTi8gykKdE1w1twR34Qj/USWyLfpl+7+SFNZ3e8aDPRSZ3w18HPvFmEq
	cUv/SUHjB3+eyDwYJFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCz-0000000CdnT-1A4S;
	Thu, 09 Jan 2025 16:16:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCu-0000000Cdj3-3T1v
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAB8F5C5C7D;
	Thu,  9 Jan 2025 16:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB8CC4CEE4;
	Thu,  9 Jan 2025 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439388;
	bh=d7TprwuD5NPkhBDq0vs/CaxhENVFsufd54gb9c1sEyA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DENzD6GeoSpVUAd6RDbv52XCnm8TjkOg7qDU/7+tmj6evPzKyU8dDHUn8WHBT6MtZ
	 +CGXs4QY9ROOfxiJGl5Os/ZeVOifUGsnXb25/HlMWt+yuEH194bSF2MWgfUReRGfS+
	 RwEeQcBS1JoXk147HinDgaSlcpdxbN1sDjd/wBzH0UA2Yc/8mz3toRi4pg6tDtjxlj
	 /w4KzdhmJ/Tt1Myvaw3XENL4YyHoAktIZWJFimpo01rhPpsPRMPvRcJH0c3byFDdYH
	 fSbq/Nzv53WoSqAVynfZR/BHmC5WsKcBAWutf/1Zbe0iAfeFRvyAJm0Jg7piffgPxE
	 pfiBj6uXY1CjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70AF3380A97D;
	Thu,  9 Jan 2025 16:16:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: use local label names instead of global ones in
 assembly
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643940999.1375203.11231498644405975487.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:49 +0000
References: <20250103141814.508865-1-cleger@rivosinc.com>
In-Reply-To: <20250103141814.508865-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081628_938438_C97E1CCF 
X-CRM114-Status: UNSURE (   8.67  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri,  3 Jan 2025 15:17:58 +0100 you wrote:
> Local labels should be prefix by '.L' or they'll be exported in the
> symbol table. Additionally, this messes up the backtrace by displaying
> an incorrect symbol:
> 
>   ...
>   [   12.751810] [<ffffffff80441628>] _copy_from_user+0x28/0xc2
>   [   12.752035] [<ffffffff800152ca>] handle_misaligned_load+0x1ca/0x2fc
>   [   12.752310] [<ffffffff80a033e8>] do_trap_load_misaligned+0x24/0xee
>   [   12.752596] [<ffffffff80a0dcae>] _new_vmalloc_restore_context_a0+0xc2/0xce
> 
> [...]

Here is the summary with links:
  - riscv: use local label names instead of global ones in assembly
    https://git.kernel.org/riscv/c/5cd900b8b7e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
