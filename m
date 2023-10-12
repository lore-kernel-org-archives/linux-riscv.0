Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CE2CDB484
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFgS57BpEuz6/P0uTMevvx5+VtCkOU6owXQ04W3lo6U=; b=i+TSLyQcM+qLQd
	hAg1g4aqQR0rBdZiDWo61XhTs/S+6A7uexrKojXzsoHjZ7fZiS1WFqBZbthxcqlH0W5V76pYt37+k
	/+fKB/0XLHzbp3Yfoksm2ObA3AmyiidIPjFlgBJ7zQBHb9B0zhb1rCDoFTi+XPow71PBq/aJKjGIg
	mNX8D8+YUR5hg5jO3b3Qx3RwpJE9V0dS3YfKsx6Wf+0tTcUGMmQjUX7wGykAXSdb2WnrLjb4RJgnN
	dUnymXJOtT2tOptFrzFpt1iSeJFt6wGs0K5To9JvkXBxM1pALv8n1smGq8bRAMyqsFfb7mqpRZn/p
	2Hq2KOxqhvuLrG4/wjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tw-001oVS-0H;
	Thu, 12 Oct 2023 20:40:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tq-001oTI-3B;
	Thu, 12 Oct 2023 20:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62B5461F6B;
	Thu, 12 Oct 2023 20:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50B19C433D9;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697143225;
	bh=9KbQtT2qxorQkpHqYco5V41LAlQnh15tqWdih4fBMXA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GU3r0N2sfzWoDsLG+uAmN6p0ZSygLIlecg488h0SEJMLL90wTLvXXxr4SL+z7rdJm
	 SMZi88JL+iohFArDgOQ3GjIF5yAtNdZRXy210WJ+jUcCWajE3iZhiqTvycuaFTeKu4
	 TwPThhYfO4f/UKSjYY9LsH/aFW/ez1PYA+lkc0jkR4dEUUKhYKYo9kFiVqUl/yB8Xb
	 LR2Ie3VZrXimbgg2AFmx+vclVtsQz8BLJLN4rfC/hFaBXI+rgb4nRrOzcBdSzHQo0J
	 Y1SWxJsJQwgU2tLaT6kpWtfSVT2yEg7lDdp9OIrdB78VAtoxkwU5ycdEM+JoehAtah
	 k+RHGua/B5z7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 332C4C595C3;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] drivers: perf: Fix panic in riscv SBI mmap support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169714322520.23371.17105611293776534650.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 20:40:25 +0000
References: <20231006082010.11963-1-alexghiti@rivosinc.com>
In-Reply-To: <20231006082010.11963-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ajones@ventanamicro.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_134027_067271_47852D1F 
X-CRM114-Status: UNSURE (   7.89  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri,  6 Oct 2023 10:20:10 +0200 you wrote:
> The following panic can happen when mmap is called before the pmu add
> callback which sets the hardware counter index: this happens for example
> with the following command `perf record --no-bpf-event -n kill`.
> 
> [   99.461486] CPU: 1 PID: 1259 Comm: perf Tainted: G            E      6.6.0-rc4ubuntu-defconfig #2
> [   99.461669] Hardware name: riscv-virtio,qemu (DT)
> [   99.461748] epc : pmu_sbi_set_scounteren+0x42/0x44
> [   99.462337]  ra : smp_call_function_many_cond+0x126/0x5b0
> [   99.462369] epc : ffffffff809f9d24 ra : ffffffff800f93e0 sp : ff60000082153aa0
> [   99.462407]  gp : ffffffff82395c98 tp : ff6000009a218040 t0 : ff6000009ab3a4f0
> [   99.462425]  t1 : 0000000000000004 t2 : 0000000000000100 s0 : ff60000082153ab0
> [   99.462459]  s1 : 0000000000000000 a0 : ff60000098869528 a1 : 0000000000000000
> [   99.462473]  a2 : 000000000000001f a3 : 0000000000f00000 a4 : fffffffffffffff8
> [   99.462488]  a5 : 00000000000000cc a6 : 0000000000000000 a7 : 0000000000735049
> [   99.462502]  s2 : 0000000000000001 s3 : ffffffff809f9ce2 s4 : ff60000098869528
> [   99.462516]  s5 : 0000000000000002 s6 : 0000000000000004 s7 : 0000000000000001
> [   99.462530]  s8 : ff600003fec98bc0 s9 : ffffffff826c5890 s10: ff600003fecfcde0
> [   99.462544]  s11: ff600003fec98bc0 t3 : ffffffff819e2558 t4 : ff1c000004623840
> [   99.462557]  t5 : 0000000000000901 t6 : ff6000008feeb890
> [   99.462570] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [   99.462658] [<ffffffff809f9d24>] pmu_sbi_set_scounteren+0x42/0x44
> [   99.462979] Code: 1060 4785 97bb 00d7 8fd9 9073 1067 6422 0141 8082 (9002) 0013
> [   99.463335] Kernel BUG [#2]
> 
> [...]

Here is the summary with links:
  - [-fixes] drivers: perf: Fix panic in riscv SBI mmap support
    https://git.kernel.org/riscv/c/3fec323339a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
