Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9DEEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dv0/Uxr3z/4lBXh/gSsXv3k/pVCKlNr8vGLEgc7z7jM=; b=uJyS6A0E+YghbG
	UlS6U/LBu88FAo0WR/XxGO2X5WnyZB4k+xqOg+k2PwUn3KH5yMu04erXeW0ztpcZ10XY3n4qpRifn
	aq4za0f31EFlaK9GhB2G3QoYxljEAIQggJzMEtzSSOlXoAFn8aFLF07hU2foLLrVldzwAUn6bqxym
	epnXHI/HKj1RrIMkfoTABjXF2pQDWS1jlxjLwZFe96dP0AXgJdUaZOszaIPwFNrMtLvQdlpr3dxDt
	I/JY+vMkFnxF773VPAK0t1J0Ivqq95o/yfEn2xubopSTDf/wfNJA7i5EJICBQrczCW6uuHXpxfGNy
	5sqtbt3CllRDn/bOXkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFRA-00FGVZ-0p;
	Tue, 11 Jul 2023 15:38:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFR3-00FGR9-38
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 15:37:56 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qJFQz-0000g0-33; Tue, 11 Jul 2023 17:37:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: aou@eecs.berkeley.edu,
	heiko@sntech.de,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	ebiggers@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 04/12] RISC-V: add vector crypto extension detection
Date: Tue, 11 Jul 2023 17:37:35 +0200
Message-Id: <20230711153743.1970625-5-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711153743.1970625-1-heiko@sntech.de>
References: <20230711153743.1970625-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_083754_048779_4F385008 
X-CRM114-Status: GOOD (  11.09  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Add detection for some extensions of the vector-crypto specification:
- Zvkb: Vector Bit-manipulation used in Cryptography
- Zvkg: Vector GCM/GMAC
- Zvknha and Zvknhb: NIST Algorithm Suite
- Zvkns: AES-128, AES-256 Single Round Suite
- Zvksed: ShangMi Algorithm Suite
- Zvksh: ShangMi Algorithm Suite

As their use is very specific and will likely be limited to special places
we expect current code to just pre-encode those instructions, so right now
we don't introduce toolchain requirements.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/hwcap.h |  9 ++++++
 arch/riscv/kernel/cpu.c        |  8 ++++++
 arch/riscv/kernel/cpufeature.c | 50 ++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b80ca6e77088..0f5172fa87b0 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -64,6 +64,15 @@
 #define RISCV_ISA_EXT_ZKSED		51
 #define RISCV_ISA_EXT_ZKSH		52
 #define RISCV_ISA_EXT_ZKT		53
+#define RISCV_ISA_EXT_ZVBB		54
+#define RISCV_ISA_EXT_ZVBC		55
+#define RISCV_ISA_EXT_ZVKG		56
+#define RISCV_ISA_EXT_ZVKNED		57
+#define RISCV_ISA_EXT_ZVKNHA		58
+#define RISCV_ISA_EXT_ZVKNHB		59
+#define RISCV_ISA_EXT_ZVKSED		60
+#define RISCV_ISA_EXT_ZVKSH		61
+#define RISCV_ISA_EXT_ZVKT		62
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 10524322a4c0..925241e25db2 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -227,6 +227,14 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
 	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
+	__RISCV_ISA_EXT_DATA(zvbb, RISCV_ISA_EXT_ZVBB),
+	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
+	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
+	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
+	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
+	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
+	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
+	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 9a872a2007a5..13556fd16bf6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -343,6 +343,56 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zksh", RISCV_ISA_EXT_ZKSH);
 				SET_ISA_EXT_MAP("zkr", RISCV_ISA_EXT_ZKR);
 				SET_ISA_EXT_MAP("zkt", RISCV_ISA_EXT_ZKT);
+				SET_ISA_EXT_MAP("zvbb", RISCV_ISA_EXT_ZVBB);
+				SET_ISA_EXT_MAP("zvbc", RISCV_ISA_EXT_ZVBC);
+				SET_ISA_EXT_MAP("zvkg", RISCV_ISA_EXT_ZVKG);
+				SET_ISA_EXT_MAP("zvkned", RISCV_ISA_EXT_ZVKNED);
+				SET_ISA_EXT_MAP("zvknha", RISCV_ISA_EXT_ZVKNHA);
+				SET_ISA_EXT_MAP("zvknhb", RISCV_ISA_EXT_ZVKNHB);
+				SET_ISA_EXT_MAP("zvksed", RISCV_ISA_EXT_ZVKSED);
+				SET_ISA_EXT_MAP("zvksh", RISCV_ISA_EXT_ZVKSH);
+				SET_ISA_EXT_MAP("zvkt", RISCV_ISA_EXT_ZVKT);
+
+				/* NIST Algorithm Suite */
+				SET_ISA_EXT_MAP("zvkn", RISCV_ISA_EXT_ZVKNED);
+				SET_ISA_EXT_MAP("zvkn", RISCV_ISA_EXT_ZVKNHB);
+				SET_ISA_EXT_MAP("zvkn", RISCV_ISA_EXT_ZVBB);
+				SET_ISA_EXT_MAP("zvkn", RISCV_ISA_EXT_ZVKT);
+
+				/* NIST Algorithm Suite with carryless multiply */
+				SET_ISA_EXT_MAP("zvknc", RISCV_ISA_EXT_ZVKNED);
+				SET_ISA_EXT_MAP("zvknc", RISCV_ISA_EXT_ZVKNHB);
+				SET_ISA_EXT_MAP("zvknc", RISCV_ISA_EXT_ZVBB);
+				SET_ISA_EXT_MAP("zvknc", RISCV_ISA_EXT_ZVKT);
+				SET_ISA_EXT_MAP("zvknc", RISCV_ISA_EXT_ZVBC);
+
+				/* NIST Algorithm Suite with GCM */
+				SET_ISA_EXT_MAP("zvkng", RISCV_ISA_EXT_ZVKNED);
+				SET_ISA_EXT_MAP("zvkng", RISCV_ISA_EXT_ZVKNHB);
+				SET_ISA_EXT_MAP("zvkng", RISCV_ISA_EXT_ZVBB);
+				SET_ISA_EXT_MAP("zvkng", RISCV_ISA_EXT_ZVKT);
+				SET_ISA_EXT_MAP("zvkng", RISCV_ISA_EXT_ZVKG);
+
+				/*  ShangMi Algorithm Suite */
+				SET_ISA_EXT_MAP("zvks", RISCV_ISA_EXT_ZVKSED);
+				SET_ISA_EXT_MAP("zvks", RISCV_ISA_EXT_ZVKSH);
+				SET_ISA_EXT_MAP("zvks", RISCV_ISA_EXT_ZVBB);
+				SET_ISA_EXT_MAP("zvks", RISCV_ISA_EXT_ZVKT);
+
+				/* ShangMi Algorithm Suite with carryless multiply */
+				SET_ISA_EXT_MAP("zvksc", RISCV_ISA_EXT_ZVKSED);
+				SET_ISA_EXT_MAP("zvksc", RISCV_ISA_EXT_ZVKSH);
+				SET_ISA_EXT_MAP("zvksc", RISCV_ISA_EXT_ZVBB);
+				SET_ISA_EXT_MAP("zvksc", RISCV_ISA_EXT_ZVKT);
+				SET_ISA_EXT_MAP("zvksc", RISCV_ISA_EXT_ZVBC);
+
+				/* ShangMi Algorithm Suite with GCM */
+				SET_ISA_EXT_MAP("zvksg", RISCV_ISA_EXT_ZVKSED);
+				SET_ISA_EXT_MAP("zvksg", RISCV_ISA_EXT_ZVKSH);
+				SET_ISA_EXT_MAP("zvksg", RISCV_ISA_EXT_ZVBB);
+				SET_ISA_EXT_MAP("zvksg", RISCV_ISA_EXT_ZVKT);
+				SET_ISA_EXT_MAP("zvksg", RISCV_ISA_EXT_ZVKG);
+
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
