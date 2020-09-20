Return-Path: <SRS0=dJHb=C5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4256C43465
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 18:00:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2631220719
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 18:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oPeHAH77";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpOFY3dR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2631220719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBJWD2YLbcuBKgCXqxvLL/eu88T1NBN9dJppT7J+5j4=; b=oPeHAH77fTcgiagq1bWii8SEUW
	wg3Mxsg2p+MA/oXC6GWpPvZvbDSztu/TYgBfV0edtQLThMNaGUmJjJB62J4Vrvm1+UGgMj2aKfORF
	xQFfvclWLa7DlZqZJzX6zAoY+EFffh/0RgSME7jXK71nXuTyDL+1Qp9WSvh98vxvdPWticFzTUmKN
	wE2aYb0WG21mVOwzbtKOtEaV/1FS4ItJfw7UWUncL6sOHplbW87jpEE+ZUXZqZMZ24TN3LjQurtAF
	0bFAi1ZaIqB52M0j+QPk7UID0VR+07mx9tz06fDXeMsdby0O6O9jHBMg/0gIQBkDoyKSt4VhDT545
	e2L0h7ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK3dL-00006O-8l; Sun, 20 Sep 2020 18:00:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK3dJ-00005g-64
 for linux-riscv@lists.infradead.org; Sun, 20 Sep 2020 18:00:17 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc6 (or shortly after)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600624815;
 bh=zDZdy2/rOnaDLkaUwDrgQ6iWegH8r8eZeBuVbfVBAuo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=RpOFY3dRA1kjtEBFlEyzubKpkWKi1vjwiMbCqj4BohEHju+Fj++kUR029nvp3rsZ2
 BI8xY8fPGFjXnRl9cpjOw460Eps1pc7RqSvvd3uSbDS+Qadt4oMOjTEu15+w7aWQvY
 aSS7rVGXg44eO3xwekrB11yqLiDazdnFrmEBmpIE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-a3f22c5c-7980-4ed9-b198-da86bf6d1162@palmerdabbelt-glaptop1>
References: <mhng-a3f22c5c-7980-4ed9-b198-da86bf6d1162@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-a3f22c5c-7980-4ed9-b198-da86bf6d1162@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.9-rc6
X-PR-Tracked-Commit-Id: d5be89a8d118a8e8d09cd74a921a808f17fbdd09
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdcf11de8f776152c82d2197b255c2d04603f976
Message-Id: <160062481552.1698.11531166567985103507.pr-tracker-bot@kernel.org>
Date: Sun, 20 Sep 2020 18:00:15 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_140017_288778_CDD35775 
X-CRM114-Status: UNSURE (   3.44  )
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

The pull request you sent on Sun, 20 Sep 2020 10:26:34 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdcf11de8f776152c82d2197b255c2d04603f976

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
