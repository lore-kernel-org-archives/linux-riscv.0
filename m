Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361A8C10F05
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7un8ow+I7A6ATpiO3jXKtR/Xumnzu6s03URc1t3bKWE=; b=YhX5UgLgv2JLbe
	ajklocrkuSTyAeCljP7Qk0/OZy18MiciCbvMtObsgNZ40QwFP54SM71rnQOoPmD3w80ji44tuZzeW
	aTZ/mfYvMQwK+lVg9peV2PDzP6Ys7aIOEYLdny3sTnOku2LjPTSwr3IRJLtdhmQAbAzU0D7p7Icxi
	P9JsmFR1sQb23RYwipcJwX6TumQr+gQp+SzGXk2bXz+Fg5xpVo/aQZ0Ieto7gQxWZf3OoYinB9O1N
	n9PnGHQmCIqtRRtYgTRqXSuwudYVKLJdRlzAh8xz15LfUL4WyfRSrm0NJTiRtldt7G8f2Vs9KPRoq
	GHWP5wn5TnbEo9v6hE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGB0-00DAJk-1q;
	Thu, 07 Dec 2023 15:20:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGAx-00DAFN-2J
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 753CCB828B8;
	Thu,  7 Dec 2023 15:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2790C433CA;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962425;
	bh=Nfw2DQJucK3TOTM/iXs2sHe7UkhmWINwujw5d2hDVcY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kc1j1h6Q+E2cEHA8NRkwn7UCAXjf24XB//4aiWcSySDQvTdMUGy62PP7Ft1un+vkf
	 /xtRh+7Ejxp33DCRfa/XoF2ZuH4MV17MyiY9kf1GWtM8Og6vo4W1gOqsoMN4T+uYmK
	 02T4ip5pd0IGbrjzBZczye97f/4RvdiujgwNiiz9ya1mFEyUuWsfZK4p+DnK1Ja4bc
	 rfZw3VKIaiFHTmYXyDi6RrGXbhaFjA1Ab5ThasA+9m0IArK6sw8EHDHkI/Id/qOX22
	 mXj6W/CURThZ5829KMUN6mLHKOT9SlUuZh+FbwBiLitQTjq8zSc/pRteTsTzUtPSwJ
	 M3+ILH06iLO9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B83ABDD4F1D;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] Support rv32 ULEB128 test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170196242575.12999.2675447724250282686.git-patchwork-notify@kernel.org>
Date: Thu, 07 Dec 2023 15:20:25 +0000
References: <20231122-module_fixup-v2-1-dfb9565e9ea5@rivosinc.com>
In-Reply-To: <20231122-module_fixup-v2-1-dfb9565e9ea5@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rdunlap@infradead.org,
 re@w6rz.net, palmer@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_072031_904486_383A6B38 
X-CRM114-Status: UNSURE (   6.80  )
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

On Wed, 22 Nov 2023 15:35:54 -0800 you wrote:
> Use opcodes available to both rv32 and rv64 in uleb128 module linking
> test.
> 
> Fixes: af71bc194916 ("riscv: Add tests for riscv module loading")
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/lkml/1d7c71ee-5742-4df4-b8ef-a2aea0a624eb@infradead.org/
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 
> [...]

Here is the summary with links:
  - [v2] Support rv32 ULEB128 test
    https://git.kernel.org/riscv/c/82180b1fae24

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
