Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02315C27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyGyP48k7kf3OryDz+vIn6ucDlUil4U2fjLayzm7r80=; b=tJa2bmQHXMMCT+
	jrUtos7ai2+542odLHtAL2WLa9OEnQwNYzX0teU90e82vJnPameztkKIbWjac6/g9mTpNTva112aK
	lW8hxdZY0oKAsnKOANhfjdy8+QohT74yCqQI0okZP3ebTiDURjnIcMvFJ/f9hRum/oWBrO9qOQvwP
	NWvGkhanW6Ni/p0bhEXiwSKgSD57ynsozEz+VehUSsfhoG5ZgAyZuu744v0OI7c4QqAY8GnCgkZ4I
	v+vehkGKmBc1w/JxfbSNO5XfkFfmugg9jjlshqAxBLUMuM6oovMmzW1iqRVhqkvtzVf3EFWMecj7c
	qwEJSC7sJd1e08DuDzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpAx-000T0g-84; Sat, 28 Jan 2023 17:39:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpAr-000Swj-3f; Sat, 28 Jan 2023 17:39:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE35E60C23;
	Sat, 28 Jan 2023 17:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDE8C4339C;
	Sat, 28 Jan 2023 17:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927572;
	bh=RY4Ft67/jFkA5pSWPnl3Ooh6rnb+H+w7ncPhEVFu+Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fppQbQPv2ocuYIvC8Ch2SeJpjm4xfS8JFwMLZeSKr5jpecjim9xDOjNwlWcIe4QmP
	 Jgapu1Cq6ROxAQvkWYzKZMztcHY6OUqj+Qr2MdwtUzZV/CK8vK+GsPeGGWKDO9Tz5J
	 Nymkcz2wk2TF7pvXon44OKavOBYVI5pajUoMB8ZLz3Y3wn4CEZW8gWf0N3ZURO1uqg
	 HRZAYrSXLbQFpdVbuWKAQHv2FsiVaGGJDn9JPOYJ4SNyiyzsEjNUGsZc3KG/8f7Ax/
	 ExaQiGvCbym3xIguILYiJaJtluYJf6yxAFaC5/COXJETBGeyYAfc4u0KFp6+UfrkGt
	 dytviqXK8mU8Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 03/13] riscv: hwcap: make ISA extension ids can be used in asm
Date: Sun, 29 Jan 2023 01:28:46 +0800
Message-Id: <20230128172856.3814-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_093933_265126_546B0136 
X-CRM114-Status: GOOD (  13.97  )
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

So that ISA extensions can be used in assembly files, convert the
multi-letter RISC-V ISA extension IDs enums to macros.
In order to make them visible, move the #ifndef __ASSEMBLY__ guard
to a later point in the header

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 45 ++++++++++++++++------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 57439da71c77..8e0ee841fa77 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -12,20 +12,6 @@
 #include <linux/bits.h>
 #include <uapi/asm/hwcap.h>
 
-#ifndef __ASSEMBLY__
-#include <linux/jump_label.h>
-/*
- * This yields a mask that user programs can use to figure out what
- * instruction set this cpu supports.
- */
-#define ELF_HWCAP		(elf_hwcap)
-
-enum {
-	CAP_HWCAP = 1,
-};
-
-extern unsigned long elf_hwcap;
-
 #define RISCV_ISA_EXT_a		('a' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
@@ -46,23 +32,34 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_BASE 26
 
 /*
- * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
+ * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
  * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
  * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
  * extensions while all the multi-letter extensions should define the next
  * available logical extension id.
  * Entries are sorted alphabetically.
  */
-enum riscv_isa_ext_id {
-	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
-	RISCV_ISA_EXT_SSTC,
-	RISCV_ISA_EXT_SVINVAL,
-	RISCV_ISA_EXT_SVPBMT,
-	RISCV_ISA_EXT_ZICBOM,
-	RISCV_ISA_EXT_ZIHINTPAUSE,
-	RISCV_ISA_EXT_ID_MAX
+#define RISCV_ISA_EXT_SSCOFPMF		26
+#define RISCV_ISA_EXT_SSTC		27
+#define RISCV_ISA_EXT_SVINVAL		28
+#define RISCV_ISA_EXT_SVPBMT		29
+#define RISCV_ISA_EXT_ZICBOM		30
+#define RISCV_ISA_EXT_ZIHINTPAUSE	31
+
+#ifndef __ASSEMBLY__
+#include <linux/jump_label.h>
+/*
+ * This yields a mask that user programs can use to figure out what
+ * instruction set this cpu supports.
+ */
+#define ELF_HWCAP		(elf_hwcap)
+
+enum {
+	CAP_HWCAP = 1,
 };
-static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
+
+extern unsigned long elf_hwcap;
+
 
 /*
  * This enum represents the logical ID for each RISC-V ISA extension static
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
