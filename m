Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A508EC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 18:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPUI9EitsV0ScGBO77SWI8mz106H2sQkgnTda/V1c4Y=; b=c8Te2/fOzdkouN
	LHPmWnVatj75/6SVWR0r5eIa8JuC6arSTEooRUHLnUxo2m7gzaepEtKyAdsXFGvnMtLH/2lNx3afw
	2AN09ugQ4s3IwnO7y0Bkf49HFP4V9h8ruBiqdikTwYqknSg7PklyY5tLj6r4lhfKbwGJD6vhmZ94b
	83fCTS5yVgI2+/nCZ5PXp/ge/1AKLgTSZgFXetKNc+CAva/NRmDzW1fe5DLLGJyXHDZxN+YWkxwoV
	0qiG2NOxJcvKVyj0rx4xWIuT7AIITgeKYpEqsLKbAvc/xFmPTrjRf+1kkVgMLtdqYL+iTTZaf/8y6
	dYuskw8oAiyy9d6DCp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otYMy-00HYPn-SV; Fri, 11 Nov 2022 18:03:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otYMv-00HYLA-HB
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 18:03:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9D572B826C4;
	Fri, 11 Nov 2022 18:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B4D2C43470;
	Fri, 11 Nov 2022 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668189783;
	bh=cIRDXIK2WBCPZtiqE0k37LqxFETqLLE19X+Yfais0BM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VXUgxSb65XR5dbrFZOmhGnQzSOXxdutH6oN0n6KqegTokt6rJts2JrMBJPQEX0WbF
	 ZRcT0q/zwKTn2+iN5tIiHFNLD43LbLpWc+IhCjwwicyJLJKmMpme/eC9uA90Rf3wce
	 KQjFK9wwbh8m7rbEQr8PURmCE8KO5tkEgpF712EYPKf+IyWByh62O/OikTWcMuYQZ2
	 mInCuwjiwYLlB/+pWwUnIxrxjhVec2/Q2YfMTK35h8wp6bQKz246LPOKFDWNvTtP6y
	 dHnv1VLn2vGUDz7jG0IPSVhJKwuYh5jQrNGvtqdPf2xot0SU+FZpfr5sS/OmZthmhn
	 YDbwoy9KIj6nQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4BCBCE270EF;
	Fri, 11 Nov 2022 18:03:03 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-a9c9d14d-1da7-4c8d-b117-b207616f77a4@palmer-ri-x1c9>
References: <mhng-a9c9d14d-1da7-4c8d-b117-b207616f77a4@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-a9c9d14d-1da7-4c8d-b117-b207616f77a4@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc5
X-PR-Tracked-Commit-Id: fcae44fd36d052e956e69a64642fc03820968d78
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 991f173cd23cea2b4102cb78f779a7a43c29e76f
Message-Id: <166818978330.15878.2811608566324625785.pr-tracker-bot@kernel.org>
Date: Fri, 11 Nov 2022 18:03:03 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_100309_800909_CCF8B85D 
X-CRM114-Status: UNSURE (   4.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 11 Nov 2022 08:58:46 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/991f173cd23cea2b4102cb78f779a7a43c29e76f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
