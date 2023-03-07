Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D59C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxhxjn8WRK8Kz6GJqPKfUsUWORbuE9BcreeyL0I8m7k=; b=PEBm/RzD7kSEdH
	vdT1nFJfbHDtAI3R+dqJQA0as1Pu9upRyN/d5cobrTcJ3SL55+CZRffB3VxzT8A1RIT9C+aaGSGKX
	3BkKl8URHDnKiKco5G19dyUdorTvLSTPCtbnZCS8WKkg/6BxA4isuXPxzxfJWY8SbbJ7RpTwNbCr3
	PB4j4G+weEtNJHGcl/brBY7vrctAZS6UuY/6p4UJ39uKb81p1as4BancvJpyixLNQBzRGOPiTgMAd
	9TdeDFegt1vrpi0UJ52+9UTiY2Kx+TqmIAlqZYmgCNkPdNLDg4XQbrmEVKgASYGS0FlDmB5TlIGQO
	+PGo5dqiGAxhUmEhuzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqN-002MNR-Ql; Tue, 07 Mar 2023 20:23:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqJ-002MLP-DU
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A6EE61522;
	Tue,  7 Mar 2023 20:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDA2C433A1;
	Tue,  7 Mar 2023 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220605;
	bh=x+8F7ELtsW/BQB3u+HCi4ETUUZR7Hhz1aXJMSp6UPQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZtZSFRIoN3Dk9IaS71f+Vi0gbcEz/eCmHEBigAl8IcconSATVF61MN1GhhQwkCitD
	 jAY7f2olbsMcii5YlQxr0YWpqHPD4jS8CFiFI7mnCRkDIh4GzVGOR+BatsULKGv8mA
	 4Wc9BKdAy1ecelH2XuJoO9v8cNesJSTEa9Bf2MeeOuSBdsZdZUVKjtJ7ed1HzRHX0Q
	 Q1g5o4gHW6LZpwsZQjAPwS5k9KWTMWndaYBkaU2i8p6hUbp+xxyPzp1mnTl3qgADlM
	 49SwhSxnJUtPSOJmUpUna9vm2yoeTzv/n/K+YsOKZ3FxQhQXQy5Smzy94n1owWRP1D
	 MdgXM/P2+3opw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] mailbox: mpfs: fix an incorrect mask width
Date: Tue,  7 Mar 2023 20:22:51 +0000
Message-Id: <20230307202257.1762151-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=conor.dooley@microchip.com; h=from:subject; bh=N+Fmo03qeVhPTJ2ouN+nX4YhvmUTQ6mGrE0sJhfEG04=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4XOqS91dHS5c+zaHbc75y70ZwR90D7jPWPBYbuAJ f0ua98ZdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiH28w/LP80GRfqdDw5M7R GT++qmY5eUXd2nfWRmRK1uO5qVqizCUM/1Nzv7fZZxQuf6hqa2HZ0rDrf+Tyu5xXzqeo6vq357z 7zgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122327_541207_75FFE636 
X-CRM114-Status: GOOD (  12.91  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The system controller registers on PolarFire SoC are 32 bits wide, so
16 + 16 as the first input to GENMASK_ULL() gives a 33 bit wide mask.
It probably should have been immediately obvious when it was pointed
out during review that the width required using GENMASK_ULL() - but I
scarcely knew what I was doing at the time and missed it.
The mistake ends up being moot as it is a mask after all, but it is
incorrect and should be fixed.

No functional change intended.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 853901acaeec..d37560e91116 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -39,7 +39,7 @@
 #define SCB_CTRL_NOTIFY_MASK BIT(SCB_CTRL_NOTIFY)
 
 #define SCB_CTRL_POS (16)
-#define SCB_CTRL_MASK GENMASK_ULL(SCB_CTRL_POS + SCB_MASK_WIDTH, SCB_CTRL_POS)
+#define SCB_CTRL_MASK GENMASK(SCB_CTRL_POS + SCB_MASK_WIDTH - 1, SCB_CTRL_POS)
 
 /* SCBCTRL service status register */
 
@@ -118,6 +118,7 @@ static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
 	}
 
 	opt_sel = ((msg->mbox_offset << 7u) | (msg->cmd_opcode & 0x7fu));
+
 	tx_trigger = (opt_sel << SCB_CTRL_POS) & SCB_CTRL_MASK;
 	tx_trigger |= SCB_CTRL_REQ_MASK | SCB_STATUS_NOTIFY_MASK;
 	writel_relaxed(tx_trigger, mbox->ctrl_base + SERVICES_CR_OFFSET);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
