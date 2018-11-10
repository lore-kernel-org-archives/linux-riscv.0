Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D654C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 00:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EDC20840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 00:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DCcHrv7H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HHdcLWRW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48EDC20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GO9cyHYqB2xysnpJkHkRACDFJQlIKjKMWQ4s5prDpwk=; b=DCc
	Hrv7H+WO2siU/23/64Rqn6mMALrKoXNztir4h6GPZKvK5CiOJtPHtPPzXvggwtAqPCxZauboAh8em
	bRoxek2hvA5oaX0lrgqyH83POMwQ/ae5cx9IGuX1Mbl4Xb8IL908crxIbDZzfn0sl6cPKOd+vo4KL
	pWTn/+Ogn+Qttj8hzGC4E4cGuGcElPF6is3lDgvN3XZ+i7L0OJ0MXOuNxi8+/qITlTSCurzoJ4+hR
	vApqC0fRDp5Exv4h11NHZA3GZxFv4ATJQo2qMgzY9cy7h7pBZxF4hLnsnGHWIc2a7OiSPE4B7qM75
	JICbl0/FE5jiijYbfDs3bz82KlAPaMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLHYM-0002GO-7S; Sat, 10 Nov 2018 00:55:10 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLHYJ-0001mR-QS
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 00:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v4J2N6VunLq0hobOZyHQM4xJyeU9Wp/trF35l1bJSyA=; b=HHdcLWRWHHUZ0VFiGMVl1jPYM
 tKWkoRbf52sZferJneWWNvgs82M9CSCbFZf2GjryVfOzOsRSI4/xfnM9N3BCJgs9BicPr3jNo5M0p
 ZnMlsRL6ari8B5FvVvHKqxn17rgPLKX0KFkfR1aRzBJ5RQrZj4/s00weCPWjmOLpcZ8ZMg5mG9Pr5
 ApS32XVgPCWbuQD9uThctnIEJ/kju6O50TI//oqfghW+3US2Rm8H88fldK68Q1nboouzGe1WGEr+F
 aj4P/NOlTJjbDjj60BiaZINaHkjnyowDBdcAL1x1YhfXSM2Erp/SI6MBso65rDIf53gdN/tcH76z1
 EBleqLOHw==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLHYG-0000TG-6o
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 00:55:05 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAA0rTeD037544; Sat, 10 Nov 2018 02:53:31 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-b5-5be62c0943d7
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 2F.6D.03682.90C26EB5; Sat, 10 Nov 2018 02:53:29 +0200 (EET)
Received: from trampakoulas.ics.forth.gr (dell-desktop.ics.forth.gr
 [139.91.92.59] (may be forged)) (authenticated bits=0)
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTPSA id wAA0rO0E024479
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 10 Nov 2018 02:53:29 +0200
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: devicetree@vger.kernel.org
Subject: [PATCH] OF: Add a warning in case chosen node is not present
Date: Sat, 10 Nov 2018 02:53:17 +0200
Message-Id: <20181110005317.5631-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.16.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGJMWRmVeSWpSXmKPExsXSHc2orMup8yza4Op/fov5R86xWsx885/N
 YtvnFjaL5nfn2C02T1jAatG69wi7A5vHzll32T0ebrrE5LFpVSebx+Yl9R6Xmq+ze3zeJBfA
 FsVlk5Kak1mWWqRvl8CVMWv7f9aCCxwVD9Y9ZGtgnM/excjJISFgIvH4wW/GLkYuDiGBw4wS
 53afY4dwzjJJPLp9lRWiyk3i9v2dYDabgKbE/EsHWUBsEQE5iZtf77KB2MwCMxklnr/yALGF
 BVwlru2+wwxiswioSpxedQ2shlfAVGL9jPdQM+Ulfj3/zDyBkXsBI8MqRoHEMmO9zORivbT8
 opIMvfSiTYzg0Jjru4Px3AL7Q4wCHIxKPLw/lj+NFmJNLCuuzD3EKMHBrCTCK7sFKMSbklhZ
 lVqUH19UmpNafIhRmoNFSZz38IvwICGB9MSS1OzU1ILUIpgsEwenVAOjgbroHNG377+zHavj
 03t+/0FCeuyGcFXrUPG2pNlqsaEHmr9dNeTx/TSRjaPVsEoo1eHml8wWfd+Zq0IXTLT8HKM0
 WVXlQO9nPiulRZ/4V7ToCj6zF0tq0XKvzora5aqjG8iytVLKxXaz7YHss7+L/M7etHh7V0ds
 d7V4/QFrOc35dSUXDimxFGckGmoxFxUnAgDJEOJaCQIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_195504_585087_7DFD5F38 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 robh+dt@kernel.org, frowand.list@gmail.com, palmer@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110005317.HcgzG9k2ZiHmAiuYFjgOr1umJo_vW43fhHxxpqFPoMw@z>

On architectures that only get their bootargs through devicetree's
chosen node (such as RISC-V), that node is mandatory. After a
discussion with Rob [1] I'm adding a warning in case chosen node
is not present, to let users know about it.

[1]: https://patchwork.ozlabs.org/patch/984224/#2016136

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 drivers/of/fdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bb532aae0d92..7ff67bf1f6d6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1200,8 +1200,12 @@ bool __init early_init_dt_verify(void *params)
 
 void __init early_init_dt_scan_nodes(void)
 {
+	int rc = 0;
+
 	/* Retrieve various information from the /chosen node */
-	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+	if (!rc)
+		pr_warn("No chosen node found, continuing without\n");
 
 	/* Initialize {size,address}-cells info */
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-- 
2.16.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
