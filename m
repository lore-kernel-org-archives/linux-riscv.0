Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98717C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 09:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A55760FA0
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 09:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A55760FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZxyVpzcGH2b48YQJCkRvhosdr9DQnYBd9r3K+hXv8w=; b=CzD/w8j9Ji1hel
	+smF7NNZPrHKVoO5+WeEZIfFB7+YOFfDUdDPaVm0hywhPa1u8RAemySEmVG0YTGudnsx1ZYftqpxs
	d/VDP9tuLVGeOxzhd1/jvXhgdLVo6rH6A9nKbOJ2olQivFIlbmlyOrVUNQLsMYkIcuENyYGYmkqV8
	c5liC9gIJGw8KIwjd9PHHmqRUQXOB2HTzsvfVgghx2RdwMwnhTWBB41vA+vSSFTIqAzRCdWBg9hKl
	5GF7R52jP6v61q5ACqjLrsnZpi/ok8Fp9xAsV/sJ4ZR0Iseoa9tykyBSIhLIWIIkQJ2v8TLSZz457
	cR8r4wtDN0FDLz2YaMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkLK-006EU4-O7; Wed, 11 Aug 2021 09:16:10 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjxY-0067WP-1M
 for linux-riscv@lists.infradead.org; Wed, 11 Aug 2021 08:51:42 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
 by andre.telenet-ops.be with bizsmtp
 id g8rG2500S1gJxCh018rGYb; Wed, 11 Aug 2021 10:51:32 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxE-001ya9-4k; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxD-0058wr-AC; Wed, 11 Aug 2021 10:51:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 2/9] crash_dump: Make elfcorehdr address/size symbols
 always visible
Date: Wed, 11 Aug 2021 10:51:00 +0200
Message-Id: <ba965ca613c0cc82c1ec2fe353ee34fb13b36474.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_015136_408389_9B3E3C6A 
X-CRM114-Status: GOOD (  10.68  )
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

Make the forward declarations of elfcorehdr_addr and elfcorehdr_size,
and the definitions of ELFCORE_ADDR_MAX and ELFCORE_ADDR_ERR always
available, like is done for phys_initrd_start and phys_initrd_size.
Code referring to these symbols can then just check for
IS_ENABLED(CONFIG_CRASH_DUMP), instead of requiring conditional
compilation using an #ifdef, thus preparing to increase compile
coverage.

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Make ELFCORE_ADDR_{MAX,ERR} visible, too,

v4:
  - New.
---
 include/linux/crash_dump.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index a5192b718dbe4f9a..2618577a4d6da77e 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -10,13 +10,14 @@
 
 #include <linux/pgtable.h> /* for pgprot_t */
 
-#ifdef CONFIG_CRASH_DUMP
+/* For IS_ENABLED(CONFIG_CRASH_DUMP) */
 #define ELFCORE_ADDR_MAX	(-1ULL)
 #define ELFCORE_ADDR_ERR	(-2ULL)
 
 extern unsigned long long elfcorehdr_addr;
 extern unsigned long long elfcorehdr_size;
 
+#ifdef CONFIG_CRASH_DUMP
 extern int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size);
 extern void elfcorehdr_free(unsigned long long addr);
 extern ssize_t elfcorehdr_read(char *buf, size_t count, u64 *ppos);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
