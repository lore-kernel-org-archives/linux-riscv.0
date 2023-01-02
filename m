Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ECBC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xazOyZ+U2g4Qi0hVNs45Kr3ds3r4ZHw8pbwN9s0ZXTI=; b=RkqaiO9maEzQEl
	3ia5mT3ecZsA7KRI8mBTJbl1MVhEULNZDog5/m4LgG6kJ3r12Nmi9/o8xniGa9pqSzKqQUvZYRurR
	KhBDpvIphsfI87VPJacItzpUwu3/5T2+q3PTrRLIWnGPpmMT9CeAudAHDwLRVNlOAaP922ydDWkvU
	xx1VStL+U6Xis+FRp/CUBPJPxrhL0KYSZVnZW/5vJMwUyR/ZXpYFyB5OIEImTtT8dQDZtsj9/sdsQ
	EHqGh7r8OTXGtVgeS1rK42RiwgfmfqOlFaLXNnEUfkOQkvKeBjYxfqqzC2CPbPsPdXDOqdmbMDvtj
	a0fpCDyZlPnfk+jFiOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCKGh-00BLEn-Sp; Mon, 02 Jan 2023 12:50:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCKGd-00BLCW-8T
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 12:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F2E060F85;
	Mon,  2 Jan 2023 12:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D89C433EF;
	Mon,  2 Jan 2023 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672663813;
	bh=J83fkE2BSX1IZ8EPpp2Ze1Betbt1ngFYzvqYU3Slg3I=;
	h=From:To:Cc:Subject:Date:From;
	b=PPDBfr5Q0Btm6wpX2S6XhgndtWGV2Os9tV79H12FEylL9hFMqxL/zQdrOq1trGWLm
	 gRAVcY+mq9vRNuQaNrvCwpsKhvii6iyB4/kanb9voWAZ/1luK0OPaXkduDz5w0vOL8
	 Iyz5rKy4DnfgPaP+N8tmZS/bXFNOk0uku9LY9/I/QZ0WKAatCKwzSXOwn+jQgWs9eP
	 sYPvVIeTIyUL6tlBfN06U7dZC7FLK59eCIdbuV0Wq+YFpEEQreYutZqohZqkaArG0b
	 xoXau46gBd+zEKGd9QsTuNP9V2nrrcnJ+gcw97PEGEWH7QBzG+j2BaZAMlUQTp4nH5
	 Cvx01y0dOvB0Q==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	masahiroy@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: define RUNTIME_DISCARD_EXIT
Date: Mon,  2 Jan 2023 12:49:37 +0000
Message-Id: <20230102124936.1363533-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063; i=conor.dooley@microchip.com; h=from:subject; bh=J5y6smCcDKVWS6LKYLyNRzrIDBkYbbewNOPjlfn0gJc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMmbLt0LWGd/VLlihUrL4xtTzjL+7Jc0k9//YUHQ145tCy9P uvnLpaOUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATWf+dkeFnypYXJ+QmBx5POfhfMT JEdPad6Ksn/s1V4p1ux+z62nojI8O01LyQm9krn5g+7WHW0VcNeCJ746XGuSP/MwXm9r37fZwZAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_045015_500088_328AE435 
X-CRM114-Status: GOOD (  10.97  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Masahiro noted:
> arch/riscv/kernel/vmlinux.lds.S clearly says:
> /* we have to discard exit text and such at runtime, not link time */
> [...]
> so riscv should define RUNTIME_DISCARD_EXIT like x86, arm64.

As things stand, no ill comes of this - but if "DISCARDS" was to be
re-ordered in the linker script, linking would fail.
Do as suggested by Masahiro and define RUNTIME_DISCARD_EXIT.

Link: https://lore.kernel.org/all/CAK7LNAT39aZEw=0209ovYZ2kxtOaA2a51=XD9=LqYHjkTOEK4g@mail.gmail.com/
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 4e6c88aa4d87..07c19f2a288c 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -5,6 +5,7 @@
  */
 
 #define RO_EXCEPTION_TABLE_ALIGN	4
+#define RUNTIME_DISCARD_EXIT
 
 #ifdef CONFIG_XIP_KERNEL
 #include "vmlinux-xip.lds.S"
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
