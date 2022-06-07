Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8149C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7goe2dfoYai2VSQ29F6IEQHdTt3qYbTAPDtz36eucc=; b=zD9sn4YXVG9Dob
	9uardYbVh4OMXdiLm814GOujeYXDa2PmSwe6pMjvCy4pYkxP2igyZtQQTmafZdRHUrjonvUIPUGL8
	FJUXwAjxax1qaCclcFHuIhDkYIFrjXf//OrwbSQs5V66hzYplpyWg369gGFBRyLJtOXNQ3PKebcmm
	4Z478L7v8202+iQV29vuaEDsk7K8zVb+TFXcay+LsYGYcFBdn/PYaqft7XCxf6tVAo5I/J7NCxQxj
	KpWwuw0gvOmx9nwzrgzfeqksCfVM56U3xL/od01lsV35x9URl6lM80ZmkgjX4q11elJMEO5ckckx/
	W7QGrMPCxSZytDB32OUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTq7-005Wkm-G0; Tue, 07 Jun 2022 07:41:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTpR-005WNN-Fb
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 07:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654587642; x=1686123642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IIzNUwsPeY1RReNMe2C/kRZYXKUGZUuwGKlpnOb09GU=;
  b=Mt884DNSrTFPgTEN2zGbhiNskivkaidEFSDObEYcj8XkzV9Avx8VqKch
   jNAjTYx9gxLDcTooMIy4nMxjURUds2GiA4rzv1t7LRMU8CLbfTHt5Xc3g
   jDoyvGwM+oB8HiIC2y82S4kn51HvjNW8yMSo6MumUXfG8EEV9iQ1F3i1T
   3H051W7cC1YtX2dyIfcpCono7743PiwwtLvTQzNVpYh4Y+YcAMb8av6T+
   QnUKfs5Sg6n1qX525oaKLhcBARnmVBTxa+/JjfQHBtx2xLTg15OsVWmVo
   ZNg2+SJ3L6+dDicwKHRhR0Qf7dAbz/TYztUEA3weO3dl0W747QmHK1xIl
   g==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="167043056"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 00:40:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 00:40:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 00:40:36 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 2/2] MAINTAINERS: add spi to PolarFire SoC entry
Date: Tue, 7 Jun 2022 08:38:34 +0100
Message-ID: <20220607073833.2331539-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607073833.2331539-1-conor.dooley@microchip.com>
References: <20220607073833.2331539-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_004041_580094_4951D231 
X-CRM114-Status: UNSURE (   7.66  )
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

Add the newly introduced spi driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f468864fd268..279a25065942 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16955,6 +16955,7 @@ S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
+F:	drivers/spi/spi-microchip-core.c
 F:	include/soc/microchip/mpfs.h
 
 RNBD BLOCK DRIVERS
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
