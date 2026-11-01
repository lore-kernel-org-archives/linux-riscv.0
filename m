Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E090606A6C0
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KH15hHoy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZrw5s7x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k7avefs2DgfQYJ1avYJaVqCVsmdbhTI1onvw2fIbdhQ=; b=KH15hHoyXRovuN3o4AOfSu7NxR
	cTyWNLTpfkwS3BwV7sIj3C+0Sr3+fR0XDP8IBWPUHwmrH29tGKHWeg58wEX2qDNBN/K//rLPzT716
	eUMq+ARlZAWRfuM9utQFsF5gks2QMlU3XSjmPiCsRzN6kx/VYiVUnf7sz2q4wFtJY1HviTI58G3Vt
	6htvuYV5clUtbxHl2EhyrfhCnRYSDJmLobYsVm5vtz9+eb/JpXav8yYh7Slk2+3lI9zgqsQF5Zb0Z
	WjE/7RfhlFguVr1iCbPIPvoXe45czZWEAIkBEv4zaGEvsRV5Zpx0EfEVn18dW0JqPkcYq922E1Ztr
	RT2e3PFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrp-0000000F3nX-1Cow;
	Sun, 01 Nov 2026 22:17:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrL-0000000F21n-0O9Z
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FF6A403CB;
	Sun,  1 Nov 2026 22:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD891F00919;
	Sun,  1 Nov 2026 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571422;
	bh=TlXe8GaWIxgfUN9oJ8ZkUQcX+CJa5NmDUSw16Gb5fjc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NZrw5s7xCTCVTHEcPZ6ICCwQcLn1a+2gAWUq/xgjMGIwe62ebpNx35HwduJR74RtD
	 Wtw5mKLKuGifhjgEA6clDYtsUyRCTEfKuRo7vY1XkeSmTmXv1+e3p+HUli5e3ZTi2Y
	 i9rG4TM2uz4kteJn95cq2ahfPBpXAo1F/XJJuxWauBorD5YRiFJ6D9fY/bTnOZnYow
	 l3CSm8xldcSTJYHEwAGX80HT9M/wTRLLvM08uTOyVfY6M/fbZyBNdAOZq4LPlCSOvK
	 EYLx5PlMzCVUUQ2QdxFluRLGxcOv9MrH+Q5IPus8GLHZb/lazuMZ7S0yVjXdFYfw4O
	 hw/UwjPRITAgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401F638003B8;
	Sun,  1 Nov 2026 22:17:02 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] iommu/riscv: Report cache coherency capability
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357142079.2624073.16238514118211699768.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:00 +0000
References: <20260821112100.572037-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260821112100.572037-1-andrew.jones@oss.qualcomm.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, jgg@nvidia.com, tomasz.jeznach@linux.dev,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
 palmer@dabbelt.com
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Fri, 21 Aug 2026 13:21:00 +0200 you wrote:
> VFIO and iommufd require IOMMU_CAP_CACHE_COHERENCY because they use
> IOMMU_CACHE mappings and have no userspace cache-maintenance path.
> 
> RISC-V page tables preserve physical memory attributes for IOMMU_CACHE
> mappings. Svpbmt marks mappings without IOMMU_CACHE as non-cacheable,
> but preserving physical attributes cannot make a noncoherent device
> path coherent.
> 
> [...]

Here is the summary with links:
  - iommu/riscv: Report cache coherency capability
    https://git.kernel.org/riscv/c/3069e8f3e1e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
