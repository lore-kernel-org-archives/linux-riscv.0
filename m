Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199FAC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fghErTGExMGpTH4rkjyF0qlOvcge0fdutw0unkQ4At8=; b=hbdrcrrSrdP97J
	hDFg6di/6KToqruujWF+7KTUbgm4tOXQ4zzW1g5TWuEuEUKy7MFAjooMsyGkBCet3q8NQnb+6l0BN
	jqi2bM0dvV28Piw8Y+aIYAOhhtRWsmflGab8zYl/JPI+p/Qm+mTvpAikSZCMp3FUEB4n3jm17P85t
	nKLQkW4/+wBe/kldrVpa2wehjiCsw7XGnvO7pEioy1cnxTqCa62lWdF/dIgnhGrRwhR6M644EVlk1
	ycfHNrTnLVg1N5SnG+qgZalbfOPVnmlTxSgKcuCLHW8AatH88zomVJxVsZ5TAVVbOoxMlAq2kyz4G
	XEOzslJEUxj0zjpgsctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEz-0000000DEeN-2csH;
	Thu, 04 Jul 2024 13:11:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEk-0000000DEX1-0o0Z;
	Thu, 04 Jul 2024 13:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19A1B626E5;
	Thu,  4 Jul 2024 13:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8979C4AF07;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098656;
	bh=5Z/JhMWlZOiA4gMPtEvpcd72gMvcEm+EciKo2a/8g/0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TYcypi+6JnHBpY4lZ+cKwjZQXSNSWSdg1CMGaYgL6jNS/VWlfNA5H0c8BOxNzmE/u
	 Ken1JVEeKRQvpC6ysrZ/awEHnBd0sHH0w0KO0ZrLT4GH1l8K8HXt9ALEiY0w8sSGpe
	 bKNzYA+Bp+c+CmYrH/zsEsTx2bliYMnRwl/9AkaasfTTlfQ7KQ3kBCpaigfLMdi9WC
	 6MyCwml9mDKAv0Y8HSG8UgLHEtCm86vI4CstzqwIP61t18YHjL9iKipLL4ReikrbOg
	 TwXkGINP5tVXCLqEGHJ8QdsI6OgD9V9T/J3Wy/fHQlz4gh+U+GPISJKRe/o9aAjuVb
	 troCPvtdDExzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5FACC43332;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] Assorted fixes in RISC-V PMU driver
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172009865667.17306.8198164921917389320.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jul 2024 13:10:56 +0000
References: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
In-Reply-To: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 atishp@atishpatra.org, anup@brainfault.org, will@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 ajones@ventanamicro.com, conor.dooley@microchip.com,
 samuel.holland@sifive.com, palmer@rivosinc.com, alexghiti@rivosinc.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, garthlei@pku.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_061058_317240_3DC9E519 
X-CRM114-Status: GOOD (  11.53  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 28 Jun 2024 00:51:40 -0700 you wrote:
> This series contains 3 fixes out of which the first one is a new fix
> for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
> patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
> to its own patch. I also changed an error message in kvm vcpu_pmu from
> pr_err to pr_debug to avoid redundant failure error messages generated
> due to the boot time quering of events implemented in the patch[1]
> 
> [...]

Here is the summary with links:
  - [v4,1/3] drivers/perf: riscv: Do not update the event data if uptodate
    https://git.kernel.org/riscv/c/a3f24e83d11d
  - [v4,2/3] drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
    https://git.kernel.org/riscv/c/7dd646cf745c
  - [v4,3/3] perf: RISC-V: Check standard event availability
    https://git.kernel.org/riscv/c/16d3b1af0944

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
