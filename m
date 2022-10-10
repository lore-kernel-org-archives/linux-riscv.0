Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B56C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnOBYYPG2OeuOTIUroegt0txT8eZuNGgE8oKwaO6eZs=; b=rK1JOrpPQiCsl+
	EgByvHtS4puj1G/LUEll3JtequmHMalps5kkiHXCr+N/6aQibU/FQYIzkrQhT7zjit10bX0TN8GVD
	A9slW6RIbUJxmq5FBe9UkemAw+LgfEZiiDB/m0rAc9w2YlHW6Wz7ynK/xeDmtqr/jKvnfk/04wzWA
	0PrnsesB8aF4mXcCivCQzqvN9GXmllXhjH1X/rvAmI9dCkK80DB5jBUCoWvPQGsTWio4r0k2IOBXO
	xG5Wbh/gGHw4W01vfuV5IrY/G3rfA8t2T6se1tTpI6cmI7+efXPpXK+qHfvCUspC8tgH5znYeTxa8
	VT6a4N6HM0gZkn1N+4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrsl-000pi3-F1; Mon, 10 Oct 2022 12:27:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrsi-000pgp-OC
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 12:27:41 +0000
Received: from p5b1274fa.dip0.t-ipconnect.de ([91.18.116.250] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ohrsX-0001kg-4d; Mon, 10 Oct 2022 14:27:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: atishp@atishpatra.org,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com,
	ajones@ventanamicro.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 1/2] RISC-V: Cache SBI vendor values
Date: Mon, 10 Oct 2022 14:27:25 +0200
Message-Id: <20221010122726.2405153-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221010122726.2405153-1-heiko@sntech.de>
References: <20221010122726.2405153-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_052740_822399_5A2D8A0C 
X-CRM114-Status: GOOD (  12.54  )
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

sbi_get_mvendorid(), sbi_get_marchid() and sbi_get_mimpid() might get
called multiple times, though the values of these CSRs should not change
during the runtime of a specific machine.

So cache the values in the functions and prevent multiple ecalls
to read these values.

As Andrew Jones noted, at least marchid and mimpid may be negative
values when viewed as a long, so we use a separate static bool to
indiciate the cached status.

Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/sbi.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 775d3322b422..cc618aaa9d11 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -625,17 +625,41 @@ static inline long sbi_get_firmware_version(void)
 
 long sbi_get_mvendorid(void)
 {
-	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
+	static long id;
+	static bool cached;
+
+	if (!cached) {
+		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
+		cached = true;
+	}
+
+	return id;
 }
 
 long sbi_get_marchid(void)
 {
-	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
+	static long id;
+	static bool cached;
+
+	if (!cached) {
+		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
+		cached = true;
+	}
+
+	return id;
 }
 
 long sbi_get_mimpid(void)
 {
-	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
+	static long id;
+	static bool cached;
+
+	if (!cached) {
+		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
+		cached = true;
+	}
+
+	return id;
 }
 
 static void sbi_send_cpumask_ipi(const struct cpumask *target)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
