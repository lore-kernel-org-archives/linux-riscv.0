Return-Path: <SRS0=H4VQ=TQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6991FC04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 18:45:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4588120833
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 18:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOS6ZKPA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NW/zXGx5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4588120833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bcj9jofngvvfUMLBVn3UXdcxM0BDZnJ2UmKPbxYcpAo=; b=OOS6ZKPA6x4Q0A
	HED/C9gwqIE/eN0igiXOGZL1ShnUD4u4kgVKaWDc81GspmBrZofZdgPNqwOAiChvN0SnL7PNBkbDu
	u03jHa+Cuns3loPjuRLtmTQMNM9HQLUadExMdhZ5IsmmEzziPdk4rpbCR6G/N1VBlcCMQfiRX/CTu
	DdBdpkCsDZCeHLddq1SL4GAZEaJreslWWBHuy9lLi93x4xpwpUztExU7aXhHUaT3Ic7uhw9u0KLgG
	XlhIPLdF8CX91zyMfPjtRAPoNcC2C5AJkGePhorDFNyGab5pTB5VkcY7UqB3Xryi7deAlTZjpvNuv
	mJI3+2cXkyhVIS7dURRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRLNb-0003iB-HH; Thu, 16 May 2019 18:45:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRLNY-0003hB-9t
 for linux-riscv@lists.infradead.org; Thu, 16 May 2019 18:45:21 +0000
Subject: Re: [GIT PULL] asm-generic: kill <asm/segment.h> and improve nommu
 generic uaccess helpers
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558032319;
 bh=SgtY/JlSUlVVPncUe4OJ6/DSHqGDEWfDNv/bzTAKQzs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=NW/zXGx5s+CfJAXbSUXvzCViBb4G4ivXR9fkrYDmPDUNEdOgHLnvBmlHZrXAWMxwE
 /cHK5bfj3UbCbG5ooYhHzAx1BmjIUv95L+VPLSGz0estvjRROtUUukzgiRwMHstmuo
 qJ2ETKjL6j+eS2gR040W5UT+sjIb5mpn6YrnCAoE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2+RHAReOZdo8nEvqDeC1EPj83L2Ug4JuVRiUh943AuNw@mail.gmail.com>
References: <CAK8P3a2+RHAReOZdo8nEvqDeC1EPj83L2Ug4JuVRiUh943AuNw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2+RHAReOZdo8nEvqDeC1EPj83L2Ug4JuVRiUh943AuNw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
 tags/asm-generic-nommu
X-PR-Tracked-Commit-Id: 6edd1dbace0e8529ed167e8a5f9da63c0cc763cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27ebbf9d5bc0ab0a8ca875119e0ce4cd267fa2fc
Message-Id: <155803231962.24051.5619683992341077407.pr-tracker-bot@kernel.org>
Date: Thu, 16 May 2019 18:45:19 +0000
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_114520_363210_5C02C0C9 
X-CRM114-Status: UNSURE (   1.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 16 May 2019 14:09:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/asm-generic-nommu

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27ebbf9d5bc0ab0a8ca875119e0ce4cd267fa2fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
