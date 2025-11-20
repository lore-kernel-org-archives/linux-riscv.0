Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007CECF9C46
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPATW5Ur7WKSLab9//zNFA3gfBAXzgkyJmKsNsUeHN0=; b=1Lc607OMeN4NgM
	CDpBRZUYrrkhzn7N1/bMT4augWwSvtfAQEwm/WP+BOmNtbeddykUsyeG9aITaxSxtP8MMpMGy1MeK
	we4Z6Ek6zTEP6dfiWuABbwURopATPsaz8CJ7Vs6tRhmykF6FWwT2+zL+A0Yl4T398zA2u/wexagdS
	a1dAIZMw532hTmn2/BU+wi/lCShVam17gMChSgPV6XYjTZj9SsbO4Eqjc7rqXf2aTv72BkjAQdySP
	Sr8T/LbcvJd/j4k84ShCSvWHCDWEqeHLXcnCjlqJO/VlcZGwYkZN40iqcxFe9hu4CH0jmKQPNe964
	Ng819uAK0LOUtzXcB73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Uf-000000070VB-0qtQ;
	Thu, 20 Nov 2025 16:26:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Ud-000000070UN-3cQM
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42EFB601DE;
	Thu, 20 Nov 2025 16:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B897AC116C6;
	Thu, 20 Nov 2025 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656007;
	bh=0AGNlvqqr0qu4bwYr8AQBoa4jNlfvu8ZN5pTq4ez5ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wis8FnzWPhKLKU+uK1W0nWROE0rAfq+mPjJk2YhoLyjqhObcBYjrDRf33s6Bq7Fnx
	 Sy1KyRr3Q93U59KEH4r9K2fpnCh4EpuhDgBGJhtXmw67UciyXZa3aM9zpZJCE37L4k
	 +BMQTePTqHmRqdy92goxx5+Hh4BmmR2FG/zB/ixK9vL0yYf2Vy8vexwYbI8DMhrAzF
	 tDhEHIuS19Y57Z1j6HEmllx9zoK2QSfgSXv4IjAbkUWMI4m8U7DMUcjHaO3TS0Agsk
	 xgfD2Bel5PM6UCXlTRl3kdn+ZwcxWsbnE3DC9vGCfdn2mhZ+3FTs8rwcBda7tv2wWb
	 Iexs3zgkdcTJg==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>
Subject: [RFC net-next v1 4/7] net: macb: np4 doesn't need a usrio pointer
Date: Thu, 20 Nov 2025 16:26:06 +0000
Message-ID: <20251120-native-steadier-481bc9453d04@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
References: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tC+n+f2MenYJnWXWr5SyA85ikQiWhM9zmnDvVhPzymI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnyjlIXF6/531VxvHi70bQzkc9PevhM38O2ZXMzK0voS pb0yjWvO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARiZeMDKdUWNfKiSdvijvi +jVo7kReqbBelX1rH/0X/yA2v/WMOwfDX/HTjBxqL+Z3i2qY3Dl/beKV3TrP2W15fr+65/AqdsG DM0wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

USRIO is disabled on this platform, having a pointer to a usrio config
structure doesn't actually do anything other than look weird.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 888a72c40f26..21045575f19c 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5314,7 +5314,7 @@ static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &at91_default_usrio,
+	.usrio = NULL,
 };
 
 static const struct macb_config zynqmp_config = {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
