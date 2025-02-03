Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61063C02198
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ0R6UjQidlR40pf0H0QUSuVez7YD9GbFUUthlYTl5M=; b=aMdMuhrfP7BeoC
	ZIOsOmNxb7nfDHCPpcV/xYBMtYdta8WYanS6Ju/kzQX1z4ywWAp6GpXvwaOvGB+mhbsJnZ9bJDtRQ
	gvov21S6KZfjmRmNTInYUbv8+W0XQ097IEv8uv6DRj1MapF3wYTUBOYuGF+MvnKujwkfY+EBXZwIY
	hsEZmO698jzfYCRahF4EinVdN2LgJnSEglRn7qDcNXoIg/FVD5TMKTqc9UHIC+jT+t5T6fiJxpsgk
	baUL+VQ4HBFH3o/dBAAB788Yq6Pi7AtsiYRcZ46kPAqTzRKzu/7zLwvu5/yuanW+crrYfffScDelH
	Eh6eJroNiBlPKZOPvp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1yc-0000000GRSZ-1EDP;
	Mon, 03 Feb 2025 19:19:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1un-0000000GQEL-1WKL
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6711FA41C1A;
	Mon,  3 Feb 2025 19:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B609C4CEE3;
	Mon,  3 Feb 2025 19:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610124;
	bh=EHqDeqDddNIApfCVLPDVdinDu5ErQOOB8uPUawpqjOA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AVgbLtYIrdpvCq52oUDxyK4YHXb5iofWOH/lli5LhAaiyHBvqP3CWsOW5Hy6tiW4l
	 9vuNOIg2goB/R2/vlCShLYIBOaDk6p2ocLHMvJyb3HL8EzScQRTtJ3Bn6+d8Fj5c0S
	 TtzSvNdOtLb1UNaf7MwOs/1ya8lU8UhQXGj4PyAQw9xjEFt6WooODqVkhzx+K2c5is
	 Gr0D5CsHvLosSWL1UH9pKeN1aCWNDNLGRzsVUIwy1ndfd5+7vcAr2VdK1icmGdNkPX
	 FfV7qW9d/zY836F6LxZ9KRc8+NDQrHWQgY5n6mVKrU4HbotvExgOWhRtkbe0QC//FL
	 npmInPiPK1kwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDA2380AA67;
	Mon,  3 Feb 2025 19:15:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/1] iommu/riscv: Add platform msi support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015130.3409359.9807283652658448466.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:51 +0000
References: <20241112133504.491984-3-ajones@ventanamicro.com>
In-Reply-To: <20241112133504.491984-3-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, tjeznach@rivosinc.com,
 samuel.holland@sifive.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111525_464849_697756FC 
X-CRM114-Status: UNSURE (   9.06  )
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
by Joerg Roedel <jroedel@suse.de>:

On Tue, 12 Nov 2024 14:35:05 +0100 you wrote:
> Add MSI support for a platform IOMMU. May be tested with QEMU when
> including [1].
> 
> Based on linux-next commit 28955f4fa282 ("Add linux-next specific files for 20241112")
> 
> [1] https://lore.kernel.org/all/20241106133407.604587-1-dbarboza@ventanamicro.com/
> 
> [...]

Here is the summary with links:
  - [v2,1/1] iommu/riscv: Add support for platform msi
    https://git.kernel.org/riscv/c/d5f88acdd6ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
