Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16830C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 11:10:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BFC61042
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 11:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90BFC61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WgEl5pYPe2++wQUe2gO+v/N/NUaXwnB6hMGbEfi26is=; b=dso1rGqUGE4S0aIwYBmszMtzU0
	fOaNgDE8aHGpKpNNlkWTDgScuNRTUEi81BRykrw9V5JaWqMVH097g5GeAoQS2wqF12dfFywpPWeG9
	+926TJ72c0j4j/CRI8V3Le+8RX7184OUBQwEPMeehd1g7zXQRdiNokIwIDodiTxmmY5d/pAK5E4Ij
	1k4KgrqNEGQCwkRw2VMbrQTMcG3e0ipVK4L2tdEqdiQz64CDZn1jN2aQr7Uwu/TcJioLQRmw79Xcf
	eRqIdxa4amWsgoJGJ2ZqKVpZ7AMoAkI5vMAHrHEAEtiSV12A21piTomo77VD4fzJsH/Pjg7r+M0OA
	SHIxo2zQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWzsu-00Ftun-TU; Thu, 15 Apr 2021 11:10:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWznd-00Frzt-Nj
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 11:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IbDa10lNiAVDnQpyZxMsU0GsYU3d2rd0C7iMTYwbPRA=; b=cgX1FsWjetH8kYuf0EMRxYYQVF
 Z2Ss2TEWIW/fZPYilzPZltu70Boa08kPdeRbbhSL48UU1EbgIXajj2ZooD8Jo/XCxfx9ZAfxDPmfR
 H7PWqy+oaatH0Jhsx865qYfs/HGL6uT/TpezHTG/+GGAz09GL/Tc8cyBka1xQQdmgEJzzsIE34Hs6
 UNbZHW/s+mejFExDhMlzgpsOmRgFe10cjcx99kIRRiRQCA/HbSO6D2cgx1G7shQqKzAVqPQuPwRAJ
 egFuI2awaYoUgvD14YKJn3Rg5pF/uHyge17S1IiMamccdw/vKCT6ylEJHmtaed9gUoiNKWSfPk1Ld
 F91nVpcQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWzna-008Vqy-2P
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 11:04:40 +0000
X-Originating-IP: 2.7.49.219
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E665324000C;
 Thu, 15 Apr 2021 11:04:27 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] riscv: Protect kernel linear mapping only if
 CONFIG_STRICT_KERNEL_RWX is set
Date: Thu, 15 Apr 2021 07:04:26 -0400
Message-Id: <20210415110426.2238-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_040438_253026_3ACD8548 
X-CRM114-Status: UNSURE (   9.82  )
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

If CONFIG_STRICT_KERNEL_RWX is not set, we cannot set different permissions
to the kernel data and text sections, so make sure it is defined before
trying to protect the kernel linear mapping.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/kernel/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 626003bb5fca..ab394d173cd4 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -264,12 +264,12 @@ void __init setup_arch(char **cmdline_p)
 
 	sbi_init();
 
-	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
 		protect_kernel_text_data();
-
-#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
-	protect_kernel_linear_mapping_text_rodata();
+#ifdef CONFIG_64BIT
+		protect_kernel_linear_mapping_text_rodata();
 #endif
+	}
 
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
