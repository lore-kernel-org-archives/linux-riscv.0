Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C02EC3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrCjv+a3rHlTGRAXCwVuJS293XdA93fBCXPYw8rU8jg=; b=PKiWipcrfHFoHD
	R4ERi9nwfdE2oDQvZZCBfzgZoloo8kGXpKdMarr7UAO8o+qyKHViDZDZdQ/obWT94qvgbcoayXqLp
	WrK0EbQlb3Ec0nrSgJrN+T13QZUpNzq3dtzxLRitU7y8h9m9ys4X0Ap101MYq2xcrCmO2xtcKYAhp
	nGpil//bBjfB2mpNx9WsSM3eq6k2EnksGCYkrG9Ho9Bn5f+EFmzjGfxMnZy7k51foSNv2F2hDAHQe
	JGwKRq6XGh7VMPtV5bJ24obfyWavFcbmxqtaw4amqri9SBc99LdIT5qZK+mEWt/dyhgp4WYISnYed
	KNjrAwv9Y64HO2csZ+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT5rk-000000056f1-3rlF;
	Sun, 14 Jul 2024 20:30:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT5rg-000000056dA-1tP2;
	Sun, 14 Jul 2024 20:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 730B2CE0B69;
	Sun, 14 Jul 2024 20:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABCA4C4AF0D;
	Sun, 14 Jul 2024 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720989033;
	bh=7Led/oHRXD3s7j73IFMTG9wReZsOlmEHlJdPHk/opJg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=W9eqaL9pvfM77uEhVwmfz8T6x6kZc1JGseTizsphX3p+MjLtBtEq/RUE9qR4INtym
	 a7w1KdCnav6UBnBlcYVp7k5xqVEGxujhn0PSOJGZJV4Iv8P6Wm3MqxfBPtrTKfdgyH
	 Ha1H9YPgKpguqGpzP2sE8gCplRiHFfZaPhQvtLvhOls0sCBpzBiS3edj7LeULEXdOV
	 px/V35jeZxqiKLOIlcTSBZ5CLyJG673gzdngpd9QTMiO2BIXJ7I2x2gVPyaudLqNgL
	 lc4/yo6NvUSMi2hOIoAUKtCFXdb26Tp0fQ1eL2n48jpFu7DYDJcVZC7ehJe6u4joT5
	 mONmPoCn53N3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 999F4C43153;
	Sun, 14 Jul 2024 20:30:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/6] riscv: Apply Zawrs when available
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172098903362.7439.8760600001594796975.git-patchwork-notify@kernel.org>
Date: Sun, 14 Jul 2024 20:30:33 +0000
References: <20240426100820.14762-8-ajones@ventanamicro.com>
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org,
 atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de,
 charlie@rivosinc.com, David.Laight@ACULAB.COM, parri.andrea@gmail.com,
 luxu.kernel@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_133036_691442_2289E378 
X-CRM114-Status: GOOD (  10.73  )
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

On Fri, 26 Apr 2024 12:08:20 +0200 you wrote:
> Zawrs provides two instructions (wrs.nto and wrs.sto), where both are
> meant to allow the hart to enter a low-power state while waiting on a
> store to a memory location. The instructions also both wait an
> implementation-defined "short" duration (unless the implementation
> terminates the stall for another reason). The difference is that while
> wrs.sto will terminate when the duration elapses, wrs.nto, depending on
> configuration, will either just keep waiting or an ILL exception will be
> raised. Linux will use wrs.nto, so if platforms have an implementation
> which falls in the "just keep waiting" category (which is not expected),
> then it should _not_ advertise Zawrs in the hardware description.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] riscv: Provide a definition for 'pause'
    https://git.kernel.org/riscv/c/6da111574baf
  - [v3,2/6] dt-bindings: riscv: Add Zawrs ISA extension description
    https://git.kernel.org/riscv/c/6d5852811600
  - [v3,3/6] riscv: Add Zawrs support for spinlocks
    https://git.kernel.org/riscv/c/b8ddb0df30f9
  - [v3,4/6] riscv: hwprobe: export Zawrs ISA extension
    https://git.kernel.org/riscv/c/244c18fbf64a
  - [v3,5/6] KVM: riscv: Support guest wrs.nto
    https://git.kernel.org/riscv/c/86d6a86e59e3
  - [v3,6/6] KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
    https://git.kernel.org/riscv/c/f2c43c61160e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
