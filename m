Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AF0C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CI8u8YVlNGo+eD6GH60LYxac1J7NanLU46dRASaegUA=; b=cS1+/3GQpjAEFw
	gMrPm3GBqxsvCEm+jmi0kOooxmEPKCLt3KQWXdIn1E+5/vUwTDC27YUcLDYiH2axFAXaavVaMP6Tz
	NGGUaQ8ml8F6v/zYDliExeUGLXnikQ2+8keEKU/isVt99+G6bOVw96U44eojpmYQ/E5LAu8ndUO0g
	NxTjLUoyzpOiMUa66Q/W2KXAgj54a1qXXw/wZt5yQpW/zWRpWWdGqMZVfWeeDWtS1YRwsNr3a9UgS
	y0VWALbeXQ+mxEPYVlZzixfouq1yF5UtPloDbHVHwBUNmG4YTeuHmGtgZYd1bFlvX9RokHUMadX0M
	amllgoxvlR7oEvrNksww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylb-00BWp2-1x;
	Sun, 12 Nov 2023 00:55:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylR-00BWhE-35;
	Sun, 12 Nov 2023 00:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9CBD60BED;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B3C5C433A9;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=XrSajqyIX/GMIupsbLdryjwZSJcnce+GPP7KDkPQhtc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eWIdIwNOLNdqkngfPRmCRaOwzQqWEdVf4fyQfsJ9hX51PDQ3bhmSI9QZtsMgYrcIF
	 8aHZMYs4gOL/4gSqcMm7IRvWe1PcqRpqOtwPinsNQE/yPNH1jAjAZc0qUF+cE2rkNp
	 nglRwyteoICzPFjGnf2iZ6kKToydLI7h8VBgwrPRWc0yrSSWvf4CHXHy6ARxGcy9DF
	 YIFq9xAbPweOOdZvVR9AfcNgB3Ga1hsegS0aAjb+9DN11BMP4pAVieNjxsE9qae8rb
	 FS/26AIT3WSbus8G7Vwa6iQL37+L3sU0hhWl6PyV4EpenSbokJHdqOpR8gqAekhlG3
	 5K+C9ET1I0p3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68EEAE0008E;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] kbuild: unify vdso_install rules
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054642.11360.1289704479646976676.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231014105436.2119702-1-masahiroy@kernel.org>
In-Reply-To: <20231014105436.2119702-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org,
 svens@linux.ibm.com, nicolas@fjasle.eu, guoren@kernel.org, deller@gmx.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165550_058972_933B3335 
X-CRM114-Status: UNSURE (   7.75  )
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

This series was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Sat, 14 Oct 2023 19:54:35 +0900 you wrote:
> Currently, there is no standard implementation for vdso_install,
> leading to various issues:
> 
>  1. Code duplication
> 
>     Many architectures duplicate similar code just for copying files
>     to the install destination.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] kbuild: unify vdso_install rules
    https://git.kernel.org/riscv/c/56769ba4b297
  - [v2,2/2] kbuild: unify no-compiler-targets and no-sync-config-targets
    https://git.kernel.org/riscv/c/9d361173edc4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
