Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4B5CDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKqrBMvL6+de5pkDdMVXZYNhpr7NfH6V8zYiGp7R4NY=; b=JocG1voIDaUX8S
	gWOA2ZlfVOdE086Y+iBg4jZRHCSLygfoPSUh5e9YSOnIlmZs5hW9Nw14vOY0q1NmxPiv2LZeuGrkz
	ApEa9eb4TQiuaDCmnaH9JMcyjAkgtfRSBvvC3yM4rKf30S13H7jdYgTj/PaRYK1xEudFc35QUdoqj
	ogHPwFQybGYzrtwJnH7HDmyp6UN1Hy2f1AOsHoGmCZISsYZIhtlhzzO4row6fT/8vqSW9e1N1RkLU
	IfA4v1mrETgxAcMCFFiRa39WKobRZycp+Ur+RieW9WbOECq+z0QN+mQcS8ipke9G2ZagkN2sXIDVX
	03Zm9uyk4tf3NOJ7uQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqe-00000005qui-2m3j;
	Tue, 23 Jun 2026 07:47:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqa-00000005qr4-2jpf
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 07:47:05 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8423610ec93so4940693b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 00:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200824; x=1782805624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
        b=c2++I6FuNyJMyrp7YCdo/dOuPrCTBFNVDGR0Sl08/36Qq0dQ+bQISNOjrsudSiMdt0
         S1Q64hHyZhyBieZ2wRUljt+rfIlN5YoG/rAoJ4iWggQ8J1dmmk76WmdoCVISXRTEG3KS
         LBhFNJ0a840olgFdHVMe/B9PmtEuhqjwp5cvBEu+H7pLbdHBv6Cgz4sVwY7SSGsyqN8N
         6V1R6bLuFNT801vn3fy0AbhIgBDGvMwrmAsRZSj5zv2Ug5K7MC0yIJhlL+lQWQTs3zTk
         +udIg4nP8NVMkMEQ8k/G7iXV76Hue0+SQhcPN7wCs8TD4dwlyi2/jEkHybNC972MovFK
         dXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200824; x=1782805624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
        b=Yg3ugLDlLAeA9bEzxIaILshy3FViGuH8dnVrddYEwtKvD3P1GssF66dLOO0sG7Zaht
         0GsaRYsag3k75XibG4dLulK40dEcBe2jfAw1EC+djRtQ9ZyFdls580PVDZzyqd360ixp
         Mvd5E71+sm5CQ65lgC5z8KLgVGuIKYqM9KVd/I8JTRAEgjCIJEhzDV32bmnd1F28UYwF
         VRjyaGA9w3RBLPbOcEBPsKqD5AgywH5CQQevsOe68jv/SZNgVCZVQlty2GVOCKVcvEOk
         EOC2qlD4IGI22s2YMxkOQxSstE8Ibghxn4UCXbs5v8ckKuiy39Z/Z4XadT3+mt6AQaP5
         tgEg==
X-Forwarded-Encrypted: i=1; AFNElJ8i73V4j1Co1TQmcGdjvIUtM+O+Faw3K5U+mh7uT85BN9/pJw68TJKdiGEtuJ0s6TUBUsEh+avnt0+sRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKOyl8K4uOV7x6AM3eOGkYo9+SQ5zE5cUv0xmfnSRVB+O6jiZI
	xiS6RmaMmBe943JrvxDqlnT2aIGYBMebxnhLCK2093xyY7/nfN4CDyBQ
X-Gm-Gg: AfdE7cnIC/fKoEf7cSZb/MM6tLL05yg2JIMUBGZNBhHLNtI2czfrkKUPCSgerpL/fNS
	7XMBeNgkbtHqtbGylK/0RB1xzLlHhZcMn/V+R9mwmg9gWp28F1YNJy43X3t1aKIZVWAbJGGwYb0
	AEaZpzJMdSeaZW9gvXwAAH7CiXD/iH18DqEnB1L68xlt9rcsOas7Q36BD3aIIPtDQ666TrEBSMg
	9sqbGt4EEmGShywoX2n9ZqwhxqAsSaVJf5I8CL5gTW0PZfnCQ3qlN2ywNoc3wabkJQmS2gsixsS
	RRx2x55oESk+4EzxAjJReFsALMMwWhLf+WGblIU4XmoAnUt0jBr0+RoFYBOUTZfGB2Ap8QF+bV/
	juwp8MPoJWQr9Kes3SBbGjnUjEVHZKzt5CaRchGnMP4YirtqJ6n4HkNJALyMG2AmFfgwRcjNdcZ
	GUmghCV3U1cy0=
X-Received: by 2002:a05:6a00:3e21:b0:841:69e4:f21b with SMTP id d2e1a72fcca58-845508d3c1fmr18398996b3a.39.1782200823739;
        Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8f1a1sm11063117b3a.18.2026.06.23.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yixun Lan <dlan@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net v2 2/2] net: stmmac: dwmac-spacemit: Fix wrong irq definition
Date: Tue, 23 Jun 2026 15:46:35 +0800
Message-ID: <20260623074637.503864-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_004704_694805_7D0FAC9D 
X-CRM114-Status: GOOD (  10.12  )
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

The current irq definition of the wake irq and the lpi irq
is wrong, replace them with the right number and name.

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 3bfb6d49be6c..322bdf167a4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -22,8 +22,8 @@
 #define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
 #define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
 #define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
-#define CTRL_WAKE_IRQ_EN		BIT(9)
-#define CTRL_PHY_IRQ_EN			BIT(12)
+#define CTRL_LPI_IRQ_EN			BIT(9)
+#define CTRL_WAKE_IRQ_EN		BIT(12)
 
 /* dline register bits */
 #define RGMII_RX_DLINE_EN		BIT(0)
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
