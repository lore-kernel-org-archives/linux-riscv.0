Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F2CCD4938
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 02:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdUMSEiDnTLNvLVB0W0xWtiRmkBnNF5/L9rL3HtnZKA=; b=IuXxMiPNHVoE+9
	0pzZf21YZ6tMQ3MGHUsUQJRrE5dvEosDDJL8uksDBX6LcsEHLU0U+ag05i2aVYG3NTpQQdNgQlIgw
	QIDoREZu2FPsPgtTA0aGltxHEnrS3ij9OlS+0ZQYmQgW9mzUbkkikhWPzMkecQnNXxU/j0XdaATeG
	/4KAX8Wtos/rqPoXeow09VJKgFD/Y0qAVqDfxfrhuJ4gEbbp9+WZPvlGabq9CWRjhV2oF+VMnJwX1
	sHVUhPgLs3LrotuScsGFS2P72uNmHx/YbRA5hccEZZI5XegOsEMuZty1AaidCBIIDOUn/eKl9rjRN
	UhyYiil1J2YV0UINjd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9mQ-004pFZ-2Y;
	Thu, 21 Sep 2023 02:51:02 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj9mN-004pDa-2t
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 02:51:01 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 38L2oi9T059298;
	Thu, 21 Sep 2023 10:50:44 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Sep 2023
 10:50:39 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <david@redhat.com>, <akpm@linux-foundation.org>,
        <alexghiti@rivosinc.com>, <bjorn@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <conor.dooley@microchip.com>, Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH v4 3/3] riscv: Introduce NAPOT field to PTDUMP
Date: Thu, 21 Sep 2023 10:50:22 +0800
Message-ID: <20230921025022.3989723-4-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921025022.3989723-1-peterlin@andestech.com>
References: <20230921025022.3989723-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 38L2oi9T059298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_195100_376951_3D7EE4D1 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

This patch introduces the NAPOT field to PTDUMP, allowing it
to display the letter "N" for pages that have the 63rd bit set.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
Changes v1 -> v3
- no change
Changes v3 -> v4
- Include Alexandre's RB/TB-tags
---
 arch/riscv/mm/ptdump.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 13997cf3fe36..b71f08b91e53 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -136,6 +136,10 @@ struct prot_bits {
 static const struct prot_bits pte_bits[] = {
 	{
 #ifdef CONFIG_64BIT
+		.mask = _PAGE_NAPOT,
+		.set = "N",
+		.clear = ".",
+	}, {
 		.mask = _PAGE_MTMASK_SVPBMT,
 		.set = "MT(%s)",
 		.clear = "  ..  ",
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
