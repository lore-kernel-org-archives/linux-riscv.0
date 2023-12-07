Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1B9C10DC3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZNjJNRpzn6rgSRoXQWGxoM5DRyRpVtoPSlU8r3j9yg=; b=IabeFj4vUD/RK7
	/nLELbuRmQtVrzH94QWdjDDLbX07wi/Zu3rAjuGiL2bP0h9MrYEVmyIgM7k7YZ7i2bjTKYT+cgNwu
	moDjG0IG2iBRUknZ0PLybiNGvfI/tWZqmvSA6Jul2znpAzLiCB8g3IGyMJu7X4HOjWKky+K47zvlP
	rJzj0+mQmpoA3/BxdGqja3x4iMiRg2r7gm6r1shhxOWwQrwegSjjfd3CCDFpqwnaUJLXjf++Dg9Vf
	gXEa/Yp7QbxVkxatDy39gtzyl2pyAIsW/gYoLkdgonDw6FwLNd6m4l8mkC0ijAnWdAKEJ1dMiJDUK
	E6si4OrKtZj7shh301mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGB4-00DALr-2u;
	Thu, 07 Dec 2023 15:20:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGAx-00DAFT-2g
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 891CBCE2474;
	Thu,  7 Dec 2023 15:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6AE8C433C9;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962425;
	bh=bIRBhYwK1IRegs4X3EsVItjloLp8U3gwV50+Gg5hIzA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t3NtVgeHiTsppyAp0gHK0kJxrJUiHzc6HXgdcdZZD/jHdie74bWA2+hmwb+eL+aSk
	 r0gNBOvnOxStuDB8cNxPd7G7KCC/RgZk22Abz9ZUuwA/yPENfrIMPGJYaG/WOTOrId
	 5b0vLc1ogkXDjLXpHAc/nEHBz7NZx35CvzbObvNwqw8XIebkZ4ca0uJOQXGZBKpPAM
	 FscKy7hTLtiyrvnGQKw7MEczwOXsG5lKPza/y/MhY/hZ/+ix4MVbtFFszXqxL+GleG
	 oA6M1Sr84iA5T8sKxj9vj0zUdc0nor8fe50brQEwv7CYY1VZ6ZJw6eP2im6smpJGEQ
	 42A2er0/flTJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE9C2C40C5E;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix SMP when shadow call stacks are enabled
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170196242571.12999.13645791686392638982.git-patchwork-notify@kernel.org>
Date: Thu, 07 Dec 2023 15:20:25 +0000
References: <20231121211958.3158576-1-samuel.holland@sifive.com>
In-Reply-To: <20231121211958.3158576-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, andy.chiu@sifive.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, greentime.hu@sifive.com, guoren@kernel.org,
 heiko@sntech.de, masahiroy@kernel.org, namcaov@gmail.com,
 paul.walmsley@sifive.com, samitolvanen@google.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_072032_045459_132A2C33 
X-CRM114-Status: UNSURE (   9.67  )
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

On Tue, 21 Nov 2023 13:19:29 -0800 you wrote:
> This fixes two bugs in SCS initialization for secondary CPUs. First,
> the SCS was not initialized at all in the spinwait boot path. Second,
> the code for the SBI HSM path attempted to initialize the SCS before
> enabling the MMU. However, that involves dereferencing the thread
> pointer, which requires the MMU to be enabled.
> 
> Fix both issues by setting up the SCS in the common secondary entry
> path, after enabling the MMU.
> 
> [...]

Here is the summary with links:
  - riscv: Fix SMP when shadow call stacks are enabled
    https://git.kernel.org/riscv/c/f40cab8e18ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
