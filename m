Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C3AC3601E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+FTEyNVlXotQx5Oo0A56brmKRn3FpMSFtv0o+wWa+U=; b=44+1ST7+K0OTqj
	TadGZ+APMfXyExjM9Yvt5qLR41/C8k99EYlxjX/YzAZet3a4qCkNZvsqczXO13A1+KhcOxCAXybOc
	rPHZvV8sJELXkEVwxKalkX+TZH4UxzpEmH2st2vjfq/ypFAwvo3tr5f+3Ne+snWCaXciarV8xebEz
	HTcNXT2qFTXzCJpHU9NWNDX9519eVrmV7xNURM/5Eg9ZWGfmZOGDxNGeaxhsVA8AZ9j8jMkOETQxL
	prFWGFWLFArwkYFA4lPJxXUrha5HUhvK9NZ7J73VZnfh7HDZcO0INmW4a6XSkBUlSf7Y5jo7o3/zK
	labv+2dijqKXw08MLfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIX-00000009LFu-1mWe;
	Thu, 03 Apr 2025 16:20:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIT-00000009LAA-1w8n
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAE8C448FD;
	Thu,  3 Apr 2025 16:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A1BC4CEE5;
	Thu,  3 Apr 2025 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697199;
	bh=nrJTfauafpSv2Poq9hOWLVq4kSCuHURQcXZ0sblPSak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sl3rTlQVoLCwgetPGN0AdxcEcbT7hQYCPtpDdNPBCQ/w8AC9dyckACZhZTvnyyaIN
	 CFyyGVQUbgBEYfbTmIfNd85FYmnJWy61WJSeGay6N3YGDz/G8UYsVt19PTYig8RH7A
	 Veo0cBlXmgXjkYw3lxMtp7jQb5yEV9eSZ39goBcLhJ6Ms5h8SVPBJ5eypJVv/n1VND
	 kTgBzmg8vQodF1ee9wXJ5fFn7J+UuwODrXi16slcKYJbd6Jnu0CemWlxdFG0KcU9Md
	 9Q1YEJLR28OW8ZZA37ZVeSevOM4P5k8X/LhRq9kN3GYWxzfEkH+iJ32PnEzrHYsuUa
	 BDQ2qEgQhJ1cA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0F380664C;
	Thu,  3 Apr 2025 16:20:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174369723623.2563936.6647368095038423635.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:36 +0000
References: <20250326051445.55131-2-ziyao@disroot.org>
In-Reply-To: <20250326051445.55131-2-ziyao@disroot.org>
To: Yao Zi <ziyao@disroot.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 pasha.tatashin@soleen.com, kent.overstreet@linux.dev, petr@tesarici.cz,
 sunying@isrc.iscas.ac.cn, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org, rabenda.cn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_092005_523054_D4BE1785 
X-CRM114-Status: UNSURE (   7.55  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 26 Mar 2025 05:14:46 +0000 you wrote:
> Commit 58ff537109ac ("riscv: Omit optimized string routines when
> using KASAN") introduced calls to EXPORT_SYMBOL() in assembly string
> routines, which result in R_RISCV_64 relocations against
> .export_symbol section. As these rountines are reused by RISC-V
> purgatory and our relocator doesn't recognize these relocations, this
> fails kexec-file-load with dmesg like
> 
> [...]

Here is the summary with links:
  - riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator
    https://git.kernel.org/riscv/c/28093cfef5dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
