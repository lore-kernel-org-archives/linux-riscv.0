Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C93AD30CDB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VyPKtZBdc0I0Hl2Ha1soFYl+v7O9dkw+CY8HHF8n55I=; b=Q4NuVUGYjD9i7T
	ml/pkXiB5Y82xlB0QKIl5E16ksA/5aQq9TFjEVMYYgfxSur2P0UUGd7Lu1j39o4zo5oaKS+2WUbDk
	p8eK6JR2cQGmoLPj/82NsbZH/Jd+4Q4CH2+7buO4KYnct+OdzlGGkBH575tR89zc3bMU6kOLlXDvU
	kmLlnoR3XNGtCnm79uGDFzpImRt1MJzvZ7uWcSwX87z181xmnLGuV5WmEBIaV0kA03RIKfCbUUkEm
	i8JXZlX0ArlNuXe7e7KjaJ3bn5K6j04bUlxjZl2ViOJFp2UGXdJsR8dV8b8ov5cMMimfWbA1zaAwf
	1ILOInEiz4PC2Dm3mlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfoaG-00000007tzQ-3yKE;
	Wed, 14 Jan 2026 00:18:00 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfoaE-00000007tyW-49qG
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 00:18:00 +0000
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AAA5034102F;
	Wed, 14 Jan 2026 00:17:52 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 14 Jan 2026 08:17:42 +0800
Subject: [PATCH v2] dt-bindings: pinctrl: spacemit: k3: fix drive-strength
 doc
MIME-Version: 1.0
Message-Id: <20260114-k3-pinctrl-io-doc-fix-v2-1-025b05f9e65a@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAKbgZmkC/4WNTQqDMBBGryKz7pQkij9deY/iwsZJHFoykoi0i
 Hdv6gW6fA++9+2QKDIluBU7RNo4sYQM5lKAncfgCXnKDEaZWmmt8FniwsGu8YUsOIlFx28cu1F
 VJZmq1h3k7RIp67N7HzLPnFaJn/Nm0z/7r7hp1Ni0jXFUk3u0qvcUVpGrRA/DcRxfabMNz7sAA
 AA=
X-Change-ID: 20260110-k3-pinctrl-io-doc-fix-a9a043e24619
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong@riscstar.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=orpaLPZIhB6o0YIirbSoKahJaSFWRpyVsDsGAJa9c/s=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpZuCtbNOFt9HYFmHL9qwVSgNlpjEqetUNg9x3H
 gGAVmMeiriJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaWbgrRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1uyw//T+tPDn0Hytjj/Xe+0H0zwyDbgdSccSl8FQSBfkZsQu6mX7h/MHcdx
 km4joFbr/IyCqdfXGJRuYZS0Ex4mUeCap/PM3x40sYp11cfdOmlElypq1s25wFKOUXyP2We1HQn
 VLzNbXwC1s4pki0lrtwqCHhRYdJGyqJsi6C1F5nVN2N5hYdQ7jc4TJMFm6EE4vqVz31F31MXea1
 jg1tZfp1qXqoZTjVljGXveEderwTvf9fB8JdNg0f/UF7C1FNDB0HD0RMImso8LTBmdWqvmLAr70
 fOhD4qMO4rjmphaGIUK+Zi1Xl+1TpPhTHgJlZFqL5nGQ+bExlhbFK7jcyAEXRoxbDefFBvknyfr
 /3QY4h+eHkCkyrjldWkQ+4F5Fpqmq8qkhi+5HIGQ5bMiTb3//3rivdoPnlQrX41hdQjoisN3gpK
 pXaiOXQRPABTaR3mOlu98bLac/fw6Y4hZRfFZ2y/Ws95i9yRCQhFCvmf78mWe8ynf6QXauxWkep
 CBTBmKueOubvgEqOieoepK5zf5OU3qRhyF1U5Aa5Z3VZtwEvjbU4LlYal87caZ+rUdcCvbfDW+V
 T1TnMpp9Ei32EqyVdkEiu5PsTFfwR8i2I+v+7r7E9dk27qzZDGRqpf6sezZvnBex32iRSeQA0EP
 QJ0yuJF7sVN5zNZQBlrve5SJmkZdYU=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_161759_088705_EE4905AA 
X-CRM114-Status: UNSURE (   9.45  )
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

Fix a typo in DT documentation, it should describe the 3.3V drive strength
table of SpacemiT k3 SoC.

Fixes: 5adaa1a8c088 ("dt-bindings: pinctrl: spacemit: add K3 SoC support")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Hi Linus,
  Can you also queue this for-next? thanks
---
Changes in v2:
- fix >75 lines of commit message
- collect Ack tags
- Link to v1: https://lore.kernel.org/r/20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index 9a76cffcbaee..f009fed87e6b 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -87,7 +87,7 @@ patternProperties:
                 description: For K3 SoC, 1.8V voltage output
 
               - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 ]
-                description: For K3 SoC, 1.8V voltage output
+                description: For K3 SoC, 3.3V voltage output
 
           input-schmitt:
             description: |

---
base-commit: 3f20bdf7151834547a85231c28538f49601481ee
change-id: 20260110-k3-pinctrl-io-doc-fix-a9a043e24619

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
