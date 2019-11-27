Return-Path: <SRS0=D0/E=ZT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E3EC43215
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2019 20:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF5520661
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2019 20:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nKo/Gj3l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFufiaMa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF5520661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYQVI8rzBEpWw5Vbtd760u2kVJDbKk7ImM8ufPEXJC4=; b=nKo/Gj3lig3WPY
	JqI8f6hEhcel8rJnzm+oQdVU551il6sxoXgUOjzgppZIP5+tXgSP21yfOqxS5g2WUBG+D7p2SLG4b
	45G6eunnJFcCm4H2B6PGWOwgtrBdPaS6T4lolbW8zsCkbQKHsm1FItd+5nArSvNdQTR3RyCkqB3Oq
	rZOgboYIu54XDQTCOCR0njf5YtCWVBVlmU+ysKoqWAu+qHFhUcNJhOjccaUD7vG0i5B1hZbgNSfKW
	0EM820P8Wen/Zx88tvFQhEHesAFbUnNmMb+l64zg4DvX4xeMaF5uY38XRTlHFgk8fPaC+xJTzMqKu
	+ks4vpmCfJ0qXKQBYmFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ia3U4-0008Id-Ma; Wed, 27 Nov 2019 20:00:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ia3U1-0008F6-AK
 for linux-riscv@lists.infradead.org; Wed, 27 Nov 2019 20:00:18 +0000
Subject: Re: [GIT PULL] First set of RISC-V updates for v5.5-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574884816;
 bh=S03p4uHH+3stFzte3DVgsrqEvGsRCqtTD/GxeT3+Yi8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=vFufiaMaD2jpHePhT5SvHilhHPalAVbVZQ/wiEzePxxd2w5nnvYwXP/f4y7hXwcRL
 4jk+MkY5QJVH9g9Oeeg0et4H8HkYw5ZsUfE5a0AKegU3fduNY82FVjfuWhpTcVe2h0
 EOuBFrPHgNgaNIdDWroCXPp1D4fpbIlb8TMeZ6SM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1911261311520.23039@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1911261311520.23039@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1911261311520.23039@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.5-rc1
X-PR-Tracked-Commit-Id: 5ba9aa56e6d3e8fddb954c2f818d1ce0525235bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6a0e20cd8cddd70ae5c1211ebe102d738ff2069b
Message-Id: <157488481647.30408.5646332357749422178.pr-tracker-bot@kernel.org>
Date: Wed, 27 Nov 2019 20:00:16 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_120017_430293_186B454D 
X-CRM114-Status: UNSURE (   1.03  )
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

The pull request you sent on Tue, 26 Nov 2019 13:13:24 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.5-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6a0e20cd8cddd70ae5c1211ebe102d738ff2069b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
