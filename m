Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66923EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNbVWo6fzWqf1hgQjUJ16uSSNiD1qVyPE+sikmk5kME=; b=djBbA80/9IPfcF
	HxSvtKm+bX1DCglSOoH3gUxoBiAEUhniNiv8U0DONk6niO6k5gK/nT3usRkOF+CRV0ulZ7Cp7CY3x
	j4NqEJ+c+CPTKwqUS0MksjUZY+T9RByCgGvqir1NxjkT+20mKPztE5GMQxf+rLq0V7Iq68w4QP2rW
	xnKxVw1d/DQDQ04P9RmpBhnM1CX3BSFqZuzqFEPh3TSkbizLWX8dYTQ5XWjEsbbpzqkglodF+AKRh
	ARCiBrorNbc0Tm0e4tN0Qnj7j97GpEpQdwAVKLRhBUJOnezpn/mcMiuqUIDyZ9JGdsBJsSbNai+Zm
	J2nLmbTSpKH5o+OgfeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFcmd-006FIT-22;
	Sat, 01 Jul 2023 15:45:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFcmb-006FGo-04
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 15:45:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1331D60AEA;
	Sat,  1 Jul 2023 15:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B83BC433C7;
	Sat,  1 Jul 2023 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688226304;
	bh=5goMEgvQFh3eL2WcHllJEDQ78LTNrgS33kORtflyOxk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KpsoAvIRfgnJqLnaqX3b2h0p0uqQxZ+5zGKaYWJ0WjeCASghSnQoGm+t2wDRSsYYk
	 Fx1/NVCkFFZG90oWiAFs7alb7llwYIYorfuEpkdOE3FGPWLADNYOi0aQJ4kFj5XBMq
	 n/W9DvP4ia+kDP70eRa+6wJIITVLdIS3oAO4UKGYeJ3d04SGiQ2QRFBact59s7IDgd
	 sRM0B/peII413QdO9JUngpDrG5aS8OUpyWBxiOEmCs5u/sPkOYoKXX5JGw502FRH50
	 mT/1hkJG7iDIIbtZ6e+CUG3L3NX6faW6eGyx9VW7ux0KMzKsS93AkhWfm8Ct0iu5De
	 gOnRKwnf6+1Mg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49E60E5381B;
	Sat,  1 Jul 2023 15:45:04 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168822630429.22742.3829252189849990649.git-patchwork-notify@kernel.org>
Date: Sat, 01 Jul 2023 15:45:04 +0000
References: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
In-Reply-To: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_084509_118900_A381B559 
X-CRM114-Status: UNSURE (   7.92  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 30 Jun 2023 08:40:50 -0700 (PDT) you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
    https://git.kernel.org/riscv/c/533925cb7604

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
