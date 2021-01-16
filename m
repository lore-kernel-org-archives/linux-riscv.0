Return-Path: <SRS0=IOE3=GT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5FBC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 20:02:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73B6238E7
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 20:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73B6238E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yn4qEES+xwAIqgXn9/7XpEIXaSqrLkGwyPCr+tEZBnM=; b=L96YSHtxGYuudeByGke+Onzz4G
	3tsh3flI+HpBHlsktkt/N1r7tZ/h479kqnh2CpcZDYBi879bgMRhoJd0jGXNHdGhckWrTqMkC4vjH
	bLGGPX8DOk4LbhWEoZySBhRwG85gvJuthlXEhA/LpIhoVgAxYMV+bTRL7zbK9eujZEylOSr1v77U1
	SjqKVmNevnsHMST+AiFD+MR4qjBQDXZu6dnVxW9rQuRlIVOXGnkJQTy+rarOwGS8XQV8tIPXrf2vy
	pSpg/2oUpOn0q79Nl6b/QFMT6ZeMMumwsj0aEgxVZcqemZmOFXmwIUZ7m2nh21ssFpNjR8wYIvrQf
	Le4kfMKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0rlw-0001rV-5F; Sat, 16 Jan 2021 20:02:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0rlt-0001rD-DL
 for linux-riscv@lists.infradead.org; Sat, 16 Jan 2021 20:02:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 5A8082078B;
 Sat, 16 Jan 2021 20:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610827324;
 bh=DVvIk3clVWF/bJYVAgfz9QQ1PSOinu69kDhJSJw9DvU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Ut7psZGGjGVmw2oDixYJAODGT+rdQ0gKn+905SOqhNDZUOyU1ZsgGM0MSMFfpEkwD
 +tFIM9YryFXcY+mW5ejOD888PnsO2aLJNpfQRQ//Oa6eegQ0cLmMiV/vqzYnj4qDW8
 CcsDHTXXsbJOlbh13ZYuQfiW/8OQIZWWex0fx3W2zDR3Xd/b1+PM97WHTvJdqM93wT
 uloadiL95qJqacEIT/La/2zMwfaLA2wU3fl52Clye7NDjekSP41qtK3r4ksgUyXPWb
 YKKUtcurCMuXoDozfTAV4Zlobuo9DBgJCy8JHE0kukSXVBcfLaJaqmgvDVQnqtnI84
 udThQ3L2yp9xQ==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-6a7bf03f-5e44-4fa0-a205-0fba77454f24@palmerdabbelt-glaptop>
References: <mhng-6a7bf03f-5e44-4fa0-a205-0fba77454f24@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-6a7bf03f-5e44-4fa0-a205-0fba77454f24@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.11-rc4
X-PR-Tracked-Commit-Id: e557793799c5a8406afb08aa170509619f7eac36
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: acda701bf1e8233f982164c8ddbedc055427212d
Message-Id: <161082732420.9271.13330129912342110700.pr-tracker-bot@kernel.org>
Date: Sat, 16 Jan 2021 20:02:04 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_150205_614927_E2EE3CCF 
X-CRM114-Status: UNSURE (   2.98  )
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

The pull request you sent on Sat, 16 Jan 2021 09:54:51 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/acda701bf1e8233f982164c8ddbedc055427212d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
