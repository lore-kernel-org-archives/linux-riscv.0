Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3420C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY17vetUuKi48NujmyccMMHqzux0/RhglHYSN9kXlvY=; b=enYYo0eimcFCHi
	fljrLS7uiLpe8QWlEhEnmbRyXJrY0b7pO885J8FdhPHrihxukCJisWF99JpFGWrTAJZSks8dCQyNx
	NoYQoMnaInBseeRrVG/4nUxY+f1IZOIXI3niIo0F2zBOnbQsmkICJa7ZeL3iJ+3MLxZb1873eeo9m
	v/fcAKKmTN3ZrzIz/sySRrs9XUuTNuukw+wNtCOcsnkGWEsIp9G+5X6tzccAaLtApN+DHl7/QCrJ0
	itDrj1KL9sqb1rr+uh1bgHZ1tt0B6N9/vy+RNDyWhd/exoqPIv+D+fnlbYIgRWZECUR3YlFm4vYFm
	+Cw3DI5/zgdbB8cL0SWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqf09-001I2x-Ic; Thu, 03 Nov 2022 18:31:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqf06-001I1N-JZ
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 18:31:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 23551B82997;
	Thu,  3 Nov 2022 18:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C32E9C433D6;
	Thu,  3 Nov 2022 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667500292;
	bh=2NyA4ERgTsQNrECcBYv8TSkJKybWzWdNA4MPIH0N2G4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IoCAnSJnLuvF8NAMTfZIrgj+qKcQaiKHeE2VyVTg2JXvDEwiCKwqEK7QvK1ITuOM8
	 B+AK+hcsj5pmqKNQTHvKb62isswoPTZ78bUyXeJHmFqMTKxbjc/5qS5OiCVoEz5od/
	 SnKoZqkYTdzvQoveh6JTFL6CEG56LzVQcALb1R7oKSAwdRQnHhUI36CYhiBN1ynfu5
	 cG4jaPkd4Cc0aF99sOBeqCP12DHICviyvuLkC71MDPL2l3pAEuHxU9R3mxwOS6W+gv
	 5RSReckjTDI1RYlCuT2W0QXh/xKlyJq+LJOKDvpzHl/ahL2tb+qoT18dfQpfyLfYRr
	 S/vsSE2w0U7DA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1237C41621;
	Thu,  3 Nov 2022 18:31:32 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o7tossaa.fsf@mpe.ellerman.id.au>
References: <87o7tossaa.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87o7tossaa.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-4
X-PR-Tracked-Commit-Id: 02a771c9a68a9f08cce4ec5e324fb1bc4dce7202
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d74039149e0062e4ed25738d6e3e06970a38809
Message-Id: <166750029271.3912.5527083554346380023.pr-tracker-bot@kernel.org>
Date: Thu, 03 Nov 2022 18:31:32 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, schwab@linux-m68k.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_113138_820875_096D963F 
X-CRM114-Status: UNSURE (   6.44  )
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

The pull request you sent on Thu, 03 Nov 2022 13:09:17 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d74039149e0062e4ed25738d6e3e06970a38809

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
