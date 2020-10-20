Return-Path: <SRS0=/4kn=D3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0B7C433E7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 01:24:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1306A22277
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2020 01:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="paHrlCWV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzxV2FWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1306A22277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqtKr5VzAp+Sj/iPsGWK5Yi9bZvKnH/XNhbiKLeksME=; b=paHrlCWVF6VQPsrBWDgyLTSA8R
	zSORGjj88H9yUSiid6moHORETwlLG6eEyBxk6r232456ZUjYPRgMGBPL8nWkHrqUrKnLUB/8Kt6qn
	bgUNa5p1h/pyr8h6Ho2GbFqzBFA+FEG0OvrbsYG/cIiW1lVTAsJ/s/NvMSm0i9iPkQmFDmGcW6QQB
	2LC/SUitj7Re1pve9UUJWIdL+wsxdRS5BPQdtTvY8IZfjqhI2ok7FDZSLg/nvKdAsmEBzRgFv9NqI
	MVwVcL/1UWX6Ez72WuGoW+IKUEwEKGDA2Pnm1I55e5L4jS9a7ziv9GreDZYn2J6kkheKzr2ApZssm
	SriRjL5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUgNc-0007ht-Rf; Tue, 20 Oct 2020 01:24:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUgNa-0007hK-Kt
 for linux-riscv@lists.infradead.org; Tue, 20 Oct 2020 01:23:59 +0000
Subject: Re: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603157037;
 bh=8YU5BxjIiCakWZtXMxohss3vO+KoC5NyEtvOpJBfeNs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ZzxV2FWe79YpQe95xCDlAuATpZ/TU/90elY21zmczaQks8Oi3rVjeGEKmH89OlQYG
 ANwSwZA9SK5WQlZqwQTnhzT4zcnM8KI2iCQ7owtNhDeWUjf6UY3m3h67AWKGTibXCY
 Yc7lQVm5lrZR5KdzsnfTVw5Zq6EyeKhZfPW5ROBI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
References: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.10-mw0
X-PR-Tracked-Commit-Id: de22d2107ced3cc5355cc9dbbd85e44183546bd5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 270315b8235e3d10c2e360cff56c2f9e0915a252
Message-Id: <160315703718.30490.7776981538558466127.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2020 01:23:57 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_212358_752462_7ECEB504 
X-CRM114-Status: UNSURE (   3.45  )
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

The pull request you sent on Mon, 19 Oct 2020 12:08:11 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/270315b8235e3d10c2e360cff56c2f9e0915a252

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
