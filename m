Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC2CCE8E9A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uHsYf4uHO7qR4be1hARlbZBgReXqm5HjT4Xsi/fMTU=; b=Mxv3xssaPL6ElW
	v5QxdUxA/x7WbZEiOFNsSq0J//clX+6Jp5FvgyS2JB/6XX+z0UGSgnDcArDwWKvdqljBftgPj16KQ
	xVGPinM+/8uMq8Il1FQ0sRNfR3VNAXEj0MNh5LOPYtGzg+rjztWfBk3z46Lsvc2mOyjRRyKHXD2qS
	htrFVXVBk88s3TbF5P0GMP+d+kVJI0SSoaoXnHe43h0k3Q57t/gQVE4IA7hD7bpJE2HFPIyjoszxm
	qfxBZLAe/gjj/XtT71Vesdp8CkpPPDxVoWPW35ZyYJy4v+meJPb8Rw1TjfnP4atpKD1X6PQ6BDt4B
	bEXTVCLmVGHIoPnVbyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42JI-00000001QZu-0N3D;
	Thu, 24 Oct 2024 18:11:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42I1-00000001QFN-1S3Y
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 18:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47C775C021E;
	Thu, 24 Oct 2024 18:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE1EC4CEC7;
	Thu, 24 Oct 2024 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729793428;
	bh=MWfNVrpzwXzo2CIL4VVcsh4vT0Qh9sgLfzlAUK6Aa3U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tNcngO4HvjgVwaapR49Z66jJT4tR5uX4rCHxJoJN4OLFN4oRBgGThdz0962CgvSzk
	 7QKWm/3a6rQkAWvERXp819PxdU8dMgERlJpKJM4UtaCSyDdJs11WGtI2q84VjpnrdT
	 D4X80tXuXQBFhHsq4NanXy6wVGcxqAvPYllrOlAbRsoo8mQNbkiBtS1eZZ6zQxx/S3
	 SsJE2dqgY1XkdNFCA1AJxEJxyqUA9StNYa9b0Z90Q0YR6M8Mb837kk0aHhWHAb3S5i
	 XrfmIfYffZ46QXRzkhr0fkNufBSJu2ckFpAw1bv1jnfoDz6GxF2c0KuhkGtICInybL
	 m9hf0Fs04hnMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711B3380DBDC;
	Thu, 24 Oct 2024 18:10:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove duplicated GET_RM
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172979343526.2335128.9298316535095984372.git-patchwork-notify@kernel.org>
Date: Thu, 24 Oct 2024 18:10:35 +0000
References: <20240909095557.446745-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20240909095557.446745-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_111029_450110_E39B8057 
X-CRM114-Status: UNSURE (   8.10  )
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

On Mon,  9 Sep 2024 17:55:57 +0800 you wrote:
> The macro GET_RM defined twice in this file, one can be removed.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - riscv: Remove duplicated GET_RM
    https://git.kernel.org/riscv/c/4c6b61b5d35e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
