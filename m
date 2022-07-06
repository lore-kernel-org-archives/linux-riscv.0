Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC3DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjruKRQD3pV0Z50dn/3Onpp44Rzygjv2kXy20oeOlSs=; b=3RkbNiqGcEr2Lw
	RP/Upw13L/pcSCLRBKS7tgdEqFij78kJfjEtMNKbyVoTmY5lOVknIeWRfDZxs7AMZByvla93DUFy7
	FcGzQCbooYlxhyexwZlA4FGpYY3U/Y3aMrm6MniWcA7YlwJX5R2TBeproaic8awjzVrJWjgIWKlJO
	6QGtuJ872W7Tw5/epfgWNlDPzXfovrTLIJOu4W6wXYgJ1/4THgan0me/QkGxwIqICdqGNqRaA0Hur
	rCQdLUXG7MsxvL+QYh3a26jsTVFFjc6huHRNOWw9ER/jFvriTIqNGvw8hT+UgSHXeJpW6U6+b1yvP
	v6AmTRytC/VDlSUr+0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91zg-008DIZ-55; Wed, 06 Jul 2022 10:10:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91hq-007xxT-74
	for linux-riscv@bombadil.infradead.org; Wed, 06 Jul 2022 09:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nrFMI239JwrdMXuTE5nC4SeQm0flVc3+BUmgdiqapwM=; b=E1917VT8Jdx6UOSDH8fyq8Cm7F
	Ns7jaFyy1zWiBRxkgWWb18Mdz/U76uoKK820qCS/8/uWl+Zi//QBoxLmxoEwq/ots787PRs8L6io8
	+uzf4wqoQJ39rroxDVxqFJlZRbqyWjU1PKDCCNF3ZJp6V/7AernQ8VeuBtlpY0gCEwh6wXAsL7Uz2
	tNpGXOks/nVU5MrU7TIMQlm2/7ECBcKYqna3NeFarlkPhk0waHfQwcWX8SArnxQzhVohLng163boM
	FLjCK2BeNZGttweiTxt17cXlyIWuVSz0Soaow0KpSODns6pon2LJ57pWtcTUf7JIAdYS1JZi9nVLm
	dn+aToXw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91hX-000OJ9-Bn
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 09:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657101127; x=1688637127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JcfI136RGD0OOfYVYgHacySTAY2bUr7/tZDULNQzTTA=;
  b=DDau8Ygn/n/2LgekDHwzJdC4VQkPn+sI9IGmLgpyDP95zHMqG2oPxBTR
   gRU3G0oinvyq0fesGMjizYlz2jVvDJVcEC6Gd25JOOAmv6t5eUMUVkt9c
   YIDQiC1IJyTvd18+XREDIYPkEvrNT9qQeQCRX8brs62Lj6ETAKshHvqOC
   ZzZ5YFwNBzAQjEBLKxHjAP7EduQEdPrtD1M5GA+ZPrpzSfdaydeVB9Ue5
   L+XG5gOVgbv67BUjnMDL4dDJ0pIh4TA3xMl5kzEFuXQ8ZhY2pkN4hTMBy
   CzHBPJnRYdv/F5dLRFzP7DP444p/286IR/Z0H+/7iqfTf/zUzcKIwGzX/
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="163537854"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 02:52:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 02:52:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 02:51:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH v3 3/5] net: macb: unify macb_config alignment style
Date: Wed, 6 Jul 2022 10:51:27 +0100
Message-ID: <20220706095129.828253-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706095129.828253-1-conor.dooley@microchip.com>
References: <20220706095129.828253-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_105208_640214_455ADB2C 
X-CRM114-Status: UNSURE (   9.68  )
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

The various macb_config structs have taken different approaches to
alignment when broken over newlines. Pick one style and make them
match.

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index d43bcf256b02..85a2e1ea7826 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4626,8 +4626,8 @@ static const struct macb_config at91sam9260_config = {
 };
 
 static const struct macb_config sama5d3macb_config = {
-	.caps = MACB_CAPS_SG_DISABLED
-	      | MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.caps = MACB_CAPS_SG_DISABLED |
+		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
 	.usrio = &macb_default_usrio,
@@ -4658,8 +4658,8 @@ static const struct macb_config sama5d29_config = {
 };
 
 static const struct macb_config sama5d3_config = {
-	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE
-	      | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
+	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE |
+		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
@@ -4731,8 +4731,8 @@ static int init_reset_optional(struct platform_device *pdev)
 
 static const struct macb_config zynqmp_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
-			MACB_CAPS_JUMBO |
-			MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
+		MACB_CAPS_JUMBO |
+		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
@@ -4806,8 +4806,8 @@ MODULE_DEVICE_TABLE(of, macb_dt_ids);
 
 static const struct macb_config default_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
-			MACB_CAPS_JUMBO |
-			MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_JUMBO |
+		MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
