Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6ADC27C65
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqjHGtHQQT0Ph4Fl/g4sRZIeRigN58co0yBVSQsLoKM=; b=Lmi5y6E28PAwc2
	9oc9CLogyFInvb8wxMQ89QkSuZZvGNoQKN4n76+Fkt/FajxpxdYE9oiEo7ZQrUbOfvzc53t0mZePb
	94r+1V8YTk39/6eReDBGAsE4OJuFO3Y3bZD8dmmuokDC512jnqSWj9Trjma0xDwu+VELPkw2RpmB/
	EdviwFgNtGkFyH+fW+igIWnt0xd+/x98rYiAp5DD9yuOC2RrebjTNkJKxzS/L2cnorc3yQ878SXvF
	TTQEfx6uOfxjFoJ/duvuB/yg9k8goUfsjDSfXg4Rbm3R2OP3+a8vdvtohX5nSJGcM4XU9ixYN8AxK
	oRySBctE7rJYspLwNGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuy-00000004lw4-0TqT;
	Mon, 10 Jun 2024 11:10:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuu-00000004ltd-30WH
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718017825; x=1749553825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vSvSduSdlE5klA6zgVVnIIfs+4m+OglLLkCW0vt9e5c=;
  b=rRnkNiolLXw7r/ruLISbvp2bt3gCvrBNMLZJE9dKa6/kwrtSg0Slu7om
   hm0gLyf+wvfOvGED8iL8CbHHiKM31Wv4y9BR/mEiVtBEvCiytEGSkCITN
   fS2zw0+D/kbusXOCB4vmRHw71gPMxtpy96yrGkfQb4ayli9sC+bgpgJYX
   d+gSEQDSgIRnB9LXeOq0+bJdyTAdSru6y/p0K9wOsUOJNEUAVayah7oVT
   +jF8D9rDAcY/zA/9BAkP7h8xASoc7CXOdR4Ntsc0B6tDd+7Dx/vbmNWuE
   LjJmRnTlJt4//s5ry2BPgqvkw7Bbuiu3vdQLl+EPomUTl5M7WIPQNK3wr
   Q==;
X-CSE-ConnectionGUID: lNoOtL5sTs6vJxiNFFwsDA==
X-CSE-MsgGUID: URZVaOARQKKJLc7sUBGxdw==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="27204229"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:10:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:09:39 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:09:37 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 2/5] cache: ccache: add mpfs to nonstandard cache ops list
Date: Mon, 10 Jun 2024 12:09:14 +0100
Message-ID: <20240610-reenact-amicably-bd088724b3cb@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vSvSduSdlE5klA6zgVVnIIfs+4m+OglLLkCW0vt9e5c=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlp925NCr74tNrk8tFqz6wS1b3LN8h+b/LeuuLAlplKp6yr /p061VHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJvHnC8M9c+5/G/R9v87vTNgic/l ymdGb6Rzc/aR+Wu7ccjl5ln1HOyHB9c3TqfcWr5n/3tYcyKihp9dZt5tEL+aat5XusUk4vlgsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041024_812320_853E31B3 
X-CRM114-Status: GOOD (  10.47  )
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

On PolarFire SoC, for performance reasons, we want to use non-coherent
DMA. Add it to the match table with the non-standard non-coherent
cache ops requirement.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/cache/sifive_ccache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 6874b72ec59d8..277e66a61efdc 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -122,6 +122,8 @@ static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ .compatible = "starfive,jh7100-ccache",
 	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_BROKEN_DATA_UNCORR) },
+	{ .compatible = "microchip,mpfs-ccache",
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
 	{ .compatible = "sifive,ccache0" },
 	{ /* end of table */ }
 };
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
