Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683D7CE8E9B
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHpanWDvvqt6VlWCFrKMHUMX3Mif8WGB/1i+8KUautg=; b=m32lJX1K+LAfCt
	/sw8HW7LC6BWgGEpUybPyOhyd4uRkL1uEEXrQ3UshQHjERSR0c89csU7hCujTuBBI+ml9OxkA4oso
	a5RMDhoWcdngb5onBxUDRvsShtGAJ3hIyrNQu/TnpW3Z6cGLgjDUwJ/fuk+UwhuV5iFhczKaBaznr
	U3jbkIlrxm3wcIkI5oM/9QGysYrApAd9CfuVL+7saPuF+E+uJMEZXcozvIX2/lXnJUsTP8cclqqiN
	wwk6ymz+0LnwsQUa80o/zZFs5eUEnfUtITnk+9qJpfLgYuT9c9AWccdPqdpLXHNizbeHuqUnzJA4H
	cp1PusR5dWozZ4O4ih3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42BS-00000001Or7-0Cy6;
	Thu, 24 Oct 2024 18:03:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41yj-00000001LYx-3xq5;
	Thu, 24 Oct 2024 17:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B42785C54E6;
	Thu, 24 Oct 2024 17:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B83C4CEE4;
	Thu, 24 Oct 2024 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729792233;
	bh=bGnHyVsk1+n+xRwZo4AwVhT1cavRFamOy1xjbAurCyg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jFqqJqdI2EoUpRNGF4/UnbxGPxPIGZGl2IUDtZTQV0rId7fpZBmOt9+Hx4ThB/o+o
	 zjTks197XXuPfCWg4ygJcXbMjuR8AbK9vzxgZi0o7pW2Urwj0Td1q/gBKJu2GWJMwb
	 mVW44st6/rUID0wZKp4FGGCQ5Zx9R0Tk7WZ7x8tYbcl1ka/XAn29AD8ixs2mwk4eb8
	 dP3fYleir0Z/XJiPZnTxCuQyghmiD4A41eQ7RRQaT500MFoiLIIQykRKve06pFugw6
	 aVADzWPj2wrF+8jYFEUQbfPtr0//N4yZqsXl2mw6zu7uEgZ0/0QA+yWe1Rb98c8gWD
	 VzmVaNo/XhrPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF38380DBDC;
	Thu, 24 Oct 2024 17:50:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] riscv: Userspace pointer masking and tagged address
 ABI
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172979223949.2327357.12698642185375267636.git-patchwork-notify@kernel.org>
Date: Thu, 24 Oct 2024 17:50:39 +0000
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 catalin.marinas@arm.com, atishp@atishpatra.org,
 linux-kselftest@vger.kernel.org, robh+dt@kernel.org,
 kirill.shutemov@linux.intel.com, shuah@kernel.org,
 devicetree@vger.kernel.org, anup@brainfault.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net, kvm-riscv@lists.infradead.org,
 conor@kernel.org, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
 eugenis@google.com, charlie@rivosinc.com, krzysztof.kozlowski+dt@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_105034_099889_8ACB7901 
X-CRM114-Status: GOOD (  12.45  )
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

On Wed, 16 Oct 2024 13:27:41 -0700 you wrote:
> RISC-V defines three extensions for pointer masking[1]:
>  - Smmpm: configured in M-mode, affects M-mode
>  - Smnpm: configured in M-mode, affects the next lower mode (S or U-mode)
>  - Ssnpm: configured in S-mode, affects the next lower mode (VS, VU, or U-mode)
> 
> This series adds support for configuring Smnpm or Ssnpm (depending on
> which privilege mode the kernel is running in) to allow pointer masking
> in userspace (VU or U-mode), extending the PR_SET_TAGGED_ADDR_CTRL API
> from arm64. Unlike arm64 TBI, userspace pointer masking is not enabled
> by default on RISC-V. Additionally, the tag width (referred to as PMLEN)
> is variable, so userspace needs to ask the kernel for a specific tag
> width, which is interpreted as a lower bound on the number of tag bits.
> 
> [...]

Here is the summary with links:
  - [v5,01/10] dt-bindings: riscv: Add pointer masking ISA extensions
    https://git.kernel.org/riscv/c/8946ad26c0e2
  - [v5,02/10] riscv: Add ISA extension parsing for pointer masking
    https://git.kernel.org/riscv/c/12749546293e
  - [v5,03/10] riscv: Add CSR definitions for pointer masking
    https://git.kernel.org/riscv/c/1edd6226877b
  - [v5,04/10] riscv: Add support for userspace pointer masking
    https://git.kernel.org/riscv/c/871aba681a0d
  - [v5,05/10] riscv: Add support for the tagged address ABI
    https://git.kernel.org/riscv/c/c4d16116bd11
  - [v5,06/10] riscv: Allow ptrace control of the tagged address ABI
    https://git.kernel.org/riscv/c/cebce87fb04e
  - [v5,07/10] riscv: selftests: Add a pointer masking test
    https://git.kernel.org/riscv/c/5e9f1ee1c523
  - [v5,08/10] riscv: hwprobe: Export the Supm ISA extension
    https://git.kernel.org/riscv/c/d250050aae4f
  - [v5,09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
    https://git.kernel.org/riscv/c/e27f468bcf14
  - [v5,10/10] KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test
    https://git.kernel.org/riscv/c/814779461d84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
