Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4F6C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 17:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kYYzbvHeDA07PXUvWLI4rahhZMoxwR7kOCxc76b9Jc=; b=Bro0m2VCq/j5RK
	pqy6/dd2iRRhoMIDStLjCPIQyf1Tvfa9KjCel/aHWJ+gpnI3IquIg6TnEG5DlZywFKjH/3PFJj1IV
	YO6NP376QuEVufgah1HM284x/60h60MX09RCQP/vLO6d5mQQjF0Vry4YPYpUMVcW8Dzjl5Ow/3OFQ
	gES6nEzeaKrYkKBWzB12ZuL5FTWv4ql4qWstXkR56gNpGoF/4iJ4jmEJx+yILtQ6zcK8qrWqsb/vu
	zq1+sV2bO+RJs4tF+ta211c1MNpNOlRci25wllhoN8P0ZCYfZ/3R4IsywaWifUEkc5I4gh4nnq7li
	v1L3fda+v+Fy4RfSaOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezVW-000000086BR-2HFb;
	Thu, 24 Jul 2025 17:13:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexnD-00000007pqQ-3OTQ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 15:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1000CA56528;
	Thu, 24 Jul 2025 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85750C116D0;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753370614;
	bh=JIi4MqCnTBTpO0jvbIQfNOEuOh4NNnMUtSNnb8YegrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=McGJNl0PvMGj9X5HL2FaCTjI2IQBUM2p8mFAN3BhinzjJv6+SYAbpIHgEh+PC9EYv
	 l15goHHubFCSXPH9jduEmPTENa7IksoXCeHe/driR2n0dIeZof1TLpGyuLkjLT+7iC
	 qtL97CwC+02BU72B3K+VqMI5hB1NJnzDMaEPt+1wSEG1qN3Ih+MIwv5Lb2ScMrAL9Q
	 AVJli42SkXXtJl8eDAXjRhFflm7Qk0PgApOAoESEFiCtP1GrD0vf6V/+8TSPB6FTW+
	 eMrMMif+/ZlueqgrCB2Fi3TtV0lYBDSKOmMkQcxr7kFsE3ModCe2ziQd1K52QTVtTM
	 9RxGm5IXc8dDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D870C83F26;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Thu, 24 Jul 2025 17:23:30 +0200
Subject: [PATCH v5 6/7] riscv: Add tools support for xmipsexectl
MIME-Version: 1.0
Message-Id: <20250724-p8700-pause-v5-6-a6cbbe1c3412@htecgroup.com>
References: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
In-Reply-To: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370612; l=1792;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=ptovTVTWzY5ypMsdB9qvG2p0IpF3HX1Qk6cCHZ2BJ7Y=;
 b=cvYEEQqQIscI391aoxjPcy38xGkvOs72Op5o37Fz5zGhuJJuNcrQhOxlfmlgERoDpENItBnq9
 kxhulaZVCwvDvIUoa6kfudy7fSW90tgqTJ6jiIKVIE6S+mTGgzMZ/pR
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082336_037899_EBE21030 
X-CRM114-Status: GOOD (  11.18  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
index 0665b117f30f2766a23446fbd7c8ce82d1843a93..b089d4be998f4ab7bc43a96496a6c6f1bb38da4d 100644
--- a/tools/arch/riscv/include/asm/vdso/processor.h
+++ b/tools/arch/riscv/include/asm/vdso/processor.h
@@ -4,26 +4,33 @@
 
 #ifndef __ASSEMBLER__
 
+#include <asm/hwprobe.h>
+#include <sys/hwprobe.h>
+#include <asm/vendor/mips.h>
+#include <asm/vendor_extensions/mips.h>
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
+		__asm__ __volatile__(MIPS_PAUSE);
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
