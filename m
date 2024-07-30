Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931FDC3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb5Wnt7yWXLkUtdDrKUQz5rnHimm9+7Mi8bDbXHSUA0=; b=Q+ihM+2PUgDIP+
	x6dC5mDBvEzna2GQIwkzV1Hg08+aC4mYz5a4NYRYAGZwbbEJ5YKe4cn+0+6auKk4tPjg6uGq9YPi8
	qHe+5K+flHjJW/yAV38oHxBed+romCTjigyhKhk3f3jgcrBQ1q7FKiF6QaG9drgnrE5K1XbX6gW5L
	6IkCKP3tyYYGF3DkIRa+yVz7LKyLAXnSUr7gvfSDZYmvxDELgpoXP8v7j+5MgzmqcE1i/EU6jg6tI
	rZBD0fkQjOR8xR1dZtMBIusLTTpj8wW1GqIhUsxmYudRM1Vqj7f4Ygz9rKgKoprdTxCXNcsQw/Lky
	qCiSGG6wvplrmQ1Flnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajk-0000000D5iE-46n2;
	Tue, 30 Jul 2024 00:29:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajh-0000000D5gW-3b4a
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:07 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:06 +0000
Subject: [PATCH v5 03/10] dt-bindings: riscv: add SpacemiT K1 bindings
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-3-98263aae83be@gentoo.org>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=eh3cgKtPldxaM4wTA1wLvLcQHYcPOLfKDPjLj7ob40k=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOkRooYNpIMy+fzKp4BO/bbbSBxvjlongWc9
 wu1V9FknL2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzpF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TGkD/9A/byF6YK3FGkaSd
 ekdv+gI6rdUm2DRoKDLpz95EsYV0VEi6fN778jw0QI6VozcmbzEqd42uiw5hwC2Sgig0RRAuAw6
 eCKo7xrfiJzGyUXBEuTxVCHl+z2nsk2JJbVJR7chCCrWf5EP2lBOK5SoBDodNOxDJzLVghe98Sc
 D5k3FLykwCTE8OQIVGGWcfSJdIfFgaczyKx3RQBtNh+rL8pe9SEGlWpc0sOgfsdijj5RABVrv0O
 9PRj+gWgQbFNEJg4//AumkRgiuSOmHjxF8+fjovyof5O++dBchisqRe6pzM3Ses4wRVFVNBUJVh
 LtFApsSEymBbNNBGBLhEODtYlovsEdFbMlexr3Pt2EQ9S2eI2szV6eaPLBdR2kQ6NV1Jr/wU7Fb
 cukMqfvaLCQcyE8f+kCQdo13YLWvpw5WiG08MBFRtH/N6pHCVhz3Jq1Syq+ekImKYHf3ehQfWXz
 2VF1yJBoGhPgmN2hCiJuuNEm1C6b/oOyd+RwcqJ+uaNLsB//KxYAabpROIZLRAZkRlmrZfQr90m
 fz7k4SN4YqsiYQlCnLMqg/n3/QO3Kggc+tOKv019aAOeCoQNoZcixloZNmmwYvAssr0EUmTUYQl
 6vYlQFWv5B2DrxlKeRchKY8GGnxxCDlCw0wbgCaUasOVYlCGdcE394G6odg6yDD3ICXA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172905_963680_54181A2F 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Matthias Brugger <matthias.bgg@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add DT binding documentation for the SpacemiT K1 SoC[1] and the Banana
Pi BPi-F3 board[2] which used it.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/ [1]
Link: https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3 [2]
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/riscv/spacemit.yaml        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
new file mode 100644
index 0000000000000..52e55077af1ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/spacemit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT SoC-based boards
+
+maintainers:
+  - Yangyu Chen <cyy@cyyself.name>
+  - Yixun Lan <dlan@gentoo.org>
+
+description:
+  SpacemiT SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-f3
+          - const: spacemit,k1
+
+additionalProperties: true
+
+...

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
