Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F99C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 00:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Syz13/RKzBYmQZc70qHPglMk9I9+ENFA21owXyLgGo=; b=IJX0rG2N7ZhMU2
	54CnDfG5bzDnz1W7Dsa5Ct0ybXKhTYEy1j5WjPyjC/JMLAxsUx5lj/CRwOcNugvAHJcn2DSDFu5Cx
	L7h59VROg0OULpgNKMQfXvOTFme/uSP23wmfYW3tXeTwPbjgZeWKfLlsF8B5+oiZxtl8CHzmb1CJZ
	tnZd7EL7nZPgJNbbF2cwJtJe0K6DKOiscZvP1xyVZKiNrmW+nXykpmwp8c8ghL82JURpJ0xn9WOK2
	950owApqawWAsflMiTAC1aBqCZb9ibAfaAXOIeGoeDtmtpO+GEW8lcLMFS1Z/X5lPT+aB53WjFdU5
	bDEDZPVeeBeXLLjV5ZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVM-00Bboi-U5; Tue, 28 Feb 2023 00:06:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVJ-00Bblj-Hq
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 00:06:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pWnV9-000552-HM; Tue, 28 Feb 2023 01:05:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH RFC v2 07/16] RISC-V: add helper function to read the vector VLEN
Date: Tue, 28 Feb 2023 01:05:35 +0100
Message-Id: <20230228000544.2234136-8-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230228000544.2234136-1-heiko@sntech.de>
References: <20230228000544.2234136-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_160601_624367_8DB28B3F 
X-CRM114-Status: GOOD (  12.03  )
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

VLEN describes the length of each vector register and some instructions
need specific minimal VLENs to work correctly.

The vector code already includes a variable riscv_vsize that contains the
value of "32 vector registers with vlenb length" that gets filled during
boot. vlenb is the value contained in the CSR_VLENB register and
the value represents "VLEN / 8".

So add riscv_vector_vlen() to return the actual VLEN value for in-kernel
users when they need to check the available VLEN.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index f38266ec483a..ad9e6161dd89 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -163,4 +163,15 @@ static inline bool vstate_query(struct pt_regs *regs) { return false; }
 
 #endif /* CONFIG_RISCV_ISA_V */
 
+/*
+ * Return the implementation's vlen value.
+ *
+ * riscv_vsize contains the value of "32 vector registers with vlenb length"
+ * so rebuild the vlen value in bits from it.
+ */
+static inline int riscv_vector_vlen(void)
+{
+	return riscv_vsize / 32 * 8;
+}
+
 #endif /* ! __ASM_RISCV_VECTOR_H */
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
