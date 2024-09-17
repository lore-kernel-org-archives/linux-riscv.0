Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D97CAC58D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOlB9EL+ii1S5QBZbdUsGl+YuCWduYvj4W8iWM4nWEY=; b=FiATrDdNgA1COm
	oYgxM21XnPa2gIEjCoh+M1Spl1DqrCWSUD7FH/18pMRwKY02O9nOJBlsZEkhPyBzd2dYYnwxrRV0e
	RKYzvmR/mapf6UMH7eiG5RxGyV5wzS26s2Ca4JQ5t1d1oOk8ZPgO0RzdBGLHsoh4HWtFKtaLU5rSo
	sQF8aVSa5vXCwRsSWk+KpPu6vN7PDSdbFjB/VVGMSIZjMQW+MMM0MvD/ZfhsR5jVgArBXOZQC0zwI
	2BoyjZb78C1J6GDG18hG5BlG6Vc2ddCbxiWSUzbkMScml/4oSN2HTY+UoS0OWHAg1cRqfdaFFGuYo
	ifUObBHT5uWPmc5dOarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb6D-00000006VbA-2JPk;
	Tue, 17 Sep 2024 16:30:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb6B-00000006VaQ-3Yfz
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Sep 2024 16:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ruRdO+SgCH8UXN8PcUEmlWnHQz4JyNDuo12qMzVd9ko=; b=TGgNmqumNX44fSmTeNLj4djLL+
	FnJHipX09E/oDoFSerqrhv1W5D/S1fGvRDB+3e1P9GwGr/rI3YlFt+0g3tHRYPxcjmARXguSStTc4
	Z5yIH5w0GkMvtiIQbaxzSMfNLnAZmIIsTvXqiwQAq9umptTRgiekiIL5EATCH75FBHY2j/lvho7UM
	8TNzEUUjqBT1x97iz7FChNddmOqhBwD4IjImlA11RC1W0w1kk64vrhN+Yhfetzh0MX4juBKl+W7IN
	SRb/9x6McbkzFBJyOfq3fd0Uh5pmB8Qo7YaOfR7NxHGsjBNGF1JXAegzAipUOxbHyb+1jzFpho7zt
	K98W1X9A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb68-00000000e5Z-0WgA
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 16:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45FBC5C5C76;
	Tue, 17 Sep 2024 16:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90503C4CEC7;
	Tue, 17 Sep 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726590635;
	bh=lp76d/TPZKlYblD+Lxh9elSyGKFOamh6gIPS5YpuIy4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qfgt2Dga75Wfn+yRt1adZC6YxdGF+wInN9mL1ME/yzDxdzrcAAOdey9LI6jP0VPpp
	 WRgNqsbQdGhsxlQDK5NfJAHLLJTEzj3SirpwqtPGQFu1Js7idYEUSDjjVBeldoDdDE
	 kwv78ql2Mlc5+969vuuxCMTYQOaQuB3V/JMNtwfjrnXNj5vgMVQODy+u6VataYemES
	 Q7GcBIgTWQAvfmvs33VLqNN/av6bqx28vrNJkf9JSbERz9/pDGP7DYiHPiQ58GslFE
	 mDQcIDXmb02xjJarhD2GYbFrIaLHIMa8NCGnfIBbaQUsRx0rGZEZ7lpau6J9H8oHdX
	 V94OHERudae4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7119E3809A80;
	Tue, 17 Sep 2024 16:30:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: Implement kgdb_roundup_cpus() to enable future NMI
 Roundup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172659063700.214459.15823238572969686332.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 16:30:37 +0000
References: <20240727063438.886155-1-ruanjinjie@huawei.com>
In-Reply-To: <20240727063438.886155-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 conor.dooley@microchip.com, takakura@valinux.co.jp,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_173040_444808_4803C55C 
X-CRM114-Status: GOOD (  10.57  )
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

On Sat, 27 Jul 2024 14:34:38 +0800 you wrote:
> Until now, the generic weak kgdb_roundup_cpus() has been used for kgdb on
> RISCV. A custom one allows to debug CPUs that are stuck with interrupts
> disabled with NMI support in the future. And using an IPI is better than
> the generic one since it avoids the potential situation described in the
> generic kgdb_call_nmi_hook(). As Andrew pointed out, once there is NMI
> support, we can easily extend this and the CPU backtrace support
> to use NMIs.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: Implement kgdb_roundup_cpus() to enable future NMI Roundup
    https://git.kernel.org/riscv/c/983f12149942

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
