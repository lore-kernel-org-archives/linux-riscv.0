Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B829BC54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kf0CcXpd5+ooWRzu+RRxGLSJ0l1GGDoij4R5KsoEz2w=; b=miQfMTZKNFw5an
	NLLnR+uxRUg11ah1rKo5aFQLmp0s2rpmDyioMWqsxQ8w3NxnDjsc6b0BYjkeuJaASPX7vl7Yt/esm
	lXtqDLQNeir1c9WpgMvt7Ss+FkPvzarY1Xc2Y9okx2f+FFjVDfRSU7Y/zBFjQ7I6exGHJj4A1MC9K
	4m+RKhG4v3BY1CPz7Nu1cwCDVNAJHVCppayf3NE6LV9H7FZ0ebwiGBVVMwrp1GTwQfTdm975iSJHl
	qNKluM+AuwlHJXn4O7bryzWRPKllcf1jUo75GjzssHlss99oQE0lVxaSVH7zls6UuB00tsUbtTKHY
	mdDHClN/1kMZg5Mtx3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tZ-00000000vtg-3q2Z;
	Wed, 20 Mar 2024 20:50:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tV-00000000vpi-1d4M
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 273D161121;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6905BC4166B;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=RbipWbMWoVvJY57B7zAecrnUinQPH1sMwHudXDipRa8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZWLamDeJVmy9Sc3MPZ1gPGHkABS90E4m13Vvy3w0mwi6DsNyamapZ8rVhBrn+cwPr
	 Zqu7d+ieji/DQq8aW60GMMHCn4uPmBMHrb3vOJKNFp5ZqBOs9MlMrLrBgfeXMTtc6Q
	 HQ3EN2KLcTHBnsOQpcg2iaVttrO/vMUdjNKMJLo7Tex67g7n0R4vU5XXBnPkug0O6z
	 cWiVKV85GC5a1kKYOs+sSs6QBGJ6fCNS4A6WgkFonuIhVgCOlhu6O+nXQPuCpY0wI9
	 esVlblwctYjV/IJ56Q+pJecA1QO/ISdsGHF1hE4DNaRXM6nDip3DXDGizSjx7AbXbd
	 zewbtYxsK6adw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 605B1D84BB1;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH riscv/for-next] crypto: riscv - parallelize AES-CBC decryption
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783939.6804.12731110062638308548.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240208060851.154129-1-ebiggers@kernel.org>
In-Reply-To: <20240208060851.154129-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-crypto@vger.kernel.org, jerry.shih@sifive.com,
 christoph.muellner@vrull.eu, heiko@sntech.de, phoebe.chen@sifive.com,
 andy.chiu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135041_586328_98C22657 
X-CRM114-Status: UNSURE (   7.76  )
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

On Wed,  7 Feb 2024 22:08:51 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since CBC decryption is parallelizable, make the RISC-V implementation
> of AES-CBC decryption process multiple blocks at a time, instead of
> processing the blocks one by one.  This should improve performance.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> [...]

Here is the summary with links:
  - [riscv/for-next] crypto: riscv - parallelize AES-CBC decryption
    https://git.kernel.org/riscv/c/da215b089b5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
