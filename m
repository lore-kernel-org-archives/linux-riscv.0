Return-Path: <SRS0=2iVI=VW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D19C76194
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 16:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0BFC22BF5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 16:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H8/pMNCp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0tvnRUa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0BFC22BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsoGtNziGpuad8fMxnVZjzS4y1Q4eyMTa4/KvlKIpb0=; b=H8/pMNCpIVs9ng
	mmB5SGkDJGO/jUB/8WNFAS1jF/vWOHK3evSqjiNa1EbWmzjfXl8kVpxdUzFV4eOm0hZHGj7zjfwo+
	dJla925bar6Evcb+iUySnkRDVUnyQh0nEYtWPOJV1oDdWNOjkaRQzDqmIeVDo6hON6E/zvlKbfXFz
	FKLVvxMELenvDAyeaPPZ0Rn7fzGK14XmhaJKW++lgXRtcwmblGfwJNewvgTtRjwqDPvq5SCADRrho
	Gfq1o6sWn7oKQfln+XLLKxHL6Co9z855J6Yd3Tpvf2kD+6o1mTdhxP4dm/wmN3v3FPTjGuTdncAGK
	euphew3pZyVdf/C8Egmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqgYY-0003Ne-9Z; Thu, 25 Jul 2019 16:25:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqgYS-0003JG-PS
 for linux-riscv@lists.infradead.org; Thu, 25 Jul 2019 16:25:23 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564071919;
 bh=6GZ6RGgSX864lLqxarLspo2pFTIRkvOhJAKWGpZpFJ8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=c0tvnRUa4vAXkj9lqa+27k4aWZo+s8RuWemee8gIBqeL8sgw97rChwCDpleBqZkck
 jYvejNeEJaNxjPUqyXd51kveWCGZ9pIqq78zhTLN+rS//AYhFzjmk7SuoDv0/227vr
 RqEub1bpWd0AkjkCi9d5T13XAXC3IpWk8PzNCLXY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1907241331250.28120@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1907241331250.28120@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1907241331250.28120@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.3-rc2
X-PR-Tracked-Commit-Id: 26091eef3c179f940d2967e9bef6e22c9e1c445f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a51edf751b660f3fc1d0724bc4cb839bdaf5576c
Message-Id: <156407191942.26857.7692173476303162261.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jul 2019 16:25:19 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_092521_357361_3E7855DD 
X-CRM114-Status: UNSURE (   0.90  )
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
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Wed, 24 Jul 2019 13:34:03 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a51edf751b660f3fc1d0724bc4cb839bdaf5576c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
