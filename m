Return-Path: <SRS0=hphS=H6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF8AC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Feb 2021 20:14:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C11CD64EC6
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Feb 2021 20:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C11CD64EC6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaLwbDr8HyU38MHdKKdUiUpKHcF28xYVFoFgBlGtWmU=; b=PqZEcWP6rR+oJzbPFMe+NB1Z3V
	6VljKBv/acups22qbXPaR29n+YuyJpIM9nFrxEUVsuOA10mhe62UkyTWyP7wa4It4FFmls/kQtqnz
	DS9lktED+FaYdawhzsSbxvD2YbReNpXDM/iq+/GbsCGbrmNdVYUWQRjHilP0c5PKqmtFq3fT69wck
	ejC8kh1EUJsoHHMnf/D9bp3UIHTa1EIFIuHFi933berPf84UINifgJ0GfKvNB6+ez3q5F9Cc9eqOz
	onHtEdZXcRVxBTJuPpXFVrXOMBwFSHafDB7j/CQvKtYKBeKvZgZCyzWJEO0jkilxq6PSg55te6Xwg
	8BxSo0MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGSSB-0000Or-Ng; Sun, 28 Feb 2021 20:14:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGSS8-0000Oa-DC
 for linux-riscv@lists.infradead.org; Sun, 28 Feb 2021 20:14:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 716EA64E83;
 Sun, 28 Feb 2021 20:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614543246;
 bh=0Pl9rfApdTbzy47R2qOHGTpwbQ8m6Wv3tQpN2O2dDYc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ggDg3c9ftZ+lwvELtMluy8dQQxddcRLfvXEyPZ71ZbCJFUV9RAYZXZqW45gd6/SjG
 CacrmkPnMSecmypPCzEFslOKdO1kJu3wa+dz0rjPOT6EOZzpGNpt6WpBH78Fp9X4l6
 rGa/OB1z3SRi9V1sVfofvIovG4oF58fpbNvNqBt9C2Pl35jYX+Wd+8ToH+h24GhKVm
 Owmu3dOGUcfZ8ykjeajQGibyt0ZrYXF46nqA03SE/1tsaz7ddwK2em9+hzs547j/60
 gg+zbxWmlE8J0j/D5so+/VjYte+Fl0HLqMQaJvOczvZhQmT9YfQPkByVkKigztcu/F
 DQpGXMjdXC9TA==
Subject: Re: [GIT PULL] RISC-V Patches for the 5.12 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-bd8c36a3-301b-4412-b3cd-a6eebd336f6c@palmerdabbelt-glaptop>
References: <mhng-bd8c36a3-301b-4412-b3cd-a6eebd336f6c@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-bd8c36a3-301b-4412-b3cd-a6eebd336f6c@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.12-mw1
X-PR-Tracked-Commit-Id: dd2d082b57602156e0c587ddb5ba04d0d624a6df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d19ea5e99731f5346b047003bbe65117a86d12d
Message-Id: <161454324644.2182.13358051381920056871.pr-tracker-bot@kernel.org>
Date: Sun, 28 Feb 2021 20:14:06 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_151408_524009_BC90328C 
X-CRM114-Status: UNSURE (   3.47  )
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
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 27 Feb 2021 12:28:39 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d19ea5e99731f5346b047003bbe65117a86d12d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
