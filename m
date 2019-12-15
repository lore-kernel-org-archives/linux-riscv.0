Return-Path: <SRS0=InA2=2F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59281C2D0CE
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2019 20:50:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 306972467A
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 15 Dec 2019 20:50:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VZbvWatZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpR4cS34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 306972467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CFBJGb3XOrxGl79Jp4W1ukQuB9zS9eZ1F417vE1Z+vs=; b=VZbvWatZwVdLrhFXzl2sHFHO+
	RmjVapXm76Mco6HJLSFozFyeIptzTsnoCYkY+BYcUb9oMBEBo2qHoEVi1O+tDzKa8mpcuTEgcjIBN
	N4KDq3N5t6pW09SlmmsTyyqU69H5RGITpnRGJOgp3Lb5JHJxlDHa7Sy9EozqSY8aVllq6WFWNwP8F
	D2qVkeGzKqMvQO6qC0AHTj/uYALymBsw+jIlCJx8kbEpWvjLUwZ9sovbXPl0FzvRFPmgIkaZ3z9LS
	G5SvgqX3u5zefgj4CgBjiMOLyo6FK6H5+0BBWjpMheNpnwkbKjzxSQMoV4lQpMz5YGjmTJnGMZWeH
	/COiXoOWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igaqH-0004Xt-Au; Sun, 15 Dec 2019 20:50:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igaqE-0004X8-UQ
 for linux-riscv@lists.infradead.org; Sun, 15 Dec 2019 20:50:16 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.5-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576443013;
 bh=OXpOcNiD+2AL9P1jkhC2EdJutGC5Ab/+u4IOFlrYP6M=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=mpR4cS34PkT0VeM83sHkWFb56husVb8L6OPfW2TKKdogUdEW9ScWEqx2/aB0vnqLd
 YAM/sukoruXM9QukPZn03EtS3ZFAaV9rMH8wkDlu9L3APDI6aV1nPn2G41tC636SRT
 DNBBkuNEGaOVwt8V0DqdeiKAO++vincTZkH4vZ+o=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1912151208120.91169@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1912151208120.91169@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1912151208120.91169@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.5-rc2
X-PR-Tracked-Commit-Id: bc3e8f5d42d5cfac3f7ac9b458c2eeb02e8b1cf7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1522d9da40bdfe502c91163e6d769332897201fa
Message-Id: <157644301387.32474.4144085813869838879.pr-tracker-bot@kernel.org>
Date: Sun, 15 Dec 2019 20:50:13 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_125015_004797_41210F1E 
X-CRM114-Status: UNSURE (   0.18  )
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

The pull request you sent on Sun, 15 Dec 2019 12:10:34 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.5-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1522d9da40bdfe502c91163e6d769332897201fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

