Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08D4C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTrg28FwX/BwTwwgqUzPJ0FZqt9d+tro5jKvMb61oKw=; b=gVXX0lmpm4JiQU
	Anw6sEj+dOCNPQ8vjahlK6z/L7i4ChH9IQp72zSp7UhvoG3EtJ1O6V0Ss4q86nxJPTXLqgKEdqGYc
	b2cfVI5uX42d5QYyuRiA3ffKzf4HV9Ted+wSEXjoYiE02m4AO2EJzMxUBRP30khmnf1d9rvSWQBeo
	jB/woMrJd3lUNf5mQ1R1qkd2JZDc68Dm7aEi6ypd2/rdVoArY3tjLyecpkP8JFqIhpnhwE48AqqJh
	9tRy+5n1YIl3lM4XUkzqKkXlqpVxwsjmGm1u0eDi3zq/BzIMMLS6E+DxQ81P2AyTkQoMacHih25YO
	GUr7+DAOjCmq9J/Qy7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylW-00BWl3-1W;
	Sun, 12 Nov 2023 00:55:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylR-00BWhB-23
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 00:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A28B560BCA;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68ACAC433C9;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=VgTVM+5WP2BDA8+eWnnrND2B8DSs8IWm3pfXn96hH5M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JLb3QwkYkbpfY3FNvlq0ln90cjF2dCJ/FBjoJvohtlKl5++jjxUpLiRvVRrzLfnMw
	 vqIx6cIMfKr070kpufEO4pDDNYZBrsbey74LmD56VyB6rtMKEMS2PuHv8FlOzAdnko
	 OCS/Hdjzh6S+iL7nZNY1du7wFsPrQPCaydb5KK9mUDp8BLAfADd2autchrBUsE5bXS
	 wtlaPjOEbe6qAkDlAIfra6VZWq2xAq3pay7+/5hPxAYOmrUCJZap1/rY5guetPn+MO
	 WzYBiUUdpnzpd6S0tZndmFihAyu/lQnh1zU4pQRpK3GfZZ53EnlYT1MgSfx2vEGWUx
	 pSeNNz6aY733A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4447AE00088;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] kbuild: remove ARCH_POSTLINK from module builds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054627.11360.14371365860315312701.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231017103742.130927-1-masahiroy@kernel.org>
In-Reply-To: <20231017103742.130927-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, bp@alien8.de,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, hpa@zytor.com,
 mingo@redhat.com, mpe@ellerman.id.au, nathan@kernel.org, npiggin@gmail.com,
 ndesaulniers@google.com, nicolas@fjasle.eu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tsbogend@alpha.franken.de, tglx@linutronix.de,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165549_742820_71ECF860 
X-CRM114-Status: UNSURE (   7.44  )
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
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue, 17 Oct 2023 19:37:39 +0900 you wrote:
> The '%.ko' rule in arch/*/Makefile.postlink does nothing but call the
> 'true' command.
> 
> Remove the meaningless code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> [...]

Here is the summary with links:
  - [1/4] kbuild: remove ARCH_POSTLINK from module builds
    https://git.kernel.org/riscv/c/7f6d8f7e43fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
