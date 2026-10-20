Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431F606A31D
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mw0+ZlIo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.a=rsa-sha256 header.s=r1 header.b=6SNc7g8Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oTeQ0VXVRl4n1LG2w4pAEw+ohycPPpWBL1IZyrk0MY=; b=Mw0+ZlIo4ShpmZ
	245drM+lIJ0TnNA1u4k7CmZ1D5S1arXD5ANY9p66CQtU+/fq9Xb5n+3Qkp1rnwPBSiwAPVB/bO3v9
	kBR+riGm94w/fmtmG7NtzyHL6FivPuu7VfQtEll+kvZAkdllnlEjnmDhdZue3aGIhSkJUk3rgIj+q
	K3riZUDa7w61bsc4Iu+shoVOTkVs2shomf2kKJEJgmranwqlYDF6lm42vNHbCkdgsB+N/K9yQ3Alu
	4mvwrVmOfDF99qBkT+E+2qNlD4kVDHhiycx9JTW4HtrLO+QyNdmz4LsQxgdrItlrKnH07CG547rDH
	HYLG4/hBJrElrvFigo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9re-00000009mwW-0xe4;
	Tue, 20 Oct 2026 13:26:50 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9rY-00000009muQ-1zTe
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 13:26:48 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j8Cqd5dKnz1rB8C;
	Tue, 20 Oct 2026 15:26:37 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=GdTiT1zqUh08frHkDgB93/kDjVVTubZPK4W1lRMqWhc=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1792502797; v=1;
        b=6SNc7g8YKQW8B0TohZR7jo5AebywKGsa/INxfzSIKzPosB340Pv7c47xTbkDYgg7
         bqp8Tw9c/72sOkVAFqbfyYiRtNEcPgxicqFqWWG+hVxXgan2YJn/GAa9Lt1svh4/
         fB1m7cF7TRso67cZ7VRoEXdyUdLtfBeE86HC+6pIWh1zYQbC3UIc6Y1TqeqJnFLt
         BD8ObIwULVwZGLSG5sjuNYswcr7oRn1z0459JAa6xA3000NjBoymys8Eb7ze6W6+
         dfW+VqPYDGA80qU7J1bbTkeVOlwwSu7TO3esGWqf6i4yUpg8WC9vK44MRy0lJLlh
         YiocInrEg1HWT0qBIgCkKw==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j8Cqb4LQ0z1rB7K;
	Tue, 20 Oct 2026 15:26:35 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4j8Cqb2pJxz1qqlR;
	Tue, 20 Oct 2026 15:26:35 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id 7LzTV1TIc3kf; Tue, 20 Oct 2026 15:26:33 +0200 (CEST)
X-Auth-Info: bowsSLLE8E7Ly/rhqS6TupuytPwKIElhWtMg/6gsRNpShmZ+y+aRBvGJ5yv4N1LX
Received: from wiesel.intern (aftr-62-216-206-189.dynamic.mnet-online.de [62.216.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Oct 2026 15:26:33 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:7b8d:a039:76a5:1596])
	by wiesel.intern (Postfix) with ESMTP id ED4C179A08EE;
	Tue, 20 Oct 2026 15:26:32 +0200 (CEST)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH v2 1/2] Bluetooth: btbcm: disable read tx power for BeagleV-Ahead
Date: Tue, 20 Oct 2026 15:26:03 +0200
Message-ID: <20261020132604.90708-2-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062645_873064_C43124D5 
X-CRM114-Status: GOOD (  16.38  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The bluetooth module of the Ampak AP6203BM is identified by the btbcm
driver as BCM4362A2.

The firmware of the bluetooth module on the BeagleV-Ahead reports a
capability of reading LE tx power. However reading fails. To get
bluetooth working it is necessary to disable reading of LE tx power on
the BeagleV-Ahead board. The disable is implemented in a similar way as
for several Apple boards but uses the board compatible identification
from the DTB as there is no DMI.

Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
---
No changes in v2

 drivers/bluetooth/btbcm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 463d59890bef..2d02cc1863d0 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -436,6 +436,11 @@ static const struct dmi_system_id disable_broken_read_transmit_power[] = {
 	{ }
 };
 
+static const char *board_broken_read_transmit_power[] __maybe_unused = {
+	"beagle,beaglev-ahead",
+	NULL
+};
+
 static int btbcm_read_info(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
@@ -537,12 +542,13 @@ static const struct bcm_subver_table bcm_usb_subver_table[] = {
  * This currently only looks up the device tree board appendix,
  * but can be expanded to other mechanisms.
  */
-static const char *btbcm_get_board_name(struct device *dev)
+static const char *btbcm_get_board_name(struct hci_dev *hdev)
 {
 #ifdef CONFIG_OF
 	struct device_node *root __free(device_node) = of_find_node_by_path("/");
 	char *board_type;
 	const char *tmp;
+	const char **s;
 
 	if (!root)
 		return NULL;
@@ -550,8 +556,15 @@ static const char *btbcm_get_board_name(struct device *dev)
 	if (of_property_read_string_index(root, "compatible", 0, &tmp))
 		return NULL;
 
+	/* disable broken Read LE Min/Max Tx Power on first board found in list */
+	for (s = board_broken_read_transmit_power; *s; s++)
+		if (!strcmp(tmp, *s)) {
+			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
+			break;
+		}
+
 	/* get rid of any '/' in the compatible string */
-	board_type = devm_kstrdup(dev, tmp, GFP_KERNEL);
+	board_type = devm_kstrdup(&hdev->dev, tmp, GFP_KERNEL);
 	if (!board_type)
 		return NULL;
 
@@ -577,7 +590,7 @@ int btbcm_initialize(struct hci_dev *hdev, bool *fw_load_done, bool use_autobaud
 	const struct firmware *fw;
 	int i, err;
 
-	board_name = btbcm_get_board_name(&hdev->dev);
+	board_name = btbcm_get_board_name(hdev);
 
 	/* Reset */
 	err = btbcm_reset(hdev);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
