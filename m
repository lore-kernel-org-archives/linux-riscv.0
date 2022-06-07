Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9771AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2e3wVWztXUa20vHdkGwsUhdFIOviOaRT0PqPJ1nuvWs=; b=e4G+//6EBt2ZTU
	NDE9UHycA0TiB4osA1BoneAhnjgz43puj1ZtNmwhJde5BIb0LPkkrNw9N0QgpreJ22vdW4PWbzRh6
	SYGoV4OEneyCeK4tMyXnx6m5dsvZeQNWeVJO79/+/pISc9MGILYfcGCzuTDwzxuGBpz367KeTCWJ4
	s5DX+eVJ1Bkq46PxsL8aBLKW4tT19AkPErQUTx60Mh4oSUrYsuCaIctEYPFKVTdBNj25QSoZGTRkE
	psqJ70o93kduRr+RJbttf7oOdEfUU4FlXW8IpbP7xBguswv5kpK7jRK1grbC7EO7sQ6U7cItahLSh
	8hGaXIom3XxszlH9nG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZDx-007iL2-IA; Tue, 07 Jun 2022 13:26:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZCp-007hFi-QK
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 13:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654608311; x=1686144311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pj2tfW8mZzif7jlpRh0HExia+x5zaVcrwbz9+Z9tZBk=;
  b=lla9ESmhvU2FHlBGtcpoXuCbC3JXuz8NjxAwrwmL0k+8vG6J6bgLx9h/
   FvO6C1jtdv70ZmEkMRQqd4qFiSiqPTsQlsjjX0X8dpLCaC/Bs3a9gADZp
   cIf6U/xZsOJnzoWoQsyyebHYz/Rw4Jc8lQmmIzHDUmASNiMhNeeZ0AayU
   omX04q4xPm+7MU/ayvsd83iIcdikVu+1fcqEJyst4bCNhq8uJeK1oBDMB
   gfLEjwMf18pwewOz/Mb8cyQtQQn1q/fO4lA/8W1Gc3bddWtTxSnNGuLbp
   q1kMWhpXmAClzXkZ81wWDBw8FTVjZwkzt1H6fQYfg1GyyfhbpfLgQkkAF
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="162235989"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 06:25:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 06:25:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 06:25:02 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Valentina Fernandez
	<valentina.fernandezalanis@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH 2/3] MAINTAINERS: add musb to PolarFire SoC entry
Date: Tue, 7 Jun 2022 14:22:03 +0100
Message-ID: <20220607132204.746180-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607132204.746180-1-conor.dooley@microchip.com>
References: <20220607132204.746180-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_062511_942729_93170B5E 
X-CRM114-Status: UNSURE (   7.84  )
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

Add the newly introduced musb driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..b07b2cfa3567 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17143,6 +17143,7 @@ S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
+F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
 RNBD BLOCK DRIVERS
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
