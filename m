Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3938C6FD1D
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5Kag83emgeu8v4lAUpuBL2GMhiXYBz8AVPWBBHg76w=; b=c1Z0o4ldamBNjF
	TBbbxAoCGFegLP1HC7tcdmL0PHg93zxDmsZ8IXTXNnq+/BsgY7TtEfFOltB5ZoHzGOJjZx7IWOCKp
	VIrk+fTgj4VzpB0xPglMpPiYatrgFD1a9bHRzPty3x0KCjt/dDU423eQZpViDgwrK5j6eSps4QxXl
	gLzlSZyYJOdDSNsn8tbTShAF083lgh77Yh67WOYfn2/bqMN4ik+g/D1cHbuUeLAjDHgHKS4bYtABh
	6+NUYHK9mvl0ao1caC8yhx89qkimoAccKV8mIekSQVpdTebcBU4Vl44hTWMM8NahEFwEjkFAuc2k/
	D6KfAbr8iclzB07BdBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdKvy-003oxn-2y;
	Sat, 18 Mar 2023 01:00:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdKvu-003ow1-1S;
	Sat, 18 Mar 2023 01:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B2A17B82748;
	Sat, 18 Mar 2023 01:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 742CDC433EF;
	Sat, 18 Mar 2023 01:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679101221;
	bh=n7fbK9Gt9s++eDvMkVmtPnuxDMaNPYXF5f2+1cxv+bY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YzdrVz+2gsN9ZxBz1fYUqr1E7Mjpg6tdnkV+tT1SZ0HKGBC81YxgLciOQz4J1JicM
	 Lqnc+3eCKc+l2MHaVKXfEYVbmAUcYnHm+Mf3g0YZV5LnQAle6vhqp3mi8GS56iXeZP
	 fXsB+9ZR/U5+CXHK8N9GvmCzKwkyHTWWqltMSVY4eHs1PON5LaJlCEgxzinNa0dvNM
	 PClHub6eU2wSjtIkn3Bn2NrJIL+rT0JM+YKxfUkKtZxedLBDW8ontjAxNPA6i9tye2
	 bpyEOdQj4pfFY6J2PNugV0W3GojzMhv9+KsdDYOWjUZTzdSsFdf88NVMZ5I2FkUuut
	 rkF64ZMTjDeAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48858E21EE9;
	Sat, 18 Mar 2023 01:00:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/8] RISC-V: Apply Zicboz to clear_page
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167910122129.24496.10588514847374462522.git-patchwork-notify@kernel.org>
Date: Sat, 18 Mar 2023 01:00:21 +0000
References: <20230224162631.405473-1-ajones@ventanamicro.com>
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, conor.dooley@microchip.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com,
 sudip.mukherjee@codethink.co.uk, ben.dooks@codethink.co.uk,
 atishp@rivosinc.com, aou@eecs.berkeley.edu, apatel@ventanamicro.com,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, jszhang@kernel.org,
 heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_180030_633361_6899D2ED 
X-CRM114-Status: GOOD (  12.58  )
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

On Fri, 24 Feb 2023 17:26:23 +0100 you wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch6's commit message for more details).
> 
> [...]

Here is the summary with links:
  - [v6,1/8] RISC-V: alternatives: Support patching multiple insns in assembly
    https://git.kernel.org/riscv/c/0b2f658f5370
  - [v6,2/8] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
    https://git.kernel.org/riscv/c/8b05e7d0408a
  - [v6,3/8] dt-bindings: riscv: Document cboz-block-size
    https://git.kernel.org/riscv/c/ea20f117ab99
  - [v6,4/8] RISC-V: Add Zicboz detection and block size parsing
    https://git.kernel.org/riscv/c/7ea5a73617e9
  - [v6,5/8] RISC-V: cpufeatures: Put the upper 16 bits of patch ID to work
    https://git.kernel.org/riscv/c/d25f256332cc
  - [v6,6/8] RISC-V: Use Zicboz in clear_page when available
    https://git.kernel.org/riscv/c/ab0f77465e3e
  - [v6,7/8] RISC-V: KVM: Provide UAPI for Zicboz block size
    https://git.kernel.org/riscv/c/665fd8862413
  - [v6,8/8] RISC-V: KVM: Expose Zicboz to the guest
    https://git.kernel.org/riscv/c/b20f67994f35

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
