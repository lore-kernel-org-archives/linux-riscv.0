Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEFEC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdKrh53vsQk6FRTYTLTKs5YiGtUWnwfXf9ZHYmYjtI8=; b=maOj9zIW5O6aoO
	62W/BOscvj0Jx5EHagnQJ3A4CoR9SihXDt7YuWW9i4VL8jwtzxPig5sUa2PxAxaIeJlRO85bZv/j8
	7p+FlSIZ8h3Reg8LOR6ik/YAJ7+xDnH9iIMWJsqpE0TenMwTzcB5NaUI9n20CR/EAWSLVvJx8fZuk
	C3W3gH6+2k6ZVUnrOZs9639kS7NhXLA+eRN0NiUSwtnpuQOX3GApDMEEyn1+1d6MzdDbPh5mBqubE
	TbE2fx8pyz46G0NvHnKGAFXMBuauPRjLIAahh9+/7vNqFnOK5w1vjg3HO7jbUD7w1HX4hqKzt3cOR
	Lxu07O38rkpH86dB5Iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMF2-0000000DEgT-1XmF;
	Thu, 04 Jul 2024 13:11:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEl-0000000DEXB-1uS1
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 13:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BEB22CE34C0;
	Thu,  4 Jul 2024 13:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB4A9C4AF0C;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098656;
	bh=d1R6VyIbkJ6U7w801EO8l21bk3qkW3imoEOlfi6mJ0o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fo2jZkvcZSDt1fGr5ZrtsubKDg0lm7xDjMC9jQnY4iYDYlIxVv8JLu59v3NRhkhb3
	 +31IvMoMqRPLlLD5TnKhcbpCo+WEl+FmkFY3ULZtIzz0lmwEu8T+L/OkXcGagr4DYd
	 CsoqzJteqGJOKYigMc5UDq+YNWx+UgHY9sVD08nqjFvsweG2GUZ4gRb5AGXYlvkorr
	 g254OZ7RieYGkdAlQPCGpbG61KIRqBnBqZuq/bicQ9M4WMOnl//qrOUT1t9sCRdq08
	 KHsOzteSG9RJ7k1Uhhha9F5VoIwT2QOUpQQ+mj2gwc9CdFhS3nzsXh5VWho1I3KNVl
	 y1rXL7FyCDNZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9FA3C43331;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2 -fixes] riscv: kexec: Avoid deadlock in kexec crash path
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172009865675.17306.18375440466203340384.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jul 2024 13:10:56 +0000
References: <20240626023316.539971-1-songshuaishuai@tinylab.org>
In-Reply-To: <20240626023316.539971-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, takakura@valinux.co.jp, alex@ghiti.fr,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 bhe@redhat.com, akpm@linux-foundation.org, guoren@kernel.org,
 xianting.tian@linux.alibaba.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_061059_789219_142BC638 
X-CRM114-Status: UNSURE (   9.19  )
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

On Wed, 26 Jun 2024 10:33:16 +0800 you wrote:
> If the kexec crash code is called in the interrupt context, the
> machine_kexec_mask_interrupts() function will trigger a deadlock while
> trying to acquire the irqdesc spinlock and then deactivate irqchip in
> irq_set_irqchip_state() function.
> 
> Unlike arm64, riscv only requires irq_eoi handler to complete EOI and
> keeping irq_set_irqchip_state() will only leave this possible deadlock
> without any use. So we simply remove it.
> 
> [...]

Here is the summary with links:
  - [V2,-fixes] riscv: kexec: Avoid deadlock in kexec crash path
    https://git.kernel.org/riscv/c/c562ba719df5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
