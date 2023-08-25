Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE74C6787B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bq7HxqDx/tlXkaH/SqADwvVNjY0HWpujPBJXQWOm38c=; b=pbzg2598+6sLO1
	gXBn68/zCAZ7CxEY7q6Ojh4a7Cs3PDKnHptJfof0PegG+1xpfKhN+5iMGl7djVMmbJfn1xJKHo4rU
	ptEmDhNRvI34yXmOqw2WN/m7TL1YyyQ/QU0V9l6eiTKbYeh77Vk/XY0IztlUS+356AVgq8RPMJPUB
	JQL8497ZLWvSts6YVR2C03f4jxAcVtpf5CWLE+QVUCuNDzsEqkUPLVruss+QPIz9MWz9mtTCs+fui
	NYoDnacXNUdEhQexlstzNQw48VmyCJtRfkFim6/n57VFHoIlYA4vgQY7Mw7TaFjvgfM3FiUIDOVVu
	07ku2fZHBOPp8wHn52Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZa1v-005kw6-0x;
	Fri, 25 Aug 2023 16:51:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZa1s-005kvJ-1s
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 16:51:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B5E2656E7;
	Fri, 25 Aug 2023 16:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73DFCC433CA;
	Fri, 25 Aug 2023 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692982283;
	bh=rrtrv6505D6+mKfj6d9ZGrF3wcp4skTS9g1LgMRmgUk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JtHfl7b2USxlC3GVa9bu0+Zhy3E7ufYWuE6oWoD7doA//oWvjHc7B3nak7yDZzGXH
	 bUqSEG5pFE1FF/TUMDdCru4yzTE58fOiaTQLvSRa3GLtVKqTgFk+XxaGlbHvjjKTo7
	 PR5O+LCbatS0m2mBvuJwWl3CDlmP5EyjCEJCynsI9QTyVR8NBFujCfuqaaU0ji3Fhp
	 vXeiyju6Q1K/aAjCtdUxJSdzJ00b0G+AYVQFxPv2sqa7ULrvlBUMeG8FsSDm9BXTaM
	 n1T+jSpFT4WSASKArHNHKZosd/EumioPlZNJuRimDQzkmoHsPkugJaEK9yUqmxy/WB
	 SOjUxX+bw/MKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5C02DC595C5;
	Fri, 25 Aug 2023 16:51:23 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.5-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f80b6a8e-79e3-486b-95e4-18c04a1be0dd@palmer-ri-x1c9>
References: <mhng-f80b6a8e-79e3-486b-95e4-18c04a1be0dd@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-f80b6a8e-79e3-486b-95e4-18c04a1be0dd@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc8
X-PR-Tracked-Commit-Id: ef21fa7c198e04f3d3053b1c5b5f2b4b225c3350
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4942fed84b98cfb71d3cdff1a3df0072a57bbdfa
Message-Id: <169298228337.13860.8193502050877507785.pr-tracker-bot@kernel.org>
Date: Fri, 25 Aug 2023 16:51:23 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_095124_695669_C793CF5C 
X-CRM114-Status: UNSURE (   3.89  )
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

The pull request you sent on Fri, 25 Aug 2023 06:16:41 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4942fed84b98cfb71d3cdff1a3df0072a57bbdfa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
