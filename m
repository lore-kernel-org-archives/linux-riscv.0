Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41E4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDNqLnPzKcAIdAX5U8pOdTVdz/sEZB6ArftH01aeJA8=; b=LiqZ98fQMiAVVv
	HyOXQkYvBkf8YfcU0TZUADYZbS8a6IdLLT25ums4ZVr1O6k6tijfbUsn+tMWdXwCVv2jhf+MHIdqj
	RgAJZi+MJGMacSe1yTh5hfVZ2mznTbfxBtIOGeDSRCabK3UDOJatqzYqBdSr5zXr2zGKveftLwp1g
	NHpJ9r6/GApAEag7DazYEEnW2IHd/Z4bt00pTbtsFeXRchJLu2ROChcRGPnUPkHtwBqdjfaqi1oT0
	bnrmSdQX9j11nzsaotjvLeLbB8GZ/k0tuotm/mSDkttEgs+IzTV3FYBsjBnTPVDpGmpi3jJ0FXY4z
	TyTJYTOa76Dbbxh+yktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbq0-00FVKF-6r; Mon, 14 Feb 2022 13:56:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbpx-00FVIt-BB
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 13:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644846976; x=1676382976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WhgHwToS3AP40rPUHhKv2AxIWSk3spmDUHvAqgB73q8=;
 b=YXMH/b0sfayS38Rzkx1N0LIqlvnt0+Qbz2G3Ivf8Zhy/b/0aDomCSHMW
 +x+l8EjaJaaF5TAvyo24rJXc38oPcRPUD2+ag3Jco90acSsQegzZMx8sK
 QK2fUKe2YIU52yzyzjjdUNYGKpNwiygFL/9ixxaW4wH4s+tx9DxDoy4eW
 j/sf6cBuJZh+orznrrzhptEfgY7uIRSWvHKlRYwhyekTEe45NY/lcHt7I
 g85veMxhy+9RTyFi4qeEKe35Un/qJc0GK6/0kPPhGLH17/80JdmrVv0Hp
 Z4LnVi4oR8Qdy4Kl+be6OQMBklanuA8v+FfAnSHNJ+Ag+tLKJ8CzjbxxS Q==;
IronPort-SDR: WfFUMexxhgNR55aNGdLqx16PC4bvZgMP416j7+VwUXR+eL6ohzkCwAWZAfF9o9QQ1F9u2Rj6DC
 NZ7n/tphc2d2s1rhvsm83KAyIFaLXrzr/Yy+exHCDzhDuNCp/yMa7t25RQnddr/lneOLewJTHT
 104GXHqtt2NBbCv5c5dN+IiBGpOMRy6L8DanS91VP4LLSdoJwNwxfmMHssxez6A/Op3F00Ejma
 8MQZbAaDxe/hL/pLtLx5IotMZOpkRy/+cNwQVVWbGhnEtSVTMk21nmkEjoBgV6iAkUwvii+seB
 uNeRPS3ekK8qTph9iSyR1n0Q
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="153506330"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2022 06:56:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Feb 2022 06:56:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 14 Feb 2022 06:56:10 -0700
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
 <atishp@rivosinc.com>
Subject: [PATCH v7 02/11] dt-bindings: soc/microchip: add info about services
 to mpfs sysctrl
Date: Mon, 14 Feb 2022 13:58:32 +0000
Message-ID: <20220214135840.168236-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214135840.168236-1-conor.dooley@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055617_422151_F5C35143 
X-CRM114-Status: UNSURE (   9.26  )
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

The services actually provided by the system controller are not
documented so add some words about what the system controller can
actually do. Add a link to the oneline documentation with the specific
details of each individual service.
Also, drop the unneeded label from the example.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-sys-controller.yaml  | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index f699772fedf3..b0dae51e1d42 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -10,9 +10,14 @@ maintainers:
   - Conor Dooley <conor.dooley@microchip.com>
 
 description: |
-  The PolarFire SoC system controller is communicated with via a mailbox.
-  This document describes the bindings for the client portion of that mailbox.
+  PolarFire SoC devices include a microcontroller acting as the system controller,
+  which provides "services" to the main processor and to the FPGA fabric. These
+  services include hardware rng, reprogramming of the FPGA and verfification of the
+  eNVM contents etc. More information on these services can be found online, at
+  https://onlinedocs.microchip.com/pr/GUID-1409CF11-8EF9-4C24-A94E-70979A688632-en-US-1/index.html
 
+  Communication with the system controller is done via a mailbox, of which the client
+  portion is documented here.
 
 properties:
   mboxes:
@@ -29,7 +34,7 @@ additionalProperties: false
 
 examples:
   - |
-    syscontroller: syscontroller {
+    syscontroller {
       compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
     };
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
