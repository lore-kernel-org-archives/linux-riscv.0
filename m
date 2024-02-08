Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A6FC4829B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wWOXVm9pG3gGWSK9EJAax4m67kPeQpGBu0IopAllzs=; b=4QbYozP7aMi6Zz
	uC9/Gkvvhorkcvp/1kQqqFoelxithhpsZMTX5MQ41XFFcw3wJYBrAS82sgXSw9b5H1zFDS89c80s7
	uJShUeO/MValKFUWy291zSL+Pq1EWEBxcZN3GsHTQRzpuajY1hY2ub2JTidWHjsourNlXfDtWet1E
	CxjJfdzvI05bj4mHoJbQtiNTA5IuhA3ro7i9MDoHuR268j1y7rihLq9/qLw/q3+8r5XoYerWfHXTn
	aNHpc0Njj2ITWthacYJPBS2R2mXjoGJq7swK6nfn8dSIfnquvGz0FOczxBA8py/s9ncD0nYsHFJxe
	5vKArx1tPFsbPSgM41yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFO-0000000COQo-1hfS;
	Thu, 08 Feb 2024 01:30:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFJ-0000000COOi-2DAZ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 01:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6205ECE1B34;
	Thu,  8 Feb 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CBE5C43394;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707355829;
	bh=jYYwLLD0cwfcrSOXqzB93y66pQoLtdRRtkWOuQY4Tcs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ry4PZHKt2T4QCiOzmtdUe9xa5hmTVZOPPqR7Entrs1kU5kxZEvLVtszf3Xx6fWRki
	 tWOfoshV8pMS3HS9cDp9uiLNiU19prV4RCn8HmYOvVRC9KKX2zYIhLgMfUT6pZUpNr
	 uQJzkgt4vhIb1TYQg30lDwcznon7vq7hU1FEseNx9JsqQZcqf+yXXRFPjTjjG7VCPk
	 xIZKeEbyVco4h441qqP7BfCB55CTNzetH3lResw3DS5H8tSsuVHRVtnTjUnvU8e4rP
	 jvHA3//nLw9IP7kICjl4Hyz5/KnKZ9Zz771ydifwh0TcVYW7Ypa0b8SkDFYeUqodSq
	 LH9m//dRHfgJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 266D0D8C97D;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix arch_hugetlb_migration_supported() for
 NAPOT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170735582915.12826.16835732930725743994.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 01:30:29 +0000
References: <20240130120114.106003-1-alexghiti@rivosinc.com>
In-Reply-To: <20240130120114.106003-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
 panqinglin2020@iscas.ac.cn, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_173033_774751_0D7CB6DC 
X-CRM114-Status: UNSURE (   8.78  )
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

On Tue, 30 Jan 2024 13:01:14 +0100 you wrote:
> arch_hugetlb_migration_supported() must be reimplemented to add support
> for NAPOT hugepages, which is done here.
> 
> Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/hugetlb.h |  3 +++
>  arch/riscv/mm/hugetlbpage.c      | 16 +++++++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [-fixes] riscv: Fix arch_hugetlb_migration_supported() for NAPOT
    https://git.kernel.org/riscv/c/ce68c035457b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
