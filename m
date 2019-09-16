Return-Path: <SRS0=O4lQ=XL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96618C49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 23:05:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CBE214D9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 23:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u5BKr2iX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dX2xokf8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CBE214D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIGa1LRm5DHf8adGgv2hFZYAzLEbqVjczGu1AFsLcdc=; b=u5BKr2iXUAsEXY
	xnPnapBqP/6VoKJlv9UUQbeLaMOGSJOQ0LpYfsxGDcrZ6nho5Q+eC3jnjBb9bQ4Of7y/uNo/8c6q1
	GZZQvKUHISzU0/OSInfcHMcCaYfMN8nyfPMlMcUHgTUh8LaXwYL/SjDVXv0rtdBzv4eW5dpZEmBTt
	oTIiKLn/wN7aMxaJJcyvRyl95t8wj79hF6CwiEzQn4muHrutkP01uRnS4SXf4SmrE0oNv6NBUZi+7
	2D4/RIKrScJS8jDYAnf0F9dgcYj3Vmau1dhKWd09WKHVesG9XJ2rFvKDzMlLnCD07gu/2+w6/1H/0
	XER7epYp1nJ7Kp1mkfbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iA03w-0001aK-Ud; Mon, 16 Sep 2019 23:05:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA03Z-0001G3-Uc
 for linux-riscv@lists.infradead.org; Mon, 16 Sep 2019 23:05:19 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.4-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568675117;
 bh=EYR2fYa2Pxx3FqcnzK82r9ahc0fLXxJECj8/NIbLbAQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=dX2xokf8ic/lXlfIshVdLl9QyXGeqb4eumKC1pbqPcjhL/gnAFHdkD842PRodoI9i
 utToS69Crg33a+17Ta6Qv6XuBU8oZHnKXacerTuN7saNleyJL5k/wECci97zMTlwvE
 /glNl5s7JeeeNB3Jq7cWQW17UbPJeJRdzwjl0nKA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1909160819190.11980@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1909160819190.11980@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1909160819190.11980@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.4-rc1
X-PR-Tracked-Commit-Id: 9ce06497c2722a0f9109e4cc3ce35b7a69617886
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 58d4fafd0b4c36838077a5d7b17df537b7226f1c
Message-Id: <156867511761.30760.331827168346797172.pr-tracker-bot@kernel.org>
Date: Mon, 16 Sep 2019 23:05:17 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_160518_010065_974C6A33 
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

The pull request you sent on Mon, 16 Sep 2019 08:20:33 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/58d4fafd0b4c36838077a5d7b17df537b7226f1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
