Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6760EEEB57A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/cy6+/d4jWRJyRZpmcojS4YD2Eq4yFepg/TcpQYrWU=; b=2Ml55+c+Ro6yXv
	PZMkPYhE8Ptio/nfJZhSEmr90wCOra948/E3uqd/Yo1NB3t9QG0oD+y6FWEBXm6hYEkFcbFpZZxVq
	mtUxo2AMJkH1s95wiUCY58i+odnUbJKGQ+bUFdjnWOYqVm2js3zqKe9d8pygjlGzDawdX59FL5n6P
	aWquufLiM1SnbZxTq8iMy795uZ4XYW/x6vpfM49QApKVOq9lfwPDzBK5dyV4ALTJFas5SnN+UaLYB
	1oW9QSVu7ic9qKKilfb7/1n+wchWfmuLlmnkWs8eTJb4rhORSrWZIVjVxv1OD8Z9U3e83EbLQ2o+J
	yP0rYIuBBu24gUTZZxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZ9z-00000007sHX-1Wp8;
	Fri, 02 Jan 2026 07:01:21 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZ9w-00000007sDb-0FNJ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 07:01:17 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3B2DD341EA1;
	Fri, 02 Jan 2026 07:01:08 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 02 Jan 2026 15:00:22 +0800
Subject: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: convert drive
 strength to schema format
MIME-Version: 1.0
Message-Id: <20260102-02-k3-pinctrl-v3-1-30aa104e2847@gentoo.org>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=w4+TikoZ5t0f91gGepLrdqB1S7dJ+SqAQScF36N4zZ8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpV20i/9eyy5Fsg6kEF2a/ddQjDdHvB4zp+J7PR
 XKa+RBFgViJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVdtIhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1v2g//ZuuVsJvH6dHkmVgAww27piFw2j/bycWWBmLIw/Gis/wCSR1dTYyXd
 hm4XxGWDxENRpDMKhxaUfW9qSHCfsgrvA412yxQ/trauD5Cd2FFyG17o8tXtOSxVTxcOQEd8jUy
 vQEcDmj7+hrQdBD3V3pX1OBIgJMrYXcA1fl/c0f8dBRQjOVsyKmheUc5Fnmqghds159bH3JFEfp
 g4FVBU7UDGc+ZNKyjNrOA+KBt6f+Xk0avc5OwzEPmPqbGu63udDZlMkbhTydVYNeV6WQhfiwhJx
 fhvHAav3cCNNU4lH3SFmTmFelW5QGmT1mn9EvERCjlXscCe4SBXP9h1TwWbfO83HePLjuU4X41P
 6cMofsKNRy0FlQO3u1RLXONThsbHT4dbUwZr0Rhbvj89URid3RtTZLaFAXDZ1axH0hezxwnFkpj
 I+Z8rAA0PCwAXn0nM6DxrAuvjg6yad366AqSnnh02uPAMWjsfFWWOobu+xjhIoXzeZmB+J+b5eh
 yRJm6z0zTk5mBAbZvSYfn8bLLrkZHQxhgTG6TRAyNSWVI83hdWFzOripLsI7YS4wb6zSL6KcT+y
 xvOs/qy5DXsqsZH4KCW2knzlkpHs2cdYaMWg+ipWEKe9PF4arkaUB19IDzl0Fb+HX2SigLC9gBO
 Q+IqbU+KhL+0GLfdsekP5RwIHN/c/A=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_230116_255432_B1162785 
X-CRM114-Status: UNSURE (   7.29  )
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

In order to better extend the pinctrl support for future new SoC, convert
drive strength setting from free form text to more standard schema format.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index d80e88aa07b4..609d7db97822 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -72,10 +72,14 @@ patternProperties:
             enum: [ 0, 1 ]
 
           drive-strength:
-            description: |
-              typical current when output high level.
-              1.8V output: 11, 21, 32, 42 (mA)
-              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+            description:
+              typical current (in mA) when the output at high level.
+            oneOf:
+              - enum: [ 11, 21, 32, 42 ]
+                description: For K1 SoC, 1.8V voltage output
+
+              - enum: [ 7, 10, 13, 16, 19, 23, 26, 29 ]
+                description: For K1 SoC, 3.3V voltage output
 
           input-schmitt:
             description: |

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
