Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5122CC31E5C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 23:35:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28EC2208C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 23:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dMVgyFdF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZRNMiqQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28EC2208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBEG0Y5iYxxrQcXkP7/iCnPVryRI2igrvM7L3lK1jAg=; b=dMVgyFdFArPr32
	9PbSC6sSJg/EHpu7AXysPYLC+UYATCMD93VnXjmp/+hBT+trMnhR8BuyXKmwp9G3OYIiBJwGiUw4h
	BodQx3oXJQk/1NcNlHLuy4lX0FMEDAcdEqkjLuD81uw7BK0iZU3vupi3b7b4pyW3L6volo3ltfEk9
	exSkrXBcB0JzFk2h8BqTs4Eui+sikcXHlbXEsB+LfnnKf96EMMF9lrCsQnLc/0GdZo2Qj4G3zGGaQ
	i7XWA3+Pco7mQWXI6Lj+VsXKwiABbBnHAF2nzZpzDAhexgCiNHc6lYm3/VOIzgTYxs0yTqdbldkor
	dSFxLlw6+58wXWeSkd7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd19Y-0003gw-Mz; Mon, 17 Jun 2019 23:35:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd19W-0003Dq-1k
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 23:35:07 +0000
Subject: Re: [GIT PULL] RISC-V patches for v5.2-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560814505;
 bh=jrDbJSj1l+QKbJqYxevvzNKpDjm3U21oYvoFhSEewz4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=RZRNMiqQkw64ZR5oA69fW9xkstwUQI3BaEBF8Yn0gMUm5ScpJpEwHMq9KYty5hACk
 Lg9btKcvDyG4VgjocpyhPNMKLxMwm/NkFaKWqG/jXmA+4hvqKZNUVrVV3lTfCYo2jZ
 Wqw4muTyq/N9abG4zU3rF+9/aXKUtZLD9ivFDUDY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1906170846340.30717@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1906170846340.30717@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1906170846340.30717@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-v5.2/fixes-rc6
X-PR-Tracked-Commit-Id: 259931fd3b96e4386b361b7f80c1d89b266234c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb7c825bf74755a9ea975b7a463c6d13ffa7f447
Message-Id: <156081450530.13377.16512075624141973247.pr-tracker-bot@kernel.org>
Date: Mon, 17 Jun 2019 23:35:05 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_163506_122390_FC039318 
X-CRM114-Status: UNSURE (   1.00  )
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
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 17 Jun 2019 08:54:30 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-v5.2/fixes-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb7c825bf74755a9ea975b7a463c6d13ffa7f447

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
