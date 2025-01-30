Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD92C02195
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkR7vomTOZkafMtcYovm4Uu5RPntiH6LvcGq+pACyV4=; b=1DsruihOSbuC2+
	cPKs3cQv3M79ycBkAmCReydk82RoGQbPMlmBwPaKvH6InbjLae6FLc9mIYfngXuv0xRu0z0e/EPUb
	IKBNvPs2hdnbhr75BdD0MPz1WbtR7fKvPNSrniziuAbVlLieOA9x/+7GY1BIHhGrua+vUcNoWk166
	X9M0N2xqmihY9kqUHYx+26oZheFucmRn2ShWaThJyGQR8yt39K4igyZ5a7k8epBq6UrtQHAokVib9
	M83Hm0pC/F612BnOMeZ3O6bzOGZMKUC5iHB7Fszsz8Kuq9GCcFYu4N8itbNhfpjfEvNpcmLpx2e2k
	9HTAkA8LtQJERSGNjVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFL-00000008wMQ-2Rye;
	Thu, 30 Jan 2025 14:10:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFH-00000008wJH-3q7g
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 14:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ABE85C6038;
	Thu, 30 Jan 2025 14:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0206C4CEE0;
	Thu, 30 Jan 2025 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246215;
	bh=gAB9uXM+mzKAnOJm4WDzv7NrurFgJ8yv0HwEZuN0vEM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JFgL0D+pIOR7mYWIT8c7JyfpDpVVX1jPS+Qf9Auu7deL2K3kYHffWESrxmQbSy02D
	 g393bUZumPvkXgq80/hlG1GyHr2m9QvntEu9tBH+QWT0PY9rk4Xvf0Q5clRPSMiqTi
	 KnYZjfshz+D+R08PH2Byn7SwbwFLSZJUx94oH6HImEEsQHGDt7bQzo0+RQGYJfm9A/
	 J/leE7FOJ8zvv7jbAqvhz3oOcw6XTASz1+jauF42kXDbS3fjcWFzZM/CVWfw//BpDI
	 icl7h56nvGPEcoTwBU8E6Rpk4dFHITVlKJ+3nRuS6LCI0d1eGDAxefAxWHGoYPLRsj
	 zJR2lIF1RehNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F86380AA66;
	Thu, 30 Jan 2025 14:10:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: add a warning when physical memory address overflows
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173824624099.971083.29484788191658517.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:40 +0000
References: <20240814062625.19794-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240814062625.19794-1-cuiyunhui@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, punit.agrawal@bytedance.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, chenjiahao16@huawei.com, guoren@kernel.org,
 vishal.moola@gmail.com, stuart.menefy@codasip.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_061015_994197_6F5C0B88 
X-CRM114-Status: UNSURE (   8.29  )
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

On Wed, 14 Aug 2024 14:26:25 +0800 you wrote:
> The part of physical memory that exceeds the size of the linear mapping
> will be discarded. When the system starts up normally, a warning message
> will be printed to prevent confusion caused by the mismatch between the
> system memory and the actual physical memory.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> [...]

Here is the summary with links:
  - riscv: add a warning when physical memory address overflows
    https://git.kernel.org/riscv/c/101971298be2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
