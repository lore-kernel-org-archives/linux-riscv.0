Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95099C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 19:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x87hs3VGsRvKX2GUy1IRt64pKskAi0bm4MGJxlaSeRI=; b=Cex/a4VPpTK+Vl
	orNKnBVNSY9SopP2uaBXgfT+j4h43AVX7UuG+8Z8n4L7mVzOjaxfmh26U0HQtReF5g1XFn/5hwEoJ
	uX7SmAQjIAJfMrDKy2RcvG9tjimOSz1AwS1nmplbrrFQdMEqVcR8D97cKGrDCu6oFPCTtSksl6YIQ
	/XSnndo8K8CBi5vVJX8/Nz2J5h0YU8Su8uxJO32qEnWwPcB2hPSjh1M4uI1kIrl8062R9NhHrcQkE
	C7uSATA9CkSqprEgIH9j0S8OG/ndW1BVsK01tbAEV4nDDJnA4Tpey6lB/XXNwjpAel7zeN6PYLBdX
	uR585E7s+KlPqAoUnZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2HY4-008lh2-CX; Fri, 17 Jun 2022 19:22:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2HY1-008leq-3U
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 19:22:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DFF70B80949;
	Fri, 17 Jun 2022 19:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE935C3411B;
	Fri, 17 Jun 2022 19:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655493741;
	bh=afgKFOZfhid1Z1GdrGk/y5v1z3bbFmUPlBQrjnLteew=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o1ev2tsJqQXROBC8pHmlKcZOIMW4pFHFWGEE+FpqLPUALTTn/7h54VZY0c7pZMuDe
	 NyjUW7ZpKibJGnV0mOBbb3mYt8k0XCm+L60hQJGWG2ByvtuwO7G/FntlkzN/UiRiyH
	 33jHWuqZmVLYZAe3BXe2twM5hWHPF36KPlcy8nJhCIH1QWDuTCYJuMoNxPovCEUxEI
	 ORmlmintKCJhfNwAToWPEYdVEIzrI/JO5QuP8CZ9Tn5gpLXvE25BoKgw3Np9spCOF2
	 SYRuEBTzjRULmDfq7stjDkoD+w2lQSCg4VcVRZ3+cv3rAfr+r83m4SRTyTGetMqfMS
	 pixs3LZfSGuhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B9EBFD99FF;
	Fri, 17 Jun 2022 19:22:21 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.19-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-67f78725-bcd9-4c12-920d-2377a998b9f0@palmer-mbp2014>
References: <mhng-67f78725-bcd9-4c12-920d-2377a998b9f0@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-67f78725-bcd9-4c12-920d-2377a998b9f0@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc3
X-PR-Tracked-Commit-Id: c836d9d17a7d102ded1ba4dbd4ee0bc42ba26211
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f10516322ddab90e2d9b21990d8c8787c2236b26
Message-Id: <165549374163.16480.17138300142059650834.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jun 2022 19:22:21 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_122225_323618_62F50E04 
X-CRM114-Status: UNSURE (   3.89  )
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

The pull request you sent on Fri, 17 Jun 2022 07:28:41 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f10516322ddab90e2d9b21990d8c8787c2236b26

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
