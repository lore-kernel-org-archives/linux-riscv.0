Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF30C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OO4OXfZ7ckG/kLyXLmJF4o8Ufms1tuckUJgZtDp7ozI=; b=ojcM2Pb00Gavj/
	+ExClrPhYy9Nxr++oqM3jKs8WDia8s50yjVLyzimptrIAGtIREssRwxSEG5UB6lh46Kb78S/PqEVo
	6AVbxMC3VBW347dLmgeK7hL2iL22neaPpsNE337QjMihetsLZajzLpYZ5QFBajc+2tKeBtXbI8Io3
	VYim/b3d5BMFzAyQeJb41gfddo5wtK8O3pKIw2afxR+05++G748We1V/Og2GxQjmetlkLrDZ1RSyn
	l4DLQf6++d9F4t5H7TTf+pNf0MW72hkhZpzL2/vG7QTXpIShjglb8SjT7RkXIh4iH+kJrUo04wYS4
	hrrUxY5iVkd1h8lVlrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxP71-00000001p7p-433M;
	Thu, 18 Apr 2024 10:35:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxP6x-00000001p6e-0BYN
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 10:35:26 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713436521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9obvaWEEEdGVSr28CMv6Cu4kAaroOIyrSClUKb5FyOY=;
	b=rFoTg+5OscplOaVXCHK/7cHWKm5qOdAWblkqZCJ4vMeOn8y66abd6BreT1dDnFVPIaJNVv
	p/hp4pRcVCOw04EJpMLmY1szbPdhyMQ2HFjpRkmDBJOhtx4HHbYjvFcbpkPietVTHmQrrn
	zxRRoVm4xJ5hzULwg9DSeqh0PYBILFnoFxNaWkgCjR0NXrpWoNDkAmoo2pj9tK/H1s6NAF
	/sQxEmmMmTQyftLxWpmCSNAaJTp5D+XI8olwQ/8vYgbBa8WVWW/7tPDRO0RkCTx35M+wwd
	N41gq0rbAGXQyGPUu+uOvXtM/Wqp9Cbq3A1/UijMAY80/oNXauN5duvfOZdTBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713436521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9obvaWEEEdGVSr28CMv6Cu4kAaroOIyrSClUKb5FyOY=;
	b=OkgiFbzKFvUFsoqftpSJySJo2U0wWkhDCM7WswDQsLc3kI9ofNu49Xa0uBH+A6iGWmTwFN
	xHdX+y73q6HTaOAQ==
To: Mike Rapoport <rppt@kernel.org>,
	Andreas Dilger <adilger@dilger.ca>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"ndesaulniers @ google . com" <ndesaulniers@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tejun Heo <tj@kernel.org>,
	Krister Johansen <kjlx@templeofstupid.com>,
	Changbin Du <changbin.du@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] init: fix allocated page overlapping with PTR_ERR
Date: Thu, 18 Apr 2024 12:29:43 +0200
Message-Id: <20240418102943.180510-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_033523_329887_C9F1D629 
X-CRM114-Status: GOOD (  13.63  )
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

There is nothing preventing kernel memory allocators from allocating a
page that overlaps with PTR_ERR(), except for architecture-specific
code that setup memblock.

It was discovered that RISCV architecture doesn't setup memblock
corectly, leading to a page overlapping with PTR_ERR() being allocated,
and subsequently crashing the kernel (link in Close: )

The reported crash has nothing to do with PTR_ERR(): the last page
(at address 0xfffff000) being allocated leads to an unexpected
arithmetic overflow in ext4; but still, this page shouldn't be
allocated in the first place.

Because PTR_ERR() is an architecture-independent thing, we shouldn't
ask every single architecture to set this up. There may be other
architectures beside RISCV that have the same problem.

Fix this one and for all by reserving the physical memory page that
may be mapped to the last virtual memory page as part of low memory.

Unfortunately, this means if there is actual memory at this reserved
location, that memory will become inaccessible. However, if this page
is not reserved, it can only be accessed as high memory, so this
doesn't matter if high memory is not supported. Even if high memory is
supported, it is still only one page.

Closes: https://lore.kernel.org/linux-riscv/878r1ibpdn.fsf@all.your.base.are.belong.to.us
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: <stable@vger.kernel.org> # all versions
---
 init/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/main.c b/init/main.c
index 881f6230ee59..f8d2793c4641 100644
--- a/init/main.c
+++ b/init/main.c
@@ -900,6 +900,7 @@ void start_kernel(void)
 	page_address_init();
 	pr_notice("%s", linux_banner);
 	early_security_init();
+	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE); /* reserve last page for ERR_PTR */
 	setup_arch(&command_line);
 	setup_boot_config();
 	setup_command_line(command_line);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
