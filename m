Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56717EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WKbPbDPmSX9+1dHoz0YUpblQv2UdsXbrBw+Qq3GFFVk=; b=sbQvkQ/Bw5A/fG
	HS+r1dGWV9xylQP7wjmfRFZJjHQdcvC+A8cI+f//cNhKWbLy3vRFweYuwjol6SH8YNSLsXn+GbEBG
	sU4dHKi0I9+PohxqsNFvQdSNZz/xQB5qzp5dnrg1JHDx6uh7wdxyKdYTXY6svEOSxzn3mgvEMhOO1
	L7krquHokzbdVvQKDvJiWBSoWtsz8IuQ8vddnK72Roc9Y+mvYL+8KyRZeRoKYvywfvu2Mm1NXatdZ
	Idtw3HmT5lidJAaRGYW0swm2pv5zbWoKsYBoaJ9eCZdVXB/F7hFwjtLFJSF1Bt8dooC5XcDeDnxyu
	gQHr1CbUm0m3p+tT0vgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdwp-000o7Y-2q;
	Wed, 12 Jul 2023 17:48:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdwm-000o71-38
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:48:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B87D6182C;
	Wed, 12 Jul 2023 17:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0CBC433C7;
	Wed, 12 Jul 2023 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689184095;
	bh=fzBqrlILV+nEusEDfMaUHYmCA1j5fPMXlt//5sFaTAA=;
	h=From:To:Cc:Subject:Date:From;
	b=m9nDIijU5BYjb6SpXeBpzW0ZfLYjB/+VHbE/ECmH/PYNHgurJMQCu204nuxFeleSY
	 o7HsnFvAHqM9VBYRj0G6T9ZqAHyJMVhcTwvBWpXlbUD6k/lmjIdzM8vQjgtQ7A3HTD
	 ZRd8CMNxfBo0Y8W3JD930Wnn/zsSvXTJzYTVrK8L3CUbZPQmIGsbOeh8tb5UZ6ju86
	 vNuI7koUvmRzbp4B7fcl+rUfm/6fPzt3tQnyFo/A8tF9z7mdwviTzWD+YF8pp9Bc1V
	 Ahh3/9lfG15GdVPsEkNbLipKvH6alHHupkU6ubIsKL6ZQqXO10je+oIWtkao2Yf7Vq
	 1k7JRg1gfUjXQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property on T-Head CPUs
Date: Wed, 12 Jul 2023 18:48:02 +0100
Message-Id: <20230712-postal-affiliate-0d61a209897f@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iwYD0KWjMSllSpGZXcyhWaWpK3ovH6jjt/k2Ztq4Jv8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrnvv/uhJXU3Vtx4vvFQ8TD2iyWrrHe714NWvvoRd73 jw/GbeToaOUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATEWRj+Gds6HuwcBV3+rdz YT+/x+T+t9q7ul422qd4UXXl4ntLW9cw/LOUP/J4caSf5ddtx75u43/3gXvZQv4b72XqpLwm+HW v6+IFAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_104817_093617_F87B993B 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: heiko@sntech.de, charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, conor@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmer@rivosinc.com>

The last merge window contained both V support and the deprecation of
the riscv,isa DT property, with the V implementation reading riscv,isa
to determine the presence of the V extension.  At the time that was the
only way to do it, but there's a lot of ambiguity around V in ISA
strings.  In particular, there is a lot of firmware in the wild that
uses "v" in the riscv,isa DT property to communicate support for the
0.7.1 version of the Vector specification implemented by T-Head CPU
cores.

Rather than forcing use of the newly added interface that has strict
meanings for extensions to detect the presence of vector support, as
that would penalise those who have behaved, only ignore v in riscv,isa
on CPUs that report T-Head's vendor ID.

Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Use my version of the patch that touches hwcap and isainfo uniformly
- Don't penalise those who behaved
---
 arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..05362715e1b7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -21,6 +21,7 @@
 #include <asm/hwcap.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
@@ -334,6 +335,27 @@ void __init riscv_fill_hwcap(void)
 			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
 		}
 
+		/*
+		 * "V" in ISA strings is ambiguous in practice: it should mean
+		 * just the standard V-1.0 but vendors aren't well behaved.
+		 * Many vendors with T-Head CPU cores which implement the 0.7.1
+		 * version of the vector specification put "v" into their DTs
+		 * and no T-Head CPU cores with the standard version of vector
+		 * are in circulation yet.
+		 * Platforms with T-Head CPU cores that support the standard
+		 * version of vector must provide the explicit V property,
+		 * which is well defined.
+		 */
+		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID) {
+			if (of_property_match_string(node, "riscv,isa-extensions", "v") >= 0) {
+				this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
+				set_bit(RISCV_ISA_EXT_v, isainfo->isa);
+			} else {
+				this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
+				clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
+			}
+		}
+
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
