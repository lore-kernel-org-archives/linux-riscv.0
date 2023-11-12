Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C24C4167D
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEgXK5oS4jQ2xt+OlLKV5mA9xYR1IdDTlCFlvELRaTc=; b=rh4oEucRdFOmV2
	t/zSDLNa/jeYlbAtQp3PeY1Z5wz9+RTI1U/sUt5j8Fa6D/5jPiJJkr+sQqehEFUwWnl1cbjXlnfAz
	P8SXeT/t0HcV4hi/uDnd0uUVbeejSH4Kf4WaegTJaVQS1LXTNCOmJ9JZaJXi/5Q2Fsu9zV/JmNLnL
	/SL8DCxvY3wth52qVvcMpkDWYeME59f9c4b5XN9OHRTGemwRGd5B39aFnoOgO1x+ki6v9l7kmsmat
	7btZMdOFt4A06a6HDDNdIAAREAl96wgRadk8SIh4yocZuqVqlHdTGmT0DJLWhmven21pDozZLmdbH
	qUcdwWLNqyVcuHDbe0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1yle-00BWrb-0v;
	Sun, 12 Nov 2023 00:56:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylT-00BWhO-1M;
	Sun, 12 Nov 2023 00:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65C17CE0AF0;
	Sun, 12 Nov 2023 00:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E392C433CC;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=BudbliKklZT1nMXLsYFQyB+Pk18EUouJG6KZUqc8uyA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qgpBSE+z2PM5zIUQ4ZiQ42U4qfNh/mK+G0UjLlwezYzovO7Hv0r3U4c2k0cyQdJYu
	 2tpvqEdQc/11Ql3RizpG4raIDOskXMIAUvBKTtjTHuZBVqO64Ai4BwQvtxiuGP7GE0
	 CQmDP5c7hXu//cf4WJPIWVVxlHFlXjFtikp2paYREnbtSZEzC4aaPYEiSS3SYENmbA
	 8Um9rkkzACTUm8CXhr7u/rIYQ204eiVoJlZZJPnezsmOLIDxlNAQc1kpIVDVmquMV2
	 HIxQgf86TrDBy4GYf8wHAQCmg3P0oq4N21BCiACjV24ts57a55XSwDkPCJQzoigyop
	 H7y/eALJS/dlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CE26E0008B;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/6] KVM RISC-V Conditional Operations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054631.11360.10958982747975281844.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231003035226.1945725-1-apatel@ventanamicro.com>
In-Reply-To: <20231003035226.1945725-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com,
 atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shuah@kernel.org, ajones@ventanamicro.com, mchitale@ventanamicro.com,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165551_632027_DB86B9F3 
X-CRM114-Status: UNSURE (   7.34  )
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

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Tue,  3 Oct 2023 09:22:20 +0530 you wrote:
> This series extends KVM RISC-V to allow Guest/VM discover and use
> conditional operations related ISA extensions (namely XVentanaCondOps
> and Zicond).
> 
> To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops_v1
> branch at: https://github.com/avpatel/kvmtool.git
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: riscv: Add Zicond extension entry
    https://git.kernel.org/riscv/c/00c6f39c8247
  - [v3,2/6] RISC-V: Detect Zicond from ISA string
    https://git.kernel.org/riscv/c/662a601aa355
  - [v3,3/6] RISC-V: KVM: Allow Zicond extension for Guest/VM
    https://git.kernel.org/riscv/c/df68f4d8cb49
  - [v3,4/6] KVM: riscv: selftests: Add senvcfg register to get-reg-list test
    https://git.kernel.org/riscv/c/4d554e0226e6
  - [v3,5/6] KVM: riscv: selftests: Add smstateen registers to get-reg-list test
    https://git.kernel.org/riscv/c/e1a8db0c9a0e
  - [v3,6/6] KVM: riscv: selftests: Add condops extensions to get-reg-list test
    https://git.kernel.org/riscv/c/2b3f2b78ec93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
