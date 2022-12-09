Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0EFC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKaiKdC686jFrW5BeVxC8mPyjVsay23fRad9O3lmE8I=; b=tndl3/GJwr5MBv
	C4vVForVtsh8GbpGlvNsEjk9QvYLaJ7I6N52RcG91DwLtrenrlea8ecQkSGILQmGqEZ7DqOIN4Kd7
	Vy2KEMMg7Z7KAcG5uy2kxN1HCQDJ6KxWan9GimSxr/sMxY0WrVE5u3Mc8z/ZEIuvsvP/Gtg4mRA6/
	MVpRbwz3ZuHcGYxlMqfmwxprthe33GaUm0fPRodXnE/nAnlPfXP9Dw0EBLF+wfdlLi1eQVDAIiNEw
	PMWS0RLCCJV3TcLfiETf0B41It+djcssnCHucW11BJwpwyz8leX09jtFlYSekQpMZqOe0gw0pPo/A
	YiTwAOXpD6D4dxYQME6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SDa-000433-5R; Fri, 09 Dec 2022 01:30:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SDV-0003y5-ML
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2AF75B826C2;
	Fri,  9 Dec 2022 01:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D24EAC433EF;
	Fri,  9 Dec 2022 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670549418;
	bh=f1cL7pV8I99q0tSRDPv/Gl5RgKQSNbhxEEWS18lyhVY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kfBXi1pJukSy8tQaBAY+s6ev7y5+IRn5fPXjWXqxsnd/xjBPkj66KoR2NVB+QmzHz
	 MOGUZcwNrAFZV/yQM/C3eW8bc/MjBnCp09nwTm9YJeLrcmaPjF8YaM49VhjR+HS9ST
	 rHgx76rAATe+P9k9HekmTQixHYAwmfApFE2oHYIoECLPv/x8RvM5x6a2ttN+vBtEG3
	 TqRdHGdCIM/QQm5oU3H+B4wBBjQzUDF2goezQjD7J0aKmxXHB57cVCGKVek+4Ck/jX
	 6ByODRz+S4jElg46O3fFkUUhMJxx3lGxO4FBv22sttz5s2j8xQXL8PWuoBwQZXAdep
	 QEZ57uaQ7vtAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B81B4E1B4D9;
	Fri,  9 Dec 2022 01:30:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] RISC-V interrupt controller select cleanup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167054941875.3046.10675797620524560319.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 01:30:18 +0000
References: <20221118104300.85016-1-conor@kernel.org>
In-Reply-To: <20221118104300.85016-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, tglx@linutronix.de, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_173021_904185_9AFFD78C 
X-CRM114-Status: UNSURE (   9.29  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 18 Nov 2022 10:42:58 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey Marc, Anup, Palmer,
> 
> Submitted a patch yesterday defaulting the SiFive PLIC driver to
> enabled [0], and in the ensuing conversation Marc suggested just doing a
> select at the arch level and dropping the user selectability completely.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] irqchip/sifive-plic: remove user selectability of SIFIVE_PLIC
    https://git.kernel.org/riscv/c/fdb1742aff43
  - [v2,2/3] irqchip/riscv-intc: remove user selectability of RISCV_INTC
    https://git.kernel.org/riscv/c/d8fb13070c3c
  - [v2,3/3] RISC-V: stop selecting SIFIVE_PLIC at the SoC level
    https://git.kernel.org/riscv/c/bf3d7b1d8499

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
