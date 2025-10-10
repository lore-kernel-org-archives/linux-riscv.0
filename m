Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B83CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 02:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eM+Nf7mccMYHlcEfDq6gZ3AtYdiCR4i0vBxWc3q+dQ=; b=amBPRZ/Zh13zk1
	tntkTZJrEZpEF1mewd37oQRLzwNKYnWhWK5R0ml3nZjUiCIg+Eg2jl3fuk4QplwH/km/hmPkDWxnN
	mIq6MqQmbZYtjDeeVpHsT7esd2bEGnV3L1qrRz50g5Gx8UcmIcytIxyEHG7fTXh9zhBz8qhURyoQY
	Etoyc8UjDaSm4pnxko4EMFhYUc6ivxtRVhMrEi5nWecCTr+K1Sdv7u081MQWuPsGkNYKkOKyzODFn
	TjNiAujXOmSrvhuRqGPTxT/8eBgvqxHOQtNpfWOmxwg7lB514CmXfNhUGnlGosuYdl3AABQpY6Hag
	Rocie1ooCTdWjGXj8ocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72r1-00000007Uym-3TqX;
	Fri, 10 Oct 2025 02:27:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72qz-00000007UyW-3Drc
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 02:27:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34EFE62496;
	Fri, 10 Oct 2025 02:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9928C4CEE7;
	Fri, 10 Oct 2025 02:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760063252;
	bh=CAvsAwjaWn/h2QM1s6i1PciEcb48b9O0RDgV9x92drI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qzNjMqVoQ9XsQjbJt3m8Yj2kqXw7xRvVExRuwyxE1Plet9Zz3QsHIZEXQRJMJsLEU
	 lpkV5/We1G/xDANaLw/UEe4ofEtLcNGxnRzDYaX1s68olfOxXDzWGJ18jzVNkPT/uU
	 6TK8a+3iyofC7cc3RkVO7gtbe97wOilE0dRlGWT3//9X6R0sunE4iRCRX70tcfi2eQ
	 8TbWYVyviI7EfWR8dGbS218JkYfK98sS1R3lUVKLP+JsTvg6vnsZeGTZmdiMzNhvFl
	 noehEnnyhgciOmUZhYDrYofcOpT7mUkpVnbB7QB87a4Wj7BpqgjOxkYL/dPY8qAVE2
	 itkAyxL9ysFbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE5B3A55FB5;
	Fri, 10 Oct 2025 02:27:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: acpi: chose to boot from acpi then disable FDT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176006324074.354358.17217967414602352060.git-patchwork-notify@kernel.org>
Date: Fri, 10 Oct 2025 02:27:20 +0000
References: <20250910112401.552987-1-rabenda.cn@gmail.com>
In-Reply-To: <20250910112401.552987-1-rabenda.cn@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, rppt@kernel.org, andybnac@gmail.com,
 guoweikang.kernel@gmail.com, visitorckw@gmail.com, bjorn@rivosinc.com,
 sycamoremoon376@gmail.com, usamaarif642@gmail.com, yongxuan.wang@sifive.com,
 linux-kernel@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 10 Sep 2025 19:24:01 +0800 you wrote:
> avoid errors caused by repeated driver initialization.
> 
> commit 3505f30fb6a9 ("ARM64 / ACPI: If we chose to boot from acpi then disable FDT")
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  arch/riscv/kernel/setup.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Here is the summary with links:
  - riscv: acpi: chose to boot from acpi then disable FDT
    https://git.kernel.org/riscv/c/69a8b62a7aa1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
