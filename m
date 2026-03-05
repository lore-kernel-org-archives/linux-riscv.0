Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D014EFCE4D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysjpyTj0ZDTz1l88GX2fFMTdFGikGF00N6C7iyqOb1U=; b=JjFS0AQfB8kmBI
	CsYzH/6bPXWiZXiWBsG4PlUFM0ZzdLQRlA0Ft1HZJRSZJNsruWYc7v3mTt5VSJmf6qS6kp/TVqC9j
	NkBXCzlvcBjU4DispV8eGBpSnkgBleiOnVxk9DHA5T7EMY2WqA5OhpuFq+Z7/0PpagJc8APrvwTVN
	Bg1nJ860WQkPGTAn9RYkGZG6hzo0uvz0SUvlj5xRkvBy6tCj7FUV5vlFgsqoLxITO2E4IJiN/W5Zy
	KGt2H4I1/HpedE9foBAxB9sDjn6TQvCVy8Oqd6sB+umUSJCtQAiQUr5JjJ8kDufkvHdZ32wMmODjc
	+wHQ8slM3DWLL/jkHgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx5b-00000000iyq-22fJ;
	Thu, 05 Mar 2026 01:01:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx5Y-00000000iwv-08CO;
	Thu, 05 Mar 2026 01:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E5CA43B36;
	Thu,  5 Mar 2026 01:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDC4C2BCAF;
	Thu,  5 Mar 2026 01:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772672474;
	bh=GURYD6cv/JMm5jM3qsw55jv7RRAQJ3j0qjIAdCjx5DY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LXTmiWDenxzHw6laYParIy93zYr1qAfct79+t+YLZQ2uKHcxfB5E0g1jCl5KaSQ98
	 eDOtIneDq++nDWiwVgflguxNC/zZQyvzn/zYFJT+suliQ2HzbKw5RXgciT3ZhQv7yD
	 zzh//qk0myGqdn+6ek8PSgSb85gBwJiZ/oWqVP3uKk3lGvI9zADcdHuTa+eq2RyY8G
	 u1soZwltWZgIEaM/d3M3ggaBGRpzdl/Y4duaNM9gnGK305XfFr5DEYYISy/iWoswFE
	 szziH15zo+vFHBwiMWUVQaSjjjUul+++n7DTd0kc8Cfxu5PrfrRUTUYFGQMwlMFJPL
	 5tt9dc7w25M/g==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 05 Mar 2026 01:00:51 +0000
Subject: [PATCH v4 1/2] dt-bindings: phy: spacemit: k3: add USB2 PHY
 support
MIME-Version: 1.0
Message-Id: <20260305-11-k3-usb2-phy-v4-1-15554fb933bc@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
In-Reply-To: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=dlan@kernel.org;
 h=from:subject:message-id; bh=GURYD6cv/JMm5jM3qsw55jv7RRAQJ3j0qjIAdCjx5DY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpqNXNYLMSPX3JIB5qTzwbP8PmAUupnsAONHCWI
 0KjF0fKKeaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaajVzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0R8A//WuNJ6TuuxBn2h4o4pJDAzkw0BdZ9SXiRUyuhn6hhrjuObMxtq5DdX
 CQqykwTr4vS84WTGVdh/AuJvQxtH3rdi08oWEwCtgUsQNbML8LUzSQg/q36wlM/ES0ySwpfusin
 WWbMnZCaU9niINeV5h0NwSFhiHb7DRfZ/3XWVza0OPdhCMKaSMDZWm5Sga/OnpFczjNKo0uCAGT
 PpnJWViK8zCyYiq+rNvTYGAqMpKlELL6ylRF1lkAU1eLxOwUGHen4AVLam+vbX0e1OinltAlQJ+
 6mZ6dK5HEkmTcwAPVTdpo1+TNERDibeTKHa0SIDXeWMAN0pe7pOHjA1hcKPacKRj3Kp942qVWKc
 teDefp8dWQxl7Tsfskp3n3OU17s3mWaKkrdX+Rk1Yn/qYvz0c6afX3oM86qdwJEpCgGUpMMzAbn
 iX+hZYa8qDo/NoJ75Zqc69vO7f/o2GrDgljB8PGjzXruh4RLq6kGe4pqghc5xgDUIfBn52eK44Q
 qQn7Wn6tTo1QHpvfUU7UuzmkODvoCF+GYUhP9Lp8v8y5vQlk5+4vh0DoiXklFde/liUPzmw78Pp
 rSTWqY/y3VbTqBxOPIGXgVRK2dPRA0mjz8tNOt5r+vKPsy8D9ALQvdn6WZrrTJVXL1IlRfyxuzq
 2063tI/oMlMy0u2g8+d2wkTiVq8XTw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_170116_118028_E6DF7EA5 
X-CRM114-Status: UNSURE (   7.38  )
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

Introduce a compatible string for the USB2 PHY in SpacemiT K3 SoC. The IP
of USB2 PHY mostly shares the same functionalities with K1 SoC, while has
some register layout changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
index 43eaca90d88c..18025e5f60d6 100644
--- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/phy/spacemit,usb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 SoC USB 2.0 PHY
+title: SpacemiT K1/K3 SoC USB 2.0 PHY
 
 maintainers:
   - Ze Huang <huang.ze@linux.dev>
 
 properties:
   compatible:
-    const: spacemit,k1-usb2-phy
+    enum:
+      - spacemit,k1-usb2-phy
+      - spacemit,k3-usb2-phy
 
   reg:
     maxItems: 1

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
