Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AB4C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYzZ6+9SedsbSzkHC6MiHpYuOuneVMiJwuPpd2UM0Mc=; b=LxjBKIgIMfDqeK
	MrtjwCUCKI0nwVxMSrGjykNs3s8ABAhBTrIAdRUE2zF5Nafbnt0drWyFwwcFfOvuowGx8nSHb6oue
	HvFCZ6UBAnXFsV65kcjrL5XVEJLSggapM5+d8KlLV7Wwh98fOlP+2HXM72F9gILa8QA2EA8qzljcp
	lFDyUMAVwwoH/FRLG/n8xuk1kGNSlca2Hgudt+Q8PJJJNr/m0gRgXL1ar4hE1X8R6U8imIHw1D6+l
	fKloocPU1XtoM9GU/Z9iOt+exmFsn3C+0fgzd+BDKiOK4Z87yPfQfP5b8WuFHEMhdxCpNRWy2WCL2
	VKL+cAO44pT2Rk4Bwyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEi1-00000007DjS-2g9D;
	Wed, 14 Aug 2024 14:10:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEhw-00000007Dgh-2F1y
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0243561A9C;
	Wed, 14 Aug 2024 14:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7960C4AF09;
	Wed, 14 Aug 2024 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723644635;
	bh=4Trc9cKH0+hfthZTt1kzAJCq/T3A8YA1Frl1jUvaClw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j7uswLlwb36kFUHgwH29C3zVPjw7WrCaKZCJRmmfzDtTNpHAvjxlqhW/Z7JKglJgd
	 wXZtcsrCbNNQLaAe1hK4ivvtmOATrJxFunuv5UAAAxEw5naadKlkqD5TbjLsnKP14H
	 zO/9bq3xyDDs54t13nXRdtp9PpIXNipsjBqgTArvnSnDB3UQek025yVZ9+3xSCoeM1
	 HM9g7mle8TML8v0J+WB0iY0ydQfMboTsDMvDKy7t4cN1HCIcnwLc/YeK/+o43WqaGd
	 /R0S9q2NlwAkOwwI6qhs1EXL6HTkizOe0Gw9NhPp42a+X9EwhrlgOuih8ACZMcfW8W
	 2+z9cFirDGh+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E8938232A8;
	Wed, 14 Aug 2024 14:10:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: Enable IPI CPU Backtrace
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172364463499.2278280.12370674777574036166.git-patchwork-notify@kernel.org>
Date: Wed, 14 Aug 2024 14:10:34 +0000
References: <20240718093659.158912-1-takakura@valinux.co.jp>
In-Reply-To: <20240718093659.158912-1-takakura@valinux.co.jp>
To: None <takakura@valinux.co.jp>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, bjorn@kernel.org,
 paul.walmsley@sifive.com, akpm@linux-foundation.org, aou@eecs.berkeley.edu,
 apatel@ventanamicro.com, arnd@arndb.de, atishp@rivosinc.com,
 bmeng.cn@gmail.com, conor.dooley@microchip.com, daniel.thompson@linaro.org,
 samuel.holland@sifive.com, sfr@canb.auug.org.au,
 linux-kernel@vger.kernel.org, taka@valinux.co.jp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_071036_701641_028FB299 
X-CRM114-Status: UNSURE (   8.16  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 18 Jul 2024 18:36:59 +0900 you wrote:
> From: Ryo Takakura <takakura@valinux.co.jp>
> 
> Add arch_trigger_cpumask_backtrace() which is a generic infrastructure
> for sampling other CPUs' backtrace using IPI.
> 
> The feature is used when lockups are detected or in case of oops/panic
> if parameters are set accordingly.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: Enable IPI CPU Backtrace
    https://git.kernel.org/riscv/c/f15c21a3de1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
