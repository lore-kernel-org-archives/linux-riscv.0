Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E81C02180
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3J9du8Lb0sF3ZRJzE1onOfvzo3nqi6K7XLZ+7zzBO6o=; b=UJWhFqsSWAO+Rh
	3Nn7P+CKBEq3cT/VVtfjLnxSjvtud06ACdlKmB0mAZddxnO+9kg0e/A6295gm3kwE/w1Bh+nRj+4Y
	Zg4w15xi1BXzg3bNiO4lJlPvCouuO3Uy/fkDX5ziTekajqsXYdt8CGdxLiuQgAP45e9PWYx2zb9DP
	rGbzx/waN3P/pInUrpv8nea2n8jlw8uyOvbjMm4m5MiavOcSju6xluG4AitKfxws0s6n7uog4k/Tc
	Y7i2R931SrM9XZsbmLNtnKKnKAAPH+1ks0SnnGqZ/+cxd9dA+RfSfRl2pFjVToMGRqNf7qc4L7Onu
	qRRxsWstxgaQKaThoohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spNu5-00000000Kvi-37e8;
	Sat, 14 Sep 2024 08:13:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spNu2-00000000Kv1-3lCy
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 08:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86DAC5C5BAF;
	Sat, 14 Sep 2024 08:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7164C4CEC0;
	Sat, 14 Sep 2024 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726301588;
	bh=atOTn57tJO3Z7a94bD4V7a3Ea/wzajO80ag5dk1D11I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n0CIpRV5xsld0qkHuFruytPdc25QvCP2b+GchUkwgd035FslwPI5EBuKgpop9utYM
	 6lSNKm0RwLJ5BwKVSGqF3s0gpCevK8E8lQQzGwui4vbWyfnDQ28kAk5Eoj/053hVE2
	 8kuE/k+UFuJ+cCR80yN9sR3I4mikvQhhLZBMB6SrpW/eDz4qZubvADUh2MKDzwoHDv
	 PwOj21M1DDORXu6LfaFFeKuL5lXWq2/IOfmHx8ulqTBNSsPYp8JM7EgLIWuOxj33Zd
	 VjI5jE+E+5O3lhDzSP+2LVJiYXHBZFK7DbNfP7+xpXPGk4t3nS7TcBF04+0pXqErm3
	 HlQRvE25ChO5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E093806655;
	Sat, 14 Sep 2024 08:13:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] remove size limit on XIP kernel
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172630159029.2498524.2048412782900676166.git-patchwork-notify@kernel.org>
Date: Sat, 14 Sep 2024 08:13:10 +0000
References: <cover.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_011311_023732_A9041074 
X-CRM114-Status: GOOD (  10.34  )
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

On Fri,  7 Jun 2024 22:22:05 +0200 you wrote:
> Hi,
> 
> For XIP kernel, the writable data section is always at offset specified in
> XIP_OFFSET, which is hard-coded to 32MB.
> 
> Unfortunately, this means the read-only section (placed before the
> writable section) is restricted in size. This causes build failure if the
> kernel gets too large.
> 
> [...]

Here is the summary with links:
  - [v2,1/8] riscv: cleanup XIP_FIXUP macro
    https://git.kernel.org/riscv/c/aa3457f22f00
  - [v2,2/8] riscv: don't export va_kernel_pa_offset in vmcoreinfo for XIP kernel
    https://git.kernel.org/riscv/c/f2df5b4fdd74
  - [v2,3/8] riscv: replace misleading va_kernel_pa_offset on XIP kernel
    https://git.kernel.org/riscv/c/5cf089672119
  - [v2,4/8] riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
    https://git.kernel.org/riscv/c/e4eac34feda4
  - [v2,5/8] riscv: drop the use of XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET
    https://git.kernel.org/riscv/c/23311f57ee13
  - [v2,6/8] riscv: drop the use of XIP_OFFSET in kernel_mapping_va_to_pa()
    https://git.kernel.org/riscv/c/75fdf791dff0
  - [v2,7/8] riscv: drop the use of XIP_OFFSET in create_kernel_page_table()
    https://git.kernel.org/riscv/c/a7cfb999433a
  - [v2,8/8] riscv: remove limit on the size of read-only section for XIP kernel
    https://git.kernel.org/riscv/c/b635a84bde6f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
