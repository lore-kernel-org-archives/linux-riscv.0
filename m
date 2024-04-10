Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C84CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5FpgnZ93M7+l5/p2dvg+2DuvgpyELAPl+miajvSBac=; b=fT4uO7Co7xIdf8
	d/WzOXs97RE39ezpxhNXOQCwErI1nOMp51K2rG1V4RdOC75OGTnMU36jOSKm2EZrOInfCQuJ6KwmX
	UHAlQvmF/0UozKLUXSagEbm7I5q8z1LZ3oW7SNIK72UtBPUZIK/Rq+CSeUG2zptMaK6CAi57NfRKc
	2X0LKY1aQ6S36kF4BTq3zctpfc+UcAVpwWdSmTsEEhTiwTp0lI1wYEwNvLu2NXybGlcwUUozj08ZB
	Mug5qMRExSMS7zLdS4qGf8W1BJzhkilpRosbGUHvEcJiWWOihcorfK70FT/B7+yLAgM1HV5T2uoHn
	6JeBBXy2tE0ml2nzMvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoe-00000007RAs-04Tx;
	Wed, 10 Apr 2024 14:20:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoW-00000007R5E-2KN1
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C2CF6CE29F3;
	Wed, 10 Apr 2024 14:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ECA2C433B1;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758833;
	bh=0DhS4EK0I4APNslc3wne19z1VN4gidak3VARFGUl/0o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c02H669+4EVdfAUg8t85q4fzFena0/vNFU7go8zrbdoO3G26BjMljhZdsw9YaHSCe
	 KAOMh4B4U9/di7pW7tqFJL363BOtAN8Ez1p2QYhmhIHIKzMhvQKEQ/+oQay1iHuPqF
	 eX08E+TjZA9OrqzoArP+KbizTzuIHMCtSVONtl9EJwj5AXbWAJ2J2qRI+YOvmCsrDZ
	 VTVAD6XHwOeqUhWyxiirdp5e3ioIedXhIILMVSzIfIIBEnGrbK4OL4LZnJ6N/X9eit
	 Avuur1aX5W+zXL5Knz4BuPRpjMALXPlNZHpPsg16H1upV48mqd6yqHvkiWYU9BRpCC
	 gUlyy6w0T88Pg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 705C7D6030E;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Do not save the scratch CSR during suspend
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275883345.18495.7862735068515050043.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:20:33 +0000
References: <20240312195641.1830521-1-samuel.holland@sifive.com>
In-Reply-To: <20240312195641.1830521-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com, conor.dooley@microchip.com,
 leyfoon.tan@starfivetech.com, paul.walmsley@sifive.com, pavel@ucw.cz,
 rafael@kernel.org, jeeheng.sia@starfivetech.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_072036_795562_8A5CEDF5 
X-CRM114-Status: GOOD (  10.02  )
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

On Tue, 12 Mar 2024 12:56:38 -0700 you wrote:
> While the processor is executing kernel code, the value of the scratch
> CSR is always zero, so there is no need to save the value. Continue to
> write the CSR during the resume flow, so we do not rely on firmware to
> initialize it.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - riscv: Do not save the scratch CSR during suspend
    https://git.kernel.org/riscv/c/ba5ea59f768f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
