Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C617FB3CE0
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SBfjqbWnnC0C4DkyLKs1XmgsX/Oqup1Jf3lcb7lRDE8=; b=CVFMF1x9SQps0R
	105E7oUEFlfJmkw/LEkQlbG9y0IPSu8SRWQKSkMHdKB517JKjG2jfgNBc0i/upFubCZdaqaBAzKzV
	YtPBJlkycrFXKqdj23inLWI99YLi9+72IoRdCAykr7I7Ke2F+IDjFbkomMr/u7fh/MD8WfSnl7uM3
	pzWR24/jZdOH5BZ0RPZ1ZDGS8djRlp+QnYGY7R4DxskBTChJCqORKstO9HemOuF+0YBPFpC0R5Z0w
	teZjuzSWHr9oZj6tlQjEd4dt7hlIfzc6viyk6LYHKHJrfJVhhL0VPT+97sTQZs/jqOePN7BKjB2/W
	au/TMdO6FVgQZEp+dGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78WM-0000000Avg2-0FyQ;
	Mon, 30 Mar 2026 09:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78WK-0000000Avfu-2mbn
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 09:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=crKEwm7ipaeJATC2iIuOXGd7KTqM+hlUKKqN209PZjU=; b=rdZZTicgbLpq7Q0W0EfeKKVbsx
	wjSpM0bxJmuiFXvhGGA4dD6h+g3z9poVlavkgBzkGVxWGVc84PEaQg0B3fuBMjT7oPyTut9td42ji
	S5pGFSM9jO6wNb4QSfKgavsbXMr9F44kUxW7YxKQlBdbA6hUu5Tk7x70ea91oCD90wf2xFEFKbEID
	IPGPULkyk32xWV8lvBX+JtWWQs7hkZ043mVW0EJR2rvfKhSZE72+LvNRTxTAF/Qsz2TZnzgvSYLhM
	bPA838RDkL5MngdFZO2iAD1u2iDQxif/6/DpIx/lFzlbdZPvUqhCzz2kAGcEwB7Jet7HBfQu3VAtS
	E2eRCc0Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78WD-0000000DO3f-2kRL
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6176D43C6C;
	Mon, 30 Mar 2026 09:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7CBC2BCF5;
	Mon, 30 Mar 2026 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774861361;
	bh=qRDiLQ7/Xx7OWinJo708eydLzcr8WmKcb0zRtIsdSO8=;
	h=From:To:Cc:Subject:Date:From;
	b=hHXjhEmZZxDEryQivP7+OwcpVMgA5oBn8cpG9Bk9N/iLWFqC8zyStSkdTZlsQ2vCn
	 IxAj6WpNay1JuUaYnqoFTx0Y1YmO7Ua83XblC+OekvpKYGNJ1OAWLXJMeOeZu4+Tic
	 4xZcS4VgIttR4bxu6P0NboTqUUSc1QDXis720VsDg/XMJWm+ha69coHzaxhvmpuJjl
	 BzVJgMZtVvq2EcsJyokY9ejZ5CHZniuEqaZEeYII/D9v5ERHFw8GrSSB23jc+7fQx4
	 t/qFv0qPFG2Yu+V0ybZoYwTQxZLVy4JkDZolzC2cepGKGLa4Z9GPaJJU58fMc4hUti
	 LOGv6tSOyhEaQ==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH net-next v1] net: macb: fix use of at91_default_usrio without CONFIG_OF
Date: Mon, 30 Mar 2026 10:02:00 +0100
Message-ID: <20260330-overture-cactus-c8eb7b9cbecc@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=A1BubFgGNTU8Lrl5NTMqEeZD7ZkkVzsO+2Mw4LraCwo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmnbLheGWkVLNMQ2R+3+ewm89UXxPTfW7DuWbrdcmX3F 57IqzrLOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRU7sZ/udrS7FEZQZeS9Hv PHfuk+fWm+ez5/xsuLnms3Ze3O4NTD8Z/sf1HliytJTxU16fzcXye71ax980ddhvuTbzSmrY3LX 22jwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_100246_176990_55524963 
X-CRM114-Status: GOOD (  17.25  )
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

If CONFIG_OF is not enabled, at91_default_usrio is used undeclared in
gem_default_config. Rather than move the struct around, take the
opportunity to rename gem_default_config, as the only compatible it is
ever used for is "cdns,macb" - not "cdns,gem" at all! With that done,
remove the use of default_gem_config as a fallback in probe, as every
device has a specific set of match data.

It pains me a little to leave at91_default_usrio in match data used by
"cdns,macb", but this is probably required to avoid regressing anyone.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603280028.wQjUrIvv-lkp@intel.com/
Reported-by: Jiawen Wu <jiawenwu@trustnetic.com>
Closes: https://lore.kernel.org/all/06a701dcc014$86def5b0$949ce110$@trustnetic.com/
Fixes: a17871778ee28 ("net: macb: rename macb_default_usrio to at91_default_usrio as not all platforms have mii mode control in usrio")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
lkp also reported this over the weekend, but against the dev copy in my
tree. I had thought that CONFIG_OF was standard off on x86, but I guess
it isn't, given lkp didn't catch it until randconfigs.

CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
---
 drivers/net/ethernet/cadence/macb_main.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 12e2b2f4aaf88..4f70e4fcf4606 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5716,9 +5716,18 @@ static const struct macb_config pic64hpsc_config = {
 	.jumbo_max_len = 16383,
 };
 
+static const struct macb_config macb_macb_config = {
+	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
+		MACB_CAPS_JUMBO |
+		MACB_CAPS_GEM_HAS_PTP,
+	.dma_burst_length = 16,
+	.usrio = &at91_default_usrio,
+	.jumbo_max_len = 10240,
+};
+
 static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "cdns,at91sam9260-macb", .data = &at91sam9260_config },
-	{ .compatible = "cdns,macb" },
+	{ .compatible = "cdns,macb", .data = &macb_macb_config},
 	{ .compatible = "cdns,np4-macb", .data = &np4_config },
 	{ .compatible = "cdns,pc302-gem", .data = &pc302gem_config },
 	{ .compatible = "cdns,gem", .data = &pc302gem_config },
@@ -5747,15 +5756,6 @@ static const struct of_device_id macb_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, macb_dt_ids);
 #endif /* CONFIG_OF */
 
-static const struct macb_config default_gem_config = {
-	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
-		MACB_CAPS_JUMBO |
-		MACB_CAPS_GEM_HAS_PTP,
-	.dma_burst_length = 16,
-	.usrio = &at91_default_usrio,
-	.jumbo_max_len = 10240,
-};
-
 static int macb_probe(struct platform_device *pdev)
 {
 	struct clk *pclk, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
@@ -5778,7 +5778,7 @@ static int macb_probe(struct platform_device *pdev)
 
 	macb_config = of_device_get_match_data(&pdev->dev);
 	if (!macb_config)
-		macb_config = &default_gem_config;
+		return -EINVAL;
 
 	err = macb_clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk,
 			    macb_config);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
