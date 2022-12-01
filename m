Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978D2C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 20:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vkNxYVcEGeKfXz+LEsiqWE6s2nLDfd5lHWtSgCMQW8=; b=XcLZQeZH4+Ztrk
	BwWFSGZ/CCbaeg1Txrl7ZBza1Xe8VP87i18NNBpoyTugF9MsCHLZux0h1TjRbsefR+NotvTKiv1tv
	9FlxHQYsHloYMy5DJaXqW8vtxs5N2oqb6AK7HHkxMQq9wa/j0es30lG9UMoPOLD8LHfUglTNlNEeH
	7TFFF07aEDcLJkYtvLRBtZpHroNaWplubZ8wAYpUj87fOuy6z/vH6Oqr8CRjTmt7e1vVkheaDlfjF
	nqa8Nqt72u2OuR/MOk+vRti0zWj0xXZnD83N2qQrgpYyLvCdgYX7OThMS0QsZbhgyjz46Qt5I9m3Y
	5TQQ8AAWIoX6CSuRJYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pw8-00Ak9I-Lf; Thu, 01 Dec 2022 20:13:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0psx-00AjAX-Ep
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 20:10:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D0216210E;
	Thu,  1 Dec 2022 20:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93BCBC433D7;
	Thu,  1 Dec 2022 20:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669925417;
	bh=66gIZp8QuckhxbGJe3SHqvbaAaSZGcddv1qT3Ntjfgc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RwVxCn7ViuR1CpOVf8tT3B7ZY+mBob1+3oOGzSLAB0TXI/q6XKS6iEWR/C0+5/aVM
	 PCL6ViSFQ9A607B0yyxFazctlJOP+iK4VaiVP5Rv0bi7ade1Jv3ZNGWSizyIVf7BZU
	 wFk9lr3sDEIZ21tqWvNmBTX9nuTijq4o+cg4ejqgywot+dsCRFHoVx/NwBV+Q5dj8n
	 8UWszWLhy/vDUuwb9ulG89WpKKovAOwdfOzwaz1KD/ajwkQyMMu2HgAxRYDDunfT8t
	 xQemEoI16BHu2An+y/mVxs2S8nA01Xv/xYI2zcsK+tq3Z73k/p2WuPu+Kc/E/YwZqq
	 0WFfcZaWhqMrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72C2FE52537;
	Thu,  1 Dec 2022 20:10:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] riscv: fix race when vmap stack overflow
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166992541746.24789.931668146499412553.git-patchwork-notify@kernel.org>
Date: Thu, 01 Dec 2022 20:10:17 +0000
References: <20221130022442.18358-1-palmer@rivosinc.com>
In-Reply-To: <20221130022442.18358-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, jszhang@kernel.org, guoren@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_121019_554282_27F1F8A0 
X-CRM114-Status: UNSURE (   9.84  )
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

On Tue, 29 Nov 2022 18:24:43 -0800 you wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Currently, when detecting vmap stack overflow, riscv firstly switches
> to the so called shadow stack, then use this shadow stack to call the
> get_overflow_stack() to get the overflow stack. However, there's
> a race here if two or more harts use the same shadow stack at the same
> time.
> 
> [...]

Here is the summary with links:
  - [v4] riscv: fix race when vmap stack overflow
    https://git.kernel.org/riscv/c/7e1864332fbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
