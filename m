Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6055FC001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhtOLY0/TIKQ0WQHafJFTNpQ/PKsUyI/cb6F/sVRry4=; b=qHMAbkQi78CwRy
	Xy7/57xEwMSBS7pv4iBUpviVJarOaB2yf1jSwIzDIzguZiC2fWHxSvOc2OFqBgVRAif/1xIyBbmYk
	e/kShjcjYIQrDqn3HgNkGGkmwkHXTDwn/ROCJd1H2gSgyS9YRiZWoNDO3nodccHqd6OKs0LzrKAdo
	+ram4m8Ia8MaaPgsOcIQXwANP9wn7EFQnagX2wkMVp6qYs9P2msZ9/GMhtWin21zKwrmvDvl4AFZm
	egNyt4mKc8FF5k0R8FR7AaksdBRaUX5QnZXSaPVht5MMKUyydx4fetjUAChdJmSE9DXSLgU2h7QM/
	vZ+pHnZ244ice1724QjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPM-008Z25-05;
	Sat, 15 Jul 2023 11:25:52 +0000
Received: from out-15.mta1.migadu.com ([2001:41d0:203:375::f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPJ-008Z0c-1b
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 11:25:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689420347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwGDE3yVIxPwsfY7daqG3Fg4YYN3E6U2TSbdOoNGr2c=;
	b=qij1kjnFwoJdPsm8qHKTlc+hKlEqw0z6iH0/AKScKt/SNRm2MnIEdugATrTQV7XEoY5Tyu
	awM9uAT0Ja7GYNRqt0zuQlHylvACAggWDBFPsJIwUrUZbxOQ9vc9SdXq3ujOjIHN9Bo9DI
	M/myL22XbVD07cjWzndjI7gDUjVTO9fTWwWey3fzAhsKK0TxLAYBGnlQ1sMxnE7Gk/MNUZ
	quj/oLQsJH/RdpMIxzLy46NJAzzMZNvN9QnKf+hzKzBD5ZG+hoIO7zwvKfR6SB0yYY+tBh
	pH8hqw5zSR7xDca8eOIBM8nKZM4TOe8upoWE5Qw7HYXyJbZGxN7tJ7KhITGS4A==
From: Jookia <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: John Watts <contact@jookia.org>,
	devicetree@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/4] dt-bindings: net: can: Add support for Allwinner D1 CAN controller
Date: Sat, 15 Jul 2023 21:25:19 +1000
Message-ID: <20230715112523.2533742-2-contact@jookia.org>
In-Reply-To: <20230715112523.2533742-1-contact@jookia.org>
References: <20230715112523.2533742-1-contact@jookia.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_042549_681171_B6E52CCC 
X-CRM114-Status: UNSURE (   7.93  )
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

From: John Watts <contact@jookia.org>

The Allwinner D1 has two CAN controllers, both a variant of the R40
controller. Unfortunately the registers for the D1 controllers are
moved around enough to be incompatible and require a new compatible.

Introduce the "allwinner,sun20i-d1-can" compatible to support this.

Signed-off-by: John Watts <contact@jookia.org>
---
 .../bindings/net/can/allwinner,sun4i-a10-can.yaml           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
index 9c494957a07a..e42ea28d6ab4 100644
--- a/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/allwinner,sun4i-a10-can.yaml
@@ -21,6 +21,7 @@ properties:
           - const: allwinner,sun4i-a10-can
       - const: allwinner,sun4i-a10-can
       - const: allwinner,sun8i-r40-can
+      - const: allwinner,sun20i-d1-can
 
   reg:
     maxItems: 1
@@ -37,8 +38,9 @@ properties:
 if:
   properties:
     compatible:
-      contains:
-        const: allwinner,sun8i-r40-can
+      enum:
+        - allwinner,sun8i-r40-can
+        - allwinner,sun20i-d1-can
 
 then:
   required:
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
