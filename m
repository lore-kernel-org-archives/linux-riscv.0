Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF9BC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43vzCb9j5bjNbgpDwRG2WcoUx+Dm9XFESRugapFJeqQ=; b=0DUFpvj/nqYGZi
	nyj4qA/6tWfIMdH3Ltv2tGgUt4nE1YhNRF05Zq717I6MyVqoQFrh4pIXoOiy9R580TZI/MhWFo2e6
	1KfNj/hLIpU6VvVZfzaVzpD9iG9jit8OeFgs8pUOGkI5Lz743ArXz8uYS6UPvJPuLcyNz+UBkRxYI
	NQYBLbETq79b85oyk7OZMtsPj7NyaQJUNgy6UWTLxrvdQhpQDoOY0i/jAER5gZPkFJRi1PBd5LYx6
	ETxAYJK5MrjYDxC2TewFw0ljQ9grdWl5sbUAPugG1CquO4d9QKmhBrdMlpAlPuqOct4PRqvNw2jEm
	9t86D7b5mKDrRQ93jvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL82-00DXmx-0K;
	Wed, 30 Aug 2023 13:21:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7e-00DXWI-0K;
	Wed, 30 Aug 2023 13:20:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2CBB620F4;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D33EAC433B9;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=tfgC2rPGqs3W0ZYHuLX9hnjGH8CI6YtpqhQ6F+5mMJc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kAkVbc4BHhwXxn78wQNHDCr+Eg+V1XNpYC1LJHbyMBib5RTw9tBFMXQJ/py/+seRC
	 bbpsg1JKL+Zd8JkdAFYOXdJfieHR33KKp9sboJf8WLGFXlQjFPuRhMgxrHD8KjpCj3
	 6gg/nA9IpyMpVnHSE912J5vHmc+igse/+PJY6GxzNYWrRGo4tzuvafgzhnxRHF+Qay
	 on+bZYqXQJkDjSzumXj1Qzj4nCKnUKOWZIrBEimvwu4k+W4Nsr+GiH9dJvPSRg8Dbi
	 ZSu6e6n7/J4FQjjcJgwlzfH/5YAaH2J/yNIwvaR0rfQLJpIC5BCmrGrudCe4A5dFF2
	 FeOG0H6gUcfPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBBFDE29F34;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] arch: include asm/cacheflush.h in asm/hugetlb.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163476.19859.14725448715332530796.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
In-Reply-To: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
To: Hugh Dickins <hughd@google.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 mike.kravetz@oracle.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, palmer@dabbelt.com, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062038_187633_1D9FC8AF 
X-CRM114-Status: UNSURE (   7.94  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 13 Aug 2023 21:50:34 -0700 (PDT) you wrote:
> Three architectures are using PG_dcache_clean in their asm/hugetlb.h,
> but relying on accident to include the asm/cacheflush.h which defines it.
> 
> 1/3 arm: include asm/cacheflush.h in asm/hugetlb.h
> 2/3 arm64: include asm/cacheflush.h in asm/hugetlb.h
> 3/3 riscv: include asm/cacheflush.h in asm/hugetlb.h
> 
> [...]

Here is the summary with links:
  - [1/3] arm: include asm/cacheflush.h in asm/hugetlb.h
    (no matching commit)
  - [2/3] arm64: include asm/cacheflush.h in asm/hugetlb.h
    (no matching commit)
  - [3/3] riscv: include asm/cacheflush.h in asm/hugetlb.h
    https://git.kernel.org/riscv/c/3aaad36808b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
