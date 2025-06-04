Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC4C5B559
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 14:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+R1+LSCNnt1iKqsrkTh0cpXfbDoAgLPjjEdiY0u8mnY=; b=eiuesMzFez2iES
	rh5HfsF+NUe3jWEVzQukNC/yhT3UpwoVrQktVb14fN7BkTsXZT21CjK+Mjcy8crX273jsqJoIyhpt
	N/c/D3iVd+nIDYRmXRixzcEJ3OUQ30VOCWsjHsuuuP6B6i5lFnPyzYsfEjNzphjfylUEwa7z70ZPV
	wu+sKf8cjiRzVpiZiyKDd7GAk7FE6Bac+7DFMlHjysjeY263ScXbNs8SoHSmiAe1mSvjmnxjmDjBs
	RGiFaOwV2l3rG+VzEV6oPIShn+l6Mjyi8VL7LNWRGbcREq05xHGrxJWOm0IKb9BvRK6pRBY9slvUM
	2h2X8JRfl0nKHkYQjwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAT-0000000DZjq-23FN;
	Wed, 04 Jun 2025 14:32:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAQ-0000000DZiF-26fG
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 14:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB45C4A7D2;
	Wed,  4 Jun 2025 14:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879DFC4CEE4;
	Wed,  4 Jun 2025 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047553;
	bh=+BmWJhOFbq1yXe1Nt/YU+m0g8RpyqPG0fIDFEzDZhBg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JWT3MXzVFlIS3uSrmzj5udbBT2PzmFj3TIl28DjMtnGbDMcJ9F8/0wNQWTJGjaB4U
	 ZShUOG7n8i8l/dlz8G2r500/IgDmpQ2KVCRV59rDXWECayp1drz0BYrCaHRZb8RCe1
	 Wo2bkeu5/9QQEEw/yNTIcrhVA69Yq+upeGRAjLBwUh1O+RWiHd1sAoyjGsr+pbKJlM
	 5qy27JTzXh31dtrjVbiNYs0f6U5w2hdeYedufW8rnut88Vf2TsRTy7Z8bdXjj1g5ab
	 CPiP9FJ8cCERBVQOq2MenLUtD1u0ZbDhIVXqnQcCUBDkucuQVFbM4y9gzbWTLmemWb
	 NTrIanRPH7Fhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD6838111E5;
	Wed,  4 Jun 2025 14:33:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: enable mseal sysmap for RV64
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174904758575.2309006.1787281436678591425.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:05 +0000
References: <20250426135954.5614-1-jszhang@kernel.org>
In-Reply-To: <20250426135954.5614-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, jeffxu@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_073234_561504_08AB9BFA 
X-CRM114-Status: UNSURE (   7.11  )
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

On Sat, 26 Apr 2025 21:59:54 +0800 you wrote:
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS for RV64, covering the
> vdso, vvar.
> 
> Passed sysmap_is_sealed and mseal_test self tests.
> Passed booting a buildroot rootfs image and a cli debian rootfs image.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Cc: Jeff Xu <jeffxu@chromium.org>
> 
> [...]

Here is the summary with links:
  - riscv: enable mseal sysmap for RV64
    https://git.kernel.org/riscv/c/053ea0a6a070

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
