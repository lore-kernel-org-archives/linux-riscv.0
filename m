Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB9AC54EED
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 22:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08PGUWfpSUPDvraFCh1aII+6iHok3dbwADal+DeRyts=; b=E5zsKdsnQcwswg
	toAj78iJjS3hVeUckJySw/isEToP+EXajt3pvgNcajLDOoZfu8oCDe8t1Pz0xd1xT23Rr6ZVjoTYk
	wAUAwRXdpmVvKudhKQFSZ85FBWrn2kYEidIlxU3galABWnTWyzf6Anf8dp96x8wD5I2VwOzEnRwnS
	ghqOXX5QhLxkvRiTW2Luq2wK2kpP6uEqwEVFB8Mu4UjNCmfijXCImSsP0AIt68GrGTNTps1I6W8P9
	bGu3f0x+IU/Q4lVbt4eMG3jvigU3WjbWnwncb/kA8WzLaIlnnctD+sDTZP8sVQDbCTYoq0YRaAtuq
	Ft9sgTysltCx9VznL1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKRxq-005XgV-41; Tue, 24 Jan 2023 22:40:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKRxl-005XeD-UD
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 22:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 785FA61382;
	Tue, 24 Jan 2023 22:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3793EC4339E;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674600018;
	bh=gDzHWUyUlB7parFoki5thmlIOArncsEzr3ZJ2pNiAt0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dnULDSAChkMCxVoGO3BUdahnWnRvk3tbO7hHLOqzB5Zh/oG83mrZMlYv1HsSd/Vib
	 vc/+Mf+yJ2ZSDlpQdq0fE8Ygdeei9MR1z44/f/kMbgV6CeVpGkbKiVWMovn5lkDhaE
	 qDiojGm8R5drZFWJq/93sXjm2Ap6VUhAO7Mca6SFYW6Ia4KzMFkXgxNvGQ2XMPi9VO
	 9Q1vaR37KYgRYZ/74owssb41kCFNj/eE+CYMTW5abvC/K0VLOBM+kpgZ92mZFkYydW
	 wvWyzdbF9t/7A6336JRVGp8TwiA60sN46kldnFl6BzOt7HdyXrTmeomg5yKLrikAQm
	 ZHmoB7LVfo+EA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1FF1DF83ECD;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fix -Wundef warning for CONFIG_RISCV_BOOT_SPINWAIT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167460001812.14719.10148685486902233309.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 22:40:18 +0000
References: <20230106161213.2374093-1-masahiroy@kernel.org>
In-Reply-To: <20230106161213.2374093-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 alexandre.ghiti@canonical.com, anup@brainfault.org, atishp@rivosinc.com,
 guoren@kernel.org, jszhang@kernel.org, gatecat@ds0.me
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_144022_057493_B5646313 
X-CRM114-Status: UNSURE (   8.77  )
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

On Sat,  7 Jan 2023 01:12:13 +0900 you wrote:
> Since commit 80b6093b55e3 ("kbuild: add -Wundef to KBUILD_CPPFLAGS
> for W=1 builds"), building with W=1 detects misuse of #if.
> 
>   $ make W=1 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- arch/riscv/kernel/
>     [snip]
>     AS      arch/riscv/kernel/head.o
>   arch/riscv/kernel/head.S:329:5: warning: "CONFIG_RISCV_BOOT_SPINWAIT" is not defined, evaluates to 0 [-Wundef]
>     329 | #if CONFIG_RISCV_BOOT_SPINWAIT
>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - riscv: fix -Wundef warning for CONFIG_RISCV_BOOT_SPINWAIT
    https://git.kernel.org/riscv/c/5b89c6f9b2df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
