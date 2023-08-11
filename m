Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0602EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akGlUmZNZFgobVrxiSBIb8nAS3UgvYjRyNH0uMoe2x4=; b=m8Ho+Qp2Hbf7SS
	73tj/sdKFEE+3Wi1DiAa5qXCxe6wmvNOuGrhR1p5UGStjc9kgxdePEcUdU3bJ3Y6HvgFU0wdp2T+x
	YTW1+zKKqHvKNrCKvpgCrWyVr+P4swmGd2dPDV71BP5twQIf6R+jLq3UgOIwdiHG4hE6Biwy1AXyf
	IZ+/ZwyGlw9JBQh/aIbDE//rfb8k5IvYLout5WuQXyP0I6ey5oR7kKMxICo3gxWiJ1u6wA/NWkzvX
	BWuwePvk0giM9NivEm+srRcnNfI4g26L8yPXInt1JcgaE31fqqDPW5zGYHZyA7Yjs+CA8uVBm349q
	gaJvWfURhRHMYn3JZDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVGA-00B98O-2n;
	Fri, 11 Aug 2023 16:45:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVG8-00B96c-2E
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 16:45:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5F6867703;
	Fri, 11 Aug 2023 16:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77881C433C9;
	Fri, 11 Aug 2023 16:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691772307;
	bh=C7Jj1OYs6Y8ePVr76OLB+L8bIX2PABmv5jP8mSCN/+M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aDxQYhdJvksycHSSIEP6s94vtxONMEpCmTbr3+7RZGVIp+577Pk+h0q8rEH1ee/oI
	 aq8WMtOcKMA0Lp3QOAJhYNjnMvXUIqn+GEcPciZmQSOGW6g1oxLWy2Hw7OKB9VJSKr
	 CnBURV8x3OmNBam5cVo+B4JKpHkPFrvqfjw/eyrJ3OnJJRorKrV0JCCCF9BhGUW9vB
	 RSihggHX/44hsTKVJsjvjIqmSNmnxK7xOcYS0WXvm+cVzv6cwhXSkj+Dovs7wmrzXU
	 Jeg+2AT01iJZbbARhTcgVBlwn4ysQjt2HY0lFObWWZqqkyWzz86Yp1PzDw4OjlvU95
	 L7sAyZTnvdClA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F25DC595D0;
	Fri, 11 Aug 2023 16:45:07 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.5-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c2fd272b-44d6-4174-9b97-3a253656e4ce@palmer-ri-x1c9>
References: <mhng-c2fd272b-44d6-4174-9b97-3a253656e4ce@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-c2fd272b-44d6-4174-9b97-3a253656e4ce@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc6
X-PR-Tracked-Commit-Id: 7e3811521dc3934e2ecae8458676fc4a1f62bf9f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a3c17edbf53816ba61746c38833b48c73ee2a16
Message-Id: <169177230738.3076.11356899040172338992.pr-tracker-bot@kernel.org>
Date: Fri, 11 Aug 2023 16:45:07 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_094508_772233_CBB665C1 
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

The pull request you sent on Fri, 11 Aug 2023 08:41:34 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a3c17edbf53816ba61746c38833b48c73ee2a16

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
