Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E3DC64EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyUlPAYCMBXEBZ5UVdNUiyXWI8phMf2vNjUnCbl+z7E=; b=nphNfv7xA4QqEN
	Pg+kzmEEl/I8TJmt2HqlFSD5s0LtrRD9HgPmcyQfM/s71uRbg4M5ZjdikgBvVIwNQnjPA9qp4M1/R
	xtsgq2MLU0zlwbjHh+wkfH+I1nq2dtd1g19KCDT1k+EVecQL4Q5/Tt9brdZvpx082Ve98M00pgtqd
	EPYSOCKqWYnixpYG1xbdaRJRMCglKIM29/Y4iWUkUK9pgbGs9OcnodcaRTcShpjpB2boi1WWbKIm1
	qmS86PvGVGNs6mjnVn3bjHzrLMKdivZJB0m/Jy+HNDeFkX4spe/1Ap7lBK/HcCeLGv6bIxR6Qv2QI
	wMDZPU4vzFzNKCHXEliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqc7-00CmXR-Ny; Wed, 22 Feb 2023 15:00:59 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbl-00CmC7-No
	for linux-riscv@bombadil.infradead.org; Wed, 22 Feb 2023 15:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LEaLK1npVLOWsuH6brTgRjOQUjyzcwPSgHkYTrF9Jyg=; b=S7DNzyXNPemSrkmu0s/ammz1if
	gbyWO/LEhT/4Hcg4dB6SNY3ZHRm9P5Mx033tvlE7hhbdgBo++S7zsAMq7F1NQxpRVlaRnqbo2r0DO
	mvbcaEtL7LsX1wd7zZB7zJM7f2yxzH/QYRAHhNzaZdeGXzmx3lgGmgQWtPMjG+afFsMpDRBdrnvGQ
	6jrbSq9ynV3RhI2yKQswxPyI3GaTcvRM9VXz5ArS4rDdmUzJOcF1jmrja5Nb5lDXTgFYFWakvT4kO
	MD0ahDzJRCgL2WSko42glhIxXBBpAJXtBlWdsEjANqwTD63iFg1wieGh7ud3lARABuJe1g5QGUA+Q
	uBj2fz+w==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUqbf-00CZvQ-1l
	for linux-riscv@lists.infradead.org;
	Wed, 22 Feb 2023 15:00:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 326EFCE1DE5;
	Wed, 22 Feb 2023 15:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A438C43444;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=//0EBuofToROe4aHx0Fig7UklG17tIZf4rPh6uYWYYA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bp1WJT9+8TdJIp4pxW+sPJBmJ55lT8100WwM5ZxC+gAf7r3EurN/X2Zehztmit/j5
	 t8oa5P3QZd595iAym+M3wW4eC6DAQ7TNWAgL9//+LwHja5miR+O7yvXxoUiu/tFWDN
	 K/zJstFnZ/C0jRO9TztJ2mYGWMOm0KzhR+aK2woFIHWI5ken3A6BGmFkk5ELMTzOWS
	 zd4rj1PSq7ATxoWgN/JH1sAWgJk7pbiDV3OtKTYPTmxEViJGBu4nPh9YRSO//JYubD
	 Om6KLuww+DwTXpMAfoKbrX8VKQCIqZrCMLdac8rQW8M/YB4uJRPZ27Oe8dEn1r+Kfo
	 Vd25wOcK2CWCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3888BC73FF5;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/5] riscv: improve link and support
 ARCH_WANT_LD_ORPHAN_WARN
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802222.24438.1548732675746244127.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230119155417.2600-1-jszhang@kernel.org>
In-Reply-To: <20230119155417.2600-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, masahiroy@kernel.org,
 keescook@chromium.org, nathan@kernel.org, conor@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_150032_291479_A9BFFEED 
X-CRM114-Status: UNSURE (   9.73  )
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

On Thu, 19 Jan 2023 23:54:12 +0800 you wrote:
> This series tries to improve link time handling of riscv:
> patch1 adds the missing RUNTIME_DISCARD_EXIT as suggested by Masahiro.
> 
> Similar as other architectures such as x86, arm64 and so on, enable
> ARCH_WANT_LD_ORPHAN_WARN to enable linker orphan warnings to prevent
> from missing any new sections in future. So the following two patches
> are preparation ones, and the last patch finally selects
> ARCH_WANT_LD_ORPHAN_WARN
> 
> [...]

Here is the summary with links:
  - [v2,1/5] riscv: lds: define RUNTIME_DISCARD_EXIT
    https://git.kernel.org/riscv/c/7e92586c28a5
  - [v2,2/5] riscv: vmlinux.lds.S: explicitly catch .rela.dyn symbols
    https://git.kernel.org/riscv/c/e5973191a8e3
  - [v2,3/5] riscv: vmlinux.lds.S: explicitly catch .riscv.attributes sections
    https://git.kernel.org/riscv/c/b13e64d94149
  - [v2,4/5] riscv: vmlinux.lds.S: explicitly catch .init.bss sections from EFI stub
    https://git.kernel.org/riscv/c/0ed0031b093b
  - [v2,5/5] riscv: select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL
    https://git.kernel.org/riscv/c/f4b71bff8d85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
