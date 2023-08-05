Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C9AC00528
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 00:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDzy6Cay1DTt3zH/qRymtfLzvCRnNegWOps5+LpWW4Y=; b=UhA4IWZJC4PARF
	STsWQsR9za78r+0MqnoTKagMfYtPW3QAPBQRxzZ5fT0fPDZtXD/ZhmtzOtCAcO+OobJ9YkGNtkrKE
	cvDptxqnb8fv+1HtAqdBkhd3lErJtPCgXLniNjQZPq1P+krT8AXwmsv503iyWI50x/SiCrrbmZLUy
	rTxOzKgx94mMDVvzWnt+nTX/ahBeaJMgOT6x0VNpoHwF6+LrTRzEFb+wiKpPccZi2ah2o0h+vAB3m
	6Be7fGonhnh9lhkngwRSWFcbVUcFfjSs3QQ+iDWWaQJwVJBf67TxtBFYlWFEbht4q3xjTlcR4vSlI
	/MtXt0OXXwiZVrVIjEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS4yT-00DTOF-0N;
	Sat, 05 Aug 2023 00:16:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS4yR-00DTNI-04
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 00:16:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75BBA62180;
	Sat,  5 Aug 2023 00:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5BB6C433C8;
	Sat,  5 Aug 2023 00:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691194609;
	bh=aEPyFtSwblvMrG3VREd43uS1cyWQ9xPMSGoReRh1T6g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Y4R8b0Gk9+8IXVGcEJFlZBYfUn/722cSNp8B9LBYbwgAYCO7W6KlmCO05ph+lf64s
	 J3KUvstVrlRF9l3APq5GlSjcBB/TL0+GQhB+MZpkj/LibTOYnJTCeZLwFww5ne+VNR
	 OW03F+IzuKUSNO61/0xjG6an7u+e9G4V3PKStDgwpXbMsu+0rVu7S4Hpai9URgCjaB
	 NP7UXsHQKpmofUOS068S3iVsBjYDGjA5YGHJ8Ij2NcCFTR9Uj3Yi6sHTRwSdj/7vcW
	 0Zanalspu90n1jmIxCkQZgrVsCgCudZ3oFoMdPuX3GDwyeXe1frsbewJ/nsCDl0L2f
	 YY5fYwi7ISj+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C221EC395F3;
	Sat,  5 Aug 2023 00:16:49 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.5-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-69f4a2f3-c179-411e-a85e-683bb3e088f3@palmer-ri-x1c9>
References: <mhng-69f4a2f3-c179-411e-a85e-683bb3e088f3@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-69f4a2f3-c179-411e-a85e-683bb3e088f3@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc5
X-PR-Tracked-Commit-Id: 640c503d7dbd7d34a62099c933f4db0ed77ccbec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e661f98c82832ddb76423f57dffb4ba6256e0fc6
Message-Id: <169119460978.16730.3438114313213071180.pr-tracker-bot@kernel.org>
Date: Sat, 05 Aug 2023 00:16:49 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_171651_127946_CC9CD19D 
X-CRM114-Status: UNSURE (   3.94  )
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

The pull request you sent on Fri, 04 Aug 2023 14:38:52 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e661f98c82832ddb76423f57dffb4ba6256e0fc6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
