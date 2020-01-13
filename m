Return-Path: <SRS0=EMq7=3C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18797C33CA9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2020 00:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE5D2187F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2020 00:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UzmYk8N1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wVxzjZ8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE5D2187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lMyZFuaJp2ulKkvtSsOeS4EqqP7MZ1fnC84uaC6WeIU=; b=UzmYk8N14qs39Qz9EJKtN/0WY
	+qZOk6Cy3AP3r7HQNnOfK4GLV3y5VHOTEROgfgA0CP6nNebucEGcwcuwJN56GOXMT6Y4q+skXv/Nc
	B+vh8JG88WZQhAYWPJwsYqh2PIzEHQXLdomyiq8dhjsbXFRq6DonaBBlGpVv5Yof/2JHhpsiML1Pl
	HAUJXyJYvM5zhdwD9BCo6QMmAXSK9tYQwB7gg4EL2EqIAUC9Cglzrg9Yfei4CA6ylRQjsNTPbJugp
	Cse4Gbynvdf2SHFFeF8ReUPSs+obGvCfVtgrVgWm2OzapOcmEr0boMzW2SrkK3IYy9edRsi4nBh2s
	lKj1pWqag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqo0Z-00075O-2m; Mon, 13 Jan 2020 00:55:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqo0W-0006Tj-4f
 for linux-riscv@lists.infradead.org; Mon, 13 Jan 2020 00:55:05 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.5-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578876902;
 bh=HMEpIO3iAVyKlv5kImX4HW06TyAK7WVzFHOTgbxj+NE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=wVxzjZ8be2N/AbY0/Y3DZ6sqymqKFdp/Mh2qa0eAWZaYTVPJho6Z68HmrmMz6kPrp
 QDmwABIXcbpXvAA7fSfbuFo1mMC2FPG6nATHWOJfDeNwk9VnGDy8KXHiFEwX70dCcZ
 oj+xUlbWGRTT7dcAbqZxyb4na8G5C06e+5TnQ+SQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.2001121053560.205587@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.2001121053560.205587@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.2001121053560.205587@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.5-rc6
X-PR-Tracked-Commit-Id: dc6fcba72f0435b7884f2e92fd634bb9f78a2c60
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 373adb7313b233d64e21f3f6329fb41a5e6ae180
Message-Id: <157887690279.24225.10430037868816805913.pr-tracker-bot@kernel.org>
Date: Mon, 13 Jan 2020 00:55:02 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_165504_213574_0745E83F 
X-CRM114-Status: UNSURE (   0.77  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 12 Jan 2020 10:55:14 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.5-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/373adb7313b233d64e21f3f6329fb41a5e6ae180

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

