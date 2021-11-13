Return-Path: <SRS0=6Wn3=QA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8066CC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Nov 2021 19:15:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F0D16120D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Nov 2021 19:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F0D16120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVP0sE8x6cYdWWFU0+AeGDARRE8U9AYsOLOIvg9iAQE=; b=p/HNppQ2Qq6jlQ
	099eQlthgiQy2P0b8NNFe+uKjsoFV+eDR4kTm6lQqvV5HSWH51ov8JpabA+CJH+CgmiLy0WWStnYj
	YnTiKs0Q/hwwf2lZcA8FpYL9jLzCiNGHqCFbLcfqSoyquurnhVk/N3agV5EIXcjoevanbqUJJNjBO
	xVhw81dbh4sIj5JqGZjXJO0G9R9LxqIeROHPnmPLZCR1dEVbBlYz6sF14ToDaA8g6i8P0K8W7E50t
	sRChXebUn0vhxL1Nznkcg+JLEdmxIPQjGzE28GXpnv+PprRloKIiHomZP61Q7xyr3pj+sWjEQgn/Z
	m4QprsIQCvRroCF5CmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlyUd-00D064-82; Sat, 13 Nov 2021 19:15:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlyUa-00D05h-G5
 for linux-riscv@lists.infradead.org; Sat, 13 Nov 2021 19:15:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 659FC611EE;
 Sat, 13 Nov 2021 19:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636830911;
 bh=ScIWgWYvJ8P2kY6dDbMwPLMWNZW3j6/OQjomJoWBAfs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=O2zgksMRjJ7SJfuyYYyF/p97SWJ8qTruV48d8gYPcj9+RTgefUbsDEwsfvslQXwES
 ptbwD8uRAWHnKdIuFX3l2qiRrgWEV8I/ToTSbnkPlQF1mSP96d9DyYgpd+Y2EUVUl4
 FpizGcCJauYBsilxIsYHqtfsFriC1nv9rN84Qv0B6AnZ4H9cG9nOuNVY4v7LUWnsXk
 lWX2VOyyzwL7zHpMfhMysopWSeS6XxonSDbHDrFsf72y+7llenICpOtfgRAmvcD5LO
 +AJU02E4vzMvucyaYAuQK1Xr3G/MPbyRBzUPthGSFuVS8P8ffhtOaDy7RU+yD/pMlb
 pzQvlfLOVFdbg==
Subject: Re: [GIT PULL] RISC-V Patches for the 5.16 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-109b0503-bc7c-4da8-8621-28aec8d9df59@palmer-ri-x1c9>
References: <mhng-109b0503-bc7c-4da8-8621-28aec8d9df59@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-109b0503-bc7c-4da8-8621-28aec8d9df59@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.16-mw1
X-PR-Tracked-Commit-Id: ffa7a9141bb70702744a312f904b190ca064bdd7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b89f311d7e25eb246376ac10de46d6ecc6b6ed5c
Message-Id: <163683091127.10343.18209516046778739113.pr-tracker-bot@kernel.org>
Date: Sat, 13 Nov 2021 19:15:11 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_111512_582643_E9546B91 
X-CRM114-Status: UNSURE (   2.01  )
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

The pull request you sent on Fri, 12 Nov 2021 09:32:15 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b89f311d7e25eb246376ac10de46d6ecc6b6ed5c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
