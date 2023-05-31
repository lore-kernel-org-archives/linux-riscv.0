Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666EBC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMLnDrLBj84nAeCYJdzbOKihDGS3yyXg3Loh39lIxxA=; b=uuv9eTOCH+fkZP
	bRjH+MlE6pU8Z2hG5weZzdxdKxC9Z0BTOkRm/gXmGrHCkYJgqfKynWDHqOlAwnvurVB2fdfB3n8sy
	FY1oOCwXdpWhlO0Vb85RGA/79AabAI+Dyk+9H7Y+aRGWQClBjcpltWxOGiXqcHwofh0viOXqvS6YT
	dm5urFjrKCb5nYtw5gkH8AJ74oBidQ0e581hk7ArymCZ7N2nY9dtBycBsHrBQb/wAcQXhNRPFSBZD
	TUxkmOMjnLi7HWfW5874Pusr2e7r1YzSzNbCzmJZ/W0poM/zrEFefwQiRHnMPvZGHZhZvycVTyuNi
	JJdNwU3Sp+1hedv+49XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NT2-000FMl-33;
	Wed, 31 May 2023 15:10:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NSz-000FKv-1P
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77F5663696;
	Wed, 31 May 2023 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9527C433EF;
	Wed, 31 May 2023 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685545821;
	bh=ZWD2zkUqIfn7LVLDVSME3AoFlWVrJDLG/awdINUug6s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AkbS2cuGbFB2C3gWF8PvQhTWG1afWkfQafSs+uoCH9LBJonNloSyQ6Qz8XT0CBquP
	 XLRkw3/R42Bd6QHHUkosQxG0WwGggVPKaFCygeCpb/ew6G0GdVW9dfbceOSmXm74wX
	 IqhP2xG6JsOuCdISRmlusxFL0nH+G+ocTlA5pWnuGUrNQ1p00duwHb1FgcAg3n4FF5
	 IXm5itCrhltNNA67Tew/cf9uZkZ3gcd+QOx2OhXKKoUVXRUsdLyXmFgveqeEceLRr5
	 Txpix/zFFubRHiul7SVdRp+8+6vEcIf7C/0/8qEZ/gZojCwfFPKIFN2Y0Pih0Moiqe
	 vlYewTAxCAnNA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C00A5E52BF3;
	Wed, 31 May 2023 15:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early alternatives
 using -fno-pie
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168554582178.8247.10623595249995347296.git-patchwork-notify@kernel.org>
Date: Wed, 31 May 2023 15:10:21 +0000
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
In-Reply-To: <20230526154630.289374-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, schwab@linux-m68k.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_081025_532791_519A9203 
X-CRM114-Status: UNSURE (   9.99  )
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

On Fri, 26 May 2023 17:46:30 +0200 you wrote:
> Early alternatives are called with the mmu disabled, and then should not
> access any global symbols through the GOT since it requires relocations,
> relocations that we do before but *virtually*. So only use medany code
> model for this early code.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Fix relocatable kernels with early alternatives using -fno-pie
    https://git.kernel.org/riscv/c/8dc2a7e8027f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
