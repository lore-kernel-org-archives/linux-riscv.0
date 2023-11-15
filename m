Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCACC48BFA
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mrd4RuVpwWXWPnUIqNuKjMv1HNlCA6EJajrjGcx7vRo=; b=DC8OrL9+zKq6PH
	AngzrCh3hQPD4bLSAds72TL1SIeWsw1G5r4AC+B7QwiHjEO/dQAoyZHXSd/9ji/DOQWKOiJiJ6s9a
	1h01hzUag8V3vJVeF3T8uEWn64/U8o8WZ5itcMIF+UI4uietXxT4prw4+eQ0Owz1O25c2cY//mjou
	fQnp/JusP8Ajb5PkN/ZJSudm0vCueMxkQFo5pG6QjCiqq8+ARS64Xr8M3XumRVrqzIEHIinqPAOzO
	NoB1pnbX+yLiInqQe3XYXS2T3TEy4ytD5XdCzKuWjenKHemfM6N5eYxk9jaNsyRMQodBlhhto8iPS
	Vj8BFzlv8r+DAuvlESsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Fzc-000t1p-39;
	Wed, 15 Nov 2023 13:31:44 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Fza-000t1B-1B
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 13:31:44 +0000
Received: from LT2ubnt.fritz.box (ip-178-202-040-247.um47.pools.vodafone-ip.de [178.202.40.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 28D2141931;
	Wed, 15 Nov 2023 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700055098;
	bh=XwKM1F4f+w/q5mNwykREvbpkU3Yv+IFVmQo+ZNBoOAM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=HvmmC4WVKC7O3shLJjN5g8UvEDDBuDvWnEKZcKmLF3lJmf5bT1yQ1odFlv8bKnFZk
	 um1GAljq/pK1B/oYV0G19jOW0ZP4jr5hIdmc7iifGVY/3THEiZDztDR8x+pwe6oN35
	 H1Pw2OLrUKbbjDDw8Sl+hdTwBVIz9NvkwUnPKra9ILtGx15w2iQq8cYxl7aYBpuGVi
	 sSz5CNKE16cTtPxSPyNFxDtCRSEiFgNb3lGjTod4mTOpmhRCnX5RoyjjQNz2D0LD4K
	 Z0YnyZ+TKnTjTn/M2cu1mdNtGp0qWAYDzEC14NtYEIkGrdKhtDkKbKSllWUaL8jkWl
	 xpVTYZSdzpCrQ==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
Date: Wed, 15 Nov 2023 14:31:27 +0100
Message-Id: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_053142_814086_92C9021F 
X-CRM114-Status: GOOD (  12.35  )
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

Up to now an SBI based early console was limited to SBI version 0.1.
With the DBCN SBI extension we can provide an early console on systems that
have a recent SBI implementation.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/kernel/sbi.c    | 14 ++++++++++++++
 drivers/tty/serial/Kconfig |  1 -
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5a62ed1da453..6e1644a95bb7 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -195,6 +195,20 @@ static void sbi_set_power_off(void)
 	pm_power_off = sbi_shutdown;
 }
 #else
+
+/**
+ * sbi_console_putchar() - Writes given character to the console device.
+ * @ch: The data to be written to the console.
+ *
+ * Return: None
+ */
+void sbi_console_putchar(int ch)
+{
+	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
+		  ch, 0, 0, 0, 0, 0);
+}
+EXPORT_SYMBOL(sbi_console_putchar);
+
 static void __sbi_set_timer_v01(uint64_t stime_value)
 {
 	pr_warn("Timer extension is not available in SBI v%lu.%lu\n",
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 732c893c8d16..454c2a612389 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -87,7 +87,6 @@ config SERIAL_EARLYCON_SEMIHOST
 
 config SERIAL_EARLYCON_RISCV_SBI
 	bool "Early console using RISC-V SBI"
-	depends on RISCV_SBI_V01
 	select SERIAL_CORE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
