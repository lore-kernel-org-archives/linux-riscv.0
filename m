Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D2DE85390
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=///qO+OwKIffBiZd0p7wpZlIE5YWcIxIgXaxscYtXR0=; b=3sLBhk9saZ5/bm
	S6taE9h4dWmm9sigrz2QCVjM5ILIs7DisrTR5HP+JzFy+8A+Lh+BuMo/Muml9pfsVg8Js+P6mI4Mb
	J8hZjRsoYKcPWoHAkuvlTdAAC1N4POfJTw0HLAVWzxnQQQl6IpKJES3LQhzajI69GnyJAJiw4CcSe
	TH3f6Qaou+SaC12Zj5XfKLR0IhdppsHqPPJWlctxLqkeFAx2TnOvNXUXV0PlZIvCdezVPdAhAMJKG
	RdiceYNJhxTcvKFreZNIJ6JDo8mciqD4+Q5URv3FUUijALCMRAzXRBr+Tp+z8/fkclJCwRoR1NcVK
	wLndbf9ihM9d+w8CL9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jI0-00000002QkL-2hfY;
	Fri, 03 Apr 2026 18:30:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jHx-00000002Qiv-37JP
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 18:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DC3643FA7;
	Fri,  3 Apr 2026 18:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BFEC4CEF7;
	Fri,  3 Apr 2026 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241036;
	bh=ZxDxHuRXsUksBWz4VNVFLZCmFXgaegcpougScwFOAy4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ux+tH3ICNYp/eOEhmiKgPme9HUPekC/USQXOK626zkVNzEBRu1Mw1LwxuYmhGas5j
	 c2HZwVND0rpqDuOuDEvJRCrctASGeoEv97V3vcUZeOA23ln6UCBaMixQUYTfCdEHb/
	 aeVOtg0NAzi6/iD8qhv9LjM3CXO3lPixhmmqk2NHBJCwjX+PDZ/kS3dDwwpfj51oXa
	 lJWuM6Nb5A/3I0qEStkLpSVXtbolJAMVd2hero8GmE0dxawiIX/WJrlM4I7NyGgVBp
	 xguMmO18cPUfwQ1d6H9JDNgdDUB0iAMdlGKozhnl2m+9TJSApAlNUzpARIkq6fn6X4
	 AbiaEopINPwzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE923809A14;
	Fri,  3 Apr 2026 18:30:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v7 0/8] riscv: optimize string functions and add kunit
 tests
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177524101803.1406513.15222599050806931246.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 18:30:18 +0000
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
In-Reply-To: <20260130025018.172925-1-jiangfeng@kylinos.cn>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org,
 kees@kernel.org, andy@kernel.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, herbert@gondor.apana.org.au,
 samuel.holland@sifive.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
 linusw@kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_113037_832795_B3FFACCC 
X-CRM114-Status: GOOD (  12.44  )
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
by Paul Walmsley <pjw@kernel.org>:

On Fri, 30 Jan 2026 10:50:10 +0800 you wrote:
> This series provides optimized implementations of strnlen(), strchr(),
> and strrchr() for the RISC-V architecture. The strnlen() implementation
> is derived from the existing optimized strlen(). For strchr() and
> strrchr(), the current versions use simple byte-by-byte assembly logic,
> which will serve as a baseline for future Zbb-based optimizations.
> 
> The patch series is organized into three parts:
> 1. Correctness Testing: The first three patches add KUnit test cases
>    for strlen(), strnlen(), and strrchr() to ensure the baseline and
>    optimized versions are functionally correct.
> 2. Benchmarking Tool: Patches 4 and 5 extend string_kunit to include
>    performance measurement capabilities, allowing for comparative
>    analysis within the KUnit environment.
> 3. Architectural Optimizations: The final three patches introduce the
>    RISC-V specific assembly implementations.
> 
> [...]

Here is the summary with links:
  - [v7,1/8] lib/string_kunit: add correctness test for strlen()
    https://git.kernel.org/riscv/c/abd6819bbf5b
  - [v7,2/8] lib/string_kunit: add correctness test for strnlen()
    https://git.kernel.org/riscv/c/31a361f466a2
  - [v7,3/8] lib/string_kunit: add correctness test for strrchr()
    https://git.kernel.org/riscv/c/68768cdba710
  - [v7,4/8] lib/string_kunit: add performance benchmark for strlen()
    https://git.kernel.org/riscv/c/54a7a0ca4b60
  - [v7,5/8] lib/string_kunit: extend benchmarks to strnlen() and chr searches
    https://git.kernel.org/riscv/c/d52a2222768b
  - [v7,6/8] riscv: lib: add strnlen() implementation
    https://git.kernel.org/riscv/c/018ffd93d25f
  - [v7,7/8] riscv: lib: add strchr() implementation
    https://git.kernel.org/riscv/c/bf74efe28f7c
  - [v7,8/8] riscv: lib: add strrchr() implementation
    https://git.kernel.org/riscv/c/3dcf058583a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
