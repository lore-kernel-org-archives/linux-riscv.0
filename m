Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1860C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3SVQN7Zop60ocjur1+EKsUZjHIQjkmr68rp3iIl5oQ=; b=F2jkXzyNJzobcN
	jqNZ8P71BhAPwQInOoyKSmb1rFxtMBR6p3ioA2TZRykVq/cOrm03FCy77K4p3m5cFRRRx6gL+frlA
	aVjeX1IyjEgAw/xWiYa1ZI+CW7PPmfE1UbjKyiLpcdtjKZo6ZQnu/6NHl9Bju/b0N/6RxyHjNIPEs
	GDklxewndLr6iW86OvCVNBVM43wMDkzaOHIioaVGdW1JFUSPgffyQWtdOxHjjL39ISQ/ugp/9hAkr
	Db3RYnAhPLjOhoQvUjRe7CjsYA7opiXAQ1Ek/YjnuMpqZ23Q5ifWvJyf5mczCDcWYWkzS8/cXirBQ
	7LffcJZQBygcyD6MfiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbrH-00FWJV-3y; Mon, 14 Feb 2022 13:57:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbqn-00FVwj-Fq
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 13:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644847029; x=1676383029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUwu9Fdq/MRDAHV6UL3afCTA6/6dxR2I/gfuI0/01w0=;
 b=WmQHAx+COFzzHioV+l5+6P6XvNaC9cb1e+KnDS4oQyJC40mWGONOPhkn
 4ut2Np2fRbmr/UIFS1uLbX6unAn8gbebD7quu+AxXdqvnXSQFmA4G3l/r
 9JqeJlFAB2RM/NEGIgDvbNeXVNyfALBWQOgo+uz41Fwr1HZWRJY14Sq9O
 4+P3yUwV1x1sA7RYN1wrj8zAquvt3SZIPXrL0TcsB7aJ1QXZNCGvZiApc
 l5gxAaQt7BLtJ8Ch2YzgJ5r0LL1sV/blTTpj7uvzD72NyXifXYgCnFKUZ
 LCpc8nURzSV0EmrrndMsuIY/ou9GEXnWhGjvcH2p4pahZ9GrxJk3v3NzS Q==;
IronPort-SDR: kdqWLspQOOwf9G7rdt6GXhstA0tSrtetAQSQuUrB+kVWOTXjZ1u4sreZnGJiur6ujtgNfNlRWO
 ylnJnPTm8+Rj8P/JZ+VrZlCPwryivA9NBVMi17O/ZDaXZCssECByaiB/KhUb+wydCiekXzb1fh
 oR6zXRx1+NdZrvDMfCqXTb6g8s+ApLr8e5PloqnFMvlC7fKHXZLKqRm6vC1EpKqgHH7rJWSjPP
 wLmS46L8/NtCIzQHPeFEIp/BnLi/Gs4OzsUzuTuPnGA7b4gDgmnrtPVYNb/hKxFsqLwu23eTXt
 kpN2CztfMqj/piID4UfB5nY4
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="152982610"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2022 06:57:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Feb 2022 06:57:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 14 Feb 2022 06:57:02 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v7 11/11] MAINTAINERS: update riscv/microchip entry
Date: Mon, 14 Feb 2022 13:58:41 +0000
Message-ID: <20220214135840.168236-12-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214135840.168236-1-conor.dooley@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055709_597977_C47B9E92 
X-CRM114-Status: UNSURE (   6.09  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Update the RISC-V/Microchip entry by adding the microchip dts
directory and myself as maintainer

Reviewed-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..779a550dc95b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16575,8 +16575,10 @@ K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
 M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
