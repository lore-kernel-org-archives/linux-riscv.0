Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1B0C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvSB3M+Q8TFdhooz6JDT2t3V/uQhypYr4d0m3Dxe/5M=; b=gqqWMvhCpTGtWu
	U7OJ+YhP4mFO56r7EGvCBRQBAAHDjECPBedOBGU6wXm3v1ZqlUUKgejS1SxwdTT6nUPXTjGruz+X0
	Cji6rqYeZfnlzkbPi7C98v+2ohryQSiSG0PvAoY9o3Lzv8JKAYeoaBI7OTJtnu0N4WcTZQEGHjcCp
	00DobK/IoOQNfIiiJh5KX/Sp67Ql7yeXWhMug/UDvIVljYg26xDCz9Zo0XCq2QJ8lP1gXeT3cKaQR
	NXCTwK07i6Cwl5YXzrGKEXhKjYTT2UDNPj2g21n2S/IJkn2vaPfAjvtljjpiKVflB575a9tbnIGCU
	X1a/n4QGx8f5l/6QKrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAOR-007C0u-8U; Fri, 03 Mar 2023 18:44:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAOO-007C09-Mq
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 18:44:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4E13A61998;
	Fri,  3 Mar 2023 18:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B219BC433D2;
	Fri,  3 Mar 2023 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677869070;
	bh=QZevfkBmy4cNqiG2nfJQcvQiWgn6Oe3/Sv5wusq1rWo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UPTds9wDuX74b997P7pERlSqgRiNSAY+BM7SXLlkM8UdUHyL1twoYxM4633n1o65O
	 uQ64VC/t4eoWxzk3/wHEwEOiSv+fxUqH46e0zKHydf98vMyeI/vmkAGOWAt676hUIe
	 QMCK0+OXRf8NLqaIC5K/gfNOig01IrpWGhhcAYuiMwk1vxCRhULqAKbPBPVJ2kGB9b
	 nNgZEvlMQNMAoZ40WBHMYQJgjlRBvxYyMh6R/6mMEw5RycWQQsEy2yuA+9nZAthLd/
	 tJ0SF9acrSN/maO5PIDH8ghQkdWWwS+8mb6HX1x22kh1w1JSD+XALclbzPoxvlszbZ
	 xjMJkEZ2GxpwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99561E68D5C;
	Fri,  3 Mar 2023 18:44:30 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.3 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-030bb7f3-2a9b-4061-8f41-e3e20c9b1671@palmer-ri-x1c9>
References: <mhng-030bb7f3-2a9b-4061-8f41-e3e20c9b1671@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-030bb7f3-2a9b-4061-8f41-e3e20c9b1671@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-mw2
X-PR-Tracked-Commit-Id: 61fc1ee8be26bc192d691932b0a67eabee45d12f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf1a1bad82407ad81130c065f6495ec0f939ae60
Message-Id: <167786907062.30023.15883158873202816895.pr-tracker-bot@kernel.org>
Date: Fri, 03 Mar 2023 18:44:30 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_104432_823874_406396A0 
X-CRM114-Status: UNSURE (   4.57  )
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

The pull request you sent on Fri, 03 Mar 2023 01:22:11 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf1a1bad82407ad81130c065f6495ec0f939ae60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
