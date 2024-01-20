Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDD7C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31bsZ3N68OFtR/4GnZjUqUnGip6Hswpt7OnzkPiNvds=; b=Otz59i5IRYgv3N
	G33PqAmX4S2O5U3tXCGSt/dD+6dQbGjjHDu/dT2DkWtG3SI0mFp2Z7v/ZFsUoBGpmSVNKnM1Q77TY
	eRNMzFEgrbGNTA+Yelfdhp2xZ1aCkAxzlR22julaCXa4aX1jhhv+AX/NHzCy5Wohcr8YqC5n0u7eh
	ialD2+i5g0dronsgVSyAJx30zNq9xDDoHdP44PWOI5sFOehMx9WWWHic47J4KD/O29SFUAIrWb1Hj
	xJKCR44VfWkty/4t7+8vuFvu7NH0DV9eAqbaAJQF5F5FDegLO9Iu4hEjs4WqW/5EbTGSZ8WxnVYdP
	nwFU2ol65JOGQ+MkwcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbZ-008OVU-0n;
	Sat, 20 Jan 2024 21:10:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbJ-008OFg-07
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9C6F1B80933;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49FEAC43142;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784999;
	bh=3pKI7Q2xGS+keEw8XPbBylHL6NJ5AoMP/3E4CwOX1y4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=czTnM6gwEOanNR2SBguDowD8dYDt5D9AEwSrWTuZ6403O8NsPMTWl1uIrugYY4XrU
	 ch15I+3JhjkOGIPDF7+ZjnBTbeEdT/buFVuwmm0Gbx3WQa3uyEKafNya5me4dQZTxh
	 H76rd205lDGBMdMoYxs65rx5kPw+jo1beOiS+hdzpEyevReeopU2cwAA7LvCixnDUB
	 MCoQj3Jg6JfhqI+Na/BRuNrKVf8xJ+38CXGG4owX4ROp9hXX8kS39MkJ7nGp8nEd/n
	 uxb45lJoaO+BV2XFl4wfdQ6t0jHelXZooWN1ervcMAhjfeYU038JQ7oYPH88iVAK2z
	 eREL0C7Y2PKkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 35B09D8C96C;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/1] riscv: optimize ELF relocation function in riscv
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499921.24348.3990929964303626751.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:59 +0000
References: <20231214063906.13612-1-fido_max@inbox.ru>
In-Reply-To: <20231214063906.13612-1-fido_max@inbox.ru>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 charlie@rivosinc.com, ajones@ventanamicro.com, conor.dooley@microchip.com,
 jszhang@kernel.org, kernel@esmil.dk, lixiaoyun@binary-semi.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131001_252593_140F307E 
X-CRM114-Status: GOOD (  13.06  )
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

On Thu, 14 Dec 2023 09:39:06 +0300 you wrote:
> The patch can optimize the running times of insmod command by modify ELF
> relocation function.
> In the 5.10 and latest kernel, when install the riscv ELF drivers which
> contains multiple symbol table items to be relocated, kernel takes a lot
> of time to execute the relocation. For example, we install a 3+MB driver
> need 180+s.
> We focus on the riscv architecture handle R_RISCV_HI20 and R_RISCV_LO20
> type items relocation function in the arch\riscv\kernel\module.c and
> find that there are two-loops in the function. If we modify the begin
> number in the second for-loops iteration, we could save significant time
> for installation. We install the same 3+MB driver could just need 2s.
> 
> [...]

Here is the summary with links:
  - [v5,1/1] riscv: optimize ELF relocation function in riscv
    https://git.kernel.org/riscv/c/080c4324fa5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
