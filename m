Return-Path: <SRS0=ZuGm=6Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E61C54E8C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 May 2020 07:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67C420801
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 May 2020 07:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpjafNwj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B67C420801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7/gXVwxfQCALl/htOL9nGBBdk9CR2DqbWyS3c9DzJzg=; b=mpjafNwjsuLwHQ
	kYnNKGlBZ2c/p7S2Shvfxc8G3Vky3iX+K9st+QXbbB2kZ2FM+d5x+F6rtOzPU4Y3jOwD0H2tw0C0b
	21g2XA55Kefmh7igc5WqA6tkgSXNa4W6zCVb29HwMGCKAVYKpXZ1OdGBkCVhnO+g3j+D/lCsRhJG1
	ZaYe2XWZ6hEvV4nm/x0N6VmVDg4r8aJfvt+JONND/ew9RCT1X2uZoNqLbfYIN0bO+KBK+zHxGItGJ
	Ff6M5pHeSvl7SlQkScoj8PThLuwie+BhaRfr5jA3ymmb9F3mdK4+qrFEz0nh15i4tZOx12FznVGvk
	7Jboyx9AgF3CdBA0C/2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXgoc-0000Jg-2d; Sun, 10 May 2020 07:56:02 +0000
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgno-0007lE-9T; Sun, 10 May 2020 07:55:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: sort out the flush_icache_range mess
Date: Sun, 10 May 2020 09:54:39 +0200
Message-Id: <20200510075510.987823-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

flush_icache_range is mostly used for kernel address, except for the following
cases:

 - the nommu brk and mmap implementations,
 - the read_code helper that is only used for binfmt_flat, binfmt_elf_fdpic,
   and binfmt_aout including the broken ia32 compat version
 - binfmt_flat itself,

none of which really are used by a typical MMU enabled kernel, as a.out can
only be build for alpha and m68k to start with.

But strangely enough commit ae92ef8a4424 ("PATCH] flush icache in correct
context") added a "set_fs(KERNEL_DS)" around the flush_icache_range call
in the module loader, because apparently m68k assumed user pointers.

This series first cleans up the cacheflush implementations, largely by
switching as much as possible to the asm-generic version after a few
preparations, then moves the misnamed current flush_icache_user_range to
a new name, to finally introduce a real flush_icache_user_range to be used
for the above use cases to flush the instruction cache for a userspace
address range.  The last patch then drops the set_fs in the module code
and moves it into the m68k implementation.

A git tree is available here:

    git://git.infradead.org/users/hch/misc.git flush_icache_range

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/flush_icache_range

