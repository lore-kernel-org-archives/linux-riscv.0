Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6336FC25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MhORQICIGpbb6M9oedMlLJreC61Oy+kbrpBTjf452mQ=; b=Cs+a/WdwDkiFWi
	KuxZUSY2yagHlnkchlV3y8gw+AgVxOsv3mp4ZQVLJfXahSGZg0zjjPF9w2xJCVslnj23fw/jNVyWC
	aWduNwQZPaKpwnFCpLr1L/6U5uLJnaUfGcGPH5rCp2MOTVwMoXF9sFEfYOTVphU6vbsuQhIWBBene
	wyFYHquVVpj8IKsDTDAX4M+eWfGGllyd+obVV/lNW3LhP0muoDnHRYDwiBOXTqexIYFDnArkBrVg9
	vSCz2b34sY7CeyiCfXdvaLq8W49bBiEM9es41m66Z3AA6yaI6y7mcPy/Qgc9auO7PqlxwITS3Cuga
	WHLk1LJsuanTfQCz4S9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBztV-00000001S6J-15tF;
	Tue, 28 May 2024 16:41:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBztQ-00000001S51-3aKl;
	Tue, 28 May 2024 16:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7EBF9CE1397;
	Tue, 28 May 2024 16:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0DBC32782;
	Tue, 28 May 2024 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716914501;
	bh=DMgXSKpLwPGnXLdeaUen3gAjKmTX+D3leZxLgkVaXlo=;
	h=From:To:Cc:Subject:Date:From;
	b=XaJNwDtpSAmeDSf7UPYDPLYGzpjNandQwPlj4GqQNQMcy84ByAlU3Jz0OHUP5+8Pw
	 F3B4baLUu3xBWWefsQ5bso6eja0kPvl4biz8ZDs1ac7Kt3mQFdFSaf4rWNz2iR2NID
	 q2QjpeudjuYrh/fZRoPMLfJUl3dNnjySoE5Zoc7cX8UKkgGqA9g4UAEkiALZ+3RAo6
	 MUsUvU7mmpcVz4i5c5f2qODMpMyigWOINSOU4B4b48LkUqQPOngA9s6C51pl3DavAB
	 f3zYOwUQcdBmE0Sc+4Sy+Le2wXBCivSf1qZY6hkwVVLuwMBumCGq8gnolDv3e3/tTU
	 fsPAVXik0dSiw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sBztL-00GNOx-CY;
	Tue, 28 May 2024 17:41:39 +0100
From: Marc Zyngier <maz@kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>,
	Saravana Kannan <saravanak@google.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
Date: Tue, 28 May 2024 17:41:32 +0100
Message-Id: <20240528164132.2451685-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, apatel@ventanamicro.com, saravanak@google.com, robh@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_094145_267820_6171BF20 
X-CRM114-Status: GOOD (  16.10  )
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

Commit d976c6f4b32c ("of: property: Add fw_devlink support for
interrupt-map property") tried to do what it says on the tin,
but failed on a couple of points:

- it confuses bytes and cells. Not a huge deal, except when it
  comes to pointer arithmetic

- it doesn't really handle anything but interrupt-maps that have
  their parent #address-cells set to 0

The combinations of the two leads to some serious fun on my M1
box, with plenty of WARN-ON() firing all over the shop, and
amusing values being generated for interrupt specifiers.

Address both issues so that I can boot my machines again.

Fixes: d976c6f4b32c ("of: property: Add fw_devlink support for interrupt-map property")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/property.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 1c83e68f805b..9adebc63bea9 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1322,7 +1322,13 @@ static struct device_node *parse_interrupt_map(struct device_node *np,
 	addrcells = of_bus_n_addr_cells(np);
 
 	imap = of_get_property(np, "interrupt-map", &imaplen);
-	if (!imap || imaplen <= (addrcells + intcells))
+	imaplen /= sizeof(*imap);
+
+	/*
+	 * Check that we have enough runway for the child unit interrupt
+	 * specifier and a phandle. That's the bare minimum we can expect.
+	 */
+	if (!imap || imaplen <= (addrcells + intcells + 1))
 		return NULL;
 	imap_end = imap + imaplen;
 
@@ -1346,8 +1352,14 @@ static struct device_node *parse_interrupt_map(struct device_node *np,
 		if (!index)
 			return sup_args.np;
 
-		of_node_put(sup_args.np);
+		/*
+		 * Account for the full parent unit interrupt specifier
+		 * (address cells, interrupt cells, and phandle).
+		 */
+		imap += of_bus_n_addr_cells(sup_args.np);
 		imap += sup_args.args_count + 1;
+
+		of_node_put(sup_args.np);
 		index--;
 	}
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
