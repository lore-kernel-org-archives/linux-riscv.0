Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21D0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 20:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ELIC0tMJQt//zo1EGZppEHPEt9nwlcFPN8o/xuXwV0=; b=KVaS9gW50qkswr
	euY0GRbD/TQX1pTp+OIEcneaRz4lEy3IOTMwbIIzVWDyB0FbIRvsC48sUt/PpD0/h4qeZokfZD6LO
	H8Zk+lR2jzNqS47gukf1dmSgpo6XFyZGtZEEb5oNeZUmpIa5TOiJfmADHuanZiPELhDytmzbRcDh/
	LTCjdS/RCxxPlaBMklMgYEXi34nlWq9APMVgN9HhoSoPU1qnxm/NsCvOEMBvwPlxR5jFprJTRmWQw
	+dC4N+6UjDepoT9dtq0GI7a/senndthh4AtyNXvuF0O6t+fyMYSYX8yHOOZX/0giwj0a1D1cYJUsJ
	sl021gP9nnq7d1yIaDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSm80-000EfG-HD; Fri, 11 Mar 2022 20:44:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSm7y-000Ee4-2i
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 20:44:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27477B80E88;
 Fri, 11 Mar 2022 20:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFB45C340EC;
 Fri, 11 Mar 2022 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647031482;
 bh=vDi2M9xuuoKAX94Xgn0xlD2AOH2r3dG2kCNUybD8kIY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QsC5USRG3VhfOPcwsr/WNBv/Uhyeyw2skf3/wMHhZ3q+HTq84x5G8pT36T+TqR2Sr
 npC2BVHiMv3/IeSWj/aEnQh+kdfpeCaIwYPPEsaM2jDCVN9k8TmLBM6U2HvRG2uq1h
 wCei+9hqGdwoV/t6gQT8riqc+JtIOEypMeD4a99TP1fJFdwB2L5KUedI42KYKCAfyb
 nbVouqscYJ3srpnSrkyWpbRzrl8xZiqswwD4TiUEuKvhblGSwbL5W1vlQcoAHhcl2E
 /W2Nn2WcLhSCMlR/Cc4NI6Rx/ygEd+lGwXanaLhSSsVRI/bzzGnLcE7XMTlw0V0OYV
 HwJ63waqIcITg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CB828E8DD5B; Fri, 11 Mar 2022 20:44:42 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.17-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-1484f557-fd58-4fe3-afce-a630fac5c8b3@palmer-ri-x1c9>
References: <mhng-1484f557-fd58-4fe3-afce-a630fac5c8b3@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-1484f557-fd58-4fe3-afce-a630fac5c8b3@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.17-rc8
X-PR-Tracked-Commit-Id: 0966d385830de3470b7131db8e86c0c5bc9c52dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 77fe1ba90241c2af6f14d53988bf0cd6b9586699
Message-Id: <164703148283.12993.8501085816446276759.pr-tracker-bot@kernel.org>
Date: Fri, 11 Mar 2022 20:44:42 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_124446_299840_0C65F1D7 
X-CRM114-Status: UNSURE (   4.17  )
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

The pull request you sent on Fri, 11 Mar 2022 09:18:12 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/77fe1ba90241c2af6f14d53988bf0cd6b9586699

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
