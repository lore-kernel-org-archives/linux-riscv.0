Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF55EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o22HPJwNYH2ElNl9K24ZZV1tyoZAp1o+s9dtV0lUnM4=; b=PmHRLJ2ZHTE2SQ
	nuy/SU0kCoqMfYCz13oU72YdxDWwGG67DQX0Q8E0H4mciPaB9quaKLs6Xl4W0Z7DzTVaQ9zNMoL8q
	B+2C7LAkuUiltXavyQ+DniGPBDVIuwoNHsOPS5cJXWId0zGmMh1+tIPrTjnE/ICzoLu7c3MXYnAn4
	HqbZr1gmBkMNwpwSkTKAweZg8lYg8DJ7PEME1Pkg1mgt71Sn1POW4dh0TKvC+Xp5feb4GaiLdkuL/
	A2bVY8/8BhuPFVPOcJ0p+/ZeCdOrZq86Bu4OBKpoSo/CAOkNkcirN66YCOs+oBldK4Lemi9GXru5u
	axLxOIzNAGpyWqlaZYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHc-00A4My-0Z;
	Mon, 26 Jun 2023 11:21:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHY-00A4FY-17
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778480; x=1719314480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eZGPwaE1m+Pw9q6+drdEFoQWfh6B8MVtcv7cz4C7AWM=;
  b=0Q7eSwuDz42iuftg8rhaYhP8F/GmKsT0JhKJnXOJTbYuiDloFWwbiN+T
   daZddEjfg2KSx/F+LJlZhCf5Aau6ns1KjuIos6W8OXTRPV4QcuCFnw523
   idLTbtHh3FHGq3OR4GDhC20qU1wYV1IcgPMPaG6pZaYcRxSGsz4vHnKik
   UWx7kNPAsHknrSfEcVGM+MbGEPvaRZj1lz5U8sV15IXHi72d03JuBqa9J
   GBvCTNcHExGVAb8Lqy09N/H62czHaFIik+MrGV7JvRnENwAOvexHeGuKV
   zeXFh8GavMiru5FnBS359tdznXD/tyC+Y9zPKCcWelTBhlUjrMPXB4Vyd
   w==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="158621162"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:21:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:21:09 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:21:06 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 9/9] RISC-V: try new extension properties in of_early_processor_hartid()
Date: Mon, 26 Jun 2023 12:19:47 +0100
Message-ID: <20230626-ardently-caress-7c5886566ea6@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626-provable-angrily-81760e8c3cc6@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=eZGPwaE1m+Pw9q6+drdEFoQWfh6B8MVtcv7cz4C7AWM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzSwIaJ2btMmdgqZot8WPa/G3PGEPs4r1udXSujdFqnn9/ 14GTHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIa35GhvvsnlwdH+17zPm/9ExMZm n5+La70FFEbOkUKZ1ir5dmlxj+1076fM9XhG3d0c9OmjclNshf3Wa71PXiWp93E2qmir0rZQAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042120_454035_81A348CB 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To fully deprecate the kernel's use of "riscv,isa",
of_early_processor_hartid() needs to first try using the new properties,
before falling back to "riscv,isa".

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 046d9d3dac16..332574f27c95 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -61,8 +61,29 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		return -ENODEV;
 	}
 
+	if (of_property_read_string(node, "riscv,isa-base", &isa))
+		goto old_interface;
+
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5))
+		return -ENODEV;
+
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5))
+		return -ENODEV;
+
+	if (!of_property_present(node, "riscv,isa-extensions"))
+		return -ENODEV;
+
+	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
+	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
+	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0)
+		return -ENODEV;
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
