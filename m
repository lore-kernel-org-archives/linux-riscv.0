Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D44CAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 03:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7pwmEots21VyHiP6ubchlBdwpbfkIYXNVCxOWTzWs4=; b=H83JZM+AjIet0B
	aexHY5d4j1XFlr5gieqV1tfTjHx1HZdQMYh3+ZeaVitD3s6dTLOcG/gHZhw0gz6CqrmOx2nLD5O49
	tbRnx+29I1eDBsWGl8bEemNe1OOuMBI0bEo2ud9Jb/D4KlIwK8IGlPTeO86+xu9knCGz+K4t80O2S
	R1gWEUcQraBRqoSf2U1ltW2UVEIutAHD2L3z+8Z4q5fct6eYXAHyRK21Oay4HMNNYncCBF2PQ2kmy
	Sf7FEP2mm4h/y8dZiLKwyuGoBC7q4ZOdJsO5VkpgeBDU7tQ99xuLX54lnmWzdEwy3eUJ63p6MugNY
	PHHmFl5vfnZI32RMOjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cgQ-00000005PQ5-0BPm;
	Thu, 25 Sep 2025 03:30:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1cgN-00000005PPb-1l8b
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 03:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E48B403F7;
	Thu, 25 Sep 2025 03:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D3FC4CEF0;
	Thu, 25 Sep 2025 03:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758771010;
	bh=Z1rEEP2xjUQWNQmCsKtyDGJqr+lSHSgBRvo63Lk1wR0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BG88CM4dYQkU3URFWRSlOCJVo0faiCWaWqOh/9KYrTInYMOcf5Jw6Od5Ybjvd00c4
	 xERQroOwStGGlwoSIXkG0A3YutwRWQWXxBL9Dhlaqre2WT+TM7S9cetFFNhm64B5AP
	 clWLyv1AWS0DqQg6IIxDJxHVdNIjQxVaENlcdLxuLxqKqHRG2lJYjZHeMJ1bEkg1j7
	 AOwOpJ4QvxfHnpmjUSu0lo990046Y2ESbnrP7XQoIkA86/QDG8a61nYAXak1DA6api
	 ZnsWCcgQinKpetUucm68kqxAjysKtbO/UqCkzwFy6t7MYoDJPpzQXoHN7WS6i4kb2l
	 is+G6YxMjXYMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B6539D0C20;
	Thu, 25 Sep 2025 03:30:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Update Paul Walmsley's E-mail address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175877100625.2803569.11537236172793560743.git-patchwork-notify@kernel.org>
Date: Thu, 25 Sep 2025 03:30:06 +0000
References: <4a3d959d-56ea-36d8-029d-141e7820279d@kernel.org>
In-Reply-To: <4a3d959d-56ea-36d8-029d-141e7820279d@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_203011_485093_095C2B6F 
X-CRM114-Status: UNSURE (   9.08  )
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
by Paul Walmsley <pjw@kernel.org>:

On Mon, 15 Sep 2025 00:30:37 -0600 (MDT) you wrote:
> My experiment with using corporate Gmail for Linux kernel list
> interaction has come to an end.  For my MAINTAINERS entries that
> use that E-mail address, let's switch those to use the k.org E-mail
> forwarding.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Update Paul Walmsley's E-mail address
    https://git.kernel.org/riscv/c/e24108012ce9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
