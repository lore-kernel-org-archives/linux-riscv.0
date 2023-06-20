Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CD8EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zq4VWG/C+DBzzw3BXEtTM/BheUnpb/RcIT1O2TlNGLc=; b=vX2yeiTQcQXuB5
	ZXD58Rkderux1bfaf5aEbzQRuecMcFVHOiWQPJGARt7eMPdiYDozCaBleIJzUdAME+fwm+4FbZliA
	JyA2CIsX+k30F3cFVBsDDVkMUrnivZk+Muokmao01DK3N3CEIAYb6CTlJdceUYs4bve/9Tx+mRhK7
	e3ZN3524Hf+oJ3BRyRhVUPVwD6OWgo26GECY5dyrwxJ1Xv6+TM1s4QQjn2iQMGquKZ5NGRJx0PY2H
	HD88jS1WEglyN5nXLW26wgi58DAJ9a/sGl41i1yPn021Jp+pv6AI7oGagLNNa4r1+Fh+v4x/DPHsw
	89eDZnIEsXayTNEK7vZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhDL-00CCPh-0g;
	Tue, 20 Jun 2023 19:40:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhDE-00CCNJ-27
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:40:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E61E860F2A;
	Tue, 20 Jun 2023 19:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52D32C433C9;
	Tue, 20 Jun 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687290023;
	bh=mM9yZzRc1EvsVBVrsYVux7+dW6hdoDW/V0q9LAFw450=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K4rKjZVg4wMrZnfe/taLR8c5BRD7xwffa4W8FuheDFdqZAdg+EFC2cyd04uSx1DbX
	 KD2zGS5HXV0pE4uedkw6BXCNYMNOt42BWWN8sA3fKSRP+MI4ld7SiAfBR9+2DWmVzp
	 xPHslnDdfB+GqZZrg3bRCr2de9dTrwMMcgemFyykKpDvELCoOoqQ9YiJLmfDzwb8FY
	 qkS5yrTsRI6ECcHTduj+SUwG2/k0IDq9YapEE8otQJeobXi8EZwvdCuRVKvX/uAPoJ
	 ntzf85bkWUJjTKjAWnfTxxyYZ6nhEvEeLDC+8E2YDWnyN0uF6MUcMYSNsKDHsgfhMM
	 qWdSSQUjjHAfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38EDEC395D9;
	Tue, 20 Jun 2023 19:40:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: replace deprecated scall with ecall
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168729002322.20607.3530889477319155290.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 19:40:23 +0000
References: <20230423223210.126948-1-maskray@google.com>
In-Reply-To: <20230423223210.126948-1-maskray@google.com>
To: Fangrui Song <maskray@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_124024_737063_6319C0EA 
X-CRM114-Status: GOOD (  10.13  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 23 Apr 2023 22:32:10 +0000 you wrote:
> scall is a deprecated alias for ecall. ecall is used in several places,
> so there is no assembler compatibility concern.
> 
> Signed-off-by: Fangrui Song <maskray@google.com>
> ---
>  arch/riscv/kernel/entry.S             | 4 ++--
>  arch/riscv/kernel/vdso/rt_sigreturn.S | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - riscv: replace deprecated scall with ecall
    https://git.kernel.org/riscv/c/4681dacadeef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
