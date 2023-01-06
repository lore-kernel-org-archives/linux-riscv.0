Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D40C6379F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 21:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tENfBMvAPbGUpdvSG59EDeM4b2ICmpP1SIgUKo7wdnU=; b=hkm4hyRV+hHGZa
	t5jsH6wNxOnhl8nF2ujJsAWXGI6HwL6+3+tRV01Dcki3kINBEfCOAU8YwbiMnAZ38c+ZaYA5l2G9L
	FUvwEPxBG3kuTEC7+BZhuonsBHuFcYki2ZybYvNFBDhUU4RgkrzZikgo5Lt/Ynp1sPn8GQL1GO7M2
	pZWoyNakQEMYmJN5I5rR/t6W/6qw392qiHtWrSh/g1B6DHKRMiVngX/4dyERhA2/QmzFGEbI8dzXf
	bIrJDLDo6sn/jpQDK2eCKAnVwY1leHcc721Owz0zJKrLdBj+6gCvvedeErjACK1A+pRZRzWshOD5k
	6PAHsnGA+Azt54hdOvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDu7K-00F0Lm-Gh; Fri, 06 Jan 2023 21:19:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDu7H-00F0K2-4q
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 21:19:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F316461F8B;
	Fri,  6 Jan 2023 21:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA110C43396;
	Fri,  6 Jan 2023 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673039945;
	bh=yVLNkZQT3F6G5kW3KNji6w44vsBmJ17vxiKfBp5M8bc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WJd1TrEFaBmJgQGfDaP07uScusWM/RPM5ugjz9oXgRNSvQqe3/MhMjbRMEFA4j0/9
	 BZX453i1j0zYtdfi7ICjRNVCcoNX6Rw/qYEcWXNIfZpEi1Br8PsgaKrek7ChdgtlMY
	 xbqy8DVGx0ltFhA1z9G/ufzRp1KNjYSklDXHca/D5gPvUrTOpWnzeaxXbXLSb9h4+/
	 Tv7Y9J/knI+VZm3ymb0oXqOkAhUV7v/3u1kwk+22gegmk3uh7awp4Ecf9HtgXaJFWT
	 sTDRt3pd6ciWqgZS2QihByGA6Mj/sk4fQiAzZR6MA5+BNP6OswYAN4TC/ZhZcpQhcD
	 CjMsXFODfpqHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D04EFE270ED;
	Fri,  6 Jan 2023 21:19:04 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.2-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-96b62708-327b-4721-a0ef-49ef52a1b3c2@palmer-ri-x1c9>
References: <mhng-96b62708-327b-4721-a0ef-49ef52a1b3c2@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-96b62708-327b-4721-a0ef-49ef52a1b3c2@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc3
X-PR-Tracked-Commit-Id: b9b916aee6715cd7f3318af6dc360c4729417b94
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a389e54642a86c91d683b2f0b248f1d2f4e52611
Message-Id: <167303994484.10294.2900232298703872108.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jan 2023 21:19:04 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_131907_253097_46B8673F 
X-CRM114-Status: UNSURE (   4.90  )
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

The pull request you sent on Fri, 06 Jan 2023 10:13:09 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a389e54642a86c91d683b2f0b248f1d2f4e52611

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
