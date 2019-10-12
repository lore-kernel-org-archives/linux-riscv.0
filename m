Return-Path: <SRS0=8x9S=YF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A752AC4CECE
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Oct 2019 21:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 791F720700
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Oct 2019 21:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHyj0vnM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2a3Ulo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 791F720700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NigrSTg41Obxj7XnfHvJG8v+0/Z4Dsu55stLXug2cI=; b=EHyj0vnMTqxxAs
	3ot8RX87onFZr86pCX+t0P/c+tH9NeHT4IpAmPHuKRlf9lCoKs/mSDaCXxIuUCrqZRDRxnOEfOAAN
	jIU5V/nfDrbWMDShLAXL3zwpevDzh5jJ4l0llf2Nnj/2eo6VSorcKlQ3P/dpQ+izbyh6yx99d1lXr
	ToSPIs58GTQ4SSU7LCINlxSnz/mXXQzv8NVQieYr288G7OifPOvJUUNr0rvByDriN/HGIzV/emnsp
	zbqSJRClM2LN6PoQwdJTWDycxsK8316NZ6EXdShm54sO1FuGQKy29gQ8GJqguOSokTLKEca1MI4gs
	Qfxp1NH6n8kNCidiGSKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJP7S-00021V-E6; Sat, 12 Oct 2019 21:40:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJP7P-0001cu-DW
 for linux-riscv@lists.infradead.org; Sat, 12 Oct 2019 21:40:08 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.4-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570916406;
 bh=7QptRoOJVZZxmkv/4oVL42Kjq5CXAYmwWeqkKj4mNV4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=l2a3Ulo+m6sJiEGWU2qjnEUxoeJTB+Vl0AsHmb0KlKevfApZJmzJHci7l9Vb89//r
 VLgiiCmvZQ9rEKCWPzjrb6Z3VVUwmOy2IuqUA0kzUJI/eKVpRlzSajWdlBqh9DZ2JS
 iNp+BA/6NNFn+Y57wxaYIihKreY4klm7PRbgTpZk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1910121307270.18026@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1910121307270.18026@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1910121307270.18026@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.4-rc3
X-PR-Tracked-Commit-Id: cd9e72b80090a8cd7d84a47a30a06fa92ff277d1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 48acba989ed5d8707500193048d6c4c5945d5f43
Message-Id: <157091640674.3377.12770705217144535996.pr-tracker-bot@kernel.org>
Date: Sat, 12 Oct 2019 21:40:06 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_144007_482144_6B260292 
X-CRM114-Status: UNSURE (   0.78  )
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

The pull request you sent on Sat, 12 Oct 2019 13:10:52 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/48acba989ed5d8707500193048d6c4c5945d5f43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
