Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307F6C36012
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8c9z5f47AUca4JES5bwbknuPvmOy3ctbQyy+lIpEXc=; b=O/VMs9zHYndIjg
	fJZk+PTcDIp7BABin69M+mhUvg5sHUYrgV/L5d6NpHckHeOMhXuBj9lTn4mDEgvhvPdqg+yXKzx4G
	umEZI/9+bcqdke6/CIdMLR0NjL71aygDE+xsQkUV3pacjcT3wiq9s+YL/4YfHMy7GrS5wxfc3YjAW
	H1BYoRM6taKbWQl5Cj51ee7ImyWwPMOGFgurUfcANduLRO/QwdlykH79/dwl+uP/yA0lzQZxPbR45
	hjm75DYvjp9WRc7XOSUZ081dPhTmnNU6HUhuI+qofpB2z/l405WJiKMeA7qf/744iFTZg7qJkUePk
	1IcaWiBlqAzd+lETB4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf13-0000000A9tE-02eH;
	Thu, 27 Mar 2025 04:38:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqu-0000000A4Kx-0ebl
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8580CA41ABB;
	Thu, 27 Mar 2025 03:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246B7C4CEEE;
	Thu, 27 Mar 2025 03:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045859;
	bh=q3uWifr4a1+xayQ552RxBKHFkKXY6qRWxXi9pE7LfJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PDsXEgSJtwj2Mjih1sDwHOgHBXgkOYVF5IktBUYPID/1O5spP9khhBIse1WWrNRYX
	 ACd4JKcnyVJzlJcfxeSvGiaJkg7qg8OZm23pgLgMPZ2cMacrA2uvjRzUJ5T9IAfMMX
	 L1x10rDBc5YD6M1cW79yqRmqEVYp/DBGPHLkCiWnHeKEcTFyUOzRheqK40Gp0EoZtZ
	 4+/glFMR87VfU2Yvj85UesipsHEkd/Pf/WKTSXfinMwweomFXYfuq7XDIOQFHudwoa
	 IN7/fqY8tS3c5Vck4bm3p+XPCUZwxk57BSFz3BHr5vHkr4XSdkLqVk9T5jj05CK2A2
	 Cjy5KLfcGX6cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD60380AAFD;
	Thu, 27 Mar 2025 03:24:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] riscv: Add bfloat16 instruction support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304589524.1549280.4582301504340621621.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:55 +0000
References: <20241206055829.1059293-1-inochiama@gmail.com>
In-Reply-To: <20241206055829.1059293-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org, unicorn_wang@outlook.com, corbet@lwn.net,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cleger@rivosinc.com, evan@rivosinc.com, charlie@rivosinc.com,
 ajones@ventanamicro.com, jesse@rivosinc.com, andybnac@gmail.com,
 alexghiti@rivosinc.com, samuel.holland@sifive.com, yongxuan.wang@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dlan@gentoo.org, looong.bin@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202420_317132_D6B179DD 
X-CRM114-Status: UNSURE (   7.84  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri,  6 Dec 2024 13:58:26 +0800 you wrote:
> Add description for the BFloat16 precision Floating-Point ISA extension,
> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
> ("Added Chapter title to BF16") of the riscv-isa-manual.
> 
> Changed from v2:
> 1. rebase for v6.13-rc1
> 
> [...]

Here is the summary with links:
  - [v3,1/3] dt-bindings: riscv: add bfloat16 ISA extension description
    https://git.kernel.org/riscv/c/35bc1883733c
  - [v3,2/3] riscv: add ISA extension parsing for bfloat16 ISA extension
    (no matching commit)
  - [v3,3/3] riscv: hwprobe: export bfloat16 ISA extension
    https://git.kernel.org/riscv/c/a4863e002cf0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
