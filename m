Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03E3CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJItQXfdO30guDVNolHmHtZO2glfyh+VZRw1hf57r2I=; b=BDazh3lt6bzln4
	KJnY+KdywL5GHHaHR/QKfZ0zN9yx0HYdXuo8a3VVZoum0TCkLMGD4Kv8H2lnYC74j5oZnObIphspo
	DIPlYnGPYLpC5V5ujsxUB6vnp9vXzKr2j+Yq1096mLgxd7KDye3ToGjj3+T2fisijpzm0t8LMbhKB
	78vTay+52w7iNSBAQA5DlR8OGZLLi5PcvbiQgXydEluK5z5jbrcomL33NJjVrm+AhRoXGEVThjeG7
	6x/qAL04m+1mCv/5b3emVOfN5DyMZlVq00JG16Ig2QhFehx/v4uuNP4vDuZu1p1wgs+IqGRzvNsuN
	tUiGqKfK8sRBjjRPsnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszHE-00000001Ied-0mWG;
	Tue, 24 Sep 2024 06:44:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sszDr-00000001HoE-1R0r;
	Tue, 24 Sep 2024 06:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A21CA43195;
	Tue, 24 Sep 2024 06:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3ABC4CEC4;
	Tue, 24 Sep 2024 06:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727160030;
	bh=9cTysO541iBtGr4672RE5NQ54grLu2lTYGls/lFRWo8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bG49ejtR+w4iYDqQXMuFgZO0lma89Q+/ewFAisjJQWdM4nTdTjYytdmC/DGU5RYyc
	 BMvAcN0Er0U0s0vzoVWwGXKl7ML7QSjj84RkCrQDqB6wbGM6op6CSkmIBtmVGdAN+O
	 vaXdu+MyS9VJRXI7TKMBU1Zs3CI+jZJ6Cmg/0OXKcgneFpWy4TTGxaZgnfajIyP2eS
	 bdwiamgtuEOTarAmZrJfYhkc0CecsMirt1nWdskd70j0SO7uri43v8/+bgRZgs0AXP
	 wBiGsUet1gXipbccOZXa574Fv4sKB0fY2ghzoFlX9wpnI7h4DbVZ5ayOH2VLpAjx+f
	 gDf1RVDEdMTpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C093806655;
	Tue, 24 Sep 2024 06:40:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next v2] crash: Fix riscv64 crash memory reserve dead loop
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172716003324.3899939.3055184553837827208.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 06:40:33 +0000
References: <20240812062017.2674441-1-ruanjinjie@huawei.com>
In-Reply-To: <20240812062017.2674441-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, bhe@redhat.com,
 vgoyal@redhat.com, dyoung@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_234031_504328_F90AC5C8 
X-CRM114-Status: UNSURE (   7.62  )
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

On Mon, 12 Aug 2024 14:20:17 +0800 you wrote:
> On RISCV64 Qemu machine with 512MB memory, cmdline "crashkernel=500M,high"
> will cause system stall as below:
> 
> 	 Zone ranges:
> 	   DMA32    [mem 0x0000000080000000-0x000000009fffffff]
> 	   Normal   empty
> 	 Movable zone start for each node
> 	 Early memory node ranges
> 	   node   0: [mem 0x0000000080000000-0x000000008005ffff]
> 	   node   0: [mem 0x0000000080060000-0x000000009fffffff]
> 	 Initmem setup node 0 [mem 0x0000000080000000-0x000000009fffffff]
> 	(stall here)
> 
> [...]

Here is the summary with links:
  - [-next,v2] crash: Fix riscv64 crash memory reserve dead loop
    https://git.kernel.org/riscv/c/b3f835cd7339

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
