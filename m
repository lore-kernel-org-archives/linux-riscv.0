Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91984C47DA2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lzfmy5joAv4jnzWKsO1WpqwLTNrK09EKBBZhyxSdvM=; b=PUbDJSITUdFwYG
	QFkBG7zRDu3HrQHlx/JeJCRdBwcxZ4QRJYxH63OXkR70Ahy3egdyldSJtM2FlFne4Xnv8dbdKa4B2
	9k2cfgZmnhtNcsITLnNa4WFQq2jkHIMS2ic2Yk7LdeaeG7jPtJU6pAfs19XYz3FDlL5JfoO744HC4
	viaW4EWVFbcSgKgRPpgHK7RFJQ7nivT4vXi1ub2SoylDXT1WNQHL5JfnDAkqCLLw3SbnKrUUYtGv4
	dNTZGs4W/m9+b5aZWERWu8GJJ9L3rdYJKqX8MSGvXZMck5F/mdc7t6TgWIXLDW9wWBi/OoFr9J43U
	hKTqmi1PfN7jBLs5gZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOP-000KNP-22;
	Thu, 11 Jan 2024 14:50:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOF-000KGf-2c
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5FC24B8205A;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8D49C43394;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=+blWXOkxs+elmiiGxL/nzv66ZE7UIH/a2iH3jf6WOV0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MvrdmSn8UtowhN7o/iJd1KQk9lDrmGaHxmqnpBMwd+g65GDsWrjHwTwFLFw1GOjjW
	 xUtteiGQz/iuIIo7ObwUmeJNgViVe8hZn23amuaxOhhxLCy+yljeuI+HRvEv1ZJDRb
	 kD7rwvNmZkqzctQLIbgLORTKrX+s2TfM5KYD7F1nN/YtMscXTA3pzOk0T5Ci9IXicu
	 fWbxOz1/ZFhf0lrJAZkcgLRVOTSIIoiDMffVVe8RoxFlnBLhQDJIKaKURLkiNMpkKq
	 1dSSsSGZUJ7yLXk8oVlkCO7F7E2w5gQGfM5TBaY7F7ym5r3Ot4NDHjk0BJWc6GnmGy
	 NMdspWQtG15Iw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D54EDFC698;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: vector: Check SR_SD before saving vstate
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463757.20080.7960935665061816471.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231221070449.1809020-1-songshuaishuai@tinylab.org>
In-Reply-To: <20231221070449.1809020-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 greentime.hu@sifive.com, conor.dooley@microchip.com, guoren@kernel.org,
 bjorn@rivosinc.com, xiao.w.wang@intel.com, heiko@sntech.de,
 ruinland.tsai@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065040_001257_165D87E5 
X-CRM114-Status: UNSURE (   7.57  )
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

On Thu, 21 Dec 2023 15:04:49 +0800 you wrote:
> The SD bit summarizes the dirty states of FS, VS, or XS fields,
> providing a "fast check" before saving fstate or vstate.
> 
> Let __switch_to_vector() check SD bit as __switch_to_fpu() does.
> 
> Fixes: 3a2df6323def ("riscv: Add task switch support for vector")
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> 
> [...]

Here is the summary with links:
  - riscv: vector: Check SR_SD before saving vstate
    https://git.kernel.org/riscv/c/e1b76bc00ed1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
