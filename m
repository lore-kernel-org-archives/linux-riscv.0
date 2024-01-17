Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4784BC47DA2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oK1anVPj2OjWyo0d0/NmcOuNJeE4KoyLyY+W4TvvNgA=; b=ppI59qRj8oEOvp
	2RyNAT87gvsSD5j1JBIGxYR6CdQLQ1CXf6KI2CxNwNlGKuhfkjA85uSIABw7eZ+CSAWfsvdgh9PyS
	S1r0dlyYQBEskzAuaHcE4SMOC9voJE965kYlrrevq9qX3u2VZZ59iXHQZ1CZNXlZAcjlURYX16b8N
	9yt0C/wBigWm21HzOFtT8w4tLnaR+87YYnnWDCIV5DXJI06k3w7o5f9wKBpTya58fRM0qP6Yz/XuW
	W9jtKmp9w9iaRP+6ptYZZuwvYC2R9le9eBldRPSuJMtC9glQPpwN/go2MIaGrpVjCboolGIqHSNfF
	TXuGx+xQDs+J14hbR57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC8k-000af5-2I;
	Wed, 17 Jan 2024 20:03:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC8h-000aZq-1N
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 20:03:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E3BA61726;
	Wed, 17 Jan 2024 20:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1E12C433B1;
	Wed, 17 Jan 2024 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705521830;
	bh=hOhgWFtfKU4VI4NXuKWgEUMKys1mmgOGjQT/c3TJkns=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SkirLYhq+QD6kwMerQjUeK3Buuh0bvFVF+B52GG61CMZwcIYn3Uu8HcMj0UmxMGTa
	 JfEsBr/jReTGQM0puf3AiRcLAQ8ekY4FXUfYLD6ERAo1dJjtz6k3mxDSCyiTAMZi1r
	 lJZCrS9QYHNiCcF6c4MOXiwZkjB5Ge+xycyReXA9XOieRMiPMxX8pyaYjdTCeRVSE2
	 7Zj13MKmpAZ5YLSzN+107tshkFv3DHIGlUXqD6ncGJ7kiJeVtNsyRsq/DDHAsYHfwm
	 koqwYZxV/8k/ED8e3/jFRQeglaScMjiyihVeccWcG2rfAj/QppeadYw4n5i8V6VzfY
	 X8Xq7WOuE1Mxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D07D4D8C97B;
	Wed, 17 Jan 2024 20:03:50 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-9a7c8503-91d4-4b92-a594-964a5983ecab@palmer-ri-x1c9>
References: <mhng-9a7c8503-91d4-4b92-a594-964a5983ecab@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-9a7c8503-91d4-4b92-a594-964a5983ecab@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw1
X-PR-Tracked-Commit-Id: cb51bfee7f62a8e26b694f9d84c0041b3e3ccc71
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4331f070267ae8f76db1abbc7f4eeed4f06ae817
Message-Id: <170552183084.2985.1457384482491808089.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jan 2024 20:03:50 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@subspace.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_120356_336302_38169548 
X-CRM114-Status: UNSURE (   2.69  )
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

The pull request you sent on Fri, 12 Jan 2024 09:02:42 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4331f070267ae8f76db1abbc7f4eeed4f06ae817

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
