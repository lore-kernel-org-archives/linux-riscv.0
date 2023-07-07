Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1270C001B0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ypm9CFmAfZ6Ur3kM4CI779nJrF153wzjVjJh3CAWirk=; b=02C5NKwTGD+RUZ
	Kf7/npZ7VVlCRIVGK25HGI4KKWO+7j62TRFwtZ/SWMbYj6c+p+EVeYueYJRFadE8wIIo2fuaXKhLS
	C72kmsSbVn6VV2++J2DPNFdoPg/AL4RWpCEn//dFf7+UFs+qHLRGiYlEhTWKSSoTQYdTxUeToVLYJ
	q/zWDSrVpem6k8bWi+T9howOzhD0l8ScXSIqV5r+CzAMQncTwQUpwWe7Khh0ftoLpnOXGYx76CDBx
	s6zhVsT374DFiw5GyYB1ZivWEADEqeBCq0REkqNUfA5k6/vxNAJAL8LDdN/Fq8sjxl/hLS78kdNWi
	UtS6eQxDVw53oPstG61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHoz6-005HOk-13;
	Fri, 07 Jul 2023 17:11:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHoz3-005HO1-2h
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 17:11:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2108161A18;
	Fri,  7 Jul 2023 17:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E94F3C433C8;
	Fri,  7 Jul 2023 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688749864;
	bh=6SimfNFVEnrDAlXNCEMGXkyHfjgELeF7SVKI+9QYsoo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iCiyTmPEbU7R/WtKgJac7f1n/lVVkxdsL88Ona12kJToEqwILq1OK0APeZApF/bNr
	 9coo7XdPDXxlupeXFsfYMgKNTvfCRALn2peWAH1hjL2PANR4X831nEodGxnfgvCeXG
	 P5rCupNmZkTlZhxAztSDn8tjPSbc6dcBMly6POaHGeV2FNjaahugdIJUjjr6TAmzJ+
	 C93Jv7WnAbyN6MGenBaYvEyghbg8sxua2AgRLABbxXqcVWGcZ9Mkl1O1ktAnlhfv3c
	 Wc2ZGEYWq/+BzKwGAqZ6Dk198vXMNOr6+ozQ8mAYiVVVyzBfimKwKjalyg0llvB4VP
	 JZmbVzbuPXyGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D88E6C4167B;
	Fri,  7 Jul 2023 17:11:04 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-4bd23a4e-dd7c-4f62-90c8-804c137c2621@palmer-ri-x1c9>
References: <mhng-4bd23a4e-dd7c-4f62-90c8-804c137c2621@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-4bd23a4e-dd7c-4f62-90c8-804c137c2621@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-mw2
X-PR-Tracked-Commit-Id: e8605e8fdf42642048b7e59141deaf8e4cf06d71
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4f6b6c2b2f86b7878a770736bf478d8a263ff0bc
Message-Id: <168874986488.21562.10846905883615220864.pr-tracker-bot@kernel.org>
Date: Fri, 07 Jul 2023 17:11:04 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_101105_918478_8E3DC218 
X-CRM114-Status: UNSURE (   3.91  )
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

The pull request you sent on Fri, 07 Jul 2023 08:51:13 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4f6b6c2b2f86b7878a770736bf478d8a263ff0bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
