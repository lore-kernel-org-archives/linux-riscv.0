Return-Path: <SRS0=SDqG=WG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5389C32756
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2019 23:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A9F208C3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2019 23:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XY3e0R+N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="prTOolgF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87A9F208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9nEdHGl++OMyRYxoMKAKgYSElEF4AMoNJzswavowrs=; b=XY3e0R+NUgTQzh
	1EPKr5oGpcLDAhpIuClbLHX6xyKh1ReHU/OyjzkDJu9kQopOjiWVMBboMJbiy1vdU6epcqcUSpN+O
	80KueJeDWcpKVTXtPbl2NuYZSAD42fwFjOgztTFMFNxfREiGnOD8AVVLbmb/81aD/NGCe0bjYq0wT
	u/UeVcB8OmJN0XI+aKGpE5QeMBUFe7J6ysCk1JJygLgd6yBA1QOECdg6YmBb3ykEq1pYQ0wgd7dYN
	PYHSewYqEeP5UvIf9GO1PEyu49pedWYGkPLBCAHkJzaBqrhaSwfyW9zRTU63d7QBWXDnyTidPHFz6
	dHt4R3GMXKqsls/jlS9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hway3-0000XN-1d; Sat, 10 Aug 2019 23:40:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hway0-0000Qi-Kq
 for linux-riscv@lists.infradead.org; Sat, 10 Aug 2019 23:40:10 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.3-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565480407;
 bh=vUFMdRRpUdRJSchw/Wj85gfdOIYjjm83fQJbpux6Z2Y=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=prTOolgF/V83Eal61PASI8MfgrSAuLD0G5QIK+CJujrAZxyjbUgbcHD5yYBP0CVlE
 kUNUFbYaS//ba3NEoRlVNtuPzxowGYFbyVHnN911zWdCJF4ODstjGpUXigNPdHLTmf
 43JKtNaLKxB7hL6R9X73W5gM/XVFwZdIW11kgZ7g=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1908101451050.22177@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1908101451050.22177@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1908101451050.22177@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.3-rc4
X-PR-Tracked-Commit-Id: b390e0bfd2996f1215231395f4e25a4c011eeaf9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 296d05cb0d3c9f4648e31abb8ce404ac6915d66c
Message-Id: <156548040730.7293.15246531905901951311.pr-tracker-bot@kernel.org>
Date: Sat, 10 Aug 2019 23:40:07 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190810_164008_710794_7A1FD4FE 
X-CRM114-Status: UNSURE (   1.01  )
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

The pull request you sent on Sat, 10 Aug 2019 14:51:56 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/296d05cb0d3c9f4648e31abb8ce404ac6915d66c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
