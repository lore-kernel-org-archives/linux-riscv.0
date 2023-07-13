Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F59DC001DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWZOcgy+PjUuOzgUaCkJa9Op8KYENZRxA3xSYOgy5Os=; b=hUdEyF8L/hth3l
	ss3T3UUA3mrthH5603iyw3h7r7DpeI5FEusMvPQ5VnIOFJ1KzJ/McjalT1ZXWeFj/Q5bINqE2lWfV
	gZZImXi2e2exSbcVGwR7YvyBR7S5S16jk0SvrTOcKCIIM54ZzlP+qT2ZPHnQHRaOBvCZY1AEwJCEY
	gc4T9d2CIPbsfcgG7o9p5WV4vNMelIMKyPUsZzcXX1+mHN3NrL0nAVCyKp1KTNVDMxU9+GdttOMum
	ViKKEfpxwdhgar52KyQKD4aJmEA75/ooED8h4jYAQL2jHucW4infV66xo88UsBKzbF7mJnabMLDr+
	XNWFj7RbazcePeCmZb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBu-003Br9-2q;
	Thu, 13 Jul 2023 12:13:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBs-003BkF-1S
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689250380; x=1720786380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6+4fXO0Mgsbn0oR0/2jnJO0XttLzGYmDlCcJv+2evZU=;
  b=pVBTRG57doTaPK51/QwhU7QcLP3PgRvTwm3QZeyN1ET/3GBgOrl0jZXU
   5VJ0KzfSMvzYqJW/pbn8AmrIVYFIHlfaepAp5mu3J7Nkhh1iMGpOQQF7M
   piVXhf+gB+pIBl52aIcGzCwD9ZNLxM8PKmW2U4J5j8yjQmXe0YgQpxRwU
   scC0iesP1bG/ELI0BMRs619JN/nS1ECDnxV/8sIh/JjBhHWg39yflIJ10
   F5Jf/4ca5U6FdWPao4nttDODzhjcI7Y/UoaUW50QMadfnLaToEZm4aIqk
   65+RtIaveH6jHg0qb/ZNv8GulCa3hc1EW2Au8QuQIcxbHz/Xg6e6owEOb
   w==;
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="222827224"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2023 05:12:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Jul 2023 05:12:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Jul 2023 05:12:56 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v5 10/11] RISC-V: try new extension properties in of_early_processor_hartid()
Date: Thu, 13 Jul 2023 13:11:08 +0100
Message-ID: <20230713-tablet-jimmy-987fea0eb2e1@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713-target-much-8ac624e90df8@wendy>
References: <20230713-target-much-8ac624e90df8@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6+4fXO0Mgsbn0oR0/2jnJO0XttLzGYmDlCcJv+2evZU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrX153cfflPHBz0UmfZbfXnZ8ederSpwdfJ5Rt15rJHcD1 6BBbZUcpC4MYB4OsmCJL4u2+Fqn1f1x2OPe8hZnDygQyhIGLUwAm4uDC8Icjzz4gRHyrkfuVnMw7Vf Oel83TOVxSNFmipDzYIXfdln2MDJ3LM7UsfU69OnxeLkRzXY6ViE7YW1frzPLMq9c2iWb+4AEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_051300_495408_B48F7B39 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To fully deprecate the kernel's use of "riscv,isa",
of_early_processor_hartid() needs to first try using the new properties,
before falling back to "riscv,isa".

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
- Add some printouts to explain what went wrong while parsing harts,
  so that if none are found there's at least a hint before we hit a
  BUG()
---
 arch/riscv/kernel/cpu.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 4f1f12f34b63..28d5af21f544 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -61,8 +61,35 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		return -ENODEV;
 	}
 
+	if (of_property_read_string(node, "riscv,isa-base", &isa))
+		goto old_interface;
+
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5)) {
+		pr_warn("CPU with hartid=%lu does not support rv32i", *hart);
+		return -ENODEV;
+	}
+
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5)) {
+		pr_warn("CPU with hartid=%lu does not support rv64i", *hart);
+		return -ENODEV;
+	}
+
+	if (!of_property_present(node, "riscv,isa-extensions"))
+		return -ENODEV;
+
+	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
+	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
+	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
+		pr_warn("CPU with hartid=%lu does not support ima", *hart);
+		return -ENODEV;
+	}
+
+	return 0;
+
+old_interface:
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
-		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
+		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
+			*hart);
 		return -ENODEV;
 	}
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
