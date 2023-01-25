Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAE8C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFG1dc92rMbdRLoWn5D5DL9gxgFIiwJdPfHESYONJIs=; b=K+fOm7QE/QT1Iy
	iCxhrh64ZCBck0Mj/foiYLRxaraFMdGVIHW4R6uqFc0JG2FE2fRnnfeMf+nNGWa/LvuNuQxds7GY8
	a/S0T0InOlsMpZcdKE86r4pBeNZL5D+EpaSAIQVoLT+mlep4Hfcx2VFusdRbDU6mHFwFovrfeA1go
	HRwsxR77DzzeEBIoF6IH84KS+Ul7u6eSnPY28FJgbf42+ZbshK7yyPrQ67Y7Zb3f2TjEBrI7SMGQm
	htH0qfBUhRCE6HLwEl8jGhwFNePJMCJYs2lXiNRTHJ9GjTK9pNvbiKyVCJXWw4dr4TwTp/2nmk9Mw
	PRg+jUG6cVLP1flao+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnv-005xBa-3t; Wed, 25 Jan 2023 03:50:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnl-005x2v-9Z; Wed, 25 Jan 2023 03:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0BBD6144A;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06804C433D2;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674618619;
	bh=OGOOxscv3pLswnr3v5bGmdovPZ+cxPyFs3HDLZAlpLg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ti634rysOu54xHK5FH5WwlxZATlXozR8wPVaDT78pU+UgsersLt5Rti3NlyjFp39x
	 NVOIkkFkw7dA3C+xFMtHl7YiS8oOr+GLzG1LeQHNum7VobiWnEYiXFsPpT+fSTJcJO
	 6n+ffLCGpmWXHwmZIInyKFYCeFmi2wCCgGv+RuXQKdTh7TpWhooE0nyoujRJUtuhI+
	 X1c3ZkIaRmiRZPmEnwOS/2/8ewNTgmL20ybKk+OPi4nSTOZaaqCACiWQlcTI2PTQiq
	 9I5etNCOxDJu8rR58pt8aDxybUmJmKvPWCxM23h4m7e6ze52DJtDNfw/6/bhqg5INi
	 wOkdT/az3zbIg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D4EF8F83ED2;
	Wed, 25 Jan 2023 03:50:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/13] riscv: improve boot time isa extensions handling
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167461861886.411.4529941581273369452.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 03:50:18 +0000
References: <20230115154953.831-1-jszhang@kernel.org>
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org,
 atishp@atishpatra.org, heiko@sntech.de, conor.dooley@microchip.com,
 ajones@ventanamicro.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_195021_398605_1F5830DB 
X-CRM114-Status: GOOD (  11.93  )
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

On Sun, 15 Jan 2023 23:49:40 +0800 you wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, so a hart's features won't change after booting, this
> chacteristic makes it straightforward to use a static branch to check
> a specific ISA extension is supported or not to optimize performance.
> 
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
> 
> [...]

Here is the summary with links:
  - [v4,01/13] riscv: fix jal offsets in patched alternatives
    https://git.kernel.org/riscv/c/9d5567ccf96f
  - [v4,02/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
    (no matching commit)
  - [v4,03/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
    (no matching commit)
  - [v4,04/13] riscv: hwcap: make ISA extension ids can be used in asm
    (no matching commit)
  - [v4,05/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
    (no matching commit)
  - [v4,06/13] riscv: introduce riscv_has_extension_[un]likely()
    (no matching commit)
  - [v4,07/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
    (no matching commit)
  - [v4,08/13] riscv: module: move find_section to module.h
    (no matching commit)
  - [v4,09/13] riscv: switch to relative alternative entries
    (no matching commit)
  - [v4,10/13] riscv: alternative: patch alternatives in the vDSO
    (no matching commit)
  - [v4,11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
    (no matching commit)
  - [v4,12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
    (no matching commit)
  - [v4,13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
