Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A364C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 03:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJ4NfXigVao65uPGaaW6gbkPWmBfXblbX3VZWMm2/f4=; b=OuVdby0ulLcCIj
	NYO1PX0J/eYCcY1TjQRGsPhK1KNS0ROl6lZW8+A+vP47zGJjTIjsRY1oYcZBobfIhx+a/VIyWTg51
	zM+XrjGfoo0k8bxU+yLG23ChtLabTAixHOOQ59YNcDHI3Zz1yhMeWuDNaLPAPQz/p1Ppea36SY/xa
	Kxkdq2KhkHyR76xdYo0r+3WKBiWastfljHbdHCxZklOQKUGncRpzNIs/YMTALeCH+N0aDeRNUA33E
	3+muY0Rw7RZBELuEceFJzfE24uQ6sHq3p9gZU8CM3JbiqfaESqtzWliNhm0jw1BytcqR84NbhaM/V
	KZyjtbx2Z6/Ib057DmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9IZ-001XVq-0a;
	Thu, 21 Dec 2023 03:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9IT-001XUD-1m
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 03:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D368561800;
	Thu, 21 Dec 2023 03:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C2AEC433C7;
	Thu, 21 Dec 2023 03:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703127624;
	bh=7p5HpM/silOKEV2d1IqFkK6Ov7Jg7fNgmjXE6MgPWkM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qnNDqOFEQFNcm4pqwvBa3xZKbpYBu3TkzZwE4yGybTuhcJwqbJP6rUt2i3JysPj8J
	 bmUk2VFSGfY87PURS7y/IWBc7dLVHU2lnRuwI+Vy/aQmm0kLlMo6LTm12P9zMi+/+r
	 cVZJR4BqV6Z4vZz+YGLUnhN6eaEC9o3L14IQ3uGafILtQstL6s9iboSWSNSwCJUbIN
	 XeiNPHCpaCUHVxx2IYYg0vx8DIhCb1FwZGZabc3FhM+2FcNmaPwrATXJet6jiT75XR
	 y3Yu+A7AfgLCwDzN2+PyMqnmpUaM/42Ay9qJN+CY+IlT+cYNSZOKZRMXy3ftVQEpqz
	 haQPHVkAbC/Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55B46DD4EE7;
	Thu, 21 Dec 2023 03:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: Fix wrong usage of lm_alias() when splitting
 a huge linear mapping
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170312762434.27922.5406606190736604127.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 03:00:24 +0000
References: <20231212195400.128457-1-alexghiti@rivosinc.com>
In-Reply-To: <20231212195400.128457-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_190029_652624_102FD4B9 
X-CRM114-Status: UNSURE (   8.03  )
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

On Tue, 12 Dec 2023 20:54:00 +0100 you wrote:
> lm_alias() can only be used on kernel mappings since it explicitly uses
> __pa_symbol(), so simply fix this by checking where the address belongs
> to before.
> 
> Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
> Reported-by: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-riscv/000000000000620dd0060c02c5e1@google.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
    https://git.kernel.org/riscv/c/6af3dd2be9cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
