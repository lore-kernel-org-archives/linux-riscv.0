Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65F3C742A7
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1t7rKv4asGKQzlGZEDVXAMFHIm1E+xY+LnB2LcplqM=; b=sPbCqlVrvsG3AS
	LA83sMkoNcAmisn7zDWbi8bxA0/wXhpiAFoJHnpfMMSGoEloyfqhqMTgKlb07QjeIGjVGLSY7koKo
	/q6GCoJZEoXnEgb6q53EIcnPGb9H3mCul58efkjXf3FrwgWPCZImXjjFKw/AfYJtUc9YmZUHtUcay
	+gTJ9B2OWPBLWwjC7RuDRuYX3i8H8X96619aFxGySfkPQWa4kcBu4BtOCfJAupsxZdnBFPdbSTKTb
	5o9YqydX20BK1/oXpcPQTj4GADt/90hZWlmj2MdMgr59TSXfxrLoEovrVSid2yAq5y/22Z+Bux3pA
	2ow+pgcKi9GshfkDJUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqP-002MOF-UH; Tue, 07 Mar 2023 20:23:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqM-002MMe-G5
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D594B61522;
	Tue,  7 Mar 2023 20:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8914C433EF;
	Tue,  7 Mar 2023 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220609;
	bh=VALLXa4RfjgD9/IaizhQxdY6y9Xca49NdnfoOQ47Y+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBr9Ztu2PNBF/a1Vij6drPfXyPlA06m7KIJsTbnWXbmOq+UrBScPikzMRIZw3qhfp
	 AQ7rSrhZ1Q8/8FoV0Sw18GSufFJrL0ZKlGVCOQTaOvMwnqqMlvxGfqMyZCcvDQvWWZ
	 YxG9Sp7BixBDAh7MKV8wKP2JNLlxaka50790bIIzqHd9ADjfyC64PUaMtDqnDDMxRq
	 8UgUatZ7Uzy7BsSFOgXE8PMIJFum2eTkPCIEFs9Wt0jhGuTQJja6QzBKRaR5DfwpJQ
	 cGGi2Ot2fBbXfTXhaQhQyWzlSkzNMSN1Ac54XMdB6Eg+ZFPz7p4lR6kBYnZl7as9Fj
	 5rguI7kVgEwAg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] mailbox: mpfs: ditch a useless busy check
Date: Tue,  7 Mar 2023 20:22:53 +0000
Message-Id: <20230307202257.1762151-4-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=conor.dooley@microchip.com; h=from:subject; bh=3TqNg+2iuqTO/EgEaud+uW5LomESwP/fUE4ltR1iLac=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4WyHSY+Wt4RdWbzMT3OCQZ3EuTZs1ns6pn2xYSzr Dzu81iko5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOpOsXwP9CY27mex73y3I6j TUdyE4v9GizYw29b9p/yP7F4AvvzdIZ/pkfbvrwXYU14Eihi9rE0IStHwWDL4+zprzc8Yfkj2Li cDQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122330_596840_F0FF4BAE 
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

From: Conor Dooley <conor.dooley@microchip.com>

mpfs_mbox_rx_data() already checks if the system controller is busy
before attempting to do anything, so drop the second check before
reading any data.

No functional change intended.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index e0e825bdbad9..0d176aba3462 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -170,12 +170,10 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
 	if (response->resp_status)
 		return;
 
-	if (!mpfs_mbox_busy(mbox)) {
-		for (i = 0; i < num_words; i++) {
-			response->resp_msg[i] =
-				readl_relaxed(mbox->mbox_base
-					      + mbox->resp_offset + i * 0x4);
-		}
+	for (i = 0; i < num_words; i++) {
+		response->resp_msg[i] =
+			readl_relaxed(mbox->mbox_base
+				      + mbox->resp_offset + i * 0x4);
 	}
 
 	mbox_chan_received_data(chan, response);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
