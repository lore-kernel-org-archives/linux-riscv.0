Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE0CC636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlklXq0l+gKJyJvoFpR42SnCBDEsK7XO6WPi89s0Iz0=; b=vT27sEiTPoLtSS
	pd69aY1N0KaRYFlRibLajmZny4Z+uzvuKCLIl7xtWPIwy/ooctj4ap92Bsw6ZKRbUJBpnETK02Y/L
	NraboAgcseH6lycvgRGEDBJ110sCQQR7N+io75kkgTPXaaJRxGGZl6Xa29B5+JoGXleUrWgN94wy6
	YVupnZndpH3XdODnsqH9AUjLoU3gqdvMLJMht9FHD02B0ScVnw0oJ8Vk44pGxczUKEezlT99TUPiI
	IM+AukVWchzSwtHDhg5DpYHYHSQraBjN3p68XZxNosJ1E+EwrJkV0epar24RzHa1mgEgTdc+AyJV/
	/dUx/aSBUpxg6fX2GWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgWX-008V5y-A6; Sat, 11 Feb 2023 03:26:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPS-008RmH-EJ; Sat, 11 Feb 2023 03:18:44 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 002A06602123;
	Sat, 11 Feb 2023 03:18:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085521;
	bh=3V60+yUqxQRcUNuxYulirFMaKOTYIE7PaGKbZOUC0s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mnEoqbs0VwxfMXt5qDvLiGFhb8V0gNhxaYj6rJMaOek7O/8UeoKKjk2iAFu+I6EWV
	 MPWy3ayM5k8ZQ/I2TproZY5gdjsnltmIP9IdBHvqJopYxTJR41uSWuIyjvtfiJ14zf
	 AH04ykzFvWuub2u7ikxOXNuQ68mQwBk6XmJsWzBAE6uHCXUuJ9hYCADWIQNcm/efHu
	 z7cAU4mphDdxLakwH1klnEoqmgYugEdmVnjmcb61uYlWQXuq9qWeb2Bb+CS+hAfuvG
	 Vq0HNyZSblq2UPQm2yoTgaHiq3f/zCZ1zi1R8CRdS+Gc2UkhoMnnMFsvFTuQDe246+
	 RH12SsTplWzLA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 03/12] soc: sifive: ccache: Add StarFive JH7100 support
Date: Sat, 11 Feb 2023 05:18:12 +0200
Message-Id: <20230211031821.976408-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191842_676117_054E418C 
X-CRM114-Status: GOOD (  17.19  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

This adds support for the StarFive JH7100 SoC which also feature this
SiFive cache controller.

Unfortunately the interrupt for uncorrected data is broken on the JH7100
and fires continuously, so add a quirk to not register a handler for it.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
[drop JH7110, rework Kconfig]
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/soc/sifive/Kconfig         |  1 +
 drivers/soc/sifive/sifive_ccache.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
index e86870be34c9..867cf16273a4 100644
--- a/drivers/soc/sifive/Kconfig
+++ b/drivers/soc/sifive/Kconfig
@@ -4,6 +4,7 @@ if SOC_SIFIVE || SOC_STARFIVE
 
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
+	default SOC_STARFIVE
 	help
 	  Support for the composable cache controller on SiFive platforms.
 
diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 3684f5b40a80..676468c35859 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -106,6 +106,7 @@ static void ccache_config_read(void)
 static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
+	{ .compatible = "starfive,jh7100-ccache", .data = (void *)BIT(DATA_UNCORR) },
 	{ .compatible = "sifive,ccache0" },
 	{ /* end of table */ }
 };
@@ -210,11 +211,15 @@ static int __init sifive_ccache_init(void)
 	struct device_node *np;
 	struct resource res;
 	int i, rc, intr_num;
+	const struct of_device_id *match;
+	unsigned long broken_irqs;
 
-	np = of_find_matching_node(NULL, sifive_ccache_ids);
+	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
 	if (!np)
 		return -ENODEV;
 
+	broken_irqs = (uintptr_t)match->data;
+
 	if (of_address_to_resource(np, 0, &res)) {
 		rc = -ENODEV;
 		goto err_node_put;
@@ -240,6 +245,10 @@ static int __init sifive_ccache_init(void)
 
 	for (i = 0; i < intr_num; i++) {
 		g_irq[i] = irq_of_parse_and_map(np, i);
+
+		if (broken_irqs & BIT(i))
+			continue;
+
 		rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
 				 NULL);
 		if (rc) {
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
