Return-Path: <SRS0=mxPQ=YU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDBCCA9EAF
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2019 11:30:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30F221D7F
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2019 11:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZNUbnYI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9rIU8Kw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E30F221D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OCsx2dABKvCVvZ5g/vG4yRZfWTuceK5ws5SFxjco8w=; b=dZNUbnYI37/YnV
	7mFNdtN2SBiNnckG6unjMmEK0Y4W3Feak+P7ZdGNvtcy6NsGTWpxTkboLdIQ6hwjjVe81DuAxTR2z
	LRSAPMvPdbBCKyBUKyEjgaJGI2BzmVQlmVzkCWsWGFQNL4V5Y59xp5L7Wozl45LAblEe+wN2X8Vh9
	DrTjc9akNqpqgjn+q0P4n7OWlNtPqJO1/csH9Wd3Ww6ng6K0EPDpKNZNPqy5+Xp4jmHdmEQZh954H
	rUaUD35WckKrQW5wCyLULdvF0oNbEtgpc6PTm+CWbV8ZNLcJD1AYpgP5j2ZO+eMQTcjw8Ekupowd3
	AxP/rBa+KieWFEFWngnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOgkQ-0007n4-4C; Sun, 27 Oct 2019 11:30:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOgkK-0006ed-7B
 for linux-riscv@lists.infradead.org; Sun, 27 Oct 2019 11:30:09 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.4-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572175804;
 bh=C7auwD1WXWbMnFdBuCDr/ykryLHxN64hBFI3GfcQY7E=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=E9rIU8KwjAmwtRcMrwUc9kHyeOyKFUwkAoctz8MOAdDkw2EAYlRc5vkH1LXlzyq4a
 2fcr0n1r9ueu9RJcxDVKujrVgJOc5uYTaHWpjWbLXkCFiUXgqW9Yj4ZwACwwobr7vh
 vCfodc7/t3c5rO6OWqy4p8dUcvwQg27wBxwRDCC0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1910261701250.12828@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1910261701250.12828@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1910261701250.12828@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.4-rc5-b
X-PR-Tracked-Commit-Id: e8f44c50dfe75315d1ff6efc837d62cbe7368c9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6995a6a5a538dae047ff16ec267394e5258e84b7
Message-Id: <157217580489.15608.4260623730121864685.pr-tracker-bot@kernel.org>
Date: Sun, 27 Oct 2019 11:30:04 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_043008_315308_0908595B 
X-CRM114-Status: UNSURE (   0.66  )
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

The pull request you sent on Sat, 26 Oct 2019 17:02:43 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc5-b

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6995a6a5a538dae047ff16ec267394e5258e84b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
