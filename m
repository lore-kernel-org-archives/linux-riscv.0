Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C098C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZ3hXZb5MruyoHhgMNf/9BLtalkvbFagKudsJjZXkVQ=; b=oNfy/wh0cKZX8R
	Ts2dsioNZuJj48wnZ21UUmEYL746zcmkLnq+3A5JJ5AjvCwNeKNTlM8cfOv9bTsuZXrkz3o/nJBNZ
	EGeCYL6XTX8cHFj6OEAiWQV7twmRnWs+xAiG9vZAvCBnbpZyl61ZMETR9WO+UNehSSGtCUieOK+fn
	LpartnnFowqBh49FkfymxSDrKSOzaQJmvMA/kfxuXqVCOXZsm0t9kKLxQFmp2HdLRfv2qcadt70PI
	jV+Ab21TqyyA2V8ELj0HrqiAlOCIbe47eOnIRFj62WYXoNaj/Som3SYHgS6j/guCYsdkdo0rPg8mp
	pW92omHLrSlEk7Fsgx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylZ-00BWn1-0g;
	Sun, 12 Nov 2023 00:55:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylS-00BWhK-1b
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 00:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A5E2AB8076E;
	Sun, 12 Nov 2023 00:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 904A9C433B6;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=GWFlwV5YPrVZ6YqtdodHarmTAW1nmW1GwfZG0HStF+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CLW3YqRliByr8MVQWRDb96pqbs+bgb8VYnYzh8IgZuWvnLxifxD1laYtt6yXJaCas
	 mv2WgeLdJKaJNW2i4omu/dTUTBVCDYoOTVuNvNqL1mxZfPoLICkDFUWX5LCAfyZlGw
	 rWzlCyMrwStgDH/r4b9Xgrs650LOTj3m4AQujf4KSEAo9ZOuKxS2SkGLELPR8H60TW
	 gUW6+PrJwfGEdTaQxBiAECGR7JgEn9BDdRRsSgl3j5Q+PbfWBetaaVFS3UBwHNhwt7
	 ZZuOd1sudlgi0QrmPefAsQSKA1aL74V/QYMzTvOc4Trja3vUQH6Bz3ipGNVJaeu6H4
	 loRxLJnJOUeGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71B15E0008A;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] docs: move riscv under arch
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054646.11360.7774579809979814716.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20230930185354.3034118-1-costa.shul@redhat.com>
In-Reply-To: <20230930185354.3034118-1-costa.shul@redhat.com>
To: Costa Shulyupin <costa.shul@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165550_663626_D61B1D79 
X-CRM114-Status: UNSURE (   7.47  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, catalin.marinas@arm.com, atishp@rivosinc.com, bjorn@rivosinc.com, conor.dooley@microchip.com, bagasdotme@gmail.com, linux-riscv@lists.infradead.org, ardb@kernel.org, alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net, anup@brainfault.org, federico.vaga@vaga.pv.it, workflows@vger.kernel.org, samitolvanen@google.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, hca@linux.ibm.com, charlie@rivosinc.com, bobwxc@email.cn, songshuaishuai@tinylab.org, paul.walmsley@sifive.com, bhelgaas@google.com, philmd@linaro.org, linux-kernel@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, andy.chiu@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Jonathan Corbet <corbet@lwn.net>:

On Sat, 30 Sep 2023 21:52:00 +0300 you wrote:
> and fix all in-tree references.
> 
> Architecture-specific documentation is being moved into Documentation/arch/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
> 
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> 
> [...]

Here is the summary with links:
  - [v1] docs: move riscv under arch
    https://git.kernel.org/riscv/c/ed843ae947f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
