Return-Path: <SRS0=eLsP=VJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106DBC742A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 02:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD19121019
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 02:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gRzMYWtW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD19121019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzxJKMs1GmBdPqM9AAwQ/8tC0MeARvZq2Ns57XYcbZU=; b=gRzMYWtW46A1F6
	XQCJRNCotRNrG5cPw8hb/Ep+QSMcH4bZHWtibXawcG59n2OKWlfebjmqOR1EzVJKKz2rywCvfkOta
	2l4ZOiIlt6HQ6ShCgEnJO2g6mH3AhWooig1EMsVkdm+QIeeoUDCY/VxNMi7dY2T6HkSu/UvjdcCzv
	H3cNWKg+OeL/7ukM1z7Q5XIBaGSHH6aVL03Kr5yoXE7c0/hz5Vy1GC3n/s5ADRWFYiGZQgy2BC8Is
	PfFpAxTL2e1BxphNzBonDj6KDPbB1L12d4aYgNcv90ILbg4olt2NMHAYtork3EZ6m5x9/fn9zypeX
	ZO7sMb0/XRGAXHtFZ+dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hllET-0001OX-Rh; Fri, 12 Jul 2019 02:24:21 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hllAq-0007S7-L8; Fri, 12 Jul 2019 02:20:39 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=18; SR=0; TI=SMTPD_---0TWfK5gm_1562898033; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfK5gm_1562898033) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:34 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 09/12] Dcumentation/sh: repointer docs to Documentation/arch/
Date: Fri, 12 Jul 2019 10:20:15 +0800
Message-Id: <20190712022018.27989-9-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190711_192036_874212_88F5AA52 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Alex Shi <alex.shi@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Since we move Documentation/sh docs to Documentation/arch/sh
dir, redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sh@vger.kernel.org
---
 Documentation/conf.py | 2 +-
 MAINTAINERS           | 2 +-
 arch/sh/Kconfig.cpu   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 3b2397bcb565..8bbe421c1d97 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -402,7 +402,7 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('security/index', 'security.tex', 'The kernel security subsystem manual',
      'The kernel development community', 'manual'),
-    ('sh/index', 'sh.tex', 'SuperH architecture implementation manual',
+    ('arch/sh/index', 'sh.tex', 'SuperH architecture implementation manual',
      'The kernel development community', 'manual'),
     ('sound/index', 'sound.tex', 'Linux Sound Subsystem Documentation',
      'The kernel development community', 'manual'),
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a245d3f02fd..84448d5838b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15169,7 +15169,7 @@ M:	Rich Felker <dalias@libc.org>
 L:	linux-sh@vger.kernel.org
 Q:	http://patchwork.kernel.org/project/linux-sh/list/
 S:	Maintained
-F:	Documentation/sh/
+F:	Documentation/arch/sh/
 F:	arch/sh/
 F:	drivers/sh/
 
diff --git a/arch/sh/Kconfig.cpu b/arch/sh/Kconfig.cpu
index 4a4edc7e03d4..fdc8b565241b 100644
--- a/arch/sh/Kconfig.cpu
+++ b/arch/sh/Kconfig.cpu
@@ -94,7 +94,7 @@ config CPU_HAS_SR_RB
 	  that are lacking this bit must have another method in place for
 	  accomplishing what is taken care of by the banked registers.
 
-	  See <file:Documentation/sh/register-banks.txt> for further
+	  See <file:Documentation/arch/sh/register-banks.txt> for further
 	  information on SR.RB and register banking in the kernel in general.
 
 config CPU_HAS_PTEAEX
-- 
2.19.1.856.g8858448bb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
