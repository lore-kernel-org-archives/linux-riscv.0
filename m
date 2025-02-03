Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27952C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtI7bpDYJaqmj9BLTCaGTwGj4Qv/PbGm4eQdIrjo1IY=; b=XeAkj5SfnnoL4b
	VEwZiJIQRMyPOD8Le4bj4r8Jq/pBUMwcrbgW0SvrAtk3GYGscBtXRRz3N75v1pzVdDbc6YYjoO6DT
	2zyHrbIk2XGaBEhGflGkf+fQ2Ak6zekP9UQusTgp6NcjXACIXXVQSDurXYX+Rit/GGJN7R2ZK+jHP
	8fMwATXJ8jsp4NFvw9jAmm/6GxX5zvrPCXUUN9MLcU18nGQtOgRWMo0gS2w58za65iMmLtBprilg5
	oTziGdvTDK1r+GK2cw9SIyTtBkatCk8h6HK7VsgO5qvOImPL+3D2PCzbOzisyBgt6q8aGEtcdlfIe
	5gFSrhZ1DA07fXlB7O9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1xI-0000000GQxv-1TBY;
	Mon, 03 Feb 2025 19:18:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ud-0000000GQ6g-3Ijo
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6667A41C17;
	Mon,  3 Feb 2025 19:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D528FC4CEE3;
	Mon,  3 Feb 2025 19:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610114;
	bh=+uu4oSJO2ZCvHq73dGxynnH17yLEevvcX7bneLr5yvg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pKtmyTx0wAWLEmSye8joLiwGcA9qLsk168MdKLsjhLoa6nDE87cHUSGYMvY+qjGV4
	 0tz93/E7U0pn9TvHmawhmBsoKT9xlP3gZ3NPrKrNShc9YP+0PZRcsIFg+4F5tK8+6G
	 K4PWqDSw0ta4z/PcWq20hk5x5t5c1ys5sq6ZPvSjZsQMOCCpxY6r/WyTtyMCTj95ob
	 jx4UWnlNFXmHmQrly0V8nNn6aeEABc/1QyYa9/PxyHzt/n8pRDycPk0qdNGX3iFVnM
	 VcFpwI7mAldm4YvIYVepgxX7kg2Ob+EGx/E94wah8p5nOgwhcUdJbAqsfz3K4gZnOa
	 OiTxfM5nn1E/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340FE380AA67;
	Mon,  3 Feb 2025 19:15:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Always inline bitops
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861014176.3409359.5658705755515724727.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:41 +0000
References: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
In-Reply-To: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 conor@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111515_904799_D1C3C9B1 
X-CRM114-Status: UNSURE (   8.24  )
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
by Yury Norov <yury.norov@gmail.com>:

On Sat, 23 Nov 2024 19:30:19 -0700 you wrote:
> When building allmodconfig + ThinLTO with certain versions of clang,
> arch_set_bit() may not be inlined, resulting in a modpost warning:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference: arch_set_bit+0x58 (section: .text.arch_set_bit) -> numa_nodes_parsed (section: .init.data)
> 
> acpi_numa_rintc_affinity_init() calls arch_set_bit() via __node_set()
> with numa_nodes_parsed, which is marked as __initdata. If arch_set_bit()
> is not inlined, modpost will flag that it is being called with data that
> will be freed after init.
> 
> [...]

Here is the summary with links:
  - riscv: Always inline bitops
    https://git.kernel.org/riscv/c/f9d2ee3f51d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
