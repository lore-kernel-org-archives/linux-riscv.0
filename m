Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F22BEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJRV6oYHShfT5U9xTeIvADqUXrzH4nX5s1KL3I1XAK4=; b=fGUMiE2BPbSah/
	PO1w3PwXz7jYZFhpqIMOfl5yCiuHdKgTzN2km2x/qMewM+RpN5wa3F/Drc4T4x35/6sLHPBBIh6CF
	Hk2kc7BDV9iU8VAbvJ/GSRHVYJ0feSxUEzMVjx4F8JVAwbVmx63giTNURr/uiff2/Yh7VI66BX5F8
	CFXoeewSAbOVqj2iMjGZoBLrwua69x/PEktX6qqG/wFqn1kRyWqGN2Jd0jRhP5UqPPeqNTHCBHndA
	BrmUCZ7ebYbJLtBjxwJlxi3wPCCxNRcGflRdpCnHSWn+OZeZA3efsuTIucP6Yv9r87W2GLaLaInw/
	B6/RsENy8cG5W6OPaAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhYB-00DabH-33;
	Tue, 04 Jul 2023 15:02:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhY8-00DaZ2-0x
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 15:02:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03B576128B;
	Tue,  4 Jul 2023 15:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A6D9C433C8;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688482952;
	bh=1RyX8hjXT73d9Hw/8gFvOm6ZBquCpTXh0cdwV67stoU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Oww0c6//HCpwHOJGIpB5nW8V0kJ70ntlY5aOROCK+d6wVL8el4h9RAO5ObM20bOdb
	 kaA5DBq9AERzm/TSFk8/jv/mmDQc7gG4vMeEJ7kp8gqkfjcFwI3J0+FUKsT5Cp+/wd
	 o96E65Y0OAc0NB4xDIAsrxeCz5o29IcUR9wCej40uI8GmMhzaX0CT34DE7mxn4wiK2
	 jxfymoL10e0Qy4gC/MahMgmKh1s/l0wwzfANxynDRmzu99tC+y2J/8fAZGUluTYHcD
	 oHVKKnLUZDhZkswNQMHv2lWASr79dU9b12/tO+ai5ixpeiC3yeIEsWNeSMz6+GtOHG
	 ySXkL1D2A1iRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D035C40C5E;
	Tue,  4 Jul 2023 15:02:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [v1, 0/2] Initialize Vector registers in the first-use trap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168848295230.29521.2754654664168260934.git-patchwork-notify@kernel.org>
Date: Tue, 04 Jul 2023 15:02:32 +0000
References: <20230627015556.12329-1-andy.chiu@sifive.com>
In-Reply-To: <20230627015556.12329-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, vineetg@rivosinc.com, greentime.hu@sifive.com,
 guoren@linux.alibaba.com, bjorn@rivosinc.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_080240_378307_4DCC18BB 
X-CRM114-Status: GOOD (  10.77  )
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

On Tue, 27 Jun 2023 01:55:53 +0000 you wrote:
> Before applying this series, We only initialize the space for saving
> Vector registers. This is not enough as Vector registers themselves also
> neeeded to be initialized before dropping back into userspace. Or, we
> may risk leaking a process's data left in Vector register to another
> process. This can be verified by only applying the second patch and
> running the test.
> 
> [...]

Here is the summary with links:
  - [v1,1/2] riscv: vector: clear V-reg in the first-use trap
    https://git.kernel.org/riscv/c/75b59f2a90aa
  - [v1,2/2] selftests: Test RISC-V Vector's first-use handler
    https://git.kernel.org/riscv/c/5c93c4c72fbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
