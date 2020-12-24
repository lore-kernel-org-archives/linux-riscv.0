Return-Path: <SRS0=/9Zu=F4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B0FC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 22:15:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 318B222C9D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 22:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 318B222C9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGTwdQDZ+vRfVxd5z4HpyRh38W41FVAuRTzrrh9FjN8=; b=wSG62jEAFEoIyXt0zx9TdmLjEo
	Q3eE6RYGor/YpHxc6hs6ZZTRd/uU7zfun68D+Q9FkOYAu+OBPqfSGAD46bPye/rB0HoWjbtXexiVN
	LnWB0SH3HGdvYb2S8OWTtDp0rL1KLA+Msqhbb8RM7FUCbML4Y5OdvjebWKOIiqt8zDPf7iUZ4fTem
	Db0zTBDOwGuIPt3XUEbnaLPFu9Hu4mDWzYASgyE95rfVQFCgCY28sCfx3vDRfnUeLVdScVs30PpEZ
	h67M9wAb4Cm5AIK1EUqotWXM7UNvHchrgoScIen9tt1AjXNJWIHC8/FHR7Hqeik+EwbCysM0dW8f/
	VYPTMqIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksYtJ-0008Bj-Co; Thu, 24 Dec 2020 22:15:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksYtG-0008BJ-Rd
 for linux-riscv@lists.infradead.org; Thu, 24 Dec 2020 22:15:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A5DF22AED;
 Thu, 24 Dec 2020 22:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608848121;
 bh=bmrbazNAIQiM2MBU0jn7uXzJEYjY8yaIYolkmDM5W0A=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=muHBwhEW52WM6L7wPtg721TPFJPhbH2N8pdBSKRHVhTYmbnug+z3Au1ceW1M7kDkJ
 pZ6b8Fcs2UZUyWaXtHs+6lOS6VGDlggkZ9BV0WNnWY/4fMIgxB+heMVlHXw36x1gpS
 C12LX7WB7bKpuGpU9IsJRNzWanHcsCqx5agrWTB82hNhEgZpapHHQbr19MgjRJrP2F
 iT76KnClV+OXKXXtGHj8mkn5ObcffE7rpeeMYdc8s0fE5RAym6cuclifvkZyHu+Vg1
 /kLgyjlDj9K3XJ2oH8pUb4PNP6TBEdV/Omga5W6/OGab0Uh19fNcYl0vvCWL88emwL
 ZwVRYRO4x7b+w==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.11-rc1 (or rc2, if it's too late)
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-ab52db2e-d084-4a51-b804-ae41d45ca8db@palmerdabbelt-glaptop>
References: <mhng-ab52db2e-d084-4a51-b804-ae41d45ca8db@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-ab52db2e-d084-4a51-b804-ae41d45ca8db@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.11-rc1
X-PR-Tracked-Commit-Id: de043da0b9e71147ca610ed542d34858aadfc61c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a2fde8def1fffceda728d2441d7e69230478285
Message-Id: <160884812139.9963.14494696534917649175.pr-tracker-bot@kernel.org>
Date: Thu, 24 Dec 2020 22:15:21 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_171522_966616_F9F82681 
X-CRM114-Status: UNSURE (   4.15  )
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

The pull request you sent on Wed, 23 Dec 2020 20:24:05 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a2fde8def1fffceda728d2441d7e69230478285

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
