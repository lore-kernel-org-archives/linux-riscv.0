Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E706ECDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfBV9bQRkCef6vLr2+lbaHminijRKN8fXDF+7sJ6ggg=; b=NWBCKNjqkF7v0D
	iQGP3QjVwzo4wtdQn0eSSexrWp+WIbSyGHNa+YrlNGHFE3wMbwunLRGawCzRrYP/MIkwYPrTo2qTx
	Eqsblg9iYajo4TbQQKNgWlHyGW/ss+MPoY3Zxn0QGfwGxPT/bJuZCTqNCJViBCNCwfs7QXORLW06V
	/Oxn1xiig1+wCjZph/LWsSp38Omv8c4q+m90zuN8exikNc7eeXES8gSocN2OoQ9iFWp+AMoT9vVN7
	Chi8uO6TVMKo5ZAcA7/CQkKdw1QS0+42/r+glokou6rFf6m7lrA/X1vmM6WMF2LHpCnXFJxw7KGgb
	5CETR8K5f8M/h3+4sIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tx-001oVj-0v;
	Thu, 12 Oct 2023 20:40:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Ts-001oTh-2F
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 20:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2ED4CE2C79;
	Thu, 12 Oct 2023 20:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48207C433CC;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697143225;
	bh=Jn75P7FWp8mm9c9ThH2hJ5ALb5bEA3ARYqgsn3M7Pnk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lJyIT3lAAVqJiqz3p5FH9Yy4pjyq++odnmtzc98c/WDd2cSz0NfBH/BbtLhPPLyYv
	 //D6SDbYlOuUWMazQaZn3/70kUJ+7dkwownnNkRXkTZYpyNBxMl/dSu3aQOq1gJ6nt
	 TKFUM9DC8A5BIirvxf6nFMdIRXxBVlQrqYZY5oCOWy6f48VTjb1FmBVAu7cRtfLLyC
	 tvFcaIntT58cT29J4tMQkXQAcqMaK8nfw1E+n41Hzs5N0D0Ah5nlKMKqDis+wcCnGD
	 Qq5jMfrEp3LuToHcwhJeWpuHc/LJL2NjSU2LOiGKPbSj8qlxsKvVWSux3nsTHqTzGS
	 DjYBWORtYqZIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B05BE21EC2;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Remove duplicate objcopy flag
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169714322517.23371.9305452183998356720.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 20:40:25 +0000
References: <20230914091334.1458542-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230914091334.1458542-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_134028_903600_73EA527F 
X-CRM114-Status: UNSURE (   7.51  )
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

On Thu, 14 Sep 2023 17:13:34 +0800 you wrote:
> There are two duplicate `-O binary` flags when objcopying from vmlinux
> to Image/xipImage.
> 
> RISC-V set `-O binary` flag in both OBJCOPYFLAGS in the top-level riscv
> Makefile and OBJCOPYFLAGS_* in the boot/Makefile, and the objcopy cmd
> in Kbuild would join them together.
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Remove duplicate objcopy flag
    https://git.kernel.org/riscv/c/505b02957e74

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
