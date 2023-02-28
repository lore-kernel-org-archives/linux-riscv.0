Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49E0C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 21:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/gBv3ynAAP7wGBi5xFEaCsE8ucArbYzMYPNigno/RE=; b=jigUUcjphQ5ofp
	1GcNqTVPKqWa0SZwbauK3+lUaUXa6I2P0pX/LU7aC3CF+wKBQnNFe8rHlXSnlwK9KhHi3vFN2W1mo
	FeLcndxvif5VvTy4nJQP2mx93nN6MvbJZFJCLrrOM5TcBZZWU7cBAYajQuiUe14dvkUYfNTx2/LeB
	JkpwSz9+Ojo8dUSaSzk6BMqC0V66NniJaa8aCeZ+2B6YZrAV81PNIRVJVZwyDIdCX75qI/iKCqXNE
	xvrAhEWdv4BcMJutuMZVmGsqkYyk1ZUG5FawauXoH/OYHT5Dli/cmeVM0yVFxsbPz7dwJSKl0yfBG
	7zZ/F90ZCpfE043bdNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7G1-00EIpJ-Uc; Tue, 28 Feb 2023 21:11:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7Fp-00EIhB-Sv
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 21:11:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8779B611E6;
	Tue, 28 Feb 2023 21:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CEB4C433A0;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677618677;
	bh=8lV+IaCiKMm2e7+A28kFpfKbQczqgP/e64KBjOHSYjQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ujOHjxx3JB60IDiRNO3KQ0O4ioZlytnREsKI3fPcEuCBOW2o4alANzWwdrvWO31DO
	 JsRiHfa8YaMUBfKYPfGDcdPjKObo2KJrhn/URQwcrjug2r/3L3cxDV57TokO2Jzj5X
	 OLPLZ+tYM81OeyiiUgvlKcthor6OX7nP8u3Xkd16L4Z5XE4gqkrybqb5NOZuur7e1p
	 ThsY8mNehUONpCuw1Q0x6Akc6QEMvmDMXuK/AQMa0b9Zb8jnZYkQN0HyRGtzxjcqhP
	 PwD9a9bAJy95r67E3js0iLSkdiqqcaMpFYVdb6ngn72Sjm/23RaD+PM2bIXEBnYiRc
	 VPA32UcR8AiJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58C96C73FF5;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Small fixups for the Zbb string functions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167761867735.10135.12344795154961095592.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 21:11:17 +0000
References: <20230208225328.1636017-1-heiko@sntech.de>
In-Reply-To: <20230208225328.1636017-1-heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com, conor@kernel.org,
 linux-kernel@vger.kernel.org, christoph.muellner@vrull.eu,
 ajones@ventanamicro.com, heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_131122_049914_5639FBBA 
X-CRM114-Status: GOOD (  10.31  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  8 Feb 2023 23:53:26 +0100 you wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> I didn't manage to address Andrews comments on v5 [0] in time
> before the series got applied, so here are two addon comments
> that hopefully do his comments justice now.
> 
> 
> [...]

Here is the summary with links:
  - [1/2] RISC-V: fix ordering of Zbb extension
    (no matching commit)
  - [2/2] RISC-V: improve string-function assembly
    https://git.kernel.org/riscv/c/6934cf8a3e0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
