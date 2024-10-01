Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366C5CE7D14
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojYpFWw9Dfwt5syeEvNmkgBHNJWW0o43Gb6eYaJoPSU=; b=QABm5CWS3bVBvP
	Ybl1yrOb1bpTnw15wA7k4Q+nYAaqEwZRVdeV07daQbjlo2v9pKErhSsqOV2QGMiy7fR4uPNUi2Mxw
	9OA+y9yQY1KCCjYmQDgu1Yd93/ApZ0S8owLT4QtOjpPiBECxucbRf+ixfPFnSH1VvTufrOhfa0/yc
	PmxfI4OS6gUoFgQ4/Rs8pFsV6lDFqxsDrdkF/IqzQRJVKk9fzL7e71aXPfkpTC3B8PhDKaYZ7ZqWB
	s52PC+v2bQAg7xJWWz9FJfoXrq6GUZXRL9VKGGyrJF6G71sl0XBlR2qDfhRNLhlyOtI87WfE+2kJV
	41+f3Qj+71VCR4xZy6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPd-00000002acp-49TN;
	Tue, 01 Oct 2024 11:51:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9z-00000002XMv-1dXh;
	Tue, 01 Oct 2024 11:35:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F267A435AB;
	Tue,  1 Oct 2024 11:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A215C4CEC6;
	Tue,  1 Oct 2024 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782518;
	bh=PLCfu9k2nrqK0Q23eCcS61S+UCWbhfJU+ryvhWPppaw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cuJGJWOvGtuy95w2CKuaTFpyUid4icwEMHtbAyOEd1SBP7T3ALRPCsctRnLg3yM8P
	 iCZnl1sN6HzCcahiMymrWhb6zvpjtn7kRTI+CEEV5vNHlGUFG1me+IkGsZZJ/pHaJM
	 VmW8I3FPpnoErlyQS4+CXDVl3LkmEFfG2MCQMArLnI4/li4dHOUOlcc7imoBT2gMw6
	 oeosrCrdIEuuAvU11L9j7ri8ih2y/RK4DYUiRqpW0QCgDOrVZht/FuuI59+fG+q7aM
	 ifEpF9KFVK6ZA11o0c44kU2gjmaVelyl8SG9/cc1ct5ubuW+ARJ2BsAyno5maDgk75
	 yyroMfbYk1HfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0F2380DBF7;
	Tue,  1 Oct 2024 11:35:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Don't zero-out PMU snapshot area before freeing
 data
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778252124.314421.2392376531840304330.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:21 +0000
References: <20240815170907.2792229-1-apatel@ventanamicro.com>
In-Reply-To: <20240815170907.2792229-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, atishp@atishpatra.org, ajones@ventanamicro.com,
 anup@brainfault.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043519_590468_0E7E88DA 
X-CRM114-Status: UNSURE (   8.98  )
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

This patch was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Thu, 15 Aug 2024 22:39:07 +0530 you wrote:
> With the latest Linux-6.11-rc3, the below NULL pointer crash is observed
> when SBI PMU snapshot is enabled for the guest and the guest is forcefully
> powered-off.
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000508
>   Oops [#1]
>   Modules linked in: kvm
>   CPU: 0 UID: 0 PID: 61 Comm: term-poll Not tainted 6.11.0-rc3-00018-g44d7178dd77a #3
>   Hardware name: riscv-virtio,qemu (DT)
>   epc : __kvm_write_guest_page+0x94/0xa6 [kvm]
>    ra : __kvm_write_guest_page+0x54/0xa6 [kvm]
>   epc : ffffffff01590e98 ra : ffffffff01590e58 sp : ffff8f80001f39b0
>    gp : ffffffff81512a60 tp : ffffaf80024872c0 t0 : ffffaf800247e000
>    t1 : 00000000000007e0 t2 : 0000000000000000 s0 : ffff8f80001f39f0
>    s1 : 00007fff89ac4000 a0 : ffffffff015dd7e8 a1 : 0000000000000086
>    a2 : 0000000000000000 a3 : ffffaf8000000000 a4 : ffffaf80024882c0
>    a5 : 0000000000000000 a6 : ffffaf800328d780 a7 : 00000000000001cc
>    s2 : ffffaf800197bd00 s3 : 00000000000828c4 s4 : ffffaf800248c000
>    s5 : ffffaf800247d000 s6 : 0000000000001000 s7 : 0000000000001000
>    s8 : 0000000000000000 s9 : 00007fff861fd500 s10: 0000000000000001
>    s11: 0000000000800000 t3 : 00000000000004d3 t4 : 00000000000004d3
>    t5 : ffffffff814126e0 t6 : ffffffff81412700
>   status: 0000000200000120 badaddr: 0000000000000508 cause: 000000000000000d
>   [<ffffffff01590e98>] __kvm_write_guest_page+0x94/0xa6 [kvm]
>   [<ffffffff015943a6>] kvm_vcpu_write_guest+0x56/0x90 [kvm]
>   [<ffffffff015a175c>] kvm_pmu_clear_snapshot_area+0x42/0x7e [kvm]
>   [<ffffffff015a1972>] kvm_riscv_vcpu_pmu_deinit.part.0+0xe0/0x14e [kvm]
>   [<ffffffff015a2ad0>] kvm_riscv_vcpu_pmu_deinit+0x1a/0x24 [kvm]
>   [<ffffffff0159b344>] kvm_arch_vcpu_destroy+0x28/0x4c [kvm]
>   [<ffffffff0158e420>] kvm_destroy_vcpus+0x5a/0xda [kvm]
>   [<ffffffff0159930c>] kvm_arch_destroy_vm+0x14/0x28 [kvm]
>   [<ffffffff01593260>] kvm_destroy_vm+0x168/0x2a0 [kvm]
>   [<ffffffff015933d4>] kvm_put_kvm+0x3c/0x58 [kvm]
>   [<ffffffff01593412>] kvm_vm_release+0x22/0x2e [kvm]
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Don't zero-out PMU snapshot area before freeing data
    https://git.kernel.org/riscv/c/47d40d93292d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
