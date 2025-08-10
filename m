Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9788AC87FDA
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 23:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pSno/WdKfKQvk8gf0pUHaBeBCCWT3rQSy8yZUxc+F9o=; b=nZQKz3kSr3I72g
	sFj3xo2wq4C0XoxRbxG7i69jVs+XMAuIX5rNoVqQr23QY9JchsTfZeVgrpkbvQ735pgZU7v30+WGE
	O0L5rsnDPh/EJQLq/SlmyasnFkmnzQlBQ1TRlDZjDObX6QZTZAas5HDXguG8qR9xJQ9GacHiFk8+q
	AiDPeonXhbzQImlrIEJ4/gGrfpWdsPCPpllYegGHws38K8y2h1PBZtWBvhz1qfJAgEw78QreQJBqF
	uscCKY8gaicLnyQsF2ld82ifJFBACuCmIodbI/WkX2NK9rph48gNEVR5qNx6inV5Za7AN6oVSx6d3
	Io3vBi18x3yO2GMQKtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulFj2-00000006CFB-1O0N;
	Sun, 10 Aug 2025 23:45:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulESu-000000066Uy-3bJ1
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 22:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754864671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DsLJnbX2CWZtNzZ1OcDHZ6+zw0frPO9S9vsrOrlu7po=;
	b=cBHQE+mWZinraGt/J9C+cKuf9u7E9alcwLe+Mh2Uqrz+1B59k3FVADd62gY9YZmLfQs5si
	D0Ml1aePgfj+16buYXo335QBoyB4YP3OK29/3Z8+3ojxC6FiqJDkUdFwcrY3MA0wGlgp8V
	QKVR8AwMDmZoboP6H8PqI+cTmx2r0E4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-Da1IZXmDMhCfs6xeycnogg-1; Sun, 10 Aug 2025 18:24:30 -0400
X-MC-Unique: Da1IZXmDMhCfs6xeycnogg-1
X-Mimecast-MFC-AGG-ID: Da1IZXmDMhCfs6xeycnogg_1754864670
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e826e0d7abso804801685a.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Aug 2025 15:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754864670; x=1755469470;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsLJnbX2CWZtNzZ1OcDHZ6+zw0frPO9S9vsrOrlu7po=;
        b=oQgTcLjvx/7ql+NTLIp07mR5mBs3J8gRZDkyFxudMHqOkYAwdin4bAWaeVxE2ZAGQV
         Z5awtwXvgkebNiTFHp6aTiYiyPfbLUB/IyspnLri1mQh3hdWclMOBCUwmVpKyBQ2TIae
         Xj7QSUzydTtADsOqj+Ux2bN8qnlQPDd8Wnh1CfW6B8Hjqs87AlzfzIpzn5c7x6DHPDN9
         u8E1qNOKJ9/vJtTPfzJXjWRxrvHPGYzJycE3CeEVaKGXXm2pRtEO6LPJdQ2mCyP2Lkcr
         nrQzOHF+A6mq7gt/1SMgp2H3qzOUCloRCgZzVOUXzWEqn2PEYU+oJ4qyhUbGwJQus2Om
         +RxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnbmEQQry+atD/0fGNmnHniPYVkshaQ/Wn3OHu/+n2H5Jxj3Rn5GmtGhp1d3SnxjdDSWZHC3OnQ0wWUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbkpPWFvp5OwIH3RkSVfD7S+KaET2JUKZzgVe5uk/O4zdbwVNh
	Tdowa8eg89+D5YV5l4YtKKpIs2HUKRcuLtH1szRRgH+ErUc+T8L9Sb1+C2toCC6JkX6eEK/PTK/
	Weg654t+NCSCjDhDFQe3m6PgiAgv8sxJajfHaRA2NxPZ4+D3DFb5Uxkj2ngDiFPUwCoq/JA==
X-Gm-Gg: ASbGncsJI1L49iPq9kVtRfziT7wYbNgIpYYtD45zdrevGvj2TEgmalHVVIsN6SmECjQ
	kSeweBwpbrLP4DVdaUggCUkR9o2NomgjyOANjMYa+dMKhumEJIQRhiS6iL2yBd1vR2KDf8bTLM0
	kvhtGnf5QgCryB7ZAeAVQgjCXTxyxa8VkkiX4nnpgizFDOXLw+YQZKoNk65HyT+mjx6bRDmjzo0
	bB4eaVwheZ1rTKp7gKQTU/BGxUYprklj/76mfl+CyQK5Tb8TBPNlplKZVE0z5rd5swQVBzRz1oT
	xZc71LYqN8kG4iv/15iQLNuKF7ZnQLuGtFqb0VdzZWKlxJgbPjvj7enareWR8lyS3qcsmj/U/UE
	tR5Ob8g==
X-Received: by 2002:a05:620a:7202:b0:7e8:2998:51e9 with SMTP id af79cd13be357-7e82c75fcbcmr921979285a.32.1754864670035;
        Sun, 10 Aug 2025 15:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfZ1YzRY3j+zDzQiBRzGaCbAkWEl6UfwFm1tYgoAJVmJujnBFCV7yyaVBd09br3SkByw4KDA==
X-Received: by 2002:a05:620a:7202:b0:7e8:2998:51e9 with SMTP id af79cd13be357-7e82c75fcbcmr921977585a.32.1754864669639;
        Sun, 10 Aug 2025 15:24:29 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0867b7b70sm74050441cf.9.2025.08.10.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:24:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:24:14 -0400
Subject: [PATCH] net: cadence: macb: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com>
X-B4-Tracking: v=1; b=H4sIAA0cmWgC/x3MMQqAMAxA0auUzAbaooheRRyCTTVLlbSKIN7d4
 viG/x/IrMIZRvOA8iVZ9lThGgPLRmlllFAN3vrO9n7AxAV1P1NApcJonWv7yIEGilCjQznK/Q+
 n+X0/6Gb5/WAAAAA=
X-Change-ID: 20250729-net-round-rate-01147feda9af
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754864666; l=3055;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=SGSec+EQWjKUsfxRcIYsyrxplqR++XYwLaxooXSSvvw=;
 b=VlXqvJ2j2K8T7qZ6gDnZKdk0xvGKLfpw0ErL2SsM89sdyKwSzDeTzqTfmr4nlHao+o7kILkOl
 2kuTkv2p1lLBQHzyzOLh+NSk3F84nKm10XJn38FozI5LJMvotkmqP07
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JtfYjPiwKhFKSNXk7o9PJjN4EAzf36Zk4gqEhok1gEk_1754864670
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_152432_976612_8856C5FE 
X-CRM114-Status: GOOD (  12.74  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 61 ++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index ce95fad8cedd7331d4818ba9f73fb6970249e85c..ce55a1f59b50dd85fa92bf139d06e6120d109e89 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4822,36 +4822,45 @@ static unsigned long fu540_macb_tx_recalc_rate(struct clk_hw *hw,
 	return mgmt->rate;
 }
 
-static long fu540_macb_tx_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
-{
-	if (WARN_ON(rate < 2500000))
-		return 2500000;
-	else if (rate == 2500000)
-		return 2500000;
-	else if (WARN_ON(rate < 13750000))
-		return 2500000;
-	else if (WARN_ON(rate < 25000000))
-		return 25000000;
-	else if (rate == 25000000)
-		return 25000000;
-	else if (WARN_ON(rate < 75000000))
-		return 25000000;
-	else if (WARN_ON(rate < 125000000))
-		return 125000000;
-	else if (rate == 125000000)
-		return 125000000;
-
-	WARN_ON(rate > 125000000);
-
-	return 125000000;
+static int fu540_macb_tx_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (WARN_ON(req->rate < 2500000))
+		req->rate = 2500000;
+	else if (req->rate == 2500000)
+		req->rate = 2500000;
+	else if (WARN_ON(req->rate < 13750000))
+		req->rate = 2500000;
+	else if (WARN_ON(req->rate < 25000000))
+		req->rate = 25000000;
+	else if (req->rate == 25000000)
+		req->rate = 25000000;
+	else if (WARN_ON(req->rate < 75000000))
+		req->rate = 25000000;
+	else if (WARN_ON(req->rate < 125000000))
+		req->rate = 125000000;
+	else if (req->rate == 125000000)
+		req->rate = 125000000;
+	else if (WARN_ON(req->rate > 125000000))
+		req->rate = 125000000;
+	else
+		req->rate = 125000000;
+
+	return 0;
 }
 
 static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long parent_rate)
 {
-	rate = fu540_macb_tx_round_rate(hw, rate, &parent_rate);
-	if (rate != 125000000)
+	struct clk_rate_request req;
+	int ret;
+
+	clk_hw_init_rate_request(hw, &req, rate);
+	ret = fu540_macb_tx_determine_rate(hw, &req);
+	if (ret != 0)
+		return ret;
+
+	if (req.rate != 125000000)
 		iowrite32(1, mgmt->reg);
 	else
 		iowrite32(0, mgmt->reg);
@@ -4862,7 +4871,7 @@ static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops fu540_c000_ops = {
 	.recalc_rate = fu540_macb_tx_recalc_rate,
-	.round_rate = fu540_macb_tx_round_rate,
+	.determine_rate = fu540_macb_tx_determine_rate,
 	.set_rate = fu540_macb_tx_set_rate,
 };
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-net-round-rate-01147feda9af

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
