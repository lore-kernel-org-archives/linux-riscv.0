Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8E5EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMCjaDHIl3Y2qSBWGeJmjueMdXRHGQpwVNQ2lrqBSNY=; b=zbqnbq5UdwK5YB
	HwgOxy1JBJi7rCqW91QHIUMEYnk4mdFfXCh6pyJBIGrGqnHX9PcBOq/nN7XAJ+w0SqxuIqygQ0NKT
	Dy5GCvPuUy1mdLwJ1lV0Y+YvXqS7kSTtjuMpl19kcrWDFUChe0APIVfwvNqgjLZDmqY2SGkzCLQWE
	dt5ZnnnFBjkSx5beESYCdzx9rV6k5AQtjFcsRYDNcsew2v2UeQkN36b2R1nbaxYsXB3SpAIdS9lUt
	nW44+wiakwy1weLM7ngGdT1sS5EB3ADiM3Ji8QJTzTR5fAJw6ipDFCNk66BULMhJAPKuqq8ZoU3xh
	nqXu5u3v7yCrOidFjE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNNp-006wzz-0K;
	Fri, 14 Jul 2023 18:19:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNNn-006wzP-08
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 18:19:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F17561D96;
	Fri, 14 Jul 2023 18:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 885F5C433C7;
	Fri, 14 Jul 2023 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689358749;
	bh=mMTJnIUl0Ox4s3zJ8S50GDtIkriWNwEZTt9R8QIGuD4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gJmU92OcKsrZvBjxBWlQL+GVOYH4c7fVM1cygpF0FmGJLSYF9pxJAt5TzFkteY3R0
	 BLl9oG6iweWOk7xndgEDCdmxZ9REJqQjBMevcFWS7UmcKPG5qmtoomazGAz7K5ArHw
	 8bj9rsO7QT3XKUHFIuuIK9T8InHhEmUa19ZLdqS1MK2M3cJa37dGRjy9GPMzh9+upk
	 +iP8fcMtwV7uQQt3GG8nULXbFquh7yf3wWiEI/8buo+UbD5JuMQOpIdb66Ppz7Z98Z
	 jYVA4IkZ4X5rtsL6AH7VEXPw3OJanndfRtS4E5Xjif1rCrW4uFi/cWKb1chTAmca78
	 5LuKNInbg6J0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 751C3E4508D;
	Fri, 14 Jul 2023 18:19:09 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.5-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c0a9115b-10ec-4bf0-8c4f-af009c34423f@palmer-ri-x1c9a>
References: <mhng-c0a9115b-10ec-4bf0-8c4f-af009c34423f@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-c0a9115b-10ec-4bf0-8c4f-af009c34423f@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc2
X-PR-Tracked-Commit-Id: ab2dbc7accedc2e98eb7d8b8878d337e3b36c95d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2772d7df3c93f15e5b2119bd9e14724db6a21a04
Message-Id: <168935874947.6403.5064105455791400018.pr-tracker-bot@kernel.org>
Date: Fri, 14 Jul 2023 18:19:09 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_111911_140417_95D8E4D8 
X-CRM114-Status: UNSURE (   3.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 14 Jul 2023 06:58:58 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2772d7df3c93f15e5b2119bd9e14724db6a21a04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
