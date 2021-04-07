Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE39C433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 05:35:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19FC613B8
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 05:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C19FC613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Mgb4SBB8eZCs7bG4QbVU909eGI4dQ+McF6p14Z/Yn8=; b=CKeq0DOTmJ8POzR7d1oW1YZ9T
	EHQZJTL++Vo7W+aXDL+76PbZZn3bp+MFMQdgtvbtRz5Pg1qKOIgqeaA7LzU+PzAQmK5oVc6S+EE4U
	5IVZcpY0tQ7AhCkdJNCuzZehedystPO2Rf/iHIboPgrD/xEqUadvdTptDjcP3qBK+AHt+s7Hguf94
	ynOYo4LTuGNYm7nkxjystWTwTp9ia1DMaTINZzEwSkvn5fsIQA7xkwD1oGhTLwvNe1NrEW5L3RcUR
	JWygUbbr+a0obeTeEZk0DqJrmNg0o1rG6AE8vv5pvxH86q7+Nfyv1rWyprbIKy4afEXzeRTFCTHxY
	o6OoAIdRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU0qg-0048DU-8H; Wed, 07 Apr 2021 05:35:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU0qW-0048BC-2h
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 05:35:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD09B613B8;
 Wed,  7 Apr 2021 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617773715;
 bh=1LtG+7DK6bKnBi2fiCGvmOM2s+/3SEL/McsxhTD/qJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FiAjfIrc+lYbxFl7uEMgtFbNoQWG9fQ9+R5YhhD6ILil9yXVjnuxL4vjTRSrdbAN+
 P752TFTKp+ls8/yMWH5+MhgMWcch0jJRAkSetV9r8qHUbw+XmMxqJfnTG7CIsfHIyg
 Zzrl98tHawNoaBMihLWOeOaJj4UFGHJ6hgPWvGJ8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH 08/20] kbuild: riscv: use common install script
Date: Wed,  7 Apr 2021 07:34:07 +0200
Message-Id: <20210407053419.449796-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407053419.449796-1-gregkh@linuxfoundation.org>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_063521_009816_4827C364 
X-CRM114-Status: GOOD (  14.68  )
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

The common scripts/install.sh script will now work for riscv, all that
is needed is to add the compressed image type to it.  So add that file
type check and remove the riscv-only version of the file.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/riscv/boot/Makefile   |  4 +--
 arch/riscv/boot/install.sh | 60 --------------------------------------
 scripts/install.sh         |  3 +-
 3 files changed, 4 insertions(+), 63 deletions(-)
 delete mode 100644 arch/riscv/boot/install.sh

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index 03404c84f971..4ba33aec4ccb 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -47,9 +47,9 @@ $(obj)/loader.bin: $(obj)/loader FORCE
 	$(call if_changed,objcopy)
 
 install:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(CONFIG_SHELL) $(srctree)/scripts/install.sh $(KERNELRELEASE) \
 	$(obj)/Image System.map "$(INSTALL_PATH)"
 
 zinstall:
-	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
+	$(CONFIG_SHELL) $(srctree)/scripts/install.sh $(KERNELRELEASE) \
 	$(obj)/Image.gz System.map "$(INSTALL_PATH)"
diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
deleted file mode 100644
index 18c39159c0ff..000000000000
--- a/arch/riscv/boot/install.sh
+++ /dev/null
@@ -1,60 +0,0 @@
-#!/bin/sh
-#
-# arch/riscv/boot/install.sh
-#
-# This file is subject to the terms and conditions of the GNU General Public
-# License.  See the file "COPYING" in the main directory of this archive
-# for more details.
-#
-# Copyright (C) 1995 by Linus Torvalds
-#
-# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
-# Adapted from code in arch/i386/boot/install.sh by Russell King
-#
-# "make install" script for the RISC-V Linux port
-#
-# Arguments:
-#   $1 - kernel version
-#   $2 - kernel image file
-#   $3 - kernel map file
-#   $4 - default install path (blank if root directory)
-#
-
-verify () {
-	if [ ! -f "$1" ]; then
-		echo ""                                                   1>&2
-		echo " *** Missing file: $1"                              1>&2
-		echo ' *** You need to run "make" before "make install".' 1>&2
-		echo ""                                                   1>&2
-		exit 1
-	fi
-}
-
-# Make sure the files actually exist
-verify "$2"
-verify "$3"
-
-# User may have a custom install script
-if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
-if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
-
-if [ "$(basename $2)" = "Image.gz" ]; then
-# Compressed install
-  echo "Installing compressed kernel"
-  base=vmlinuz
-else
-# Normal install
-  echo "Installing normal kernel"
-  base=vmlinux
-fi
-
-if [ -f $4/$base-$1 ]; then
-  mv $4/$base-$1 $4/$base-$1.old
-fi
-cat $2 > $4/$base-$1
-
-# Install system map file
-if [ -f $4/System.map-$1 ]; then
-  mv $4/System.map-$1 $4/System.map-$1.old
-fi
-cp $3 $4/System.map-$1
diff --git a/scripts/install.sh b/scripts/install.sh
index 934619f81119..9c8a22d96255 100644
--- a/scripts/install.sh
+++ b/scripts/install.sh
@@ -50,7 +50,8 @@ if [ -x ~/bin/"${INSTALLKERNEL}" ]; then exec ~/bin/"${INSTALLKERNEL}" "$@"; fi
 if [ -x /sbin/"${INSTALLKERNEL}" ]; then exec /sbin/"${INSTALLKERNEL}" "$@"; fi
 
 base=$(basename "$2")
-if [ "$base" = "bzImage" ]; then
+if [ "$base" = "bzImage" ] ||
+   [ "$base" = "Image.gz" ] ; then
 	# Compressed install
 	echo "Installing compressed kernel"
 	base=vmlinuz
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
