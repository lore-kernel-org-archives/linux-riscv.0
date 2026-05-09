Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14015CD37B5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfOK3ZL0yWKi13/Cw28tzz/30Sw3Benmvr7dU5N4qg4=; b=LdhLKCUEVG6ZiL
	iQQjiCZacKAGBy9zDb3v1xSMxAfdtolOo8vUm7NcsNrkDhWvUECAdSdBvQboTKsojcsy8IYJN7F0s
	8mUCP4ronA4PKGrJUNlK25vY2KZ63plPZqQlrrAYTXnozT3h2zVa1Qde597892zteyZWn3pdxkE5w
	H0BW/VHe/POugRUTOy1p6enWafEwzsgzZ4qs+vwubeBov069PF2Poek1N7A7WkEWfxqlY3MwPZoHU
	+itFFANgESaXCeGy1V+i4rjHbiDrWjEK71nlnN7GVUokcQk8GDYwYslYDdK/AXExUbbTtbfcGDLtN
	bhwdvVco0f4EwLXp5uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcHX-00000008VF9-2sEP;
	Sat, 09 May 2026 07:39:27 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcHU-00000008VDe-1SAr
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 07:39:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778312362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foDb7jRhQ7tTjvHMCNJc4xapsrfITaiL459E77sMl4c=;
	b=qljhDLO0ORexztI863p++m93L7kO2CAsowpr2erFMXCPPmD23VjzWqZtOE9jptQ0/89EZ/
	B55U8cQZEK/ouoHMnkajZQQ6dKuxXF4Go2Bx/iyI425ATrQVQ58/kTBXKLqdEeYAv05O1b
	g4uXrmAbPEtPIGpyrulLxQpwV39e7fA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv/purgatory: add asm/purgatory.h
Date: Sat,  9 May 2026 09:38:51 +0200
Message-ID: <20260509073850.44595-4-thorsten.blum@linux.dev>
In-Reply-To: <20260509073850.44595-3-thorsten.blum@linux.dev>
References: <20260509073850.44595-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=thorsten.blum@linux.dev; h=from:subject; bh=m3P5UTf7QNWv2g5DbtvZi4S8gvDYX5rkrsOoDucAc9c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJn/nkwzPlXDmhb3f4H+0ch3exf6XJJjvrParWfKoX27l +bzvbwc0VHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATCX3LyLCi13bRQSORldeP z7j8U9zmk3rrwy055k6sNoGxQXuOZWxlZLjIs767qOCHWU1ok2ph7EUxNgkXhscvNum4dpr3vZT o5wMA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_003924_556039_5E54C070 
X-CRM114-Status: GOOD (  10.44  )
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
No changes in patch 2/2.
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
index 745deeb6e3a5..3474e3abe5d7 100644
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
 	return memcmp(digest, purgatory_sha256_digest, sizeof(digest)) == 0;
 }
 
-/* workaround for a warning with -Wmissing-prototypes */
-void purgatory(void);
-
 void purgatory(void)
 {
 	if (!verify_sha256_digest())

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
