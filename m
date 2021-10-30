Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A37C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 20:48:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7399660F38
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 20:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7399660F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krRYbBOrPQJ48RtQll3cQVDB/iTjqTbLw9u01FqxJV4=; b=ddYvXeSvU50jzN
	Ne40czJPqCwqkcM/wE0pChNWAvjOq8wkPQbty4hSzddmCj5jt+tkryyRJ4xYXCgrM5IAIV2I8U2ZW
	R5gGK32BRKqrv1bjryRzi8nKrQKsMx9s0sP89bAh9QEvctL4vOsFUK/sAN5groYQEAfJFyalKlfHZ
	yBi9hVHnM2SxaqgIZWLDMsvYVuJYLas31rpryqWwZUNVMO5kcJiou8yFkdfip8iwEBOK+FNp9vjeO
	YRR0ESQn6nVEEEfH54ivqGGE2KqA+JbzLV5DN+9AVk7rLuOlnmFPpjwE8cde5Z7hIK6lXRwpJAnWz
	X3H6aiPehwGEntyOiFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgvGR-00DW5X-O8; Sat, 30 Oct 2021 20:47:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgvGO-00DW5G-Kg
 for linux-riscv@lists.infradead.org; Sat, 30 Oct 2021 20:47:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id A1FB260F23;
 Sat, 30 Oct 2021 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635626858;
 bh=i/ZGFbptHLhRgB6xZcC/8NSXylXprVhdd1X9yDdng84=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=OW2CfkdKT3U4MGoJ5Y6Jie1qTkixvOoT8xG2/yIvMM0+qsfyqYK0wBEh5hSjwyyn9
 qRcx9X7GqH+yaUKTyKKGkw7I6w5+bvX65q/CYfIZnZW7sug64473okqUtVI3UBBz5i
 v3ujIr552JTl6w7zLxacrrUcVcBqUV2aS/5EZf5H6jqsVRSes47roC8cZrR1E1Sz2y
 k88GpVz9guUYOBx8BHtM+25BHlvcY8ILJHhuMNmP8M3ZqgA5NHiURaOqkl9zlz/Npq
 VVRr3L1997NxdYZGtXyU8XYYelvUX9+vfEgesidgloa0MGlVM+Voh5UeE0dzUh2GBi
 NrE9VPTmo/0FQ==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.15 (or -rc8)
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5efadc14-a2c3-4c9d-a383-8ecb782399e7@penguin>
References: <mhng-5efadc14-a2c3-4c9d-a383-8ecb782399e7@penguin>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-5efadc14-a2c3-4c9d-a383-8ecb782399e7@penguin>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.15-rc8
X-PR-Tracked-Commit-Id: 54c5639d8f507ebefa814f574cb6f763033a72a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf85ba018f9229ce54765a62dba2dea60f7cdafb
Message-Id: <163562685861.6976.9088395794636907661.pr-tracker-bot@kernel.org>
Date: Sat, 30 Oct 2021 20:47:38 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_134740_736710_656FA331 
X-CRM114-Status: UNSURE (   2.88  )
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

The pull request you sent on Sat, 30 Oct 2021 09:05:40 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf85ba018f9229ce54765a62dba2dea60f7cdafb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
