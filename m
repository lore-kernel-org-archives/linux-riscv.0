Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2332BC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVS4y3So5iGOWBN3KnvSvUqP55DHf1aLuC5MMAdRsIk=; b=BfysPJnseKkvyC
	y8bdVnmFwwhGuPN0NqcO5gMFv7zbKfG+2ywvz/WfhBa1RxmUl9jj4n5BKuujfUMHRJ0YR0wcC9btn
	6cs3tfOotK0XvE21sQNseCYRPowpDSxulpwjV+TI5mH8y8MaGXHkV7sgum9dG4fdiUIQmBal2ClmE
	8RDCE1Ql13Tahh56LjxqqevsVLBwWszCiQB/WQ5l6JYbKOTvC9H1uHSAc0jWSSdaJKko4qXcIu+5+
	apv6R3vgvAV5ir5T5CFHjD22np/mWgRZHHp05fmNiwt5Q0Qv/WztNkx4sHXaJMzknPIJL30Ujac2h
	ML7fgKM7DQhHD+Y9qneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGWh-003cOl-20; Thu, 09 Feb 2023 23:40:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGWd-003cKj-I4
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A48561C22;
	Thu,  9 Feb 2023 23:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DDC2C433A0;
	Thu,  9 Feb 2023 23:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675986017;
	bh=HCHcr5aTKt1OPUwAH00/oOdmH1TMv7ouKZHMe+UhXk0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tHeLQa/2Jcu6T2BjcEcFrVaK8JDMPyp3lVEmNIi6eTE91V3rHi3xKAxFNegLy0Z55
	 38fCYTcD5BTE66XxMt88QjxSFgcyOMuGfcwHQ3zj6fOdexyijypd70QAhiQE6FOsLB
	 BtwS8S+UgylBxM8wkiOVsgbo3tejSkIR0ROTJ48klTdpAABBZDA8mBNCTrhpZ3jxRV
	 jqho6B4GV/tMF09Uc7WOEfC6PILoZg1ckJ9p5Y4HM+9B20f+E2DQFqELqI3kBK/tzb
	 ZQDhgbGgY+753mA4ILiKBXPoIIpI3ZtzOLNzarLfDdNdN96Tjr8wkFdjrS1OsnYJng
	 z3jsifi3WUxWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 628EBE21EC9;
	Thu,  9 Feb 2023 23:40:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: kprobe: Fixup misaligned load text
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167598601740.16272.1273076344376497011.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 23:40:17 +0000
References: <20230204063531.740220-1-guoren@kernel.org>
In-Reply-To: <20230204063531.740220-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 conor.dooley@microchip.com, liaochang1@huawei.com, bjorn@kernel.org,
 jrtc27@jrtc27.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com, bjorn.topel@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_154023_656766_3BACF257 
X-CRM114-Status: GOOD (  10.11  )
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

On Sat,  4 Feb 2023 01:35:31 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The current kprobe would cause a misaligned load for the probe point.
> This patch fixup it with two half-word loads instead.
> 
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/878rhig9zj.fsf@all.your.base.are.belong.to.us/
> Reported-by: Bjorn Topel <bjorn.topel@gmail.com>
> Cc: Jessica Clarke <jrtc27@jrtc27.com>
> 
> [...]

Here is the summary with links:
  - [V2] riscv: kprobe: Fixup misaligned load text
    https://git.kernel.org/riscv/c/eb7423273cc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
