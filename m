Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85089EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJ3R98CTLCaC2yerXuI8BYpXwJg1i+fv3TMS4PR6lbY=; b=ih+YlAi6mpRDgE
	K6e5nE0BuzVRZ1/j4rUnxq/XZYZEdYD9rGkk/0PrEtuz7U/7/tniXUH70T5UHUKcxvciCegqOsskl
	ntGlkg65GgJJGI976afYXitz8cpBDyGfcY6taGGSOUeU4f0oNPECyM6LFsc/rpr7V4ypLXFBl2Tru
	luUtJQ+LHeGRUl33Pcwv/pLXhUTDZWYA7jus7dsdEGehhp4e6XfOPwAisuK5x6oGbaSee1//D9TXZ
	Sqsd3Egl0+Gcz8Du7w/stkronp2epvrKL4/Eu8gb0CYVI3MS6GFmZtcRE0C2vJIwC6mgTCesXPbpJ
	45cGSwBvQUOO6zYYkssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEdW-001VYR-1u;
	Fri, 16 Jun 2023 18:57:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEdU-001VXN-0v
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 18:57:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC8C762D6D;
	Fri, 16 Jun 2023 18:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3028BC433C0;
	Fri, 16 Jun 2023 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686941847;
	bh=aBiANHfc7WlRsOXJs3SS4tlihuGbK31wTJiW8w+GHAI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HawpRXdpPRLre/nNAR0w12jD39h/2TyEHBPUVv4zaM6krmuPPSYc2+NKPAwLvNqKq
	 vyhnKD0WORt46RxrQzpcvSE39j0K40i0PdB1SF2U+YgNhniOd4FfTYuPfLyM/p5On9
	 OQrwWHOWX3F7y6OzuhdQJwcSqAPST84aVs1x3KublgMse9hf1y7uinaJZXmGEPT8xi
	 VzHz6v+5/uIzQpc1TXjPjL5C7o5mTJukRZJZBQ3vA+EcWMtEU2Zfcmh/SChVx6B4En
	 kerlYFqK3rR0LR4Ie1tcDPXEyZTnmK/CPOkq3wdWR8hojvpwKQskSCr5qcav7WgnRu
	 NKjUld5HGTnag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 19CF8E21EE4;
	Fri, 16 Jun 2023 18:57:27 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fix for 6.4-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-7c3e3b18-17a7-4bf5-a977-f287ef6d18b7@palmer-ri-x1c9>
References: <mhng-7c3e3b18-17a7-4bf5-a977-f287ef6d18b7@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-7c3e3b18-17a7-4bf5-a977-f287ef6d18b7@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc7
X-PR-Tracked-Commit-Id: b104dbedbe61d89a933479f8effce6409037ef73
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4fd69a32551036ac84bf4487b680167df77477d
Message-Id: <168694184709.2801.4867806136487239028.pr-tracker-bot@kernel.org>
Date: Fri, 16 Jun 2023 18:57:27 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_115728_372581_64BA3310 
X-CRM114-Status: UNSURE (   3.47  )
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

The pull request you sent on Fri, 16 Jun 2023 08:53:34 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4fd69a32551036ac84bf4487b680167df77477d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
