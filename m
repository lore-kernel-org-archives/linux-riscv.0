Return-Path: <SRS0=l2pG=D7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BA9C2D0A3
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 18:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF2A222C3
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 18:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MrTHB3TN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgeeNaDp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DF2A222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZQQtGWf0choWd5nPEOiO2Lgs/hmCk2Ice+sX7C30R0=; b=MrTHB3TNM+kGMxxS0rz+xHaxJT
	yhoXEBVAAReWPkLb4ob/G4VCdv9kqHl9CjUPg4x7XSbBm2lufi0BRIhKpnfZNNgOcykedWln0PG3w
	NJ3mUKfJ3QDdhCzhOb9AZPUXQdH3vN7oL+kSB/lWWEu1yp+yG5h6xgTyktOcNvknukij+QovjhvSC
	vmTOikXuRv5yZcleMvuuUdlsZV3MTmBJVWpUU4WU1A0SszjySxN9kMCkX34HKDwzp8n+AbtFtw3r7
	vjtkrIgnOy0PyzJGrkMnf9byxyz/AOpKWUay0hMzIY8dMWPInu+DnAu0B9W5cxRb0G+rxf4dox3G8
	Qn6bZR5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWO0f-000565-Ip; Sat, 24 Oct 2020 18:11:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWO0c-00055W-NN
 for linux-riscv@lists.infradead.org; Sat, 24 Oct 2020 18:11:19 +0000
Subject: Re: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603563076;
 bh=8fw4vQh+vMRJ2XQEavl7iG2o1D1LWZm/tdDRFXflFtQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=OgeeNaDpenj53Ip5q/l0kuUpP7/gqlNvjJeWZdLDs86ALsHyR+G130hKQpBp528Q6
 L5xrO/+hmv0olHzvgwEfIXzul01q26BStc51SXAEhesAvv8vK1colWCaOakUv3+XOP
 L08mbC6kdzYJUnnTpc/kRQK52U3nntnIQnLB6onA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-ed53d520-0ecd-4767-ade1-f4266118c3c0@palmerdabbelt-glaptop1>
References: <mhng-ed53d520-0ecd-4767-ade1-f4266118c3c0@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-ed53d520-0ecd-4767-ade1-f4266118c3c0@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.10-mw1
X-PR-Tracked-Commit-Id: e8d444d3e98c255f91d228984abc46cfdfaf48b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0593c1b4598a77b5f835b278cde0ab71e2578588
Message-Id: <160356307627.29626.11197947365181304549.pr-tracker-bot@kernel.org>
Date: Sat, 24 Oct 2020 18:11:16 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_141118_889423_86BDDB8A 
X-CRM114-Status: UNSURE (   3.02  )
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

The pull request you sent on Fri, 23 Oct 2020 22:13:02 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0593c1b4598a77b5f835b278cde0ab71e2578588

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
