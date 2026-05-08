Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B4CCD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XD/ljFySFfmZNiIsFKRxVadRxXtQx+lyF0l5TMHVRgQ=; b=De7ffpI/hVLNcR
	jPDDaTdjf2/3zwopjiTVjbS0gnyCrhoyj+wMMwuCtdEffoUFQQ31waeE8YgXa0uovaLrvL81BL8tv
	we3lR5lXKXSwBV5hvWT7pm5sv4vpkwveJSOOu0D59Z/NC1gxM99/lMN61F5Plpk/TFEFa8venzHxW
	4u/E7HWFvPdaehk04ZWDkp9RuHe5m0IpID6pn1SQU38Nleetj2UYaXHU3fuDQI2eg7bEbIHOKLeOU
	KinuB6Y5Dui5T9aYQ7kCSiwO2kwP2QIIv7iWBeUvVcAsbzBtGol99foOobE3NRJyPwCC2ao6xYoVp
	6o7XLk7EEfStTxV8lkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMJP-00000006gSe-1oMj;
	Fri, 08 May 2026 14:36:19 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMJM-00000006gRm-40cs
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 14:36:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778250974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQkYNSGrXU327YT/AkU4IhOfysgSoF6ODaYcCM0x4bw=;
	b=soQfuRXQPsq3NZ8fW78iQpsJ/ZZyhBNJHxGsTJY9/bNXmFfNJNQ5WqgyJM8+IVyFArJc92
	HCEqg8scVy4U/vg7bYgL4Wd1RQS7tBa1WUMjj0XQKDUsxFIK2h3pdPc5L5ZZJOppjarXva
	okv7hUBz4Sk5WpeFnjR8DjR6K0T1a+4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] riscv/purgatory: add asm/purgatory.h
Date: Fri,  8 May 2026 16:35:45 +0200
Message-ID: <20260508143544.2484-4-thorsten.blum@linux.dev>
In-Reply-To: <20260508143544.2484-3-thorsten.blum@linux.dev>
References: <20260508143544.2484-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=thorsten.blum@linux.dev; h=from:subject; bh=HB+vajFVtEoIDbr3Y2w6LEv93VTwKtHpJs0r8RrScho=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJl/v5w9pWyk9NUzseMjA7eX4pmbNg9MOF9krdX86WPTH ZPOwjG5o5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACbivJ+R4fuvny1hFkJ3sxIk /K0rObbUtDDW33V1nLv+RNAfn2fvkxn+Ck65tEKXMeCvn+eRbyUfuYM3dB6QuTPp6j5B6Q7umMM hfAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_073617_132988_F35CEA56 
X-CRM114-Status: GOOD (  10.15  )
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

Add arch/riscv/include/asm/purgatory.h and provide the purgatory()
prototype via the architecture header, mirroring the x86 layout.

Remove the workaround from arch/riscv/purgatory/purgatory.c.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/include/asm/purgatory.h | 11 +++++++++++
 arch/riscv/purgatory/purgatory.c   |  5 +----
 2 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/include/asm/purgatory.h

diff --git a/arch/riscv/include/asm/purgatory.h b/arch/riscv/include/asm/purgatory.h
new file mode 100644
index 000000000000..a63687be2517
--- /dev/null
+++ b/arch/riscv/include/asm/purgatory.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_PURGATORY_H
+#define _ASM_RISCV_PURGATORY_H
+
+#ifndef __ASSEMBLER__
+#include <linux/purgatory.h>
+
+extern void purgatory(void);
+#endif	/* __ASSEMBLER__ */
+
+#endif /* _ASM_RISCV_PURGATORY_H */
diff --git a/arch/riscv/purgatory/purgatory.c b/arch/riscv/purgatory/purgatory.c
index 15c72dafa3d8..6a6e6f611a56 100644
--- a/arch/riscv/purgatory/purgatory.c
+++ b/arch/riscv/purgatory/purgatory.c
@@ -8,9 +8,9 @@
  *
  */
 
-#include <linux/purgatory.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <asm/purgatory.h>
 #include <asm/string.h>
 
 u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
@@ -32,9 +32,6 @@ static bool verify_sha256_digest(void)
 	return memcmp(digest, purgatory_sha256_digest, sizeof(digest));
 }
 
-/* workaround for a warning with -Wmissing-prototypes */
-void purgatory(void);
-
 void purgatory(void)
 {
 	if (verify_sha256_digest())

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
