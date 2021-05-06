Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554B3C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 16:35:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1EA60C41
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 16:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B1EA60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXR4pZnRzmYuLfjxzemAkXGJNZuODnN5l+EVvAW4s8k=; b=g0xBTCw/zICQWaAcGg3a7xn3ez
	mMNF8IYB1zpi3XyvRpZHpOC51xeTVGM5Q6GbV102ePpwJgn2hm1RFlbl+19+4zAFmuWW2sh2WQPIW
	ES+Oj9K8cGrbwH74VAsgr+DJ545dt7LchKJas7L6lQPU0R2Pda9Kp1uoakXkbOE1GGod0JGWI2Fo/
	sNbMYvghdBdfaOkhKwoxL6xQm15uQ5tx1T+7sOkZmjb7udE0pTzyp/nuD9ZHHXKCLnTxpYi8T4nVX
	OOV+RNU6fJWg6bLgdvsPgNSUhJs95d4H3rHFdNXEXm3vkGLTyqKSSYauHR3WgPtssv/v4dkCBFs3f
	RzTUIwGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1legyM-004pQ8-6Y; Thu, 06 May 2021 16:35:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1legyJ-004pPt-Ag
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 16:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JNwAcAhK9f/f9gTQctLYTW0YVCEyCFLcLiPJbXFOVQw=; b=SlS8L148nDThw6xC3Bg8ckGOI/
 sxNKzwdtMLjvJqbz4Sn0ULOa94vHmEzeQ1C+iJD56SIJusPDtVADvGrBxzM1FIBWIQeBc5bVzsO8S
 Cfo1zfXakbSPXAwZkGr7B4fiOf2+t+uqVIIxc3KJ7sx+q5HnDfhP7u2xa0ZAKPQO/bYxdLgkdDH2v
 lgSm+MPhf3kQzz4wyHTB2cOETjfvSY9YjpF9Ih3BnE6IRF47vYQYoWYTZ/Nb2k++ZHlLDgigmJ/Zz
 evjrvcZ8nmn56wqOKFq2011zhIv+Z+mihALU8fzWoLv5bz9c7wD57RlcmEzfM2Nw0yMBkzaAzYnR5
 mwaV/CBA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1legyG-006DmC-T1
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 16:35:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D12C6113D;
 Thu,  6 May 2021 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620318927;
 bh=BMF+/cwRTuDiNf22Ih7rCcmsfWG+yJgPZFWrdXoEx6c=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=n+U4SVY4iBOBmPu8oDh1jERM8X0iXCxvnHTn08Sse6w7keaCvssmHqBRFCBzP20hW
 ESKnIO6QnuLQ69E/D4Xcdy7yANwuGbaLxDywxnxYk5yNP+vqhZl2Vb6O8pbNXWYkgX
 8i6vp2MjO+VdgOhoYPxHBa34yvKHBs7Zbi8dSh+QGzdobzFXc6tEWK7AwjJv4pSWdx
 zzkP9IlOaq5mlMrL3wgQfPQgyPpVn/9qHX7PSFA/+xmOnN1s9pIPUEZyVmHcwYUkxr
 Tv0me1z+zADY77hbFqHjg3tH3R/eQbpVaBwDVoOgeBCAmXjuPTeZr3kXW9+K2a48Fe
 n3EdgQoD/K7Sw==
Subject: Re: [GIT PULL] RISC-V Patches for the 5.13 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-723be372-8df5-44b9-9e4f-def2eb929f8e@palmerdabbelt-glaptop>
References: <mhng-723be372-8df5-44b9-9e4f-def2eb929f8e@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-723be372-8df5-44b9-9e4f-def2eb929f8e@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.13-mw0
X-PR-Tracked-Commit-Id: f54c7b5898d31eda3d6608da13b55c0466ba49fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 939b7cbc00906b02c6eae6a380ad6c24c7a1e043
Message-Id: <162031892755.29346.4410305055923494242.pr-tracker-bot@kernel.org>
Date: Thu, 06 May 2021 16:35:27 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_093528_983304_F746B63A 
X-CRM114-Status: UNSURE (   2.97  )
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

The pull request you sent on Wed, 05 May 2021 22:51:36 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/939b7cbc00906b02c6eae6a380ad6c24c7a1e043

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
