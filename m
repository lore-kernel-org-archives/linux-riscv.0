Return-Path: <SRS0=HRsY=UM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D57C31E45
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2019 07:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10352084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2019 07:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O95D5NkR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10352084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6HTDGS5OwtFrV/UKtYu1bVta+O6Mg8NzIS+U68dIys=; b=O95D5NkRPlKMBH
	Q/+xsHGgevkFy5NQrCxImIqcPXvbkguouInRADiQDBuwV7/alMNeag5XE4XtNYy08VLF6g6ck40sZ
	QxT+RLQsjRPuVKbTY1Eh0BNPfIAyOm0pXyHs1SO42R6Bq4c56yQRiJMVGcLyiHE7v/N1sT+DDBQJU
	dWq1vSfgfHSpbPcEbd0/Kc/y4krFf2IAkIqrCfvLGqlPO2PYiSeAx/+P6Nqt/v7e0HGgg7bwLhpG3
	b0PGqnZmNPZfOmswy/n40ap3CQQFyCrGzKz93DHhgiTSJ9v7nC2VuSfXH6hrUgp5ylLGxV68ldu/i
	c4351n3nJO0GAO/ZwJaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbJsM-0005xO-HU; Thu, 13 Jun 2019 07:10:22 +0000
Received: from mpp-cp1-natpool-1-013.ethz.ch ([82.130.71.13] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbJrA-00049B-Ok; Thu, 13 Jun 2019 07:09:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 01/17] binfmt_flat: remove flat_reloc_valid
Date: Thu, 13 Jun 2019 09:08:47 +0200
Message-Id: <20190613070903.17214-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613070903.17214-1-hch@lst.de>
References: <20190613070903.17214-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-c6x-dev@linux-c6x.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This helper is the same for all architectures, open code it in the only
caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm/include/asm/flat.h        | 1 -
 arch/c6x/include/asm/flat.h        | 1 -
 arch/h8300/include/asm/flat.h      | 1 -
 arch/m68k/include/asm/flat.h       | 1 -
 arch/microblaze/include/asm/flat.h | 1 -
 arch/sh/include/asm/flat.h         | 1 -
 arch/xtensa/include/asm/flat.h     | 1 -
 fs/binfmt_flat.c                   | 2 +-
 8 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/flat.h b/arch/arm/include/asm/flat.h
index f0c75ddeea23..10cce9ecf151 100644
--- a/arch/arm/include/asm/flat.h
+++ b/arch/arm/include/asm/flat.h
@@ -10,7 +10,6 @@
 
 #define	flat_argvp_envp_on_stack()		1
 #define	flat_old_ram_flag(flags)		(flags)
-#define	flat_reloc_valid(reloc, size)		((reloc) <= (size))
 
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
diff --git a/arch/c6x/include/asm/flat.h b/arch/c6x/include/asm/flat.h
index 76fd0bb962a3..ecc6aea6606c 100644
--- a/arch/c6x/include/asm/flat.h
+++ b/arch/c6x/include/asm/flat.h
@@ -6,7 +6,6 @@
 
 #define flat_argvp_envp_on_stack()			0
 #define flat_old_ram_flag(flags)			(flags)
-#define flat_reloc_valid(reloc, size)			((reloc) <= (size))
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/arch/h8300/include/asm/flat.h b/arch/h8300/include/asm/flat.h
index f4cdfcbdd2ba..dcc7775115dd 100644
--- a/arch/h8300/include/asm/flat.h
+++ b/arch/h8300/include/asm/flat.h
@@ -10,7 +10,6 @@
 
 #define	flat_argvp_envp_on_stack()		1
 #define	flat_old_ram_flag(flags)		1
-#define	flat_reloc_valid(reloc, size)		((reloc) <= (size))
 #define	flat_set_persistent(relval, p)		0
 
 /*
diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
index 4f1d1e373420..a631caf5e18f 100644
--- a/arch/m68k/include/asm/flat.h
+++ b/arch/m68k/include/asm/flat.h
@@ -10,7 +10,6 @@
 
 #define	flat_argvp_envp_on_stack()		1
 #define	flat_old_ram_flag(flags)		(flags)
-#define	flat_reloc_valid(reloc, size)		((reloc) <= (size))
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/arch/microblaze/include/asm/flat.h b/arch/microblaze/include/asm/flat.h
index 3d2747d4c967..34be5ed011be 100644
--- a/arch/microblaze/include/asm/flat.h
+++ b/arch/microblaze/include/asm/flat.h
@@ -15,7 +15,6 @@
 
 #define	flat_argvp_envp_on_stack()	0
 #define	flat_old_ram_flag(flags)	(flags)
-#define	flat_reloc_valid(reloc, size)	((reloc) <= (size))
 #define	flat_set_persistent(relval, p)		0
 
 /*
diff --git a/arch/sh/include/asm/flat.h b/arch/sh/include/asm/flat.h
index 843d458b8329..8f2929b32f2e 100644
--- a/arch/sh/include/asm/flat.h
+++ b/arch/sh/include/asm/flat.h
@@ -13,7 +13,6 @@
 
 #define	flat_argvp_envp_on_stack()		0
 #define	flat_old_ram_flag(flags)		(flags)
-#define	flat_reloc_valid(reloc, size)		((reloc) <= (size))
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/arch/xtensa/include/asm/flat.h b/arch/xtensa/include/asm/flat.h
index b8532d7877b3..6ee5a35eb0ec 100644
--- a/arch/xtensa/include/asm/flat.h
+++ b/arch/xtensa/include/asm/flat.h
@@ -6,7 +6,6 @@
 
 #define flat_argvp_envp_on_stack()			0
 #define flat_old_ram_flag(flags)			(flags)
-#define flat_reloc_valid(reloc, size)			((reloc) <= (size))
 static inline int flat_get_addr_from_rp(u32 __user *rp, u32 relval, u32 flags,
 					u32 *addr, u32 *persistent)
 {
diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index 82a48e830018..afddea583999 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -345,7 +345,7 @@ calc_reloc(unsigned long r, struct lib_info *p, int curid, int internalp)
 	start_code = p->lib_list[id].start_code;
 	text_len = p->lib_list[id].text_len;
 
-	if (!flat_reloc_valid(r, start_brk - start_data + text_len)) {
+	if (r > start_brk - start_data + text_len) {
 		pr_err("reloc outside program 0x%lx (0 - 0x%lx/0x%lx)",
 		       r, start_brk-start_data+text_len, text_len);
 		goto failed;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
