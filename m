Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505EBCCD189
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LguuGsLNSW98QcFcLJF9Z/0EFzvO/eOwdKeJGvvj4Y=; b=bJLXKpZDI8ff9B
	eWqr5R4WvBLgycpTzBVnnD88YAIAHUWrcOcmy+OXQ01U5E+9m9rqD4mVaBj6zA2e6/I/Y/VYeh3wb
	ueQwPVLUL5cqY+oLRHHqmWOden9odhlVTlqTmlmCC9YxOo3pocmHFRpFa29raTs2GwsNTRLStuv+9
	HpTXc9zomu4Z1aPEcPNCyobgkmVU/GmmbnwkuMt7xeWHBPxYaZ9coSzJBK/1Ld6E7b8Hmr0YHs1pf
	PaXh13wsU1Gq4vm+NgKUiyIvdgIF7pUsc6Q7wgQ2KuExysrb08QYFl51plJ8yA+EJ8Z04Uo3saTH7
	2lu7gCIHWjVbZokRIeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7l-00000004uX4-18lT;
	Thu, 09 Oct 2025 01:07:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7h-00000004uTu-2oyE
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A07B48A2C;
	Thu,  9 Oct 2025 01:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04D1C2BCB4;
	Thu,  9 Oct 2025 01:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972032;
	bh=DpWnKckSi1GoUQwHCRxOqqqXjZaYsYGRGLUY44Knqm4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CfdQ8hrvVK2vjG1jELAZ9XB/VzbYM3QSariwjEz75dikULWouQXl5O8qfLrk69lYK
	 TGMNoWQKrhn01+aLWkmM40QZMGmJDATejJJ9bNLDhpsjTIL9JT2JpJN0tcR3ecnHAH
	 NWiwQuw9q0dGeoCsNy7+ju0TShILGhg6y6bvv7muSrI668XhVeIDfr8vySWiG66Du6
	 lSNLqTA0dl3ow6EQUCvasO8mvbjnV3DCqQtwU+B76U6U0uAZrXqPr1Kh4NGixICnK5
	 jBaYEernq9xC8jEw37vCbJD/QrXA64IImcHpOHNtjthovQVnob32nMWDBchOEqCZZO
	 XBOUxGjH1jRDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DA53A41017;
	Thu,  9 Oct 2025 01:07:02 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] iommu/riscv: prevent NULL deref in iova_to_phys
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997202124.3661959.1599667136766880381.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:01 +0000
References: <20250820072248.312-1-huangxianliang@lanxincomputing.com>
In-Reply-To: <20250820072248.312-1-huangxianliang@lanxincomputing.com>
To: XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com,
 markus.elfring@web.de, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_180713_765344_E72FB266 
X-CRM114-Status: UNSURE (   7.45  )
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
by Joerg Roedel <joerg.roedel@amd.com>:

On Wed, 20 Aug 2025 15:22:48 +0800 you wrote:
> The riscv_iommu_pte_fetch() function returns either NULL for
> unmapped/never-mapped iova, or a valid leaf pte pointer that requires no
> further validation.
> 
> riscv_iommu_iova_to_phys() failed to handle NULL returns. Prevent null pointer
> dereference in riscv_iommu_iova_to_phys(), and remove the pte validation.
> 
> [...]

Here is the summary with links:
  - [v4] iommu/riscv: prevent NULL deref in iova_to_phys
    https://git.kernel.org/riscv/c/99d4d1a07087

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
