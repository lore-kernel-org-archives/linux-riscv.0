Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B372ECD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 06:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f7ZUHEe0nwZFNEtyTJ5SQFX4l6TtRbjbos777jpjFmg=; b=F4pD3Ne+y091bd
	tdG8iCyfKn4/IqJ/LFxc1LS6GckdG8+Vgelv3tVQtCi+/DrbdOk9wwdwKZOouAbBvfsDBDYpPuNYS
	vKWQDdbgPDXpROez4qccGexNqnWX5BEO/Q2MNNmbY4x0RYJppcU0qROPuY/C7m5HdLbRpxKLJ7fey
	MME1gUwFm1sQ9vxs4YOeU/qmRIO4fVM/FnBeJSYq061S7yhDWMUHrxqt/+4TpnpXD5oTIZdm7s7us
	GduhoYZJprhJ2ibDGEdIvja4I+um0qLiFEs7URYcPKcnVtfzdJOCBdFlnnCTa3i+9PEmHyJlNdFqh
	e+ulOEphTj1Xo9JdeBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Ru-00000000hgO-0LkR;
	Thu, 18 Jun 2026 06:42:02 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6Rr-00000000hfg-0WjG
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 06:42:00 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c890110acdaso262654a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 23:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781764915; x=1782369715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq+UrIAjX4AZwds/jvySlMBzvhIQPTWIB6Jqv3g81b4=;
        b=ql5OVigPpEbRuGGs83PWvj1uCX2nhF51vPOCkKlKxr9ThL6J4aRuwiouOG5eLrfy2o
         eDcKUjkCuNycd161rDKuat5izt2xJGzqpyIOcGNsT0fNQ4Ua4rdJ1elMRwJoa1FS8BUV
         iM3OqslkgHERacgSagwXsE2eOhScXG9wjn+pJWgxZ8A9yaiJ7JQNL0mDhtGV18k9n6ag
         pZxfG78xlY8CrIEbfwX6VZ+KfY0dJOcfqINdNee5KND61nGkrC2AM2Tl8wVyxKnycL5B
         +/1cP3WdsTRca9ozDy+NTwjgJF+fj9JBpwkP/U2cbhNV16uN6sj1o+iq9WiNNrWNdUQU
         Rp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764915; x=1782369715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq+UrIAjX4AZwds/jvySlMBzvhIQPTWIB6Jqv3g81b4=;
        b=qRgMv/Zilq554hFNbbAft8KT8jRl/O09Yd1u5YrDSf8IBVYpllOrJSwXUUCcg+IjXK
         21J7HrZdUIQWN9E61e3Asm9qXF4ICDJf/vuK6zbwvGd/spvLcqyOUoYFmU4AS2Wan7Xw
         gBI5QXrvJkzk6ar0tc1asiE2CuAy5OzesK/ibB2UqVRPqQEWP3+kIWphrgtmkf21ZiAx
         s2OHqWAL8Pn5RKk+V6K8u5RvNhvAGIEwSnKkDEHsl7Qe8JkRHtEh1U72dEm7bSSZcOzS
         wGBGtbC9r9MBIJgr7tJp/9S/WT4lEsapjeQlino6rBiKXGHn6gooonCQfVvZC+YVSm3K
         SKCw==
X-Forwarded-Encrypted: i=1; AFNElJ+78zF0clhUliqHrXxcaNvR9AX9G3UpPabYHFigQPxfCbj/qmn0BVbIExkpcI2E7+iW/SrvMLODi63CTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9qFN2Il9bFh0gCPN4rbKVk0v+F8IxCFAMXrWO9gJve3YZWIDJ
	xqDF4iLKmVSPSJUtgsk34EiqjZuuJnPhQHVFycblpOg+8iAX7Y+HCP13
X-Gm-Gg: AfdE7cklSV8v5OaYsd2oZi6nkUmKd4Egmgf7cHOkh4tW42UJjLVWIQ25f1M+TpnXUp8
	/ge5MgaN4FIhEN9dYrVJMFSnOTt551653EzuRlyaa2CbJSX57VQ5MALIPvnfgJrIuhEMaV5jueg
	2Jp3Phkvyd6Bw5JlOXe7GkD9KotUjeJhNws9NgBawNsyZdfYKQoTNyWdpIv+CtV/DA5p1RyrTb7
	RKzfAi9bppWEbEhbixj0X3neCuh57XT9u224wy09+L2KMTthj3u767s1G1vdYGo6aKkZlJFIVf9
	Bi6ohmEfWsprRDgQ0W5souNKxq+VbvvZIArJBVczq8+1eAJfz7q7Cj62mP5dGATTzCOQSEzD8L7
	1ZYktSD2M7tksFlYhOzsk1qYJUkxSCHEG2IMr3IG8l086QCsJpJ3PS9eLX9WyXXDyGOL83yO+fX
	Wm5JfY2ROjsn8=
X-Received: by 2002:a05:6a21:4d17:b0:3b7:9aa8:3be3 with SMTP id adf61e73a8af0-3ba4d0e7999mr1744739637.2.1781764915177;
        Wed, 17 Jun 2026 23:41:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm16799602a12.13.2026.06.17.23.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:41:54 -0700 (PDT)
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
Subject: [PATCH net] net: stmmac: dwmac-spacemit: Fix wrong ctrl register definition
Date: Thu, 18 Jun 2026 14:41:43 +0800
Message-ID: <20260618064143.1102179-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234159_190738_FCBEEF51 
X-CRM114-Status: GOOD (  10.84  )
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

There register layout of the phy ctrl register has something wrong,
fix it to match the right layout

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 223754cc5c79..6feffaa3ef3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -18,10 +18,12 @@
 #include "stmmac_platform.h"
 
 /* ctrl register bits */
-#define CTRL_PHY_INTF_RGMII		BIT(3)
-#define CTRL_PHY_INTF_MII		BIT(4)
-#define CTRL_WAKE_IRQ_EN		BIT(9)
-#define CTRL_PHY_IRQ_EN			BIT(12)
+#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
+#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
+#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
+#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
+#define CTRL_PHY_IRQ_EN			BIT(9)
+#define CTRL_WAKE_IRQ_EN		BIT(12)
 
 /* dline register bits */
 #define RGMII_RX_DLINE_EN		BIT(0)
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
