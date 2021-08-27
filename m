Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D08CC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 20:11:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F0760EFF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 20:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2F0760EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btVuQdKzW13wF1rD14WFXpe6hBef5xatINcX969A+Hw=; b=WA4o3iPdQE683F
	Hx8bn4351HZKaSTDjN8wi6Pl03auHkafPHIvz9z6lqrYcZlpSKLGgF9BUbS5j9dwfOqsubZib3T2D
	jP4d73b93IqEo5fCCxgypY357gDcCJZROiFs2Bhnfd2ZCnFEkZMm0VomkeJJPAOqBghraq9tVYFXp
	897/gBLAK+zFDkM8RAoyF85wkTIK/zMQI1ActlBIx5RfuITtwHyman+BiHbXPr8zyx/VfTt1eNZ5y
	CldRUmK0moRa0BlNzdxR4c5vQuczSNDEKGTYRefr7s/DF17VPXIejVK1y5BDZUxmXWJEFqszCuQZr
	l5DUHjfqBT0ztRyoS62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJiBn-00DBOH-5L; Fri, 27 Aug 2021 20:10:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJiBl-00DBNl-3K
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 20:10:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 00CB160EAF;
 Fri, 27 Aug 2021 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630095056;
 bh=TSPJ9B5ctmgXYEYzurJRuzp+UPhIYcPkRusYE3OfY6E=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=G69j/RXTUAxUTeK9GgKSfQ9pPT23M4QoaOP8Jx/vb/lKY8y8a/rdJY9VXRkzFFebC
 a15pbkyowkZ4fYmmhw6MmwBEYydawrLfMLFIfjvNss6TsLRCUrdM8jSmxooN0DGiMR
 Ou184zSNXHSb1g54/gQz0mM07vQ5dIjZtxEPbRc/thQZYksNuzQYZUq/eqWFNdmr3C
 1OnCj1N4hZTr3YBJLg62NbW9oBFnFnG+WK40wnzadGvmNExPmyUxq5Ud0uI+wDuYO9
 DEzzL8pP9G4l/uR1zFas5HHqIjz/U41EaQBgbzDXiib8HoQ4Xh1I4fLUCke9KCaOgK
 VZdJ/M7ma54fA==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.14-rc8 (or 5.14)
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f06b0a4c-f321-4c14-9378-da36fbf6212f@palmerdabbelt-glaptop>
References: <mhng-f06b0a4c-f321-4c14-9378-da36fbf6212f@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-f06b0a4c-f321-4c14-9378-da36fbf6212f@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.14-rc8
X-PR-Tracked-Commit-Id: 417166ddec020c4e969aea064e23822591ad54df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5a61b7a29647ed7c939ca76d3bf83c75d10ba16e
Message-Id: <163009505585.27622.7254144734962070601.pr-tracker-bot@kernel.org>
Date: Fri, 27 Aug 2021 20:10:55 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_131057_193680_C985E50B 
X-CRM114-Status: UNSURE (   2.56  )
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

The pull request you sent on Fri, 27 Aug 2021 10:45:51 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5a61b7a29647ed7c939ca76d3bf83c75d10ba16e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
