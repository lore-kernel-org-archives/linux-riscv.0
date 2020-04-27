Return-Path: <SRS0=Khb+=6L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD88C5519D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2020 15:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF9B2054F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2020 15:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OK4kEUsd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CF9B2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eDTIOPKzZTQHcCnFmgW4aZ4Dq026VS8W9SHQ3KjAPAc=; b=OK4kEUsdiva2cJKhs9CfUS8dep
	J6WjD7Qe81LZ0aZzGp0KaYtZxURH+gUsiG/yX5lNkd1xYoY4krCYh15+qQ+fHYbIRxI5AEY2YQteZ
	dJaQLAeP4FFsqzEnO3qpPWIrFqEu02wjE1jTOdq8J453lha/FnR6kUpoKuLUZCOl/dASuaQLanqlO
	vwtt8twRKkYeH24dllWSoDRG73M8Ncy4/AKspk0zzosjRHQERQQ7+uoQgzFBsUOb8qf/29yMhbOrw
	lTsW9zJLZZB8sU+r/3EBm5N2OcdYM1xpbS+/25zMl512wc6SMsnp3vapmVJCCVhfhcHCuYoIr7pcV
	HWDtACFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT5S0-0007tB-PK; Mon, 27 Apr 2020 15:13:40 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT5Ry-0007sM-9a
 for linux-riscv@lists.infradead.org; Mon, 27 Apr 2020 15:13:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A06BAABCF
 for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2020 15:13:34 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: add Linux note to vdso
X-Yow: I'm losing my hair..did it go to ATLANTIC CITY??
Date: Mon, 27 Apr 2020 17:13:34 +0200
Message-ID: <mvmpnbtrmg1.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_081338_478866_93C8AB3D 
X-CRM114-Status: GOOD (  13.94  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The Linux note in the vdso allows glibc to check the running kernel
version without having to issue the uname syscall.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/vdso/Makefile |  2 +-
 arch/riscv/kernel/vdso/note.S   | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/vdso/note.S

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 33b16f4212f7..281dc58189e0 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -12,7 +12,7 @@ vdso-syms += getcpu
 vdso-syms += flush_icache
 
 # Files to link into the vdso
-obj-vdso = $(patsubst %, %.o, $(vdso-syms))
+obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
 # Build rules
 targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-dummy.o
diff --git a/arch/riscv/kernel/vdso/note.S b/arch/riscv/kernel/vdso/note.S
new file mode 100644
index 000000000000..2a956c942211
--- /dev/null
+++ b/arch/riscv/kernel/vdso/note.S
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This supplies .note.* sections to go into the PT_NOTE inside the vDSO text.
+ * Here we can supply some information useful to userland.
+ */
+
+#include <linux/elfnote.h>
+#include <linux/version.h>
+
+ELFNOTE_START(Linux, 0, "a")
+	.long LINUX_VERSION_CODE
+ELFNOTE_END
-- 
2.26.2


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

