Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0981CDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBWNR86g6DJq7ZTX0QTjp7U+tJsvFFqBJhGLbhb1yh4=; b=iYydDufMtECV+R
	yWG2FoEUj/sxetC5FpvJnGqjHBcnBl95bBCcy3UUOecNFnSqfBnZOOdII4L99NvRD7zIz5muxXAOG
	TKRRLWkSq85nPZ8/84aVi+s+HPuOPcfTgYMQzCm/qouJWn5e3niKDdfmAIoanM2kTYz0SmIIsSpwj
	Q0NlSq99IDl8dObQ4nHvYbgCI7x1hlfuE458c/brlYQmWCwqx0t6xHCZ9931WyoFNDujLeOXrf22j
	GnAvdin6xKAXIomk6kifQGVHQ2MRORGOMsoJULfX5NIn1eRFOWQzPh3sSAbZL/2MSif/PtHw0d8fQ
	dcF81MXA0NhfJoqoTpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqa-00000005qr8-1Uhb;
	Tue, 23 Jun 2026 07:47:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqX-00000005qpR-3PI2
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 07:47:02 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so2287700a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200821; x=1782805621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1Fyw9fJmtAP3F6H/X4okbn9VnSF0X5lGAx5UXg/ZEY=;
        b=aqbJEvFK7Vj8xreRvbbmGLkiVcrRuP751mG4MsK8IxU66vnX3VTEHP1WIC9v3rHfiq
         ykQTyPbxRT+yvdk3ihgYb8slD1qD1dkrKSftx3vloE8Zmkp65wfB7DQh1iGevlRsW0VL
         1SCWNfB9fAn1NC6YOTZ0OKS09n458ESc3x43mscTzk+TCKM51rSV9/e6E4iJIbg+SnSD
         2JqEDpLK7HS4MZgcFpv+itEqpzeW/tSnOD1XULah6H2kBvnWUVS60dbvwhxFIFk8QyS6
         BTxjCRcUgzq1VjfcJJYp+JIFEYAhiR50BS5yqA7uS9xOjqI9y0FcGn6cBg+tbIKMsS2b
         zAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200821; x=1782805621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1Fyw9fJmtAP3F6H/X4okbn9VnSF0X5lGAx5UXg/ZEY=;
        b=J4KcokkP4o2alhsAMcULs4hgnuXKY3+XfsHK2wllM/QyIgs/zS0xTY1JTpY8yLoh5Q
         nHJH9fSUs7c/tcKUrpRH03Q45jQzsNz8uJiAt/Q6bvYX/DoxpT0jLiPQGc2ADK3xAdSf
         BHCKB+5sPVomWbRFZwKZWgS7fiba7H28UE5gAYBkJNjS0g3UAlGdRnWxgjiq4Wx4hPBf
         9jg5qCgUSqnLFNawXmvc6XuiK3pAdP9db4AvTWVS2kQeX4LvCNK3+oGY6fNnr0HaAYNQ
         RXhzlVrY2jhLFeORDOinjYyqCbLelLwtYHYiM6pDK3Ns+iemJEi7iyDzdcGEGcDDNJtm
         gLlg==
X-Forwarded-Encrypted: i=1; AFNElJ8Zu0wRqpfXLsbW2WVZ7j5H0VdHaWiMTiy1DOtWfKRcUhgNokRtv+SDv+3Rc1dCpVEE2yT9wof87I4IIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5IZwt/tNRd9KcgI89QJsufWwKrYWvg7rU5NWbcETofQvT/WhB
	WQbEWK0rUR8SuXRHW+LeE8kCBzLNoi1k1XQCtDgBJYEkmu4nAtrnRvNl
X-Gm-Gg: AfdE7cmd8sswlJEQVQzSwEM5/Bp7zohvpt4SmHjrpSrNzjJaXxywP4PZEM8WJbm8n3P
	Lm4YKqIaGdKBuyqUXmVqyhwKjuaguUiz2qAsj11UKFUhbtl2S5kQnx9iHSWgm+uULab5JFyzZTz
	T3uh8t45VjgCUKLHObiZcsCDcvO9H366G5ilmOQCum3QgtmCaB5u/OSAboZds9gwzNKWBu9UiT9
	qJopJ6jcJq9pSUcprR2D9oTU7794UUz1OTeOlbAoBhzmAKLKNMnvPFUnEEWkYWV8n1iiRN3sWTR
	McIDXBEvHcOAw+9hg/6WxNrxluQosnCqVXmLjQ7fyO8FCyaxDi4MFNCViD08K316t/WB0UbVDkB
	Sn8aZ3eEDl3OFmKiaCUU+FDLXkAsJBgXmRn5dC7DHvwga21sSiJyS7DVl+zLGougP1KOQU+pkEz
	G+w+j4TQBmaSk=
X-Received: by 2002:a05:6a00:22ca:b0:842:74e3:48b5 with SMTP id d2e1a72fcca58-84597067827mr1756226b3a.13.1782200820845;
        Tue, 23 Jun 2026 00:47:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e76a0bsm11039417b3a.36.2026.06.23.00.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:47:00 -0700 (PDT)
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
Subject: [PATCH net v2 1/2] net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
Date: Tue, 23 Jun 2026 15:46:34 +0800
Message-ID: <20260623074637.503864-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_004701_856163_9C7504B6 
X-CRM114-Status: GOOD (  12.44  )
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

The current MII interface register definition from the vendor is wrong,
use the right number for the macro. Also, correct the interface mask
in spacemit_set_phy_intf_sel() so it can update the register with the
right number

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 223754cc5c79..3bfb6d49be6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -18,8 +18,10 @@
 #include "stmmac_platform.h"
 
 /* ctrl register bits */
-#define CTRL_PHY_INTF_RGMII		BIT(3)
-#define CTRL_PHY_INTF_MII		BIT(4)
+#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
+#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
+#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
+#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
 #define CTRL_WAKE_IRQ_EN		BIT(9)
 #define CTRL_PHY_IRQ_EN			BIT(12)
 
@@ -118,7 +120,7 @@ static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 
 static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
+	unsigned int mask = CTRL_PHY_INTF_MODE;
 	struct spacmit_dwmac *dwmac = bsp_priv;
 	unsigned int val = 0;
 
@@ -128,6 +130,7 @@ static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 		break;
 
 	case PHY_INTF_SEL_RMII:
+		val = CTRL_PHY_INTF_RMII;
 		break;
 
 	case PHY_INTF_SEL_RGMII:
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
