Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4435BC43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA20720838
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVfsio46";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kc3xXJaL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA20720838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eqKHPXZjgxnsRQqwOAffHYB+voedwYeMJQuTsHbANMQ=; b=WVfsio46jCgZIWDpULp/RIfKXG
	0kJBICnyJCnOD197dF6TftgEht9p/mal/nnAEeS3L6rD5EQm+dsKnOupqfpgKwfanB8VpCeYnUNCM
	9vjhZ44sNXTNS+YlmOqhb7N4qBuZad2nJ++KrwI25qw9bT4Snpeq85NsIVGmP6DiDqcObpKaPPnCd
	bpN7yJlPknsdyfgDrdlMfNVi8TsY5hUqcR/3lRcDl8Q7L7SsdHPHPAEaOIWmhdTG544oKBfhZ8PA9
	itP0yAYagHSuSdqn1QMsvV4AcY4MYZ+rJ4eYM/zDU3hs3hZC6QFnAi6TZwvo4bNqbzdUj6Gf+hHYR
	FIQLklqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAAg-0003xd-OD; Mon, 07 Sep 2020 05:58:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAf-0003xL-1m
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 05:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ngzswZtKXcd2zI4NzevNwUNXyZikinlURXNEXQYjmEA=; b=kc3xXJaL3wBgnsWsgdPkruCI4F
 5Bzt1jtrfRYSHnPUcOwtvUy4kW423EybGBpNesUtDCFWtY1gAlWT4phrHv7ZDpNQNVk4bwLVVpUwO
 EmQ+ygOWaxa1Uj3YpdfYLi9XrBgOcxdDXrmp0Ue1A2MGcwbiu2xsxDE2AtuMWffHOywtHal95rVoh
 o1OAOUQCml2MxRcbNl3u6X0ayMOrmd5KW9KYeaDhQpobGN8S5pTDazQzDxZ9hL3OIKW4rBZ4Zb+Pl
 PH44NUkMafM4iy/q7+ny8koTmnwj40z3KKmSJbVPeWaWAVWmMCa8zaLibo0BZ0hr9HRIE97Np7/ux
 iWDqAMhA==;
Received: from [2001:4bb8:184:af1:e178:97b2:ac6b:4e16] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAc-00034K-P9; Mon, 07 Sep 2020 05:58:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: remove set_fs for riscv v2
Date: Mon,  7 Sep 2020 07:58:17 +0200
Message-Id: <20200907055825.1917151-1-hch@lst.de>
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

Changes since v1:
 - implement __get_user_fn and __put_user_fn for the UACCESS_MEMCPY case
   and remove the small constant size optimizations in raw_copy_from_user
   and raw_copy_to_user
 - reshuffle the patch order a little

Diffstat
 arch/riscv/Kconfig                   |    2 
 arch/riscv/include/asm/thread_info.h |    6 -
 arch/riscv/include/asm/uaccess.h     |  177 +++++++++++++++++------------------
 arch/riscv/kernel/process.c          |    1 
 arch/riscv/lib/Makefile              |    2 
 include/asm-generic/uaccess.h        |  109 +++++++++++++--------
 include/linux/uaccess.h              |    4 
 7 files changed, 166 insertions(+), 135 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
