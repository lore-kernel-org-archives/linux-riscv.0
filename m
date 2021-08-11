Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B685EC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 10:00:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2805660E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 10:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2805660E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpmTm+usbJTJ8SoqggjcvoZtBhrqwWnwxtxnFbrpax4=; b=Lw76YqlTFFxB66
	HlqOpgnRth8/IH0gGkKUsfH+uyNdwqV80EQLJP7jsU31Yeag2owSjhLVVqJXBceyJkDu1h05s1DWM
	lbptJbxn7kB3wbYCndUyAu58PyyrEexMn6Aht96BjTcJl5uax8qNyX1RVTBVDXHq40NxQ2/1R5STM
	xh+87LJAXY5vciDlrRyohJhEkDsdF5fQ+4vtAr/ahp096EvMhMHmfgNYHcpsmeDDJnK9UsOV6S0VZ
	lGM3sgY8l/qJdUydIO+MJANb6Ko5NwbcVp3buMdA4LPlQ7yL7H8ixliJLV4sO8fksD28UGK9Lspzm
	zpq0IMs9F6VLS//NHgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDl1s-006UTx-Of; Wed, 11 Aug 2021 10:00:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkxE-006SOH-Or
 for linux-riscv@bombadil.infradead.org; Wed, 11 Aug 2021 09:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=SjXyeDDjjVVFSdK4kOR0Z3ruJJu84SR8mUCaj+Gu1xk=; b=SIyO9C9n8J+se8dKAEGuAVjedj
 bGFo9M9zc9rUQkk/vg62RNGtSQR9zrXzoFHs8PmZOeTvbzskX1LRzo479aC8DB+gxaqdWiNNhY5dF
 noWYarY3X+4ebDq0oI0m96B3FuxXnkv2jC11e4WMKpzsSJrxCvpfY0pj25pQQojB6GvVnFJv4fMXq
 RzDNuLSuqT66q9be/syyidpalNH5BkOwufWAwye3RQ2wHI9RJL+WdZ/Nq16dzvB5yJ0EQ2pJvNwU1
 TM4f85CgQBin57NNX1w6j1L7T6A6XnkxYPUr5WfrruamuG+O7WDtwp1lUPFaHlJ8UTEFomJlmGE7u
 4qGQ5kpw==;
Received: from newton.telenet-ops.be ([195.130.132.45])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjxZ-00800s-7Q
 for linux-riscv@lists.infradead.org; Wed, 11 Aug 2021 08:51:43 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4Gl3TL6CxkzMqlKQ
 for <linux-riscv@lists.infradead.org>; Wed, 11 Aug 2021 10:51:34 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
 by baptiste.telenet-ops.be with bizsmtp
 id g8rG2500C1gJxCh018rG4A; Wed, 11 Aug 2021 10:51:33 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxE-001yaD-6N; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxD-0058x9-D1; Wed, 11 Aug 2021 10:51:15 +0200
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
Subject: [PATCH v5 5/9] of: fdt: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD) instead
 of #ifdef
Date: Wed, 11 Aug 2021 10:51:03 +0200
Message-Id: <604c13747f09d800da6a7c12f661e1ec146f1dfd.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_095137_449481_4747FC82 
X-CRM114-Status: GOOD (  11.78  )
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

Replace the conditional compilation using "#ifdef CONFIG_BLK_DEV_INITRD"
by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to increase compile
coverage and to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - No changes,

v4:
  - New.
---
 drivers/of/fdt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bc041d8141e86e62..0142b9334559baec 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -880,7 +880,6 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 	return best_data;
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
 static void __early_init_dt_declare_initrd(unsigned long start,
 					   unsigned long end)
 {
@@ -906,6 +905,9 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 	int len;
 	const __be32 *prop;
 
+	if (!IS_ENABLED(CONFIG_BLK_DEV_INITRD))
+		return;
+
 	pr_debug("Looking for initrd properties... ");
 
 	prop = of_get_flat_dt_prop(node, "linux,initrd-start", &len);
@@ -924,11 +926,6 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 
 	pr_debug("initrd_start=0x%llx  initrd_end=0x%llx\n", start, end);
 }
-#else
-static inline void early_init_dt_check_for_initrd(unsigned long node)
-{
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
 
 /**
  * early_init_dt_check_for_elfcorehdr - Decode elfcorehdr location from flat
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
