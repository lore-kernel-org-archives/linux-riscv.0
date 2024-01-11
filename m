Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D508C47DAC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFY3RKM1iArT+Rosn+AcxPzK+xsrq9hAzwZ2fzlmrzk=; b=FHkDNF33ibdzIL
	Jx9pc/HMkrEaJIT4hBJEzSxYKEzUufaJG83c+dfnkX62EKWJi7Yo4gksXRjJk7le7hMKz+1BZwmAf
	kYxrxNWb62M53phY07qK+cY9fPYMZ8qbeVd1IcJgAzREYIvxSN+IK0XXfCC2XXCbC6tJtN67Q7cPM
	xTJXy5YEe2tCfRIGZCeJqBgzZ1CVoHQSZbxVmffvNbhSEDMt6aMuYmy5VpXokDCBUUa9U0Dkr+zTY
	noPnKVCGfR0OSpAhXoOhWYbeIFfVuew64OmYaL50z2BZU7WhwYi0uhy2a5LhWLogajAn2AXUc2LCn
	rwVR/jw+4ZdJsSrXxW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOQ-000KO7-2k;
	Thu, 11 Jan 2024 14:50:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOG-000KH4-1l
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 36146B82062;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02A90C41674;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984638;
	bh=mHkFOeHTyojA11QtG6B355HuG+5pcJdp5fAe56XIogE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FnyAb9IZQY3WpAp8wuQ/asvFicejEPMDKlcADCmkdSP4cT5s21xswPgPcOcXFPuhZ
	 C2NaK+C0xlRdzlRfD17ghA++TjxLoQPi1Opq/jpZHharguWhpbPXCZ73dvdJI6F2G5
	 kdn6tgBPTyPvCfO9po5l/9ZveQfRoo7n9HNdtfftavfYlM+tZhFxeWj5/InJbRIlVF
	 jjUvoNkHqN0IVk4lSCHakjTTMRYX+tiJhXy6WkfHQUqltdhJB5ZMFQwwqEkC7fhoIr
	 k5VoL/fi3Dmrm7Soj+OgfkRsAMrV8lFGvVl9X8wnqJErs0rvRUqIdzerERwbMrA3y/
	 XRsnTAJPxTUGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E38DDD8C974;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Clarify mmu-type interpretation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463792.20080.16092078813919262282.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231227175739.1453782-1-samuel.holland@sifive.com>
In-Reply-To: <20231227175739.1453782-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065040_713325_FA395309 
X-CRM114-Status: GOOD (  10.00  )
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

On Wed, 27 Dec 2023 09:57:38 -0800 you wrote:
> The current description implies that only a single address translation
> mode is available to the operating system. However, some implementations
> support multiple address translation modes, and the operating system is
> free to choose between them.
> 
> Per the RISC-V privileged specification, Sv48 implementations must also
> implement Sv39, and likewise Sv57 implies support for Sv48. This means
> it is possible to describe all supported address translation modes using
> a single value, by naming the largest supported mode. This appears to
> have been the intended usage of the property, so note it explicitly.
> 
> [...]

Here is the summary with links:
  - dt-bindings: riscv: cpus: Clarify mmu-type interpretation
    https://git.kernel.org/riscv/c/b4070c2a242e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
