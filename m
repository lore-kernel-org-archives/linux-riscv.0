Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E72DCD98F0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 03:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vbUBVBsAU7NqW6xlh8gEOuE76YSzRZ7+wg3/osRdzlM=; b=0gINsecctX0Qi1
	OG7ucDNt9v7NpfNXqqINNYNzVMOL76TuEGTwOClxMpOFbIsbdnchiAaooICUojRvRMxV6mFsf2wJ4
	DN0sjP3LilDFpOluXo0xoqFAC75vXh9uAkJDeSHdTqRX0um/foyWTl568LzbcE5i4WGW2UHDuLh0J
	LLLAbXZqn1KfZrh1SLswWMC+0r+D7LY05z0JZ+jhax26mve2jKWSNDTD6Ch6oyJUwuSzZjAYGUdLk
	N0fHIT5BYFe7VGiNfWrzc6gALmIO5TgOPw6tNB3NML328hyeAFGytM6EUjGIXtMRxT+PcN9PuO2mV
	gndBLk+wmjFZguexrpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh6w-0000000GYys-3Gvk;
	Wed, 17 Jun 2026 03:38:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh6t-0000000GYxY-1q4B
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 03:38:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781667515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z8KTVnvj6CZiytzjZC55rYxHlJSY9APqUbyBxvST0GI=;
	b=FUwyAik4zuSVPljx/z/Nw2++bSxwNRvOXCnIz/kRUQSxki7a99PEI6rDTX7E/ChqXcOklM
	sgQZuThZcz9W9uEQmaZKD34suJuGxVn5HD+9VRPi78h7D/Bi+urcBe4AplkeMnAhHgOhwo
	R9X0EwEbX4wXRDiJlJ1gZ9gqS0QRDqteAPF7DunJtKvUaXfKun/MDfjZC64HbSBy+IXlBi
	175yph0oHYiFS8sBJw88NnaAiuNSSaevtJirKqaxaPauqwbRZsOpq/FhIRm9xowUmQK7L9
	CchrIFe8xHBMxrc+BX6iZPpdZ93aBUjplil6w316rKTzKwiIHaEPmPuIEiiAzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781667515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z8KTVnvj6CZiytzjZC55rYxHlJSY9APqUbyBxvST0GI=;
	b=bkeRL8RKRCoeNxRgbMbGJZLXTNwq8rS4NkrIA/pCXA8u9rTuT3MkAe73vDxpkRJf9iopyo
	9owRKlX8i1nZj7BA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/2] riscv: unaligned: stop using kthread for vector speed probe
Date: Wed, 17 Jun 2026 05:38:23 +0200
Message-ID: <cover.1781666867.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_203839_660567_82D49AC8 
X-CRM114-Status: UNSURE (   6.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

This series is follow-up to the discussion at:
https://lore.kernel.org/linux-riscv/20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com/

It removes the kthread usage for unaligned vector access speed probe, avoiding
a bug that the kthread may still be excuting a __init function that have
already been freed.

It also allows removing some vdso synchronization, simplify the code.

This kthread has been bothering me for a while now, and the recent bug report
pushed me to post this series.

Nam Cao (2):
  riscv: unaligned: stop using kthread for
    check_vector_unaligned_access()
  Revert "riscv: hwprobe: Fix stale vDSO data for late-initialized keys
    at boot"

 arch/riscv/include/asm/hwprobe.h           |  7 ---
 arch/riscv/include/asm/vdso/arch_data.h    |  6 --
 arch/riscv/kernel/sys_hwprobe.c            | 70 ++++------------------
 arch/riscv/kernel/unaligned_access_speed.c | 19 +-----
 arch/riscv/kernel/vdso/hwprobe.c           |  2 +-
 5 files changed, 15 insertions(+), 89 deletions(-)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
