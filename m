Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402BDC7EE30
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fb2yr6WnLD56cXaYtZE4uuE5lhANeQkokCurbfAPMM=; b=LiPSIzW8FU8Rpb
	8NbtTtFlF0YM+RPcrF3ip1tVKjRDMC0ShCS5HHMUWGn89PFGB53DHmgx6RVeTBf+yFuQZtW9yey++
	mBPrTqtQi9RHkUMvggMedllNTwIcGqHXBfcTlx5i1Phu3WD/QmLzPf3Gu6mHBq8+i9qV6cf2ZqifL
	8Xq4oVwuJ/ARN+HJSiQuFOxv4vWM7lZd0OLd8tNOMzQ1ADPHc7dp80YUnnQ3TxP4DIm8EQBkGmC9a
	JNkZeiOHhtIZPTJ8HSUClZnVps0HTGvuIExMjOZStdFXsDBDTsxv9gNrhqsgNREnoGW83ZsrbbTEY
	3QkQk8X072XOGVeQDdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUri-00000009ZHI-2rqC;
	Wed, 25 Jun 2025 18:28:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQzl-00000008wXF-1Rkn
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 969D161F1E;
	Wed, 25 Jun 2025 14:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCA1DC113D0;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=ekFrZC5Q8HAZmivsKkul5NZgQJY/Ur7Qwq0Ni+Ze2Wo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sKjlndDfq6MxaQtVWwjpM2UFDVFv9aVG+aWi320g51XsmRAGUa+nh68dzP1bsD0uQ
	 KF4FtQ9Ar02z5Eb8VY0cT8okQXRWcHAuyVTqYIMJUWDEU77NXD8xq1ttGC60QU6Aak
	 bxnUU4r4h2sU1ij6LANPdsS5RnV+229meHCYZzxP+sA+iZPPSqYG/vP919FdSRvX/Z
	 XIVmGBKVO93O9/xVT+KEoL1A6KwPTZDJmVgRbCzXGGa+tBqdAY1COvjpwtF+G2Gx5M
	 60upm3f37RC3wKnMiWKMpMsFn5lGSo0ibNjxtb917MBPs3rOqDpffq/PCKV/BDK9H1
	 K3ggruSE/8BVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D68C77B7C;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:21:01 +0200
Subject: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
MIME-Version: 1.0
Message-Id: <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861258; l=1752;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=fl56XWVJR0cTZUk8jRyTT/lTH2lW6qnyqDJH+9PnqIY=;
 b=Mto7g5DhM1M9UonaHroS3dZuhWFPjWkGx378MbcFfXJMl3jVTE46hQiw0X4lreIe3FgNutkbE
 L075sqhpGpaCKa3IvHFij2pGGw2CdOaZ1s0MKYdbLOQsfXKWFHo4R1e
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
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
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Use the hwprobe syscall to decide which PAUSE instruction to execute in
userspace code.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
--- a/tools/arch/riscv/include/asm/vdso/processor.h
+++ b/tools/arch/riscv/include/asm/vdso/processor.h
@@ -4,26 +4,33 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/hwprobe.h>
+#include <sys/hwprobe.h>
+#include <asm/vendor/mips.h>
 #include <asm-generic/barrier.h>
 
 static inline void cpu_relax(void)
 {
+	struct riscv_hwprobe pair;
+	bool has_mipspause;
 #ifdef __riscv_muldiv
 	int dummy;
 	/* In lieu of a halt instruction, induce a long-latency stall. */
 	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
 #endif
 
-#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
-	/*
-	 * Reduce instruction retirement.
-	 * This assumes the PC changes.
-	 */
-	__asm__ __volatile__ ("pause");
-#else
-	/* Encoding of the pause instruction */
-	__asm__ __volatile__ (".4byte 0x100000F");
-#endif
+	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
+	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
+	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
+
+	if (has_mipspause) {
+		/* Encoding of the mips pause instruction */
+		__asm__ __volatile__(".4byte 0x00501013");
+	} else {
+		/* Encoding of the pause instruction */
+		__asm__ __volatile__(".4byte 0x100000F");
+	}
+
 	barrier();
 }
 

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
