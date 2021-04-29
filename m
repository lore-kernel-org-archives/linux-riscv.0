Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043B0C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 15:05:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCD76143B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 15:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCD76143B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XNcsT3/+jKdSi02nXcAc01inU/qq8qyQKw9sVTHjfgo=; b=RdowraKKpgFT9IPKwlHkgrZ8XV
	mRTDiclfs2KwdK/uQy1qdVY/ExDscLUbXZvSjrAf1sV9vBeML5nJmZ4+PPPtqIpCOZTTmh6mh8dKK
	HB/yFh6Ego8eYC9ISnd0dc/3AhjglqrNcW/gIAyr/6B+2EPY9RUIAxdtd49etyVIzseH0vUTdVflI
	8KWd8UoJKROzFSH8pZOBjlwgEDBufPm55Q6lZO3h1vX+07cEUiDEbm/pwdSBwOLoUbbCQRF9yFkY5
	R/wPfRN0HH2yMNe/iECb3d7jEho/WAcqcBKBiSORJW580kdT5EIsZLCooxeLJihzKNk0q6lbQbZ91
	akSchMZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc8E7-005tMs-JO; Thu, 29 Apr 2021 15:05:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8E4-005tMU-6u
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 15:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hTMOOgzfGIx1PKOZrURGjf5gY7SvqMN7rEkC9C+rECQ=; b=BEOBKMKFdxAF32GpQiLUf4cxCZ
 RdrjZotY73U3wDvSQALES0zpcwXiQsLYHIAI37IBCe4+ouwJAbg6WIT0ew1EUegYExhNVxyODgRyD
 4ltU/PAIHLVmr5ZcQuDDfCrIQYUpxOD4+fH7nEW6WWniioMN7KEUid4JDlBZaZSQS9OctGgbNKHUh
 2t0K7KrWsYwvzuzxAa/O/NOrU7r7nPJn0thlnIjsuXRxEP3V/uucwghpPvYF++vs3OY1gpgHvzU2m
 Adpnsr8bfZootA0A+IR+F9fRx9amRkrmuHw33UMsDIl8cgyD/+mqFK0XvOLAIkgf4Qo8O9Ck6BCuw
 SDqJDs0w==;
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8E1-000iFY-7p
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 15:05:10 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
 by albert.telenet-ops.be with bizsmtp
 id yf532400w4p6Y3806f535w; Thu, 29 Apr 2021 17:05:04 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc8Du-001HhU-BI; Thu, 29 Apr 2021 17:05:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc8Dt-009d6c-Pu; Thu, 29 Apr 2021 17:05:01 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] riscv: Only extend kernel reservation if mapped read-only
Date: Thu, 29 Apr 2021 17:05:00 +0200
Message-Id: <02e05df076da23fc0f52c944bbf0a5cb99e95bd6.1619708542.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_080509_441938_DB6F06B6 
X-CRM114-Status: GOOD (  15.05  )
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
needed, i.e. depending on a simplified version of the conditional logic
around the call to protect_kernel_linear_mapping_text_rodata().

Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear mapping")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Simplify the conditional, as STRICT_KERNEL_RWX depends on
    MMU && !XIP_KERNEL.

Only tested on K210 (SiPeed MAIX BiT):

    -Memory: 5852K/8192K available (1344K kernel code, 147K rwdata, 272K rodata, 106K init, 72K bss, 2340K reserved, 0K cma-reserved)
    +Memory: 5948K/8192K available (1344K kernel code, 147K rwdata, 272K rodata, 106K init, 72K bss, 2244K reserved, 0K cma-reserved)

Yes, I was lucky, as only 96 KiB was lost ;-)
---
 arch/riscv/mm/init.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 788eb222deacf994..3ebc0f5d2b73b42b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -136,11 +136,16 @@ void __init setup_bootmem(void)
 
 	/*
 	 * Reserve from the start of the kernel to the end of the kernel
-	 * and make sure we align the reservation on PMD_SIZE since we will
+	 */
+#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
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
