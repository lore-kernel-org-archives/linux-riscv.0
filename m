Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B8C3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L59dmJxgTiLEzYEaQuSAtluqPXNEdua2kxgwpuCFwDI=; b=3bhySw7C4b57pw
	QOlCbyCAgPzK4eE/O2iAaokih+YbfGuLyGVRMK/6qB0Gmttu68iDKZpxy6t3K4smlmDIMRbqjWDmj
	DmtCglm8Tge8UtDP0tSQLvC50tcNwux2ila+S3bG16NR/V+vVNgFB/8E/4vxYWYgBHnc6edsiKY8d
	Nmg8y3SCuOfs/roQ3lCfPVvhqon5UhswBiqNLqxq/+zHiZwK0I9OkH0qCqgOChpQAVq5vvGAzucTj
	aM5xKFyCcRdUBK44wWZIfnAkrXpAZbaWVP7wjGYBdCHhUb7mKUNjIeEojb6A5BmrOnY9z6QmPu6DE
	aA1y2iKqJmHY9YZJ8jWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1OQ-00000005j69-3PRK;
	Tue, 09 Jul 2024 03:19:51 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1OO-00000005j4r-1Y1w
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:19:49 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:44 +0000
Subject: [PATCH v4 01/10] dt-bindings: vendor-prefixes: add spacemit
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-1-ae5bb5e56aaf@gentoo.org>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
In-Reply-To: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=S6L+lb2i5tfCPntQqdP469atY/fB6iYa1pxCzasyD14=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwewnlnCkqnwBREmvoqSxsKANpcVX1cKArvE
 s+PIAZtT5yJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysHl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RMyEACZ3uVCfGIltXdrI7
 gesBVB9wQr4FM5xlZqd2tzkwkiOCJdL12btQSRLHikgO0h7sFBM+vXNfm2LXhOkMWKCKMeCFmvN
 qmObUGoGM2UjdLcrpk3yw1oh+Ch6SalD63IKuDZiGTjVGiSkfVpDn6ySYx/HeGeNqBxEu4xgI9Z
 dEhaXzc0ripF8tpAW+cEasZvpFWSE9r7mPni3yKoUt9NVkJ8iDR3+7LlDoEJHI8Yt+Kc/rN/Iod
 0Kk5vgyslG8s48RLjU6hEvnTpTauPBa9TimPiXa+SSpBjMHI18a/QSoTtkcU8+oi8Vuw7F68OMn
 3rHmwGW6FI0K2wbV6jeXAG72ciXdwUBwlGOQlU8Qq3PeMjRJ7lxgAkMiQs7DL9+/W9do4FezmHv
 pHE630bxsu4Q+YcRqaSUTOq9uq8TLkKIbMP1Rb/JP82+mWVRix86z0k2saU1lMZo/c7/JXgKAzD
 g5fG37a4qr9gA3zDRog8nMOAswL/dakvTfJ3U/olosAtDkKCgf+VD22qt/qTVAVRSUGxUe5rIJZ
 kBLJUCc90izZzQp20VjZkhNjjiRmOuB/mSqghNOWYSh7XmezAXl7b2EECbjuYxQcLyLbE5QPvs8
 3Mc2tDXVslp9BNuNP32WMZbCztax/uTIcC2lU1ylroprPwBOEDoVp1ZyzD3nuLH2W5WA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_201948_475681_A3A58C93 
X-CRM114-Status: UNSURE (   7.08  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add new vendor strings to dt bindings for SpacemiT K1 SoC.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1a..7ee6e4a89376e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1362,6 +1362,8 @@ patternProperties:
     description: Sophgo Technology Inc.
   "^sourceparts,.*":
     description: Source Parts Inc.
+  "^spacemit,.*":
+    description: SpacemiT (Hangzhou) Technology Co. Ltd
   "^spansion,.*":
     description: Spansion Inc.
   "^sparkfun,.*":

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
