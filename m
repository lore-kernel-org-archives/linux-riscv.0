Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABFAC47425
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCAA20795
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hqu1SjXG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="STmnWLK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FCAA20795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sHYNimaPCRDgNCeFMVlaHoqC2VzShitaCRmS65Qqn70=; b=Hqu1SjXGPR9vtXNN5m8LrV3EfX
	gQcrFsCyxkiH67Xg5Hg/m78yUpCz1jpLxderEIAN6fQAN+UWYRBKQsHaev0YkaSjR0Up9Tjxfyzh3
	zmmF9fcNM9UU5++GS/1rt21JJ8Bd2SEqbuY0qY4KVrBaCEydLj2pW4c6/Wi+eXtEAaclejqzVVnwo
	JP2TKwwh4qyjfZ1OgnEVSwL7mn5wBLpbO+4zsUDT1VFSyM4z0cQWex9uHaq+9bp0KknX1xXQuLQz/
	WJGvh6mGBgcoXUops4QMkGAUUiAbVlzRLWsvdaeFJ9wx9ukfz/ZxiK1nK7RkMVgry65i4oKoVxwz2
	sRnP8hZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEwo-0004Iy-Pl; Fri, 04 Sep 2020 16:52:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwm-0004IM-Rn
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 16:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vg3eMp3qgi31sLSmCrf5FHDomo2X8qRKjrMoI4zUJzk=; b=STmnWLK+ma1qwigPmOi+LTrWVt
 VwzJER0Yn+fHMRwnVnqTdt6SoKqMbguQN+a/9bm0TVtSBXW1C0gxIbGfwNlfBpjUGygw9Jy5wDvUv
 xr1cJZi5CxRDXK5waonglnCVvRpTvJigi0Xp8+exRfuXksMBm5WrSmB3843+DaNxCUYmQ6zNwjN+p
 wUEo8kW7glq7Y543bYAln+e6JO4HTZfPSjf1hgWWsqPLqnhDudBhuwc3JQ4AwZYpnPllEmCW/Fws2
 qGDF7LNFWUu80E/41QdN1iBPTrGz6vjS4cUbH9gv6G9ZFx6oiTwDxnY2HZ9Az9a0BFoI5B/3aYdML
 eFeBiq/Q==;
Received: from [2001:4bb8:184:af1:704:22b1:700d:1395] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwj-00012Z-Fz; Fri, 04 Sep 2020 16:52:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: remove set_fs for riscv
Date: Fri,  4 Sep 2020 18:52:08 +0200
Message-Id: <20200904165216.1799796-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

this series converts riscv to the new set_fs less world and is on top of this
branch:

    https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/log/?h=base.set_fs

The first four patches are general improvements and enablement for all nommu
ports, and might make sense to merge through the above base branch.

Diffstat
 arch/riscv/Kconfig                   |    2 
 arch/riscv/include/asm/thread_info.h |    6 -
 arch/riscv/include/asm/uaccess.h     |  177 +++++++++++++++++------------------
 arch/riscv/kernel/process.c          |    1 
 arch/riscv/lib/Makefile              |    2 
 include/asm-generic/uaccess.h        |   42 +++++---
 include/linux/uaccess.h              |    4 
 7 files changed, 127 insertions(+), 107 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
