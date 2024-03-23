Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2408CD11BF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E17ujEW1mlVkEofJ0JiV8XDZ59zzX4vuLCDaaWhJSGQ=; b=Kv8eVPpJyxKdhU
	kbVen2AJRpCu6lka17gIgoFYYdEQpL/KxAOCx4heUwBVEAWTehcB69LTzyBJmJaVx4icSDtG4rQNn
	l/X4vdtY0aiZJXIhk0eUzlznrBUF0/J+nZ236JyUSKSzurqo1ZPWyFvktFFp1M6CPSSpK5s5e3CoQ
	opvAgC/ejMWuhC5lszjb2krj3PJ9Z/A2oa2gSU/8tL1rNJWrvNd1LtW/p1bt/31te8g8e3IVtxgU1
	Rb+9JmyxO07nbhykd600UbiiG485pUkGgJbmASMJPmzQO/4p2cOGIHws7QyIwhNZmHqzZcUxC9fe3
	n46ZFLH0X2maJmDZP/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnzeh-0000000AGwq-12Ra;
	Sat, 23 Mar 2024 11:35:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnzee-0000000AGwF-1rgR
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 11:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9FA4ECE102A;
	Sat, 23 Mar 2024 11:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2199C433C7;
	Sat, 23 Mar 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711193713;
	bh=s3Msyc9z8t/gpktSf5g/K9aT1iYIR1/xxL+MBJH1F94=;
	h=From:To:Cc:Subject:Date:From;
	b=HLIkyaAVFf3l3DbhPZk9xviQiFV/PGYTECEs1BTZqZnoenoLlJYx1xvTka2Xflj4s
	 K1kxHD1db8ZLETyX1l9dUaYRgOQyqT53YjWx08x6nEtjpj4z45UYo+7Nb+KgelULNi
	 7QeXf8ZtKyST67cH3XrYNk+F4uf0AxxF6fJSC/zVhbvexyyO5IQ939J6JP8I4VJe7v
	 jLV3DY+mPInjpatl7g5TE3wqNDFCSRV2jW71xeMx0MkyCA9i8TE4Dvwt7jOvJKIeKx
	 1J1fGPX4n4ButwoQSsqJrJVfUZzbUGsNcfM4/B8Z0lIm4bB0Xpjk3m8GLFTBuFT7h3
	 IhsT5FtpJ+WUw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] riscv: merge two if-blocks for KBUILD_IMAGE
Date: Sat, 23 Mar 2024 20:35:00 +0900
Message-Id: <20240323113500.1249272-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_043516_686029_50C3ED7D 
X-CRM114-Status: UNSURE (   6.59  )
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

In arch/riscv/Makefile, KBUILD_IMAGE is assigned in two separate
if-blocks.

When CONFIG_XIP_KERNEL is disabled, the decision made by the first
if-block is overwritten by the second one, which is redundant and
unreadable.

Merge the two if-blocks.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/Makefile | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 252d63942f34..a74e70405d3f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -133,7 +133,15 @@ boot		:= arch/riscv/boot
 ifeq ($(CONFIG_XIP_KERNEL),y)
 KBUILD_IMAGE := $(boot)/xipImage
 else
+ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
+KBUILD_IMAGE := $(boot)/loader.bin
+else
+ifeq ($(CONFIG_EFI_ZBOOT),)
 KBUILD_IMAGE	:= $(boot)/Image.gz
+else
+KBUILD_IMAGE := $(boot)/vmlinuz.efi
+endif
+endif
 endif
 
 libs-y += arch/riscv/lib/
@@ -153,17 +161,6 @@ endif
 vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vdso.so
 
-ifneq ($(CONFIG_XIP_KERNEL),y)
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
-KBUILD_IMAGE := $(boot)/loader.bin
-else
-ifeq ($(CONFIG_EFI_ZBOOT),)
-KBUILD_IMAGE := $(boot)/Image.gz
-else
-KBUILD_IMAGE := $(boot)/vmlinuz.efi
-endif
-endif
-endif
 BOOT_TARGETS := Image Image.gz loader loader.bin xipImage vmlinuz.efi
 
 all:	$(notdir $(KBUILD_IMAGE))
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
