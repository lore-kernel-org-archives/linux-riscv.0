Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 20:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2AvmvAMevQpEu1IzBe6QCJFcspHmShC2NPJ8t5/rD8=; b=0Dy/9Xs3v4BX3p
	VT4DIw5DDVGV+rEDw2GLuWc92baNkam3cqQj01R6vazNej+LYwofMBRS6+MITM4yXlE5+LJHTClyp
	sBIOM4FzvtjHfEM7n2bVw5OatYEvLAid/LgdW6Tx+USVwtk3LVGURp0EW8baQq03R3l/f3cCWAyKd
	j24+sC+9RCVS6Ch/yu3VUCxy++VeFfg8nM7zmGf7RgA8dUqulBIHrrPp04xN8qzbfevxVuXDnBYBa
	PD3TEZYD0GHQuUb5AsoKx06+SfBZM7l09n9mPRf982loP6XdU0C12++htJyfokTXETQ7TPm/01yuj
	lO7XG8AUXSzBjuNWKYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofofg-00B0RS-Hg; Tue, 04 Oct 2022 20:37:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofofb-00B0Q7-Eo
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 20:37:40 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ofofT-0004n6-4O; Tue, 04 Oct 2022 22:37:31 +0200
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
	cmuellner@linux.com,
	samuel@sholland.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] RISC-V: Cache SBI vendor values
Date: Tue,  4 Oct 2022 22:37:23 +0200
Message-Id: <20221004203724.1459763-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221004203724.1459763-1-heiko@sntech.de>
References: <20221004203724.1459763-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_133739_525118_A36CFA68 
X-CRM114-Status: GOOD (  11.42  )
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

Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/sbi.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 775d3322b422..5be8f90f325e 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -625,17 +625,32 @@ static inline long sbi_get_firmware_version(void)
 
 long sbi_get_mvendorid(void)
 {
-	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
+	static long id = -1;
+
+	if (id < 0)
+		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
+
+	return id;
 }
 
 long sbi_get_marchid(void)
 {
-	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
+	static long id = -1;
+
+	if (id < 0)
+		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
+
+	return id;
 }
 
 long sbi_get_mimpid(void)
 {
-	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
+	static long id = -1;
+
+	if (id < 0)
+		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
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
