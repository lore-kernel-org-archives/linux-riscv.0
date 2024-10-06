Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79E4CFB424
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A1NAsx54CC3e+l3IWvaoRaG6qjtYhTq8ilqUbqffM4=; b=COCRrUxnYYsmJw
	5SZBBVbvcQVfQzYZ2lxLkZ9aJIyxC1BYtPOpIRYPEyMvRfLvvc6D/I0xbT230Na0VSqk8dCipYHZG
	5rtE/5wwcMwWbPUV+PVKgPN0dT+agoJRD0UyI/9MQpfd4nyuUf4UyWfdBnzYpGcaLNesqFmvkwx7t
	25GKW5JFS7e4/lEBH2fcUqywErrA23JkZvB7x/0Ea4tRUzWzWc1ge9cpsalTouroZ1wIL5xf8ZwST
	muCPpy9MNWakCrfdzZjAGDoWxtRJrZs0AyunvFbgLCeMr46z23iFF0jvpO1n8KA2zcrNUFfX/ij0y
	XwPjDE8pwy7nNGHW4Vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxRK3-000000005Ms-1pwC;
	Sun, 06 Oct 2024 13:29:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxRK0-000000005MG-32lr
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 13:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0D79A40D14;
	Sun,  6 Oct 2024 13:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EABC4CEC5;
	Sun,  6 Oct 2024 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728221354;
	bh=JkezCXci0FhDh/r6gOCJZzc3+278ITOevezbT4aBxLU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EPSwuRJCldO53+ZotSJ3frgqm8YOBG30DJus2fiLurymQr4dhYZl9VUR/0PoxELZQ
	 +Y6yhHBrOufmMbDA6Xu7OlzpcEfbqXZHKOXA1PYEx8aSWyOtGSiJw0l5e2IElOm+e+
	 LXeb+5hxb9/M9FndLt4g3+eJJJKJXdzNXNjCyWDLwIIEMo86R+UHmVThAMI25lP4oR
	 LlZAg6wSxIDSuB5KUVnW0ap661Hg4hTqIDRQD3twoLKm/j1/AtOW5+EWHKUBa5jtyf
	 PJB6FPVoIjR1jBFhObcGVeZD+eaO0lsmqbkfbGRK3u527RFzoFV4Oduz7hdj7gY+GW
	 /t1pYQlmLsUUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADC43806656;
	Sun,  6 Oct 2024 13:29:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] riscv: Per-thread envcfg CSR support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172822135876.3395169.3761438771827436861.git-patchwork-notify@kernel.org>
Date: Sun, 06 Oct 2024 13:29:18 +0000
References: <20240814081126.956287-1-samuel.holland@sifive.com>
In-Reply-To: <20240814081126.956287-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, leobras@redhat.com,
 aou@eecs.berkeley.edu, xiao.w.wang@intel.com, paul.walmsley@sifive.com,
 charlie@rivosinc.com, linux-kernel@vger.kernel.org, conor@kernel.org,
 conor.dooley@microchip.com, evan@rivosinc.com, guoren@kernel.org,
 andy.chiu@sifive.com, greentime.hu@sifive.com, cleger@rivosinc.com,
 tglx@linutronix.de, ajones@ventanamicro.com, ke.zhao@shingroup.cn,
 debug@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_062916_848868_C886941D 
X-CRM114-Status: UNSURE (   8.41  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 14 Aug 2024 01:10:53 -0700 you wrote:
> This series (or equivalent) is a prerequisite for both user-mode pointer
> masking and CFI support, as both of those are per-thread features and
> are controlled by fields in the envcfg CSR. These patches are based on
> v1 of the pointer masking series[1], with significant input from both
> Deepak and Andrew.
> 
> [1]: https://lore.kernel.org/linux-riscv/20240319215915.832127-6-samuel.holland@sifive.com/
> 
> [...]

Here is the summary with links:
  - [v4,1/3] riscv: Enable cbo.zero only when all harts support Zicboz
    https://git.kernel.org/riscv/c/1b57747e978f
  - [v4,2/3] riscv: Add support for per-thread envcfg CSR values
    https://git.kernel.org/riscv/c/5fc7355f0137
  - [v4,3/3] riscv: Call riscv_user_isa_enable() only on the boot hart
    https://git.kernel.org/riscv/c/368546ebe7e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
