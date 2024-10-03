Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A807CCF34A9
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LJyobA+DoY2donB7tWnhfEx5m4lAij2wGcZuo4tq00=; b=WOKFclBWykW9Wc
	JYEJGLRxqrGSVUF4jhe6VZKYCP2e7UTmKlYuJw/YsXMh7Q+7urpprO70lM7L8h5StkdTdo1z8WrYg
	XjjpEdW7yqIXcyVuTe3+fV7NqH9rQTCwqUSi9Mf9R4NytMqyrGvzzZG+wxmEBefx92b4+ZuWG16h2
	Aw7xWN3T/4duMqdO8PKDb2JOEWMNebmPw4zEOdCsAk7b2rB6OmzusIpDRyWYRpTOZF7X9/E6AoEv2
	W/fep1knN25VYo1oFRogSNb9qBfdeKURMYWYHGpw0mgOx8Iuo3dGZquLupta2PafMaVT2qJJNKE9r
	mNuuOlqWfmHX8vowozCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swN0N-00000009QRP-459d;
	Thu, 03 Oct 2024 14:40:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swN0K-00000009QQg-2TSa
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 14:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 314635C5D22;
	Thu,  3 Oct 2024 14:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD75C4CEC5;
	Thu,  3 Oct 2024 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727966430;
	bh=V1XuERiBmSes0N5Yl/WUuKxBEijQFuC9DkaNNu3ZSeg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fM4WINcl1EUGbOjJ4iHhfoA/xDYxNFw7OXXrvXhBuq9LHJcLx2r3DZk8UDPPY+uXc
	 Kg/pqMr4lTnPR1sGW5gKMr7Z+wFQP+mT2lN7jPQAoof5opj6sQgQ9B1iaxEprtlBfk
	 qj21Atys6+j1mzi/iIgj1BGF6PuWL1v2bEZG710GvBNhvCbzFqxyXAvpnUe8FCRmuP
	 d4qaQPTuXa9mP5eixK583sOlNJIG5QL/VRWTLkyRxHvItT9afWjf+4hNggt6eZi0FY
	 Q4naOq2Dpgr+vzDv0Q0S7vw6Z1tk+wpNfssVYk9Dv/STbmZxlHjWL5dsFtBppWlTn7
	 6XQUsEH4eW9IQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7105E3803263;
	Thu,  3 Oct 2024 14:40:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix kernel stack size when KASAN is enabled
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172796643428.1879887.15358585146308905046.git-patchwork-notify@kernel.org>
Date: Thu, 03 Oct 2024 14:40:34 +0000
References: <20240917150328.59831-1-alexghiti@rivosinc.com>
In-Reply-To: <20240917150328.59831-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+ba9eac24453387a9d502@syzkaller.appspotmail.com, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_074032_715330_ED27D068 
X-CRM114-Status: UNSURE (   9.83  )
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

On Tue, 17 Sep 2024 17:03:28 +0200 you wrote:
> We use Kconfig to select the kernel stack size, doubling the default
> size if KASAN is enabled.
> 
> But that actually only works if KASAN is selected from the beginning,
> meaning that if KASAN config is added later (for example using
> menuconfig), CONFIG_THREAD_SIZE_ORDER won't be updated, keeping the
> default size, which is not enough for KASAN as reported in [1].
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Fix kernel stack size when KASAN is enabled
    https://git.kernel.org/riscv/c/cfb10de18538

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
