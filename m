Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABC9C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GAp0JSjCi14Y226CoI0BnhiDRMlIOXF5qrUu+QPF3U=; b=ihAP1f/XnuWEyv
	ouV/DDTzS84fm8qGMNXESEnjtpUVx0N4E0CS4l866klQ0lXsJavVjjx0XSFxpRIQDvHf/KaQlSw57
	RSrSC8BhwVhi7zu11Rj6hgsucvnKCv9PmCQEircbYxMzaNoooH4wdca9ghlFCGg8H9cvRWQKJPzJr
	W7GRHi9yofmQOj7kn5v3RpWvlsu887Qxjm3GcPxVdHlT4gK80tYvbdYILpJC/+KsVAaNUIpA5hafU
	5aCq3EE9RMXC1jRmnTKW3x8nYaCnze0wp9cEVNZXeZskMgOKPHi0i5FF/1l0umI1CkX7SFp24f5Db
	BAA/UGMd/YV0hn7zbbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psYAB-00ByYC-1H;
	Sat, 29 Apr 2023 00:10:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psYA9-00ByXc-1H
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 00:10:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFBFA641C8;
	Sat, 29 Apr 2023 00:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C5CBC433D2;
	Sat, 29 Apr 2023 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682727004;
	bh=XsoaQj93I5H97j77YSJFrGFLBXFXTiy6B3pMwBky3fI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VVHfVvy5/8eagge8hVaN2D+tJvdluuGCZcVim4Gwfwal5jODmVGhd9fOyeZRuxO0h
	 y1aKZvc8sCC6w2ssGvqz6PYOSo5iLD+8BCB/oA6tyRf8x5ClKAyd1/kT8/V7JiTVGM
	 gGMx/Z36XBRs4EGKJaorOwEzMvl/s65goBEZPv95hycvhIuAz76yXRiZv1f+If3n8X
	 BpLbOt1ASsopNBlzF6724SX6m2xZYq8aBoq2NqSKs77QyMahBZWhcr4CfwXoYvn4DZ
	 TL1tUsSYY3y0yQEKFBICdcpjok3q/e6YkBaxAsCRDMaMaMVqWl5s9L9Z3KUm8PQEQd
	 pGg0NY4ttMKdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44762C3959E;
	Sat, 29 Apr 2023 00:10:04 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.4 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-57198db1-de34-4dca-be9f-989b1137503e@palmer-ri-x1c9>
References: <mhng-57198db1-de34-4dca-be9f-989b1137503e@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-57198db1-de34-4dca-be9f-989b1137503e@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-mw1
X-PR-Tracked-Commit-Id: b09313dd2e726fe5e1fa574cd73f5e326c6030a4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 89d77f71f493a3663b10fa812d17f472935d24be
Message-Id: <168272700426.9526.5480201367174697156.pr-tracker-bot@kernel.org>
Date: Sat, 29 Apr 2023 00:10:04 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_171005_477975_7C34DE5D 
X-CRM114-Status: UNSURE (   4.40  )
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

The pull request you sent on Fri, 28 Apr 2023 09:09:21 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/89d77f71f493a3663b10fa812d17f472935d24be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
