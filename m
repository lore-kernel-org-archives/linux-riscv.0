Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EF9C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:00:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B3C20707
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lHSx4fOS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGbMP8fD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B3C20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg1rY9xyg9zuNnZn+jqEZ6+//5tvBOZ3cKQCDMmqhq0=; b=lHSx4fOSJvxnaZDiyv3gMlrKA7
	YCsoF0MLh3mEo1gKXMCI4MnhAYzBSvKXNKjAVxQNwIsg1HEOLTE0avmNSVs6Dk9N5E50kexNgAwhU
	Ims0HxHoJPdnSMI5x4hgg0GfTCZlRIcq/Wig5VmhK7jZOwmuOf3qDpdDnU4qPoLdVDKzEo4n0wXxi
	q4Ke6yDo1WE5KhWRdlc2xCaciBr2+uhk4fVAhpxmM5O8AVHhNDAoyVEqtWrxB+jDyX8XZGQ9fJzBY
	wlm79UW89n1dOLbBTbUvIxS4RqrgvgUdJU/q0Usry/kYoc19ngNs+7FbSzrabC0Nr+jmIb9UH+N1D
	/Mqy0uWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpDFa-0004aE-8N; Sat, 27 Jun 2020 16:00:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpDFW-0004ZG-Dc
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 16:00:15 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.8-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593273613;
 bh=yeaCwpqSECTCFxMaYCulEAIX38enPKz/1j2BOtgNk0s=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=eGbMP8fD/bOGh1n1UCVeFcMF1izSBdul1WEncVgCNAsAvgdPfIj9HUl+waYP5iTk2
 rF8TSfzXFImlRpkHNIMYGufY8xdAHVZYKVdQyoLY2Jatx/I/G0FFwm9Yp3Gv5UDphj
 qt5lpjPElVMkLmQDHxr6dXtZLuEr40MFtgVu0XrE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f93a0d3b-0f13-4426-8f7a-77c153f1098b@palmerdabbelt-glaptop1>
References: <mhng-f93a0d3b-0f13-4426-8f7a-77c153f1098b@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-f93a0d3b-0f13-4426-8f7a-77c153f1098b@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.8-rc3
X-PR-Tracked-Commit-Id: e05d57dcb8c71492268ff46ba9bfe9a9cfb1f95d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b6ab1012cbcabf31db9c3a0c329d07dbcff4fd7
Message-Id: <159327361326.7015.2026111277110574291.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jun 2020 16:00:13 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
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

The pull request you sent on Fri, 26 Jun 2020 10:40:28 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b6ab1012cbcabf31db9c3a0c329d07dbcff4fd7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
