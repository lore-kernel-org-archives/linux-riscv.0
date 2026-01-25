Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0570CE63C81
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 03:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSl540j+r3SkaE1D8XHH5iqZqLpkTm+Np+mNkzVMvqk=; b=jFJzQD+KABk6IQ
	lPyiWQ1RpGSp3Z8iJ3q9zOdj2zjiYkDOFHmY5pxEt/4Ytef6K6pYhJ2+59XPOoqH5sPePitsVQbU1
	0fzpAFuE5RcPHQAYITyMUVPtj0WEUmUBYuHtNbQDE0Aw8+HlBZkzOIx/HmsJxFZKsuBIm0KGArjEs
	AJG1kG/5lhnkiNxlhUJC5RKKLbjHNZPPuyel/gi8IwStov2o8bgAQllkjkgGXtb3NIW/Lt0edpjNi
	82bjXXvzajaCti33rQPVIX3XGI+j3o9ID0sZaiO724Qn4D19SbUPDqA6u85fIEOizSnPuiZsk1pBg
	sRQ80PiaXif8mQfKC8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjqMD-0000000AnBN-1F7A;
	Sun, 25 Jan 2026 03:00:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjqMB-0000000AnBH-1WjT
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 03:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E78FB600C3;
	Sun, 25 Jan 2026 03:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0A5C116D0;
	Sun, 25 Jan 2026 03:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769310005;
	bh=9fr+XJtH7SFcnltEXJNlthPdjjOv2Jy3rw1mZG1IlKQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cVhesLBwequwSxoIYJhMSoniT4gkO4001ZPXVFS1ME82mNYNu2xUHydCJl67jgHxj
	 HQKNRGgJojTQq5TKYkVIZLjrf3ZiXar0ZovUNtKX5PRC9upC3gp+ClBkgyCOdTWcKt
	 bIu362r2W6H8NkjE92D+0DoT3+cQj60JZc40Ze8RBlq7DOeAZLnrelM6OVOmxYW52P
	 loYyl4zSqFGWdH56fse4N3u+Uun2sYXrmK0bASccvgZNTzo8HrD8I20kklevg45z7m
	 ogy6kKzRd5/eEzyRMiMtFp8HPWi0u117RCYJujOeQIrKcnPr810Um9x8t4lKXSV4CK
	 Ie9GouoJQh0yw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11B113809A00;
	Sun, 25 Jan 2026 03:00:02 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
References: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc7
X-PR-Tracked-Commit-Id: 841e47d56cef9b96fd2314220e3d0f1d92c719f4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d91a46d6805af41e7f2286e0fc22d498f45a682b
Message-Id: <176931000055.3419453.10723054175735999407.pr-tracker-bot@kernel.org>
Date: Sun, 25 Jan 2026 03:00:00 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 24 Jan 2026 16:21:29 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d91a46d6805af41e7f2286e0fc22d498f45a682b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
