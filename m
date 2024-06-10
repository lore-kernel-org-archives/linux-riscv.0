Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0E7C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/BPYZ880ZbfrzdSFInAEFpLbujKTS4XY+rH0qD4heo=; b=0wNfj5GR/4YJhv
	cfpMmWwIF/0LBY9N24rqQOunaOhPg0dgiQMhxmaJSuQTx4oMzk+ZOy7oS+mW7oE77FRKr57vjy+wr
	NMhEBVJTCxD1XPh53oEUzeA0RsxeJyLRwDv9MYTmXeYsNqAq1yzVL67gJfwWfJmAUZDQGnfFvXJFM
	lWNyn9Ig/mMOLf6Hf4b5QvvV8FGhaPQcUDoBx/OEqXI4MYuO1zhSOhfdN+7oXrzDXq1V3dKgNBuf+
	48KpSHYlhoTCAnFvWZ4aUSrFsSZvWJSYWx7HiWj3+iNU+zXaR9lxsYSCRH1GzvLi2ofvE3KzckAJB
	Mq8r/m+txBoK1TKhkVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcus-00000004ls8-0qxB;
	Mon, 10 Jun 2024 11:10:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuo-00000004lpf-2LDp
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718017819; x=1749553819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/+z8VTLNuGA5cW2ehTsz1bcNhKx95w02wSEQ6xTaY4=;
  b=iBkLdqHTomGHgxC8gryc0RCDMac4XLJELiATjAm+szfKlCYsNYPAEM4e
   EeYoQElBlSMQkZTwdHZMCfTv3kp7k6r7g9WsjRa5L5IREVBN/bEQI13CZ
   HR5+FHK5BD2gijSby8bkYfPkvsc4V61rh7nRZlEDwA3nLGwW3jcc4J6oF
   LQEqmDilF3T3AyOV7PR8fDg6LqS86f1gA30jOQO6Hpni/8AIY3CiwlnlJ
   YRNz9lJXd4N2Hpz7fN6uJGTLPZzDYJKxc2nIdawxT9D50nIAsAui2cwpU
   Rmqxv7ccSY7i1r+3HtFWK0itc3knhzs/l0iruaep/4uMHXdOd7S/TaQjd
   w==;
X-CSE-ConnectionGUID: jk7quZmdTreuz9niASlBPQ==
X-CSE-MsgGUID: 2i2zpMRCSdiJS1aM8SSDPQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="258054503"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:10:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:09:37 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:09:35 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 1/5] cache: ccache: allow building for PolarFire
Date: Mon, 10 Jun 2024 12:09:13 +0100
Message-ID: <20240610-mocker-ankle-d3ee407bb352@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=K/+z8VTLNuGA5cW2ehTsz1bcNhKx95w02wSEQ6xTaY4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlp926q8hUsOnhjSdyy83mz0sxf8Sw4PYtrgcfTiMOrJZhZ 84MmdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiJ5QY/pf+WGrVf698kUmj+UuX9J NrOv45sep1Fnx9Py9kfdQNy9OMDMcs50jffOG8Umf9zhyhexYrI5LVTvse+pX5IXoZ+ydJBxYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041018_657188_E3560167 
X-CRM114-Status: GOOD (  10.75  )
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

There's a ccache on PolarFire SoC, so don't limit it to SIFIVE/STARFIVE
SoCs only.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/cache/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 9345ce4976d76..b2d525e540212 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -10,7 +10,7 @@ config AX45MP_L2_CACHE
 
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
-	depends on ARCH_SIFIVE || ARCH_STARFIVE
+	depends on ARCH_MICROCHIP || ARCH_SIFIVE || ARCH_STARFIVE
 	help
 	  Support for the composable cache controller on SiFive platforms.
 
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
