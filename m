Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD06C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm8roG1oUYZnI0k+bSHhiMjmx7enU6l7sJI2UOU84ww=; b=J6FkiqyFcDWJvN
	eUU+7+RzCS3f2l20rvL9lPlv6KOzgv06ct15VcEw4CKrNebDNkHco9a8i/7z0+zFyz64JSIDsiDaS
	M9sQk1KtyURqd1SCrmczHqs/jJgBGZT2EN3cvFsRcvfacylSeCpDJl0S4cf23+9hhrhdQxxrlUaa/
	cddh3vs7vzp8eu6uiUcHWXXax1v5XBeaKB7DN5PfSjbV+64XyPEvWWyOduApOT/Kbzjz7AED6b1mu
	u1G4no9p5xN2+oonGCFVRZPfiTPIDXarqbZQR9eVAMXa7kAO6HFFcuOkxl7DtRlJ28Tyeh295tGMQ
	mItUCFyQp02JU8fslaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7JC-000000020cg-161J;
	Thu, 25 Jan 2024 21:30:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7J3-000000020Nx-49Ga
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B038CE3515;
	Thu, 25 Jan 2024 21:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 567C0C433A6;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706218229;
	bh=DU2aKLt1gDJPFPkXs014yUzizTB2XryAG05PwCdQcMU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OCk0fJ1km2f4qcwwOqVN9rN3xFh6DvAwQwI+eiNur43sI9ERsQfnRTVxkqZiqz80e
	 c1DQ4U4k/gQHMQm1bcp5Io+ugoJYCmX+t2awn2ujGQqUH6mBpDt1Qtp+8kvPGPwg54
	 0jO/H0FCHxTW0Gh2mvBLEc6b06GfE4AxLtgvxsHrM4mBbmIwzKEmmNfw/WO2M21Tiu
	 3mqQRRq371QDxIIO39ljhxj18xBGU6kMvYJxdTnomaEbr5EMIm2vILmoS4IKQqp6KO
	 IWehxvkNo+aN5DwBIEfrd7ifICA9fLYX60LP5g6krKvpbONpvGetKosjHjIPzfmpE1
	 1OyD1J5sDwOMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 406E9D8C961;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Avoid code duplication with generic bitops
 implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170621822925.6239.5198530018567200745.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 21:30:29 +0000
References: <20231112094421.4014931-1-xiao.w.wang@intel.com>
In-Reply-To: <20231112094421.4014931-1-xiao.w.wang@intel.com>
To: Wang@ci.codeaurora.org, Xiao W <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 geert@linux-m68k.org, haicheng.li@intel.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_133042_284230_068C4120 
X-CRM114-Status: UNSURE (   8.06  )
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

On Sun, 12 Nov 2023 17:44:21 +0800 you wrote:
> There's code duplication between the fallback implementation for bitops
> __ffs/__fls/ffs/fls API and the generic C implementation in
> include/asm-generic/bitops/. To avoid this duplication, this patch renames
> the generic C implementation by adding a "generic_" prefix to them, then we
> can use these generic APIs as fallback.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> 
> [...]

Here is the summary with links:
  - riscv: Avoid code duplication with generic bitops implementation
    https://git.kernel.org/riscv/c/cb4ede926134

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
