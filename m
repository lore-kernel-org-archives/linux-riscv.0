Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A8EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3SVQN7Zop60ocjur1+EKsUZjHIQjkmr68rp3iIl5oQ=; b=11K2GeJxzJVCk4
	t+iV0PTX8SAr/WMmgWSWvkdUZJ1oDputsu+z7sDQBQhTHoZxsrDhGYQgrOlBvnhQcAClST83UINSd
	IRANi0i2u9di+wMbC/M/rDs4/+6dYjU6ZF9VqdBOZGArid3fVQSPReyhlpCOUhImyapIWAeG1K2Hm
	ZjP8eBsNTrwj4bPEtCk+7eL5ME8s5wejgrR9sJgABobrMtxUHQ4h4rVrFDpnTqONdOlqxURCOYRrV
	bfU1uNgvIGSSdAIYW/zVah6XZzGWLXD3sPbicpiZnNOF6nAByNQb0TWwiPAdRYTHEPH5klDQlCS5S
	HHzvh5dJJcydThmsUHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6zY-00B85k-VR; Mon, 07 Feb 2022 16:35:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6p6-00B45T-50
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644251104; x=1675787104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUwu9Fdq/MRDAHV6UL3afCTA6/6dxR2I/gfuI0/01w0=;
 b=SxBd8eB4hx4m1F2HORxrsXNxsbd9cg5ivD+ElqqL36Ppsl+Op4nXVh6d
 5GFCiSs1vDXlo2YGMOyskAd6OoXnZU6hQj5qbnO/WYfguWWJJCN1Uxn45
 IJY9U/EZWCK22w2Qva1Zmt8bB21eylyEmmVk3vd/wf+0I38kx33Bf9hqI
 jCXzWSxkVXJcIXJeUnUFMDN1QwNsE0pXL6buLUDQa1LdChNAKKO0jaNuk
 IyADMN7jpiNQLDO/sOl6vtTL1GGPCdI/wckpgxHA+Hz4gxGHBzaMiUTLF
 Ev3LaabSCXYJr3/BsrqvfWGXYssH8i57ISixAQJHPMh7y8iWXk/dTKB4D Q==;
IronPort-SDR: OC17uJvBq1q0iATmtAibBLSPdHfRsh1dMhzNL47iUvksAHeoT2Jd9/Di1DXlDeXIz3sY6e+I0q
 o9twXutBj7DKdr2PBkvVlqNZd7gNc6/P5krNdCFSDzobFqCJit3iSNLnRXRVKuLGGJDlbPqUaT
 dO2VzO6j7NMAvtyL20mMbEtMFI0lNjAVmVBp3obCvHH4007w6MNu90vQ1HfxnG3TfDkf70D4P/
 rNRAYWKxX4ak/E7p6q74kMdRxOPRs5lBfYXt/Q5UAIILW27R0hTAcjn8mxpRUolkgyctVApjZQ
 e5PmQ7IPniSDNfoUMSRNxx4s
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="152200246"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 09:25:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:24:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Feb 2022 09:24:48 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>, 
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>, Palmer Dabbelt
 <palmer@rivosinc.com>
Subject: [PATCH v6 12/12] MAINTAINERS: update riscv/microchip entry
Date: Mon, 7 Feb 2022 16:26:38 +0000
Message-ID: <20220207162637.1658677-13-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_082504_250511_EE69F105 
X-CRM114-Status: UNSURE (   6.16  )
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
