Return-Path: <SRS0=Gv1X=VP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DA4C76195
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2019 19:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5182173B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2019 19:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RGAT0TtY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zIQiw1cM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C5182173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFXwPjjGeWGzjwEXHYXng5PTNskWWO4wepIu2ZPOCzo=; b=RGAT0TtYvILoEl
	x/WLxL6B4juWdfkR3b1+KtV2j9aMfOMQfy9V21qGxjK9IjdGL23WVb0qQMZ0o9u5QLqltYtIlrtsD
	kIr+txoA4xS1+H5a1lfj+ZY4IkrR1XBw1BEi0ri2Cb+lS+EDbGA62a95SXUnyuzIyjmYb2dd2sKGc
	/T+0a8pHYidabAiP2jti3LZ+HbsEIYDuqzi2YLgZlemwxTsDHSLQshoUNqehghtqK690Y/CB1m2Gv
	T/sHDqPcdBFYZ+VyaCHqFOVvnNZ7ACzgzC5VD/h+KnUEUSBj/ovBtbPxNgOokJ+sr2Spm+X73xQSg
	Xlkw+jP9AFrrQKTbdf9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoC6f-0006Y8-Qw; Thu, 18 Jul 2019 19:30:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoC6b-0006WX-DF
 for linux-riscv@lists.infradead.org; Thu, 18 Jul 2019 19:30:19 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563478216;
 bh=D1f/Tc3RXavpmYOt0PHRUeAsG9ee1Ov4o3Y53yPM7LI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=zIQiw1cMMRma0E/MYgXBQ4I3aZtkLL2ZxaRcOKzijKBX2U4GSj3cYkoKPRvtR94yU
 9qD64wGChsZmoAwG7NKMO2uz3cijc0qJ7odtdhjRjr1rNgQ19+OnUrioYYvplU7btC
 0C3qKyJVvPnrgmbubFqq6uf+DewsJ+qgykN3lcSc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1907181155050.17807@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1907181155050.17807@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1907181155050.17807@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.3-rc1
X-PR-Tracked-Commit-Id: 2d69fbf3d01a5b71e98137e2406d4087960c512e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0570bc8b7c9b41deba6f61ac218922e7168ad648
Message-Id: <156347821639.4271.16107164962398721436.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jul 2019 19:30:16 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_123018_252743_958E879B 
X-CRM114-Status: UNSURE (   0.89  )
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

The pull request you sent on Thu, 18 Jul 2019 12:07:36 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0570bc8b7c9b41deba6f61ac218922e7168ad648

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
