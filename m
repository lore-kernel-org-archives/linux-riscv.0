Return-Path: <SRS0=r3k3=7Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4EDC433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2020 22:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5497E206D7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2020 22:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RyEL8RCW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLzXKluw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5497E206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ifZzHyfqsJFPzsgrqMNp6bR3VvFD3xZTPbwtjYx6E08=; b=RyEL8RCWE17MBJgrULifHCTjP
	6llrEnkTq66GZtKEF/DN6/qqftycY+Mg1ypaXS4VO5fLQ2eZP9pHweuIH4Lm/rO9cdKaXNz40IuXr
	9SIgbUNDoGb75ruMMo16ufOUoazS3+VhMg4xpKmZUdkXknNOWnUloD+J/MQ+9PGD1GT7vCmd3fHlS
	1psIpYkHfkgLL8qvw8PFFIkY0hjMxIx/vVDOh245U5o7sbk3D5igCBkKQMI+B1lhbn4jeDShgEwJG
	w+Rv2j6a2i7fMBO0xKwqDFnjMGe19lyZPDo89faA1EOEIDIaYMWPN+kqOcM73Fz4HFxmtdSxruXtM
	wXvPBmEaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjVFQ-0004hJ-Bo; Thu, 11 Jun 2020 22:00:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjVFJ-0004bI-0l
 for linux-riscv@lists.infradead.org; Thu, 11 Jun 2020 22:00:26 +0000
Subject: Re: [GIT PULL] RISC-V Patches for the 5.8 Merge Window, Part 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591912824;
 bh=gZ46K7plbt+eE/wq0aG7U6KOtRrOLE73xRAiFeDQQtA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=lLzXKluwUtogg+QEcBdE+bgWFeCqe9frdD0SIJGVc0J5hYEuIMovdCzdrJR+XMEEa
 ucqtPnx1o2FcsXzSsh77kugAZhuv66g4JWi4zEPGA1lQ5QQO1q4n+iWoQqBsriZn+5
 BQ9JVJXc2FygUJJ2+PI09Uwiq23SM/AMYNWhBTQ8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-70ded5ff-c09c-4703-837e-7ab2d9eea85c@palmerdabbelt-glaptop1>
References: <mhng-70ded5ff-c09c-4703-837e-7ab2d9eea85c@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-70ded5ff-c09c-4703-837e-7ab2d9eea85c@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.8-mw1
X-PR-Tracked-Commit-Id: 01f76386b0ac0b1c1094456c8f43ea6085fc49d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd16ed33c3c618930ccda7049dcea05ee707a9c0
Message-Id: <159191282473.15411.16688151928262454215.pr-tracker-bot@kernel.org>
Date: Thu, 11 Jun 2020 22:00:24 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_150025_075976_C95EB07E 
X-CRM114-Status: UNSURE (   0.80  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 11 Jun 2020 10:53:59 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd16ed33c3c618930ccda7049dcea05ee707a9c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

