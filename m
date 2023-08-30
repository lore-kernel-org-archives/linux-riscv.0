Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA2EC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTwUFjNKIjgI/X+Lry7n/PzLE18/x2gRiw4XhrmxVqI=; b=jye/cyLxOP+6Ym
	6Ca1JOX6HlaAZm8H9wMVoA6GqHnunPrc8uc2K1CzjyVwJJx2QHfMoQrBEEdNSJvga/A5vXcPquIbR
	okZCTWDWP1BxoDs9Ju41UKSYFZL9rJMORDrGgbCOJyBSqD0Q/xTNWaA2nbKelZDWBZ/Av2CtPpmff
	iTwesWy9xJKy2eem885VljPP4CLyXaCKduh+5TqDRQkxVZQfPlrNIUpmZ/Ih/4/lTyg3dDXGThg4Z
	UY1mcKx7Mz16nDG05jljChWMjl/ofrkeIIFWHp8/bMXB0xv5OM129DDODOLHIFnBqWhIsSLod7I37
	97D9EpKibcAdhHrkQLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7k-00DXbg-36;
	Wed, 30 Aug 2023 13:20:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7c-00DXUa-12
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA9C562080;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3CCBC433A9;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=hVtW05MKV0sf+IwOEnA77nj8VabEYfwLfx+JdrrM5ZI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pVqYuCawbpySbWx7oJa82WSo0DRz7LHqGQqpmRgIVVauivbzUh6A8pH3pCIdHPSMu
	 zCAZlkHT1qH9t/LegYPbzGtYGMrKdRrPPd7YFrNB2X57Y3nFNXsCvCW67Jkc4LceCq
	 6rtqYK32VSRp6dvRwyuja0X0+7vNPAO87RvpDc3qLM+s99rzOHUGG5lL3hT3Btf13w
	 iECrzczJ0RSPq/7b7ZA4GNAhiCveZtPmuyTp9EtnKzJYp936vt/50t+zgrOLrRN57k
	 te/YEn7tYOdQcWHnlIUKyZB0G+mPHzbzNFPxOknSqg9MiaNNA3RMcOESL4fw1U/zbf
	 UuQ/QMfrG6dbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92961E49BBF;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: =?utf-8?q?=5BPATCH=5D_riscv=3A_mm=3A_use_bitmap=5Fzero=28=29_API?=
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163459.19859.10905358770015380538.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <202305061711417142802@zte.com.cn>
In-Reply-To: <202305061711417142802@zte.com.cn>
To: <ye.xingchen@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 sergey.matyukevich@syntacore.com, dylan@andestech.com,
 ajones@ventanamicro.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062036_395625_AFABBFBB 
X-CRM114-Status: UNSURE (   7.24  )
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

On Sat, 6 May 2023 17:11:41 +0800 (CST) you wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> bitmap_zero() is faster than bitmap_clear(), so use bitmap_zero()
> instead of bitmap_clear().
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> [...]

Here is the summary with links:
  - riscv: mm: use bitmap_zero() API
    https://git.kernel.org/riscv/c/88ba8c83bead

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
