Return-Path: <SRS0=3V4y=M6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B44DC4338F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 18:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A6961057
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 18:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07A6961057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpfVgZybJsdNzbC9++gBmcBgOwcRy0ZTRaON4mVHyKE=; b=tsXQHwXOu0g5Eq
	9tkEdwcBP72fAZdBMGjcQlGb4blOgK8X9JVS3xYrCQC0WQlxuDpaZPJex4IksAy4++DrcjNs+mQnf
	Be4dkRJWumpct155mGy6wMIiZmjNkM6A4dtcJvnneh3mKWhS4v0uD2EqWwx50lxmUn2DrsO1AkC9p
	rPrJ5abfKCAGlcebsgCYzbobQziWakD3BAWWsCtHi0qdL/d9S+Gj5xq4Mu9k0lEZK21GxVksiVQOV
	sNbxuGL3D3nmfkDNSfTcd/Qq8LBPHDp04aNLCidE068LV41EqmFChxPfMkjOtLOG7hdu71iaxhhvP
	Vczkhb+xsLA1M0wz7U+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCQxH-00F2WI-EB; Sat, 07 Aug 2021 18:21:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCQxD-00F2Vc-W5
 for linux-riscv@lists.infradead.org; Sat, 07 Aug 2021 18:21:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 354A860E9B;
 Sat,  7 Aug 2021 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628360510;
 bh=agqOoUD89S/Z8V8ZdzqbGU3qvUK4Tk/EkaLKFcpUq2w=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jhjG6cEB+7aGrwXdOoQySu28BgQ4wRykRzRUgKT3oTx7bm0oKpy6kZBDPnkENGOm1
 pGvuljev+6TRSGM35j9PQHonVnwNg4jor5vZuJBdwMZosnVuuD3AxS5obuPXjMllWG
 m4Q4BzmCJeRGuVWU8B06y76Xbd+mwZww0ih7XDGkxuVxHHoKRDSrukDhW5b7NhGqvy
 cqcZTcgJdLy41x2PFRTh8oH/+VOv1J7hxp35SzaA46pYTtLjQB3tJP3YgtZKTKMUXe
 Cl2OOwbRc6tx2LVhAYtMSXHALLR4+ukHVHIKQpy9RbLDNg/k7jhtuQr6YWMS+Q9EFw
 yrRPZmaziKUbQ==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.14-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-bafc6421-186d-4f3b-b5bd-7c7f15bf94fe@palmerdabbelt-glaptop>
References: <mhng-bafc6421-186d-4f3b-b5bd-7c7f15bf94fe@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-bafc6421-186d-4f3b-b5bd-7c7f15bf94fe@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.14-rc5
X-PR-Tracked-Commit-Id: 867432bec1c6e7df21a361d7f12022a8c5f54022
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0b6684ba5f5abf0dbbda35af570443181910a780
Message-Id: <162836051016.5679.13094161831326920444.pr-tracker-bot@kernel.org>
Date: Sat, 07 Aug 2021 18:21:50 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_112152_092982_C7817EE0 
X-CRM114-Status: UNSURE (   2.08  )
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

The pull request you sent on Sat, 07 Aug 2021 09:39:50 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0b6684ba5f5abf0dbbda35af570443181910a780

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
