Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B663CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Shl0bl9PRbdAOZ1Z/apJglcvcdkCTMvAL4sbyEkPMKM=; b=zmJvfivgNIdtig
	gfOkqIPbAE+tjiB2XUq6tefPLTU3g01tqtEWGTzFPKp06RAl+xW44XnF6R8Mu1xJisg53jKCdB9uA
	L22oVPpFj7jnci/entBylQmnhll49l1M6gAY9IdBLoBuGeOxPj2e8dsD9EnoEpPinOnVi0tsNyAvC
	eqjDvIcF/LndXCVuo+q5Guwd1uCCInuVX0+yB5dqO6Elg2dy45iAuo500429HPd2WMJSUm3Vn/tOJ
	djqvS6rN/NO7LsEtKAI7DhD4bEmhn5Nyb4NR4eSfpaXcf+2XNDhiSRyAg4L/vk3uzziw3AjX5iffo
	Aa1Y+5YPCiUqvmvZE2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYen-00000007OQx-0xk9;
	Wed, 10 Apr 2024 14:10:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYek-00000007OP9-1xFA
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBD3B61D92;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 634B6C43390;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758229;
	bh=eD02rCIxp2Gn2KKb+4Vh9Qm0xtxbnnnXHsw4g744NdE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NRiK+DwV1z0am3phlRQoAFhCw5HhWVbiWsidi3BkPso0RvZBvLnX0Z/TkURuS4Ha9
	 slcneo2VT2MuwT72bDEqUKcGtl1A+CDCoM3mOOKKwi24fs9Epfh1M+HDI+Yl2fpOiz
	 cRVIJR8Dp7qIdH/eDgUgf11qUzPa2DlattHTimB6butNK0JkTM1EuSWfOaA78BaNPz
	 RRvVQrCm3xSFt1/mtCOsfMEN8PzflM3N//hkbfNyYfbPGD0ElcpTMFSrWLTTMVkIbB
	 Kn+Dlt/8aywnuSU4k1q7iFjOAANHFMH1D4EzRG8nRYj5ey4hnHryoT2xbvfpJWY0gd
	 eF9yPlvFhTeoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55A6DCF21C6;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] export.h: remove include/asm-generic/export.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275822934.12683.6255352556602510987.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:10:29 +0000
References: <20240323090615.1244904-1-masahiroy@kernel.org>
In-Reply-To: <20240323090615.1244904-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_071030_573439_06DB3F29 
X-CRM114-Status: UNSURE (   7.70  )
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

On Sat, 23 Mar 2024 18:06:15 +0900 you wrote:
> Commit 3a6dd5f614a1 ("riscv: remove unneeded #include
> <asm-generic/export.h>") removed the last use of
> include/asm-generic/export.h.
> 
> This deprecated header can go away.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> [...]

Here is the summary with links:
  - export.h: remove include/asm-generic/export.h
    https://git.kernel.org/riscv/c/36d37f11f555

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
