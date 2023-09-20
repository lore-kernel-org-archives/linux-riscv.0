Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733B0CE79CE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owAbl9t6LKUi4sh9eFBEaMSOOnecd1Mt2TkxSkJI+8w=; b=MCfBtD8H24btOA
	bh1DpL2wTfg1a7tWx0M2gyT90Y/l+Qboey1RSpIAxbVfOp1tP+1vTCrRt5ub+fFDKiSp8vnS/0Xq4
	Buym4Kd3gZZTg3PZ11vR+XTzoxPrFehw7QksqVrLKY8eDNCtoEPZeRCmWV/0we9nJKezaZQGANqgE
	hbPiDfMSrHeU7rCsYBjefZQe5eukj1uJs0F2nkmtPx7c9ORXdS4FuDp8NZcYWAKiZalKDI+/Sck4g
	xCWS3HOu1WBJIZ/BihlYUnHBgmskJHLsdWxHuRyN8TLzFxng4LLmVXirZygtsy8UVvywK5zHl8HJa
	CKpVHeqonrczg0ZQ4q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixHm-003BY5-0m;
	Wed, 20 Sep 2023 13:30:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixHj-003BXG-2l
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 13:30:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A50D4B81C06;
	Wed, 20 Sep 2023 13:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E5FBC433C9;
	Wed, 20 Sep 2023 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695216628;
	bh=KIFyhvlk0M/PhlpCsj4uMTv2n1j5avTPP9lbTgWA73g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q9CxtV8Svu0x4lh2xBlRSZre3K5SzUtfWB67H2RQ0of/p/HNoG0yYBWNLhIU2PoRP
	 zmSc4y5HAkvJGqANaJhnmI+0fiRQSuI5QSE7/ceU4XegVEn5+pr39Ao26S1dJzS0Wy
	 QrxmRf+EW4LO0SzgjlE16qc358KjDjtGPwqwR+d+zpfbEAcNpw4TpbjwOh+M9Nmdwl
	 Kc13U1kGxHuLWs1s3ovlbGG7MTruZ/Ghvgz3seNwChOltZ/2gPtQ4xDqdkRyfOBgso
	 tjasSaFZJtWqR1s/5jNxQZ5riKyicHbslU3mMVKaR+UKpFuFAHI/mBq1c75Hd4eLJL
	 0uS3pZih2r0jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A47AC4166E;
	Wed, 20 Sep 2023 13:30:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: kselftests: Fix mm build by removing testcases
 subdirectory
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169521662823.29772.7940523167721652862.git-patchwork-notify@kernel.org>
Date: Wed, 20 Sep 2023 13:30:28 +0000
References: <20230915100113.13131-1-alexghiti@rivosinc.com>
In-Reply-To: <20230915100113.13131-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 charlie@rivosinc.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_063032_052395_88192871 
X-CRM114-Status: UNSURE (   9.85  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 15 Sep 2023 12:01:13 +0200 you wrote:
> kselftests fails to build because the mm/testcases subdirectory is not
> created and then the compiler fails to output the binary there.
> 
> So fix this by simply removing this subdirectory which is not very
> useful.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: kselftests: Fix mm build by removing testcases subdirectory
    https://git.kernel.org/riscv/c/b06fab003ae1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
