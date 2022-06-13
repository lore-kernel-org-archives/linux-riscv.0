Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3955C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2e3wVWztXUa20vHdkGwsUhdFIOviOaRT0PqPJ1nuvWs=; b=kX9DqlpZpPvith
	9akuuYnGa4Q5e3Q+gxylyXZzfqkjzQ9Alpmo15lIaOVPjJHb2qG9r0cls3T0DdTvlquy0k+wz7yUI
	KbsRxuU7YYs/XniR/7nkpx0welY/DN03YSVWVsc+1Qfs/+OM6IRdo/WZoAehrvYqv6PSq5cqNQpMc
	0Wxc0gbvrQIB2NVLIdUwp8aGjov8OMUB6kMvjoHascGgMvlJJ90TB3f4BTFG3MGXqp4qAyvBfbLzr
	JnNG9UqeLi0wbKxz7nSn88TIyjQD+FaOxJo544/q8Q1DBj8xaSZ7dbQfI5ePTWDzAKecBDyu3t+Zi
	jiJAJgdY9WzcFyCueoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iYi-003Lit-0s; Mon, 13 Jun 2022 11:48:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iYd-003LhP-GK
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 11:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655120915; x=1686656915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pj2tfW8mZzif7jlpRh0HExia+x5zaVcrwbz9+Z9tZBk=;
  b=w+fMD85eLFNKKYbY6yO0uDjZXa3BptgTtWCZCJUAeKZWI7bxapX86oyT
   hxpz0SW9J3HsAFfuYdvtmJyEaDn2bO7KFe70sm9wNv+ly9cpZFVgeBL4N
   N7ch985IgIAl82oS0ihpCDJOmE1PaUANsfq3AEn54LyOZ4WAAI7AjyO7Y
   ufSvBCGUaNgdVWAJ4QjmOm6DSqlVTN2BbWG0nm2Hl2IuQOiplkJ8clzKQ
   lqhi9nQlVgQLeCWcMlX/6mJlV5K62CEWiCgSDJcTR13C4i7bvByI5zUSR
   zxUPXIqoEy/PYqEyjbH8Nmf3RYbA2ottsggTizaesg8XP79pEz6FhwBLZ
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="168174938"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2022 04:48:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Jun 2022 04:48:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 13 Jun 2022 04:48:32 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Valentina Fernandez
	<valentina.fernandezalanis@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Ben Dooks
	<ben.dooks@codethink.co.uk>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v2 2/2] MAINTAINERS: add musb to PolarFire SoC entry
Date: Mon, 13 Jun 2022 12:46:43 +0100
Message-ID: <20220613114642.1615292-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613114642.1615292-1-conor.dooley@microchip.com>
References: <20220613114642.1615292-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_044835_586272_5307666E 
X-CRM114-Status: UNSURE (   7.20  )
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
