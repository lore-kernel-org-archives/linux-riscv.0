Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F7FC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vw8A8qyaTaAKtEVKRvhvtyqfJiKHOmjmhE0gsUlsBlo=; b=Hfj4N1PTHtWAio
	+9OqJgZCw2F7vfOXkUChMIbo4OpaaWlslCxGZQW7bGvCMoYVD41MD+q3zaIYBvUvPYrWhYZ2HKcor
	5oV0nEoDSllIfNGsJ6fnUxpypptQ/jvAqLavcNbgw6/HIYAl4FVD5zIojxTP3xsDi13LBWygSNbwO
	7lomJUY8rPNXSaGuc6/ew/e79ZqB8OsnWH/iidVseDDR0OLDzFS2eU+GGUPvt+h+ITEFpv5QyyYtC
	A1o/FPnSgVlIGgl4hDatZR1fJvcglrTPQUsmHCkyvH0vySqIWcyyGycyi/p3w9sdHSZCdjFLmk7A9
	DmtKNGJ6QJJ8yNyVq3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAx-0000000FEMJ-2eLN;
	Mon, 25 Mar 2024 04:43:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAP-0000000FE4d-2M1i
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 04:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6BCF3CE104C;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A81F4C433F1;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=YdL2mOIr3NlfgP6sy3cQZt2wKvb73NuUct/fQ8gw+wo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hyW3I9qaDGbspbhpix74t7gfdEo1sveTew3DjnMt0ZAq3sY/coVNVi6/3u55HLXNK
	 vzByJhq3ut4mAzLPPWqIk24QB0wfqD1HnBCIH5lCGVkWJ7aJWYTwwPC31Kab+vkenA
	 SEBh3Iu5z4JRfGHgpDEq51ruoTZ+llxyXps4ld4DBTWqp1s5v51z48Vmlv3m/ILTFp
	 xikKVbaAsWz03cvxujv1VNVjWDf6zQYQzQfSPV/KocEjuHmR00tmZHCNjzR8deIi63
	 1Dx+FsMSafpFQZvqqg7MUbkSKlRROuQfZDvHV4SjINKFWq6x5BCLXm9BtnhIZmPl80
	 qwz+3RUCSNIKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F525D8BD1C;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.9 Merge Window
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175458.18749.15620721210284247678.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
In-Reply-To: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214237_958323_AE6C3790 
X-CRM114-Status: UNSURE (   7.29  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 22 Mar 2024 07:22:06 -0700 (PDT) you wrote:
> The following changes since commit e0fe5ab4192c171c111976dbe90bbd37d3976be0:
> 
>   riscv: Fix pte_leaf_size() for NAPOT (2024-02-29 10:21:23 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-mw2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.9 Merge Window
    https://git.kernel.org/riscv/c/c150b809f7de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
