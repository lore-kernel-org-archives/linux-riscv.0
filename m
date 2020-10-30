Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9A9C00A89
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 20:30:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC212076D
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 20:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYtG9msi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZIulvIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC212076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJgQuh/lzPDJEfdcuzzkk3iAA/EQB2bqnmqn7FiEH2Y=; b=uYtG9msie1zSknGJ/z9MS52Clf
	qkOXk6tU95yUx91xB+Z2eomVFTu3qxbwJziEBIcUm2vc2blfCVGDTuW98u/zIbvm9sZPJFAYF/yNv
	UkU8LJmZbyYm0+yQwLN4DxxAbLoW9p+ejM8g5X6H9W2LNiqFVbnUNpAx1JSgKfgxfAvOkv2bRhBZT
	YfigxWs2JyTGri3zlnBI9lx3yaRxu5EJvvOKIoltz1/qw8UnuO/lKzJHEJU0O/X7UDq1nS1LSDZOt
	tQFH4FbN69geqmPESLc6LFkc+3nCDOXNTL4QNoliznlYrCMo8qdil8w5ZNPM1jtbqhX3VRpj9VN7U
	oSWiMo+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYb28-0002At-Up; Fri, 30 Oct 2020 20:30:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYb22-00029E-Jb
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 20:29:56 +0000
Subject: Re: [GIT PULL] asm-generic: bugfix for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604089793;
 bh=Jy8kjdkuXflD0v68wbWxJZm1LR3w/6MVT94H43JwDKo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=eZIulvIcaX0ZWVlAwGxxUfoN+aa0lamvXtQN4xGNuCqGhBPOKVzhKYJ/QQdsPyIpx
 uUfUGN3fMjsjtwDq3Llnwqxyj3K21Whv1PlhPbSzWHPXtmS+jQ9R3Onhqy+nmJYZrV
 IRVwp0q6Zhidx1AjMfiLT5rHFUa6RGQkevUGJ6yk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a37eA8s68pkHcmR_wtvPaDBouqRF7S2T+t3=YUh9HuCOg@mail.gmail.com>
References: <CAK8P3a37eA8s68pkHcmR_wtvPaDBouqRF7S2T+t3=YUh9HuCOg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a37eA8s68pkHcmR_wtvPaDBouqRF7S2T+t3=YUh9HuCOg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
 tags/asm-generic-fixes-5.10
X-PR-Tracked-Commit-Id: 0bcd0a2be8c9ef39d84d167ff85359a49f7be175
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11ad2a73de10bbebb71199f29abdfc1c2e70d231
Message-Id: <160408979308.26569.13334300238219377572.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2020 20:29:53 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_162954_735522_5E716381 
X-CRM114-Status: UNSURE (   4.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 30 Oct 2020 17:29:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/asm-generic-fixes-5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11ad2a73de10bbebb71199f29abdfc1c2e70d231

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
