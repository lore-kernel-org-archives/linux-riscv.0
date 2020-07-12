Return-Path: <SRS0=qDH1=AX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DDDC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2020 17:40:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652092063A
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2020 17:40:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5Kc6NZp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4mgjY7A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 652092063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wC66c/loXA6/ihSKZcxhnd/Zw6IS/kJxdCvgiP6GKHQ=; b=g5Kc6NZpK6N4jXQen2Cz9KacKN
	JvDIuU5IddWNUX4s7EgBNwDPYcgmmtip2cOJKsXe0Ed31AW9GM+Q7DEvATH9QdQ6R4/W6mxP8QWeY
	tHAqar4VPql7Ka6qzY5DTY2Is3Idz4z45ZEvfKm7voPE3ugo/ubGD5iSbxKtq0/y5U4ui8ETUZjj+
	hU15pAXCpqOEdO0c8Y4d12lwWLDdl+8NADAUV3wLWEpZD3IiWovus2NT7pRBKhQRc9C+j98+5Ce1N
	GiBpI+gwEJR7aac8IFCPrGxSN2HNC5FUd0pfJWYsC6yKqo8ncrvmeApc9qBPcvOPxqUb+opiKRCQn
	ioQ1FU0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jufxO-0001HE-W4; Sun, 12 Jul 2020 17:40:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jufxM-0001Gj-VA
 for linux-riscv@lists.infradead.org; Sun, 12 Jul 2020 17:40:05 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.8-rc5 (ideally)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594575603;
 bh=AtfBEdHa/4GZH8vVuyr0o+4ubDXXRcvdrZUNYTTNC70=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=j4mgjY7Awa2G9onNZVMzHyVoLYQUgQVjBj8cX//OOTyUqUSRCatMTcLSOYOx+mJ1n
 6xK0H0pjLxOehSRwGoZsJ4W+NB+/qNlMfG6cW5QL0yJEcVCDD7poY6O98F3+nK3aSA
 b/RvblXl1+9OCME6bjvr8GQuvs4pJ5KKUfEdkQnU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f8b65a3e-17ea-448d-be82-0d1c42c0bf37@palmerdabbelt-glaptop1>
References: <mhng-f8b65a3e-17ea-448d-be82-0d1c42c0bf37@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-f8b65a3e-17ea-448d-be82-0d1c42c0bf37@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.8-rc5
X-PR-Tracked-Commit-Id: 70ee5731a40b1f07f151e52c3c4ed27d70d4f9fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9901a6bd157719f9f93186868c527c5ba5edf8e5
Message-Id: <159457560337.22698.5375202992687678340.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jul 2020 17:40:03 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_134005_157294_54A4B031 
X-CRM114-Status: UNSURE (   1.75  )
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

The pull request you sent on Sat, 11 Jul 2020 13:24:01 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9901a6bd157719f9f93186868c527c5ba5edf8e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
