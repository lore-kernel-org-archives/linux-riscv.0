Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A339C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 01:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hgd98Q/O27MYkZypaNOYAFYctA/iXXkevlb9RzRx7H0=; b=zhhd6kHfYDxrZq
	P6bMIj2+HouJ33bfmHbstei1CrFqpEqS74T2+Kknxnf87gZHSQTVWjcWfQcKMgEylCOjs4Onti1Og
	p25ph3JRr0GlftGrTvV0DQBHI9z8zCii1ecXglGtQ6CJVL2skBse/8IdZIAXj/WPOK+3Z0IC8+Ibg
	rwo6H5lz6IULot6R3EX/4UXulIfX1nKYR/+6ZK1x4TGMqsrq5EnSCqZ1NW1sAujfXcLlsbNsz5dPv
	Q9KfEQhqzytamvgv8XlynL/gafIrJ7iR94Q9wmCosAguX2nsb/G6/TxEZKThEYN7J30ZTi6LNfGHF
	fYdClYSrbqhtx387zZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFM-0000000COPy-0063;
	Thu, 08 Feb 2024 01:30:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFJ-0000000COOm-2DFV
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 01:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 983416196F;
	Thu,  8 Feb 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DB25C433B1;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707355829;
	bh=RMupFb4nJ/fs56B3Mp8NAVjkwclZL/zYoqXWz4mV58M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NUggYVTwasaK3+SnCqY9s1DQ8Rkt7whE+tlGoGXPUQQHxV3a/U/FiudlgRtJqnnyL
	 YoK0u724ZuXIkgMN43WHBgAwe8VJWRVCNGKJtogCxNKdiPByDc5gPHchg3xuPtNNKA
	 pds3VnpHYtH5Is78jCHKQJujPhHp0Rpm7sxocM5zPY5OWGtP9m5O8jv5M2BLykINi/
	 9+laroHlcorrGptWxrx5+8JomDo2K9VELemYkrrT+jqwsTxUQu+JvkV9EsIlT+Q+TL
	 N5nOmV8eSLnWHM8LeWY6cawc/BekQMMpt9wBGk4facBRozJMKBvc5XrbdTWXJSWo5N
	 tJ4Oy9c9bNaNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53514E2F2F1;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Flush the tlb when a page directory is freed
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170735582932.12826.4648361824228463635.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 01:30:29 +0000
References: <20240128120405.25876-1-alexghiti@rivosinc.com>
In-Reply-To: <20240128120405.25876-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, will@kernel.org,
 aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, npiggin@gmail.com,
 peterz@infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, samuel.holland@sifive.com, ajones@ventanamicro.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_173033_632620_39AC0701 
X-CRM114-Status: UNSURE (   9.66  )
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

On Sun, 28 Jan 2024 13:04:05 +0100 you wrote:
> The riscv privileged specification mandates to flush the TLB whenever a
> page directory is modified, so add that to tlb_flush().
> 
> Fixes: c5e9b2c2ae82 ("riscv: Improve tlb_flush()")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/tlb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [-fixes] riscv: Flush the tlb when a page directory is freed
    https://git.kernel.org/riscv/c/97cf301fa42e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
