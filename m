Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DC1CD8CA4
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 20:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wsvYLLmENIrxhseCmhN/JgWrGDaZVkP8iL3KIgeQKCw=; b=4ghi/b1wO4AoNR
	PB8umBHR4i6WGfxYhEalQaC/DHE3I15Hyp/GyBO01EvzLsU25XHgK4ODrqscsdxJmnTHBfBk/JXCq
	xjAKVJ/zwcrhEropEiBIO7lsNUXHlnmpFbOeOYwm7rTlt8TL6aPtTtCmDXIWXH4Thvj1UHXItWRkw
	BdbxT9SwFX5NIDS7dZYbEfXI6/Wh57Af04LKP/wOcC1D86i4mfQHWzGW9i1swLgpwwG/JCuxvlBuh
	PZXXhcYqCuI0ERoJ3ynH25772Doq2mhzbnbVv6wfyfFNBxb93LEDCW96FDU8irHfzFxynn3r5GiK4
	uM/glu7GfkKCQGlJXfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgRf-00000004LzL-0nBT;
	Mon, 08 Jun 2026 20:19:39 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgRc-00000004Lyx-2eCs
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 20:19:37 +0000
Received: from ipservice-092-209-184-216.092.209.pools.vodafone-ip.de ([92.209.184.216] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wWgRT-00000001vbF-2T2A;
	Mon, 08 Jun 2026 22:19:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Chen Pei <cp0613@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] riscv: ftrace: sorttable: fix mcount sorting
Date: Mon,  8 Jun 2026 22:18:27 +0200
Message-ID: <20260608201904.715374-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_131936_693717_C9EEB8CE 
X-CRM114-Status: GOOD (  11.22  )
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

Commit de04fca5d2f8 ("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT")
enabled mcount sorting for risc-v. On my system, the sorting changes all
entries to address 0. The startup test reports that the mcount section is
properly sorted, but no traceable functions are registered at boot time.

[    0.000000] ftrace section at ffffffff8101bba0 sorted properly
[    0.000000] ftrace: allocating 0 entries in 128 pages
[    0.000000] ftrace: allocated 128 pages with 1 groups

The sorttable helper program does not take into account that the
-fpatchable-function-entry compiler flag reserves an additional 8 bytes
before each traceable function. (The size in bytes is the same for
RV32/64 or compressed/uncompressed instructions).

Define before_func = 8 to fix the mcount sorting for risc-v, share this
setting with arm64.

Fixes: de04fca5d2f8 ("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 scripts/sorttable.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index e8ed11c680c6..da70f0938d04 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -895,13 +895,19 @@ static int do_file(char const *const fname, void *addr)
 #ifdef MCOUNT_SORT_ENABLED
 		sort_reloc = true;
 		rela_type = 0x403;
-		/* arm64 uses patchable function entry placing before function */
+#endif
+		/* fallthrough */
+	case EM_RISCV:
+#ifdef MCOUNT_SORT_ENABLED
+		/*
+		 * risc-v and arm64 use patchable function entry that stores
+		 * 8 bytes of nops before the function
+		 */
 		before_func = 8;
 #endif
 		/* fallthrough */
 	case EM_386:
 	case EM_LOONGARCH:
-	case EM_RISCV:
 	case EM_S390:
 	case EM_X86_64:
 		custom_sort = sort_relative_table_with_data;
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
