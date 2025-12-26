Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F03E8FDA2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK/snEpd1nYqQJJ+PuaHkLtFN91dTrEXGt8JJM9a3gg=; b=oX7LWBhJlRjsv5
	OKP9sNBBP81PagYZeQVT1NyXDItyWLzeHn31SMaEoE9cb6mRerpJ1ZUbJxD+Aa+NS7oRqeS1lBdrN
	+ELLKyTm/AksUgteTZCiB98FfwKJ1abEhe0T7wKkRMBxxGvO4m08XVj9LtpoklLYcQBkZce8DTDdZ
	pho1otAeriurtgoqlNoNTdTkIrlxs+d2jyziFRcmH+jzzOh4GadpTGg/Fzq7j1pn55Y5aEN/pMYc/
	vgd1SLO9lH5Zxf0FtGIn3PsB3vHZqErAc12sUxIQvH63pTwLBT0K7Zw49OlduyhldfbT8WDTiNrPv
	MXqDwZgEHcfhrdrRmPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7PJ-00000001Bsn-0v6A;
	Fri, 26 Dec 2025 12:59:01 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7PE-00000001Bs6-1FdF
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 12:58:59 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0764A3415F1;
	Fri, 26 Dec 2025 12:58:47 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 26 Dec 2025 20:58:24 +0800
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC support
MIME-Version: 1.0
Message-Id: <20251226-02-k3-pinctrl-v2-1-5172397e6831@gentoo.org>
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
In-Reply-To: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=SutOUYsKHnB32xSj1pZ5Xcaf2Z88gPgTQ32lxI4PKBU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpToZ5whC2XNQ/3Z3VOI/IZvPTC5NovxvPin3gp
 WobKUNbOX+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU6GeRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2byA/+IrrABW5FF4g8zsEFUxQNxwuN3ET8VTxa0iyVa17eEFumYfGgOjAKD
 4eh1p+mtngZBWOtDiYo8T/8qTaietVmKfz/Ak7/RJwRwVonwb5B0K1HEgxDxURpAvJ3vTwA2fPo
 XHdUQ63nRHOaHzxODos7OAMWWsQEcye+1ccFvc7nHaGWA5vzbIdSKYnKsd4kTNm2ppBSvlcXwwL
 N+okN/B6qR5Ry7arV5hLHRb/lLghd3QaZ8Q43kA8PjjqziiD0GmZzfMm+2KPd1EBzqiYkvuWKEL
 8TWVNquC7vIKr0l1r/sDByUtDExz1dXfaK2A9nkD3hkFsLTrJy+o9yJorAvNu6Rdbtt7QlKZyyI
 v1IF1q/anWFMnnB49RfafeU4davhPx+3VdQLaMA8M0UfzJ9nxtwRe1VQqXlR4HoyjOI9Dg8sQPD
 7587C/t0bxSi2OH8BqzYBBzfIvmKP4vJcIlb8A3EXl31rMdnQGgvm4K06n0cA/VsrMgZE61kcF+
 j0DUOHN6T99YMCgMSHiXZ/UCePCn5jOyH/h/eFQM/pPRrpSv5TK28D/6uNQ8PvSk1pzNX9gA2OF
 XsQvnopet1I3L2ScF/b4/TxZTFnMyjJ53AzhoEeVNjyo13QAP/To7LjeNp1UvM4AC58AMhklezY
 NyT5c78grhijooVBvzh9i/gDwlkqig=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_045858_229705_80547001 
X-CRM114-Status: UNSURE (   6.86  )
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

Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
almost same logic with previous K1 generation, but has different register
offset and pin configuration, for example the drive strength and
schmitter trigger settings has been changed.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index d80e88aa07b4..d2cb994e30c1 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: spacemit,k1-pinctrl
+    enum:
+      - spacemit,k1-pinctrl
+      - spacemit,k3-pinctrl
 
   reg:
     items:
@@ -74,8 +76,12 @@ patternProperties:
           drive-strength:
             description: |
               typical current when output high level.
-              1.8V output: 11, 21, 32, 42 (mA)
-              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+              For K1 SoC, the settings show as below:
+                1.8V output: 11, 21, 32, 42 (mA)
+                3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
+              For K3 SoC, the settings show as below:
+                1.8V output: 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33 (mA)
+                3.3V output: 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 (mA)
 
           input-schmitt:
             description: |

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
