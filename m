Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F331C7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 03:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glToewEoVvj5k3F4PSk7Fpq5hAfjwO1Ad+drJ/+q9y4=; b=NPwenW4MaWzykb
	pmFjutBYyxX3dU8cunWqRg61nWRUmij3L0dpzwLypSJNCaUbCpiX2RBKYmHUZhE87TDUQm1lEo6Im
	SPI/9IkgDJHzFQnaywc/f2DB4iuVcCbsdPeOxC+6RpygQU5zY4d4BN2r+Mwq5l630Zd0rcSYTrCfG
	Q55crbpG7nvtmqiurQ1CXqtUGEeEyipW6U6Qd4TqBso2GtdJf4XNZFxF8jUG3PbZ5Yg9wudjx4p5q
	rtUUcEMT0R/Diue10pyWR7rOPc7NaQYl6MDqYv1tGRXK7ApSqSk4rdjVMC/vb+I0H2TR97A5QIZmQ
	QELgFr7zUMRnOUbioA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTu1J-00000004WMJ-193o;
	Tue, 24 Jun 2025 03:08:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrr3-00000004KVf-36rj
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 00:49:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFEC4629C2;
	Tue, 24 Jun 2025 00:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74806C4CEED;
	Tue, 24 Jun 2025 00:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750726180;
	bh=X8UulWlYl9LmJn3LksLbSQHl4U0132JMnyWRQath+zI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kMANg9pbkyiSlF9oitx9ECRRIjq9IurI7AwTATjQfEkO0qD407oX07uhZaJs3oNC7
	 bJ1BtGWJZ1cJEfV5ZTZ4EUw1s7k4pqMp1+ZBgFDKLPrvgUnga8TDlwoU1Mn6Y+pXcg
	 AXTdh4KL4fh/sUeQ4N6Q1kzcHhcnNxSY7uqITG3uoWJnqxhkUpkOiCMxPOZegr1BST
	 bswDQ7I69jIDmKdPGZzOO9A/UkTQZxfKcB/IEu1U9Y3bt/PU0vxPlDtfvaq6fkZIDa
	 JJ8ySnZlMDfRl+z6gqBKxTOoraDhRlWZE7wRqZXhC5r0NI+W9xf8idp6K6b51PoeyS
	 iY4SMoiXawtMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFC439FEB7D;
	Tue, 24 Jun 2025 00:50:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175072620724.3349808.11810729064319282385.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:50:07 +0000
References: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
In-Reply-To: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 samuel.holland@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, cyan.yang@sifive.com, palmer@rivosinc.com,
 linux-kernel@vger.kernel.org, lkp@intel.com
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 20 Jun 2025 12:08:11 +0000 you wrote:
> sparse reports the following warning:
> 
> arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?
> 
> So as this struct is only used in this file, make it static.
> 
> Fixes: 2d147d77ae6e ("riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: Fix sparse warning in vendor_extensions/sifive.c
    https://git.kernel.org/riscv/c/b0843f836126

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
