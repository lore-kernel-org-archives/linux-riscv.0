Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCB8C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 16:49:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081806105A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 16:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 081806105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FL9CexKswrnNGvmcT2giqFggO/DQEUesxEdxqEzD42k=; b=fnuVi0V6tLqNWDYck1SvaFzebq
	GkZZIYz2YlzdNDES9lGmaDJvmNdx3GQ7NE2cFVbqU+8RSeFoPqSqJEp7VQRwvvP61swlpjLv1tl3z
	aSTtYIvNBIAs/o2dH09aoQm0kfgmo2Wh/8xfGQP2r68+0ZDcyoxYbrd1s1DIudbNYuxU2DqrnVyzo
	7D0S5/IuAR1a79ojvDFqpBQZyoLAF1IxDb4FUXosKaP3VBpYuvQNbd/fw1rPg06D9q24iK5FklzDk
	8tz60HHFI+RbqnNbplk3ReAWHZ874nicKQmE45N1JhJL1SRe49G5tQkx1m0IFv56HJ6FQybJyUkS4
	XiZ63Udw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnNB-003tg1-NF; Wed, 28 Apr 2021 16:49:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnMF-003tJ9-7n
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 16:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=/9IbZ25Vxd/3aqeNz7bfVhfcbanEzHFOogl+BUrrbKY=; b=r30zTJArH86daCfCFpEgTo/Ft/
 mZz2KbDXSg5633vO6qO7mVy6rGwTLk7fIgVar10zBG4Jmuhst0Ab0+DBaR5Ld3tN906ksMfuYM5kE
 0DILfm9jH9gLIbRuAnQJH/8DUDq5NPSmMcccEDaBCi8Q98K6ussOBsafzCnU2yJRWFLgyhpHEsjSW
 nC2uetmB6FlQMqF0VhK0prO5fMnuDGv4JTBifbL7jblW8bKNiyTyvFoXY2c2T/7RgxJSpWRJ3pYFs
 O5Y23p9D5eDB+cPKrLBcgRNm9Tcoq+T5o2IdjT9DGBKEnon46ajuRPLDj1VrRJxBCFAzN8uDCSPo1
 SFUiOtBA==;
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnMB-00025z-Oa
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 16:48:13 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:91bb:828d:42f8:4e5f])
 by michel.telenet-ops.be with bizsmtp
 id yGny2400d2ZBlDX06GnyTG; Wed, 28 Apr 2021 18:48:02 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lbnLy-0014IZ-AY; Wed, 28 Apr 2021 18:47:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lbkVD-00HLPF-Sr; Wed, 28 Apr 2021 15:45:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: Only extend kernel reservation if mapped read-only
Date: Wed, 28 Apr 2021 15:45:17 +0200
Message-Id: <1a7660125046b94db9c6a7d62aa0ce88c8cd2f1d.1619617340.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094811_958204_8B4E3663 
X-CRM114-Status: GOOD (  15.32  )
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

When the kernel mapping was moved outside of the linear mapping, the
kernel memory reservation was increased, to take into account mapping
granularity.  However, this is done unconditionally, regardless of
whether the kernel memory is mapped read-only or not.

If this extension is not needed, up to 2 MiB may be lost, which has a
big impact on e.g. Canaan K210 (64-bit nommu) platforms with only 8 MiB
of RAM.

Reclaim the lost memory by only extending the reserved region when
needed, i.e. matching the conditional logic around the call to
protect_kernel_linear_mapping_text_rodata().

Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear mapping")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Only tested on K210 (SiPeed MAIX BiT):

    -Memory: 5852K/8192K available (1344K kernel code, 147K rwdata, 272K rodata, 106K init, 72K bss, 2340K reserved, 0K cma-reserved)
    +Memory: 5948K/8192K available (1344K kernel code, 147K rwdata, 272K rodata, 106K init, 72K bss, 2244K reserved, 0K cma-reserved)

Yes, I was lucky, as only 96 KiB was lost ;-)
---
 arch/riscv/mm/init.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 788eb222deacf994..3439783f26abc488 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -136,11 +136,17 @@ void __init setup_bootmem(void)
 
 	/*
 	 * Reserve from the start of the kernel to the end of the kernel
-	 * and make sure we align the reservation on PMD_SIZE since we will
+	 */
+#if defined(CONFIG_STRICT_KERNEL_RWX) && defined(CONFIG_64BIT) && \
+    defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
+	/*
+	 * Make sure we align the reservation on PMD_SIZE since we will
 	 * map the kernel in the linear mapping as read-only: we do not want
 	 * any allocation to happen between _end and the next pmd aligned page.
 	 */
-	memblock_reserve(vmlinux_start, (vmlinux_end - vmlinux_start + PMD_SIZE - 1) & PMD_MASK);
+	vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
+#endif
+	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
