Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC340C47DDC
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BSsOduVDn7UzGV2T6bgDVEc/ZfNo6Pm6RgM5M7Kxvc=; b=KpwOlkUSsMA6IW
	bsQ6W5dJ6LRj1+4ZYu49j4Prd32cwAb0TNGKaoVdF/pnr0/iTxqDd+ejSXtFYgGxugxKjp4KsqmhR
	Du8/tsq523o2iLtZrXlCXE4f4mck9VBKXFpYl5cU+HG4ynUy2T4EZyFH8zgFovk429FR1dK3Ynhof
	KLmrMrns9N9pyaU6PIneRJArZ4pVxgye6W04Ep6C3/NYl0GoD0VpCklInYLoQqWCTSE0xX6IOeujc
	69M8vv+VyMfOiuT42VziNOpKCHSYVVrVf3EaF1lZrovHgBgiX2ifoSD2aBMaiwlb5OsEPtcdEScBq
	H72z7dteEeYkpNOPMUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbF-008ODf-2k;
	Sat, 20 Jan 2024 21:09:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbB-008OAY-1G
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:09:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFD8560BD6;
	Sat, 20 Jan 2024 21:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A8E3C43390;
	Sat, 20 Jan 2024 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784992;
	bh=Rp5EUqsK/zub74udKI73W3OYZb8MEebPJJcJBbBEBqQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ncG4baLylKP+ss4CNXGIlS1a6uVEW90QY99EMGmgpt4V0oF/pEjWEZ3npunq0fl94
	 6PShq8XUgcdedvfzb/WzPJFqk0JtjmvcUPRYOzk0iNlMKX8YNyCcm+ak7wj9Cs0cQ0
	 nYdvbHahPXimCBXcoo/hRh31unWRJgPFFXQANqeWvuw1gUb1052zmkYbcwW8lH3JNy
	 UferhTZ58Bmo4LtIjuw6GElQDqC1PevMsZITHmk7jIkMPCrGudcbfNOBvQcvgU4wUP
	 b2WVtO6lkZuexwY2RgZZyq4EE1kc6h0RZ0V/MEDn2mCQykMUkd9XAAR3j8w4O3c98P
	 WXy4hDcSfDJug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A88ED8C96C;
	Sat, 20 Jan 2024 21:09:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/5] RISC-V SBI debug console extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499217.24348.10595488871949157918.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:52 +0000
References: <20240119113449.492152-1-apatel@ventanamicro.com>
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 conor@kernel.org, ajones@ventanamicro.com, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130953_729310_1B7D8DB8 
X-CRM114-Status: UNSURE (   8.35  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 19 Jan 2024 17:04:44 +0530 you wrote:
> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> functions sbi_console_putchar() and sbi_console_getchar().
> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
> 
> This series adds support for SBI debug console (DBCN) extension in
> Linux RISC-V.
> 
> [...]

Here is the summary with links:
  - [v6,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
    https://git.kernel.org/riscv/c/f503b167b660
  - [v6,2/5] RISC-V: Add SBI debug console helper routines
    (no matching commit)
  - [v6,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
    https://git.kernel.org/riscv/c/c77bf3607a0f
  - [v6,4/5] tty: Add SBI debug console support to HVC SBI driver
    (no matching commit)
  - [v6,5/5] RISC-V: Enable SBI based earlycon support
    https://git.kernel.org/riscv/c/50942ad6ddb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
