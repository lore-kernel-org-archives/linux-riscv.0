Return-Path: <SRS0=CPyr=A5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F35BC433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 18:15:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8772064C
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 18:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1S5mVN4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZslVoSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8772064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8Lxq1VeWe/vx+0B1w/M5dL4kOSd9CNlvH/sdJ9yg8U=; b=l1S5mVN4TUTrYHungiVAYY93F+
	VRMfEglugelveDKVoWG/u9ue8XTtOQ2V202P7iSI5LEuH/ufCBKaE4ZSWtTWi4hqlbXunn8CK4WgI
	mJvxqC8ipOXLwetZ+4/CZXa9utaZt3t5EiA+CuEsooVWff/NQ/T+4VATy9EsG4kVoLvipIYByH3AP
	NDYRhDzb39aQExFGmZQWsSEJ5CYBOtXMeJUwh1klKiuG5UTux00AEWdx45rBLVxAZGn9tdwuAX57b
	17Xeq9UEDxRhp5uR2CsgPizcbu1Kql0lht15ZTZzcbB9T7/QjKPtXw8dhQ2OlFo5tw4mWVoz/nI9Q
	F+fLW3SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwrMc-0008J0-Cz; Sat, 18 Jul 2020 18:15:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwrMZ-0008I5-TE
 for linux-riscv@lists.infradead.org; Sat, 18 Jul 2020 18:15:08 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.8-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595096105;
 bh=qJ9DGh2MbDH+9LxJfZz7qg0S194bmszwbnjpsxmZ308=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=qZslVoSV29tZ41c+/ZHLQnBK0FLKKDAp4GdQ1QLgnJf3aqxVFI024pPtZy14fc2Lo
 KX6EqtZi3a4fVwv8imFfPexth4p2rJnnc+glB2bnmIXAQJjj6MyJhf+6zIr8hKpuCv
 FtnHflDVQ30SZQZouwq5DCHM+xPCKR+l9EQT9tKs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-8419056a-6b67-4a07-b5a2-6ca837bb9b9d@palmerdabbelt-glaptop1>
References: <mhng-8419056a-6b67-4a07-b5a2-6ca837bb9b9d@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-8419056a-6b67-4a07-b5a2-6ca837bb9b9d@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.8-rc6
X-PR-Tracked-Commit-Id: 38b7c2a3ffb1fce8358ddc6006cfe5c038ff9963
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6cf7ccba29dcf39ab27630c383a3844078a6d5cd
Message-Id: <159509610526.11665.3440471012487224189.pr-tracker-bot@kernel.org>
Date: Sat, 18 Jul 2020 18:15:05 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_141508_015787_8D7CEF77 
X-CRM114-Status: UNSURE (   1.27  )
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

The pull request you sent on Sat, 18 Jul 2020 10:35:48 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6cf7ccba29dcf39ab27630c383a3844078a6d5cd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
