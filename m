Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C805BC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoOsGGS1yaoQCTRzf/r1+rm5My8k1clJb+r6cwnfKc0=; b=jKinw87SlcH0ea
	HbkIzOYgkxXqiTuClSEN10Yww9alOcVMttbqAf27BoBhGP//DQbtLEz/MxorbF8UXkcLqHjF61mkH
	IJ/uXMj7+7yVQWijHLMc7Mjm4SSgT2KmRQYVfKwJy1jNW2JzsffzxQ+q9UlYzrTNaK7YwjFmyHkrH
	RfSU0b4iqCzmOnV2Th0afUJ9GNfKkdGrJLGQ37UitTaBljtWicou/SpX+2F9miOn/J9NxVUkO30ox
	6Zp3BDh8zmTQ1rqqCVagycWl/3OCHDOoM4/fYWb5lQggYPohW9lVGc8RpcngRc/s81ZE2QCdBVpo8
	Ysc6aJsrj3dYKDKpauUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnq-005x8H-TT; Wed, 25 Jan 2023 03:50:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnj-005x2h-U3
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 03:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5EAF96144B;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B45DC433A8;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674618619;
	bh=W49himB24WbXFY9PqkkVpWkwLeDmCXXyYZNXQsCimqU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DQBxlohxyD9EKJywFWIB5YJu5Dm1GsiWzY5DivbfB77DOSWMi+Z+By+ZJXsDXOLff
	 tcHF3o3x82ddK7GkBfxacVAGDOF57yIeB35E43kdxmlk6ssxZNs0nL3Yeu2SChHpxF
	 fLQt0ySRveCHQt/pol2br+Or9Lc4JR3HlHk+COhP6LFu13LCaDOU09OrDAPrbM3JqO
	 u5nlmfEqh510gVXULgt0jm3AaZ3ZG8MmmmJp5iyAT2RzVvOLJdX8G/ss2ZEtSuA0+z
	 Qx66wJ5JvlBdkZR2t0QhhCi1ujuKjSKOkflnzImLTLrjA7Y49I+1+TzKtmBjBq93yB
	 e66n1a7vKiUzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EBF22F83ED5;
	Wed, 25 Jan 2023 03:50:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167461861896.411.6044285262102729324.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 03:50:18 +0000
References: <20230110080419.931185-1-guoren@kernel.org>
In-Reply-To: <20230110080419.931185-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, alexandre.ghiti@canonical.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_195020_033543_D207E31D 
X-CRM114-Status: UNSURE (   9.76  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 10 Jan 2023 03:04:19 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> KERN_VIRT_SIZE is 1/4 of the entries of the page global directory,
> not half.
> 
> Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> 
> [...]

Here is the summary with links:
  - riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
    https://git.kernel.org/riscv/c/6be1ff430dab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
