Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A4C43458
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2026 02:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCu2Eoodhfviz9pM4s/Xo3Ouu3IXxug7Apo5gPSu9vM=; b=W1CeT2jiR6Q2zX
	f8jM39Vw6rUlhyIkh7mj2wWATo8BMEr/Z6uoYTkAgaTrV9EeW5GAD6uaZK3Xo+tgaCfKWLhP8RrwG
	tRCJOdItCvHTlGVNkpXJ1/vGEU+VIy83q64Smr+2mVfw46TqwBhFwVzJCd9Foq96y+Qrp3Ae0amZF
	HGZZWJ2OovdMEXTmBO7gxmeZpjyNY2NjQA3/7AslcAI/jpQ9E0oBQOJCXOz+v+qmEgGkdAdrFx7mm
	VEai58B7AP0SfHlipLY6J8wLdb6+5fFhBhQ9XQkGgItGBvjz5xlxJ3sSq8LnDUHBtbReQG1W4Eqrh
	odeEUnOB82NuF8CK8YZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfpiG-000000085he-0OHD;
	Sat, 04 Jul 2026 02:02:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfpiF-000000085hT-1bfl
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jul 2026 02:02:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB526402E8;
	Sat,  4 Jul 2026 02:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED151F000E9;
	Sat,  4 Jul 2026 02:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783130553;
	bh=FiFD+8IMwheGtPRC/Twtw5q7GRuybepWVsH85w1NW4U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AmDzGtc8OEOEk3jAawBoP/w0BWeW1B8MZPoL6Qfggs8QAftXTBY8l64NzwnAoLXv1
	 PrZSWp4WpHsv/02iE+SeGf8dpt40gnknp9iyF5+vS+1GR/KOItamPern20zx9Ejf9c
	 408bohEapuWA6DcvsZeQbxF/x7cxetmIrN6gNE+IeFAff0zXKuUxaeFDO3ihotPjsM
	 1Qsy9ZFvxJnPvBrQH2epwnlQGFkiLo+xtrvAiL4bRKB4uAPigaGntUL2Xeq9GB928j
	 nbMpt5rwThH29XC/bhitEnUUDZj0cRi07z8Dgr1u8Md5T0hSnC2TqVKJOgnpLMh9rg
	 ekKG5Lq6Q2BwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19D2E3939F31;
	Sat,  4 Jul 2026 02:02:17 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.2-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <98c1a609-5ce9-5703-77d4-bdb2d92d7338@kernel.org>
References: <98c1a609-5ce9-5703-77d4-bdb2d92d7338@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <98c1a609-5ce9-5703-77d4-bdb2d92d7338@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc2
X-PR-Tracked-Commit-Id: bc7b086a45521a986a49045907f017e3e46c763e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 590cae7152cab2dd954b8db20522769e1c62deec
Message-Id: <178313053566.3392227.13313533276453141055.pr-tracker-bot@kernel.org>
Date: Sat, 04 Jul 2026 02:02:15 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 3 Jul 2026 12:07:31 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/590cae7152cab2dd954b8db20522769e1c62deec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
