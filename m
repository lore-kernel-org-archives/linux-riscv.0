Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E00C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 23:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQJEI5ZonIdIRidqLsoUxJUcye71bvthJc1RAAnTDEc=; b=os/F6KGm1HJkac
	GaAhrSausgkHnyGbccnltWsdie78PQw2hQ69/HQ9tal8Ha7y8G+QgRmrMSMIo8+X158hf9HxcuXSr
	u4Dsl3K9PJl/8MRK0GWVeP/ELSj/cUV9eAc4DqV5Ubxr2GPbT3irX9XqrjMla57XPAYVMm8iCIXa1
	GqPLlqOJqvCjrHwLr2NQR38a5YpquKVZlrMuehXwNfLVj8OcbKbfDtdXRPIOlGvh5VTQzK2F+I5Pv
	siu6yzYrLJr24275hwjJR3hwniKRWznb0SSnBdPuwiXYk0dJrVr+qL+/WH7RfYSN9nIQDoriF6yeP
	HmH9OsTdqKAgDi2nGkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjC3-00HQPw-Cu; Thu, 02 Feb 2023 23:40:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjC0-00HQOs-E8; Thu, 02 Feb 2023 23:40:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ECA5361C5A;
	Thu,  2 Feb 2023 23:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 571D0C433EF;
	Thu,  2 Feb 2023 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675381235;
	bh=aD0wz/pJ0BiJsKx6MNlQbfZ5Myimjsn4T14W0hANWRI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QKCpMmSWQfJed7D9pDLAvYigyp1GMf7W1KlxCHCBuzIpFquK+tsbF3exUEZtXWIiA
	 qfS8WLdY9fJOB9Poz+B6rG7yJUkafX6mx1vTEwDL638B+gGZL0oq5OZh0SCTeMaXyB
	 zSpneZAPLZKpenjSrgiSNmDJWeN6D0nF6HL+XhjG6/mrBYbkao4ExKLOkgbSFeQvOu
	 On0GhSg6cxLFmi3+vw1YWyl42uZTbtA0XVL57GkWS4Yoa8mWxJAV6Ob1Hi6G6c/GX5
	 CTAmex1VLHuY/Lc9/PtGOLu0psDRAtkFsg4JUnlD1KKZgoPxpvP2EAV0qVnl2mu5GX
	 3fCxqMxTbCgLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3F03BE21EEC;
	Thu,  2 Feb 2023 23:40:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167538123525.14322.1108858489360294941.git-patchwork-notify@kernel.org>
Date: Thu, 02 Feb 2023 23:40:35 +0000
References: <20230128172856.3814-1-jszhang@kernel.org>
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, anup@brainfault.org,
 atishp@atishpatra.org, heiko@sntech.de, ajones@ventanamicro.com,
 conor.dooley@microchip.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_154036_568358_FCF4C9EC 
X-CRM114-Status: GOOD (  11.46  )
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

On Sun, 29 Jan 2023 01:28:43 +0800 you wrote:
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
  - [v5,01/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
    https://git.kernel.org/riscv/c/abcc445acdbe
  - [v5,02/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
    https://git.kernel.org/riscv/c/191b27c7c0e8
  - [v5,03/13] riscv: hwcap: make ISA extension ids can be used in asm
    https://git.kernel.org/riscv/c/d8a3d8a75206
  - [v5,04/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
    https://git.kernel.org/riscv/c/4bf8860760d9
  - [v5,05/13] riscv: introduce riscv_has_extension_[un]likely()
    https://git.kernel.org/riscv/c/bdda5d554e43
  - [v5,06/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
    https://git.kernel.org/riscv/c/702e64550b12
  - [v5,07/13] riscv: module: move find_section to module.h
    https://git.kernel.org/riscv/c/e0c267e03b0c
  - [v5,08/13] riscv: module: Add ADD16 and SUB16 rela types
    https://git.kernel.org/riscv/c/1bc400ffb52b
  - [v5,09/13] riscv: switch to relative alternative entries
    https://git.kernel.org/riscv/c/8d23e94a4433
  - [v5,10/13] riscv: alternative: patch alternatives in the vDSO
    https://git.kernel.org/riscv/c/cabfd146b371
  - [v5,11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
    https://git.kernel.org/riscv/c/95bc69a47be2
  - [v5,12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
    https://git.kernel.org/riscv/c/e8ad17d2b5f3
  - [v5,13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
    https://git.kernel.org/riscv/c/03966594e117

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
