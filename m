Return-Path: <SRS0=nQgR=NF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4534C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 16:39:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A68660F48
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 16:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A68660F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXVCLWDXwRokgszv/WQ+DRFt0edBmp2T9hcaLat2fU4=; b=iTWYl4n8lF/pPU
	pplTsedx1CEq8FmRKYCIfmsWo+rhMyc8YmL5Lnu8HgOno5LObD6r2wT39rNXkyMIY0mGEBfyPMZG2
	5sv+4Coale37bBya2pP9lbSUyQ+1my39A6LbDqQRluccB/G1ZRMjSUBcsusO3O82RU8XjabR1jZ6+
	kAS2v/FH74wy+lFx+R9TmMAy9WZvCZBWhpHyMMXEekIKyFpSMgA48KoG7Ob4Ik1o5L/Yg552nGIwq
	1gWu8ex0HOFwXAb3BjvQdOsKO6fZtZeKDOkHzkpu5LIGS1iCidcFLWhG/VNHmM2tSs6m+WpmP8Gi5
	z4Swgon6NXeZsCJmBgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEwg2-00EOJ0-Q7; Sat, 14 Aug 2021 16:38:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEwg0-00EOIh-2c
 for linux-riscv@lists.infradead.org; Sat, 14 Aug 2021 16:38:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 6CDD360F9F;
 Sat, 14 Aug 2021 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628959107;
 bh=usl2dHOeVd2/n1Dj7xONUdcyHGEOpZSc2wjxJW5H6Uc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZUsULPyUtp1xevDliWYOX4rp+Ufhm/VrOqRNkrbJZKwDGjWuQf+0ZZLmlPBtXKDXN
 c919A6MMNMnQC0ZAKnLyVDSR9baRxX3bKuxWHhNf32sDc8QWMb1ecC2A0QQrBBG9RY
 KeS9uuefLrJ7UivngIy2LONGgcgmv24bTRZLy4vZmE8AeRhQxkjIeToiqftrhxTWVN
 WtcUhsI8AnbLqUCytVwcHzww5k9QI7MLsBQ4/9nAE09/TurMFiIjn67t2a+QFSliH1
 919s4bp/inMCXVYtBAHf6f2Hzpzv+Dd5WApZHVI0gsw1KZHVP1bSKhSci3ALlIzu95
 0NvCNIEb/9xgA==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-eb8a31c1-f921-487c-8e96-8d4c32f8ed16@palmerdabbelt-glaptop>
References: <mhng-eb8a31c1-f921-487c-8e96-8d4c32f8ed16@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-eb8a31c1-f921-487c-8e96-8d4c32f8ed16@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.14-rc6
X-PR-Tracked-Commit-Id: fdf3a7a1e0a67a52f631b055975c6ac7e0e49a65
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7a4f1c0c8455657b3e19eaaffbad64a5f750c43
Message-Id: <162895910741.32142.6255521916706120489.pr-tracker-bot@kernel.org>
Date: Sat, 14 Aug 2021 16:38:27 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_093828_177752_C4CBB1B4 
X-CRM114-Status: UNSURE (   2.09  )
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

The pull request you sent on Fri, 13 Aug 2021 23:51:59 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7a4f1c0c8455657b3e19eaaffbad64a5f750c43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
