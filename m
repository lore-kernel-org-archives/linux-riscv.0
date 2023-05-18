Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D84C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huTXMcxeCjjJbhR3KC1m7aKzUqMAGWEoj9K8cFKg+Sw=; b=CdxO70+3EM/B5h
	vbk09+A637Me+IvM0Up/gwwp2Wcs24exQClcbe6AIVGTY8bMGil6GDKCVPic2uLbAudMRXo1tHgXq
	KCw1b3ybT0YFWvNwSyxw3AgCHEIjWqFZ9u46+4eGyCYbN/9I8fLrqigZEyLHkLtyVhiAuAv/CwKxq
	umJ+WTsTiaxtmrWopwWEXzw12UH9HTrXD/MfvtbjS4MEEc1hh4CaTix7qWAKDSGWGigibQYjLftGd
	+kl2D35eJOtnKnyq+jVhihTIRKvP3bd82zElE4/nJe8wzVZNqp1kHVUP1tTcadug8/keARF3Y+Smu
	GycwkhiyJs5cYSI15svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmIL-00ENSu-17;
	Thu, 18 May 2023 22:40:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmII-00ENQf-0g
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CDAE065185;
	Thu, 18 May 2023 22:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75517C433EF;
	Thu, 18 May 2023 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449621;
	bh=nw+ar3lSZTgvdorsVETbRqm1nYKJHrwh+sWkkOaRg80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=clcu9hN6AHQ3Vn1S4vwhdmd5cYg06Z6bONy3iA7rIKmGHDGsxwyASpwNFoMdE2Jln
	 Z6aOrFXkFNe8vxN03dhFoDdTJGAPpr5+GC2qLwgs3DG4O+wYGQKHio6s/d8cDCEuq7
	 EF49zOsSVCaIxJO+CJc4xmiVrq6bYKYVOxjnd5KoOrVO9U2f2EabAdbORfdgNTG1FY
	 35eHeuntmV/Sg1xTH9WKw7BvTZaUJfiyigOC8dNA0CiifR6DbL8RkIQz04L4FYpVlY
	 17o3kybr0g0N2ijbTZihH7dTjzDvwFIzkpjsiMfR4TFn+rUfqJfvGLDAEkWuXJsrKA
	 T4wxwq7VDErxw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 8/8] RISC-V: always report presence of extenstions formerly part of the base ISA
Date: Thu, 18 May 2023 23:39:09 +0100
Message-Id: <20230518-otter-pennant-f3c9c6126b66@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-moneybags-rebalance-1484db493d6a@spud>
References: <20230518-moneybags-rebalance-1484db493d6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=mMbnx79Cnsy3EzOX7AC8PrNjk22zJMA5eUAfTDDlqRA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpKzknmwtO8UjLE1R+9O5mb432glkL/fbOPiyvUFMXy Xz58l6XjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkXz/DPwXGSh65ZvlJfjkr qjxufXuVfip2o65V581n0nybRM6KX2L4Z//4oXXirJyjSz6c4Lz3PaqwNylnXWjUEo2yAJ/yCK4 4fgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154022_324972_CC77E6CF 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

These four extensions were part of the base ISA when the port was written
and are required by the kernel. There's not much that userspace can do
with this extra information, but there is no harm in reporting an ISA
string that closer resembles the current versions of the ISA
specifications either.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Intentionally avoided your conditional tag here Drew.
---
 arch/riscv/include/asm/hwcap.h |  4 ++++
 arch/riscv/kernel/cpu.c        |  4 ++++
 arch/riscv/kernel/cpufeature.c | 10 ++++++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 9af793970855..302f06191056 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -44,6 +44,10 @@
 #define RISCV_ISA_EXT_ZIHINTPAUSE	32
 #define RISCV_ISA_EXT_SVNAPOT		33
 #define RISCV_ISA_EXT_ZICBOZ		34
+#define RISCV_ISA_EXT_ZICNTR		35
+#define RISCV_ISA_EXT_ZICSR		36
+#define RISCV_ISA_EXT_ZIFENCEI		37
+#define RISCV_ISA_EXT_ZIHPM		38
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index b0c3ec0f2f5b..958073bd3451 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -206,7 +206,11 @@ arch_initcall(riscv_cpuinfo_init);
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
+	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bbf3cd203fad..1b43d1fb31e4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -291,6 +291,16 @@ void __init riscv_fill_hwcap(void)
 #undef SET_ISA_EXT_MAP
 		}
 
+		/*
+		 * Linux requires the following extensions, as they were part of
+		 * the base ISA when the port & dt-bindings were upstreamed, so
+		 * we may as well always set them.
+		 */
+		set_bit(RISCV_ISA_EXT_ZICNTR, this_isa);
+		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
+		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
+		set_bit(RISCV_ISA_EXT_ZIHPM, this_isa);
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
