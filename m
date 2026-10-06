Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627A8CA5FFF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7C+ZItI1dOnTCpsjLQ8HDZO/DVoByj3kTb8pP5L8hg=; b=J2/pSnHvw2oM1w
	KqynGyjZS4X0pNzE2PbX8CNOB+oW9y1HmgxNfF2NGGR5LRnY4Yaa4A02/9R4VNHXLtHp5psSw/uUo
	PZ49b6thIRxQvVWpmsTP+gDSPEU8WHROtcRNjdeqSosE6utb6yZzG9pyft05xOOkZHb5nzRfrg3E1
	3RAYRqgG8nTAqqWAyV8rdjDue/lg6kbB1suea3qydx8D2cSxvAxkzjHiF1s/LxCorm8DHBdYiTyT3
	9TvFbtHFzl/vt2sUHVROoj4pGGsrEN3lexb7UDNOaaAsoknUbD94c6FxEeivG++R8GysT9XNECjy7
	gGQneBFKrZ8mPInYF+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtA4-0000000HOaj-1ZHh;
	Tue, 06 Oct 2026 00:36:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtA2-0000000HOa8-2tvL
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 409CE601FF;
	Tue,  6 Oct 2026 00:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF663C4AF63;
	Tue,  6 Oct 2026 00:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791246960;
	bh=PuIzazG1WDn6+b7O+FsK76ydRCstCMtz6LHyTRHphmU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sE8mG7huEoa+ve6wYUuZsYm1TkfvqxL0Wv6NUg9YwuFyiIDKz5lfgLd0swx4mObXj
	 hjcbhW/+8peE4JuDvI4ULLO3vyZoIhx6Bk+6pDyioZ6UxdMug/UzseDKlRdWKpn4UW
	 Iu6xxQ4CPBVVxWWwryttrKGm/YJLdoO1r8VGSkEKOTlGnErWxphblRD4de2W2rpryD
	 dJj1YzsCUZXXGf/3+mzPg5g9+wVvniLv8bzieiuWL6RKkfLIi6GUFc8zACXWIjLy4O
	 /BC63xkyglkFsPDoINtPvd8nT2BS3o+VmiLCtQdwRPGuPkIn/dy/8g5ftdut6gSisc
	 XZyhbBJ0l1NvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC614CA5FFF;
	Tue,  6 Oct 2026 00:36:00 +0000 (UTC)
From: Gleb Pesin via B4 Relay <devnull+dormancygrace.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 03:35:55 +0300
Subject: [PATCH 2/3] riscv: Make the vendor extension headers usable from
 assembly
MIME-Version: 1.0
Message-Id: <20261006-riscv-xtheadvector-vs-v1-2-b00e5abc9f7a@gmail.com>
References: <20261006-riscv-xtheadvector-vs-v1-0-b00e5abc9f7a@gmail.com>
In-Reply-To: <20261006-riscv-xtheadvector-vs-v1-0-b00e5abc9f7a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Chiu <tchiu@tenstorrent.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, stable@vger.kernel.org, 
 Gleb Pesin <dormancygrace@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791246959; l=3518;
 i=dormancygrace@gmail.com; s=20261006; h=from:subject:message-id;
 bh=uS9Af9tVoEa4c8sQkOgjv/oYrhckO8osB2DVAqKiDJQ=;
 b=I76PHL05C45eefzwCne75zKJetUcvKyxASA+9GHQHReQHPfJWy9KtwPAkZqJGQjsO5B+WPb/r
 G5jFL7LEXOhDaleql+jNFOTSav9N5LXlgtjDTjSYQZxQz+8FKUp6Y0b
X-Developer-Key: i=dormancygrace@gmail.com; a=ed25519;
 pk=Ha8pk6XE0bhPh/mNtu1MKWgYqiX+CxZdhLyDR1rgD/M=
X-Endpoint-Received: by B4 Relay for dormancygrace@gmail.com/20261006 with
 auth_id=1121
X-Original-From: Gleb Pesin <dormancygrace@gmail.com>
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
Reply-To: dormancygrace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Gleb Pesin <dormancygrace@gmail.com>

<asm/vendor_extensions.h> and <asm/vendor_extensions/thead.h> provide
the constants that ALTERNATIVE() needs for a vendor extension
(RISCV_VENDOR_EXT_ALTERNATIVES_BASE and RISCV_ISA_VENDOR_EXT_*), but
they also pull in C headers and declarations, so assembly files cannot
include them.

Keep the constants visible to assembly and guard the rest with
__ASSEMBLY__. No functional change.

This is needed by the next patch, which uses the xtheadvector
alternative in entry.S.

Cc: stable@vger.kernel.org # 6.14+: needed by the next patch
Assisted-by: LLM
Signed-off-by: Gleb Pesin <dormancygrace@gmail.com>
---
 arch/riscv/include/asm/vendor_extensions.h       | 28 ++++++++++++++----------
 arch/riscv/include/asm/vendor_extensions/thead.h |  8 +++++--
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 7437304a7..c9fca8591 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -6,16 +6,25 @@
 #ifndef _ASM_VENDOR_EXTENSIONS_H
 #define _ASM_VENDOR_EXTENSIONS_H
 
-#include <asm/cpufeature.h>
-
-#include <linux/array_size.h>
-#include <linux/types.h>
-
 /*
  * The extension keys of each vendor must be strictly less than this value.
  */
 #define RISCV_ISA_VENDOR_EXT_MAX 32
 
+/*
+ * The alternatives need some way of distinguishing between vendor extensions
+ * and errata. Incrementing all of the vendor extension keys so they are at
+ * least 0x8000 accomplishes that.
+ */
+#define RISCV_VENDOR_EXT_ALTERNATIVES_BASE	0x8000
+
+#ifndef __ASSEMBLY__
+
+#include <asm/cpufeature.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
 struct riscv_isavendorinfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_VENDOR_EXT_MAX);
 };
@@ -32,13 +41,6 @@ extern struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[];
 
 extern const size_t riscv_isa_vendor_ext_list_size;
 
-/*
- * The alternatives need some way of distinguishing between vendor extensions
- * and errata. Incrementing all of the vendor extension keys so they are at
- * least 0x8000 accomplishes that.
- */
-#define RISCV_VENDOR_EXT_ALTERNATIVES_BASE	0x8000
-
 #define VENDOR_EXT_ALL_CPUS			-1
 
 bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit);
@@ -101,4 +103,6 @@ static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsign
 	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
 }
 
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_VENDOR_EXTENSIONS_H */
diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index e85c75b3b..625f44175 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -4,13 +4,15 @@
 
 #include <asm/vendor_extensions.h>
 
-#include <linux/types.h>
-
 /*
  * Extension keys must be strictly less than RISCV_ISA_VENDOR_EXT_MAX.
  */
 #define RISCV_ISA_VENDOR_EXT_XTHEADVECTOR		0
 
+#ifndef __ASSEMBLY__
+
+#include <linux/types.h>
+
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
@@ -19,6 +21,8 @@ void disable_xtheadvector(void);
 static inline void disable_xtheadvector(void) { }
 #endif
 
+#endif /* __ASSEMBLY__ */
+
 /* Extension specific helpers */
 
 /*

-- 
2.53.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
