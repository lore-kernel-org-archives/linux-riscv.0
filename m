Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0C6C05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 22:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPB1ocQl0VpVxI6rwBMMfIA0Cn3tvH1QTl+9nusKIhE=; b=NJcFutE6QQRlIg
	eJohpsfYc34jECwvbMZkUzKqSLhoTK2+hs9jVDtKc+NLCCzdzojnuH5bnTTDx/QnFZmB4//Fr5DrC
	Gz/Q7vAh+QXVdyjF0SduJ55IqVXOyGJj4OPSD3FWr4O9YqhnBWdhZBWnywdHZcm1bbycjIMwU+6zn
	nX/IMuj0DRwkA2I/jK/anlAPyfWP/nxPRgKcnAeImNC7yjwfeSB7fSfbeknxbAZOXOAIlgg+YhTe8
	VWMjZHbfEEUdrUONCm4KK96+1h9Ojgantunk9LHpcENOitQa6769WCKSOodbwMt9mlEErjRVz8G3n
	s0C8QJxE4TueiuQ2QU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPASK-00A7T3-AE; Mon, 06 Feb 2023 22:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPASH-00A7Pn-AK
	for linux-riscv@bombadil.infradead.org; Mon, 06 Feb 2023 22:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ha2VcTf/Ukpmf2n4K/vpPnR+V+kmAlwsf0EEZj20Wu8=; b=INM6a3uYptw64e/6DnFrYoV35V
	sHik9elkCi6OSqK9MuuDhWz2vekmy+CFOZ7JZOuKU6WP+oe7DmlsCfEE2cPjWx0wwxFcp76jZNg2p
	AdwJSy5qvDguUPdGoeqspWjC4YQtbMe2HOJuAthrVNXnGkEKIxACHhACiOcMaG8ujx4zJUoP/6qL5
	FMWjei+K58h3SQ70mQA5EiQJ/zFURmOoOcavmxYOAHm8RUlsovhCbcp21n3uTtPpDh5Bi6opfFsF6
	SM5Xyu6QI2ARBS3M9e4iD2s7NUeKgFiBQBXqjzYnLTdV0ngywsfMc+EaP8YDRpb6EShKF88VZmb6h
	StQtCZDw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPARV-006ho3-2V
	for linux-riscv@lists.infradead.org;
	Mon, 06 Feb 2023 22:58:35 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pPARl-0002Mb-2T; Mon, 06 Feb 2023 23:58:49 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH RFC 03/12] RISC-V: add Zbb extension detection
Date: Mon,  6 Feb 2023 23:58:37 +0100
Message-Id: <20230206225846.1381789-4-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206225846.1381789-1-heiko@sntech.de>
References: <20230206225846.1381789-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_225834_075118_C85285F6 
X-CRM114-Status: GOOD (  11.45  )
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

Add handling for Zbb extension.

Zbb provides basic bit-manipulation instructions.

As multiple subsequent features want to check for zbb presence, add the
extension handling without directly including code using it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig             | 23 +++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpu.c        |  1 +
 arch/riscv/kernel/cpufeature.c |  1 +
 4 files changed, 26 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f4299ba9a843..f4b0e0144516 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -426,6 +426,29 @@ config RISCV_ISA_V
 
 	  If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBB
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_IS_GNU
+
+config RISCV_ISA_ZBB
+	bool "Zbb extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBB
+	depends on !XIP_KERNEL && MMU
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBB
+	   extension (basic bit manipulation) and enable its usage.
+
+	   The Zbb extension provides instructions to accelerate a number
+	   of bit-specific operations (count bit population, sign extending,
+	   bitrotation, etc).
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZICBOM
 	bool
 	default y
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f413db6118e5..c8c69b49f0ad 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_SVPBMT,
+	RISCV_ISA_EXT_ZBB,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_ID_MAX
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0bf1c7f663fc..420228e219f7 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -185,6 +185,7 @@ arch_initcall(riscv_cpuinfo_init);
  * New entries to this struct should follow the ordering rules described above.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cbd60e744c09..33938f91cbbf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -234,6 +234,7 @@ printk("!!!! isa-string: %s\n\n\n", isa);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 			}
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
