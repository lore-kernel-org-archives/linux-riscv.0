Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D883EC88E48
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc7hDLG7xzCSS8B2d87t6vnnuTN6eUCTqvD4bb4n658=; b=Sg4nCooD9CAyQE
	OES4rqyOCtkGH4MZq8Ehqae0HU8wW7GkDz3xcszXPFPwKrNb0PztsnbzJKNBRqVrRVcpHlxyiopvB
	fS76O2gCRYpeqieFX8brH4ina9MC0XZOOidS/ZMvhgCkh40YR2Wif4xt7xZchcQNEqbE0va70y98q
	TGaHtgkaQTfmZvP5HoJjsIHeQNGKGxHkmRxGw+axKqeEb1DYZ8+3a1jfLCPLRSWtf7k3sCPigPnEI
	uhm3P0hE6oW414ZEWOVGkmm2PiChuGCbJxMX06Y6l9P8li9z+Ay+7iDp0O7WVHxYcpvBLkwfRlxcL
	sS8ApyGS2pQ1wVjxPklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE71-0000000Bsao-1Ph7;
	Mon, 26 Jan 2026 04:22:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6w-0000000BsY9-1OTA
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38FED44180;
	Mon, 26 Jan 2026 04:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163A3C116C6;
	Mon, 26 Jan 2026 04:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401318;
	bh=u2mZjtT2ef63nBRxN806PtRnf8Sp48BSpzrnucxNvLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mx3khty3+dTGClMOSsm4TCGURDjhMxIJ6Hr1bO+Hbm7pIDDMRiqqUI60/PSBokAlS
	 XDKfB/qj+L3xyJ2qvyINgs0wD1pWn95s+Rkn2LpKpDZVb3Qm6E11lRb6+gmxfXX2fp
	 Y0puJp0SfTExJAn/+KhCOy5Bb/Cb4Wib65mAZItqOyzuEp0PMSk2hQ9F8YHBPAhLUl
	 4OkRVSJbQNM9okPoSdnbRH4h5yxkAZi8MRJuUoppDD2ti/3VZX6AQcX0/6q4RJB+hX
	 BoyEqXvgV5dn4f1qXwsNoEWqJw9JT7awjVq+tpfrUMGLV8dNWUCboeRZP7SRPsDOMP
	 iCanGpQICOKlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11B303809A22;
	Mon, 26 Jan 2026 04:21:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are
 unsupported
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176940131284.4057692.12950572087692218599.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:21:52 +0000
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
In-Reply-To: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, bp@alien8.de, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, mingo@redhat.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 muchun.song@linux.dev, osalvador@suse.de, tglx@linutronix.de,
 gor@linux.ibm.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org, david@kernel.org,
 ritesh.list@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202158_395196_A382D32B 
X-CRM114-Status: UNSURE (   8.62  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 24 Dec 2025 17:25:24 +0530 you wrote:
> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
> 
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
> 
> [...]

Here is the summary with links:
  - [v7] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
    https://git.kernel.org/riscv/c/b02019169284

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
