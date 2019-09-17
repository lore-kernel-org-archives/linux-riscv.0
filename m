Return-Path: <SRS0=Dbhb=XM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE1EC4CECD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 09:12:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D56D221881
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2019 09:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPSJUltq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aurabindo.in header.i=@aurabindo.in header.b="eQjSy21K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D56D221881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aurabindo.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TIKjhGVM690S4V4THsx4nndLDj6BcJMiR5CCseffO74=; b=CPSJUltqPAR0d1
	WJpoBdc9IeVYW/JJhKFpYO1rdyxyOluMemBubMQH6zID30CCLfgo+8hNeHMcp61uDfFI/ulKrQbGH
	hwn0NZhGZpxhyzgYxGA3jqorHRfEZe/ORGxFailRpODKeLu1eivguCZQqNHwtPMdaD/KtuJ1VxAJL
	gejPFT8cnQzXsk7V5KfFbigmH2Q2TLyk6BhY3N+j8BxLYzig+3vzfJWC3GDih1ZCYKqJ7q79eBfPG
	+qbKzXmt/w6CCcEbON/8qaybWnCEMnLKfHn4RYaFso9VaR2qto0qZqCE5Ygy6t4hjFjgEUtyNmIbp
	wGTctGBAn8ZN11T5eO5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iA9XD-0004Ct-Dp; Tue, 17 Sep 2019 09:12:31 +0000
Received: from mail4.protonmail.ch ([185.70.40.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA9XA-0004C9-N5
 for linux-riscv@lists.infradead.org; Tue, 17 Sep 2019 09:12:30 +0000
Date: Tue, 17 Sep 2019 09:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
 s=protonmail; t=1568711541;
 bh=ZKYIzKdgRRtrB7OyOmWDzTMGg6uay9ipjlu1WQonyTU=;
 h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
 b=eQjSy21KM5OSXxxHfL1Q0qHO98l3ynqXu8fnUA4rHJu0AHrC6MQbLJr3PyVby+VLd
 HftIbwWlow6/FRq+UwbpO4l5ArWqYTCd+B5WEmp/Ozjw7Y/szu+/yOmVBRq/qx4u4A
 NkAgdHx082bP+SO2K8f2zMj/58ejxv+TrWH7LCa4=
To: broonie@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com
From: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: [PATCH] spi: sifive: check return value for platform_get_resource()
Message-ID: <20190917091207.4925-1-mail@aurabindo.in>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_021228_916961_296FD66C 
X-CRM114-Status: UNSURE (   5.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

platform_get_resource() may return NULL. If it is so, return -ENXIO

Signed-off-by: Aurabindo Jayamohanan <mail@aurabindo.in>
---
 drivers/spi/spi-sifive.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 93ec2c6cdbfd..67485067a694 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -308,6 +308,12 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, master);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "no IOMEM resource found\n");
+		ret = -ENXIO;
+		goto put_master;
+	}
+
 	spi->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(spi->regs)) {
 		ret = PTR_ERR(spi->regs);
-- 
2.23.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
