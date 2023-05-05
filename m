Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA5DC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqqBGaPGGvcvQ/YWOO1XX1iuqBvrmVTIGP2YeW9eAIY=; b=1WidNihJyBu9gU
	BHX4TL5HaVPYh3TtiggTlJ+6xTgh7o3JsCERDbY5H5fuXt/TKbdjSo+GF8J1VOO8pl1d5h9kuJ01n
	s4Aqj1oJqCj1dj8P8kZwZgY4A42A2ag2teXA1wVPp7QUTbSAgd727vnd7aLVXtEaulNNMQH1zGmZT
	2Rm/TPDoR4UFdpXeXNMd9E1WJBX+d7E5viSa3Gnv6axX1DjywDZtTn8189XH/yc/HUYdDC9HdsxoC
	RFPhTnVsd8+LIihqlmAbDfu+PVNwckJVlOQqIO0F5SOs89ujl5LEOSiWybvRYVZg9tng2cKjheFkw
	QZ7c4V/+kjTk5Py+KR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv27F-00BkLA-2S;
	Fri, 05 May 2023 20:33:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv27D-00BkKQ-0Q
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 20:33:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC52D62C7F;
	Fri,  5 May 2023 20:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C21F9C4339E;
	Fri,  5 May 2023 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683318797;
	bh=qvOgJN+oCNS5g1ytNum7KttdtPMJbOoHq9j31ClFAwA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nuVkRigt9PCDIBUX2IZHLJhUilIv6QWEeXvf+nQhtk6+COCXB+X6rxvhq4MTc+ssI
	 K9/fXI1fn+xdRXtXOhNwXi20dahBw+ztVFgUXe1HxyxZdtV9gDoVRbLmsNnYIv5xDD
	 t6W27b7vCaPQ5rkagwGh2kbZdvLPku4lLB1M7hgFacIaOAAbhjyDgwl9yMdVZDzziZ
	 KP7sE4/d5eBMjMpNEGxckFjnWAwQDmx0qGZiDJbOp16zUKaF2BdLvm0Dx95T63ZQ36
	 6OZfR2xci+oQkNtVc7PCosBcZW6z+KJpD3qFfOSsQWK4w0Qh83sTQVSc/dLV1vBsDb
	 b3xFB+HMaii3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD1C9E5FFFA;
	Fri,  5 May 2023 20:33:17 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.4 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-b783c0bb-3d23-4767-9c69-a39f805a8544@palmer-ri-x1c9>
References: <mhng-b783c0bb-3d23-4767-9c69-a39f805a8544@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-b783c0bb-3d23-4767-9c69-a39f805a8544@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-mw2
X-PR-Tracked-Commit-Id: c2d3c8441e3ddbfe41fea9282ddc6ee372e154cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 982365a8f5c453b3ecff131d60f254a7e67c9a2b
Message-Id: <168331879770.21250.12119912930299851226.pr-tracker-bot@kernel.org>
Date: Fri, 05 May 2023 20:33:17 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_133319_216189_D6C9AD20 
X-CRM114-Status: UNSURE (   4.69  )
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

The pull request you sent on Fri, 05 May 2023 08:16:58 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/982365a8f5c453b3ecff131d60f254a7e67c9a2b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
