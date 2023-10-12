Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291E6CDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuqkoggK1j/c8c4MPoOpoxyWyAC7WJ7a40ImSSpg7w0=; b=GL2hvmReVewokR
	nZvqyO1Ox8EYQZ1rBY5Bhob8VJgS+Ye0n11z8+pCwNWMLqkufRCLp6k6VKmBOAHSAvGjyyRJl2wBS
	E4griakZ87Fze6N6yM1fV3bC0c2fwYuNQBuhFRe3QLIk8jbP5ozeQtvgKFAIuV9lCKxlzjBz3HjWR
	JuAVFT6sDk80/+FCuIYQKNzuT0XXMiuUh3PH7qVlL6yWhACXWp4tMZ2w1TNYtKRky+tLahHbPl5fR
	jh4pBQrQusYyC4suKHAtgSM3qtmr4KNP5qBmjB3qYxaSL/712YHAqeSyiSNeg6Yfs4oB1NqOTFFpA
	BiBcQELLXJgTKou5XHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tx-001oVn-2k;
	Thu, 12 Oct 2023 20:40:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tv-001oTq-0p
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 20:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14C90CE2C7D;
	Thu, 12 Oct 2023 20:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40712C433CB;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697143225;
	bh=sie1ll0Ma6WQdPMXUvgh0Kq88rf1sQq3F2RccRPRanM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DBCrBYGwYrIBSeJI/gKXdf0gz418ojPV52K5rTvSVAbvqTe4nEwY2/wus2Iu6gZEF
	 TFsc/tDdqvxAB2kfE7YjUDZnkmxBJtwladLSVMXFtC7rOoEGqOs1TB0f8buAexQu3o
	 hf7kavhvJYGfGFcK+hlirhYNDUsdBRHIftONpIMAVA/rCHGHhj19DdzgEF8Vt2oSL5
	 oi0wxkLaLO+gapmvsvpvYZg+z7B1DXUjg1E0HbAzcXdoEFmZzvNyl/NqB6PWxPEIxv
	 f8puKsZxlCyxEd9fnPaD6uuYt5iJEv+G8rEOJYuz/0q4rkF9ZruZwMMyJZ8b0Zp5L0
	 htJdJypZOQTww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20AC7E21EC3;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] RISC-V: Fix wrong use of CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169714322512.23371.9964258021648462397.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 20:40:25 +0000
References: <20230913052940.374686-1-wangjiexun@tinylab.org>
In-Reply-To: <20230913052940.374686-1-wangjiexun@tinylab.org>
To: Jiexun Wang <wangjiexun@tinylab.org>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, conor@kernel.org,
 guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, falcon@tinylab.org,
 jszhang@kernel.org, tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_134031_466584_92254E3D 
X-CRM114-Status: UNSURE (   8.36  )
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

On Wed, 13 Sep 2023 13:29:40 +0800 you wrote:
> If configuration options SOFTIRQ_ON_OWN_STACK and PREEMPT_RT
> are enabled simultaneously under RISC-V architecture,
> it will result in a compilation failure:
> 
> arch/riscv/kernel/irq.c:64:6: error: redefinition of 'do_softirq_own_stack'
>    64 | void do_softirq_own_stack(void)
>       |      ^~~~~~~~~~~~~~~~~~~~
> In file included from ./arch/riscv/include/generated/asm/softirq_stack.h:1,
>                  from arch/riscv/kernel/irq.c:15:
> ./include/asm-generic/softirq_stack.h:8:20: note: previous definition of 'do_softirq_own_stack' was here
>     8 | static inline void do_softirq_own_stack(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [v3] RISC-V: Fix wrong use of CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
    https://git.kernel.org/riscv/c/07a27665754b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
