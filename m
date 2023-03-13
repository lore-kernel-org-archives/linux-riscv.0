Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173E8C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKaisCdOHOZCUQs4GnnPgf++kfpAUCBqVLqS/EvLqWw=; b=Wn1aaSiV63Ghfj
	xs5heWQq6w5ofH7wygwbxGCHRmGaPJBDcuj6Q7/SIZJFeasr2JuCtFTuOgCBkpv0VcT/oOdig+PyS
	DboA4Dulsrh39ovh2wZ/wwvU/GlDqb1FJ7EEE5tqAk56ea8eVY+buKhaTXqVUvN/vA9VfLVzVxIPu
	aHtB7BwQUqFxiAjAXj3lpES7HdZzi+SkIQRZuUocpjJdoSu4xEfaWgCxmL4xBgM8yaBsTofucf8tu
	StOiPJ8gu4w/mKZ10JVL83X5yqYqaJuQSADPIjsbKXej/OSKW4pfcVScyzjcmSJJ9kNzrrDSdWYjL
	GBic5V42nrSLAgeiEsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnbw-007TLE-MV; Mon, 13 Mar 2023 19:13:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnbs-007THA-9S
	for linux-riscv@bombadil.infradead.org; Mon, 13 Mar 2023 19:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7I3aclIWEe20n6d9rt8YZV1H1jCvecFjvx48YFQ5AF0=; b=SkM4izkCRR+NV9Q5CzYbYbvGcw
	hFs0ni2dgchcqMLbuZbiAqywUHg3N3rmlFvjYhEGb0PoNRp7iynN2Dlx/2myLtLjqT0G+Zu9Gsqxs
	ML7kNB8lzrRMR76JgtehMxev0wQAfCOz9IuMk++tceeOo2paWtqGya4lWf87GtscG2MZEnZ/3ppO6
	osfVV4GlMnEf4ntDupy0NLZZiAR/r9xeKZCwXg+pk4483ayf3r6PlkgcoVz3VR2fJyvXfChmAiZG7
	nmjlccQDqGwC4lSN0IOM1Iz3UtMQfZIHbZz36+jXt5/+xWIpBjS713+PbVB2AYEpirqKIamq3bZh3
	5LinD1fw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbnbo-001VBC-1W
	for linux-riscv@lists.infradead.org;
	Mon, 13 Mar 2023 19:13:26 +0000
Received: from ip4d1634a9.dynamic.kabel-deutschland.de ([77.22.52.169] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pbnbV-00028k-In; Mon, 13 Mar 2023 20:13:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de
Subject: [PATCH RFC v3 07/16] RISC-V: add helper function to read the vector VLEN
Date: Mon, 13 Mar 2023 20:12:53 +0100
Message-Id: <20230313191302.580787-8-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230313191302.580787-1-heiko.stuebner@vrull.eu>
References: <20230313191302.580787-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_191324_602665_08E58C87 
X-CRM114-Status: GOOD (  11.53  )
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
index 202df9ea28d7..e466e7787d25 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -178,4 +178,15 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 
 #endif /* CONFIG_RISCV_ISA_V */
 
+/*
+ * Return the implementation's vlen value.
+ *
+ * riscv_vsize contains the value of "32 vector registers with vlenb length"
+ * so rebuild the vlen value in bits from it.
+ */
+static inline int riscv_vector_vlen(void)
+{
+	return riscv_v_vsize / 32 * 8;
+}
+
 #endif /* ! __ASM_RISCV_VECTOR_H */
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
