Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064E8C64EAD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E1E2086D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7cM+mHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7E1E2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wANPFuzkob3aomECgdYGCv6DuSEMDDExc7uZX3FtiTQ=; b=X7cM+mHuhTTmgw
	uw5Wz3q4CIBVqFHn9FiKQSUNSTfGhhDtZi2FBYMo2MkjF2YvGjy8c82YbFofQ9WsdBRGMB5maboWZ
	fybWoFhKtG9j2Pj+mYyi1cfPnmuTAELhiY9MYVlmjPjPDlA1+T2lv6omv8fPaM9IuMKsaNbONn4ui
	o/G06yWG9ysprxJb6BMRA9dcDlrj9gpWC++sYpneis/DtY9bodkj/ZQ4CoOrX5225Fm1gShcH/K67
	tZeZ62GLbAhuwpJROR6h+n6K5spWVY1F9CobMlTNTxx7KKfG0UPStrB6vDlEduNpPvJgbrzIMT3Ay
	Y8kb8EuS313khqhgiyEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9hce-00045X-0c; Tue, 09 Oct 2018 02:19:44 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9hcZ-00042l-A9
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 02:19:40 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w992LwUj032623;
 Tue, 9 Oct 2018 10:21:58 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 9 Oct 2018
 10:19:17 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 3/5] Cleanup ISA string setting
Date: Tue, 9 Oct 2018 10:18:32 +0800
Message-ID: <1539051514-3658-4-git-send-email-alankao@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539051514-3658-1-git-send-email-alankao@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w992LwUj032623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181008_191939_598923_BADC1E9E 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincentc@andestech.com>, Zong Li <zong@andestech.com>,
 Alan Kao <alankao@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <greentime@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009021832.uh5B_PxxVmxYElSpmULk965fh4ilFqlqaj2Eztj-lIs@z>

This patch cleanup the MARCH string passing to both compiler and
assembler.  Note that the CFLAGS should not contain "fd" before we
have mechnisms like kernel_fpu_begin/end in other architectures.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/Makefile | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 61ec424..01393e1 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -28,7 +28,6 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 	
 	KBUILD_CFLAGS	+= $(call cc-ifversion, -ge, 0500, -DCONFIG_ARCH_SUPPORTS_INT128)
 
-	KBUILD_MARCH = rv64im
 	KBUILD_LDFLAGS += -melf64lriscv
 else
 	BITS := 32
@@ -36,22 +35,20 @@ else
 
 	KBUILD_CFLAGS += -mabi=ilp32
 	KBUILD_AFLAGS += -mabi=ilp32
-	KBUILD_MARCH = rv32im
 	KBUILD_LDFLAGS += -melf32lriscv
 endif
 
 KBUILD_CFLAGS += -Wall
 
-ifeq ($(CONFIG_RISCV_ISA_A),y)
-	KBUILD_ARCH_A = a
-endif
-ifeq ($(CONFIG_RISCV_ISA_C),y)
-	KBUILD_ARCH_C = c
-endif
-
-KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
+# ISA string setting
+riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32im
+riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64im
+riscv-march-$(CONFIG_RISCV_ISA_A)	:= $(riscv-march-y)a
+riscv-march-y				:= $(riscv-march-y)fd
+riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
+KBUILD_AFLAGS += -march=$(riscv-march-y)
 
-KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
