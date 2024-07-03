Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E19C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xJCbzkvhdKuB9R3iQxQtzQZkRd12ZoCUTOxoBxNvhI=; b=4XCVIpV0NtGGGz
	F15eZheN7hFSKXYLOS6W3z34NZaV+ZQJKVsjUsRyT8DVXxxPqJ6zHxLAB57EyzQZaZLH8sv+vmiMT
	TvLpZAk3lGrqt9HKNZ/StzCIiCN6gs8zl1kXyrjMDWP2z/svWtHr2UFSwUNmsuy2qbnlCXUs1ltRa
	DYk3HSZUATxLgTvG7qSjl5m19PbwagoySOCkgmkTyw/plXudYDZV17TU0RjeOORHeeBMJSTWgiu2F
	PgX9Jb3fxdk7YiXM9kOIVk3EftfPJNx1VnruHv3/h7pgqSaP04RujTB/Ads7xWz18vgge2DeUAfwm
	QLqyySwcNPlSj0ve8SGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Pq-0000000AYnw-07Bm;
	Wed, 03 Jul 2024 14:57:02 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Pm-0000000AYmL-0jWG
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:57:00 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:06 +0000
Subject: [PATCH v3 03/11] dt-bindings: riscv: add SpacemiT K1 bindings
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-3-12f73b47461e@gentoo.org>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
In-Reply-To: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=K5sE2wVpJR7k92B9EpfKt0IR4hvNzMMCnPoGl9Y98+Y=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWZ+lA3bVNp6ejY1YajOTksXj5zgdJtwC4MDA
 WGfpR1mlVWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmfl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277bDrD/9dRvIZRevTSGjiMB
 f5SU42FLX05TrUTE0a8KDI/DiBNNBLulm2y58uZ1vaywc83gTMA/Cujk5JSAfBIvFjnfkq2+8TO
 MpPemOQ/5AbOOffTXDJ7Bi53Mz0hWHtQc0QU1If6Dkr15Sup9uf0hYRHZg1YgcPC/jnB+lpulbG
 SJmx7E4TEFN9VBYSlxfbmZkkpx67Ppg6yNVjCtZeXhSVRvW4Q6ikpW4RB3afLm+VgVKMyAYdCIR
 ZNZPi4SkqSD8KyVbTEQm9qgN2tE6vDFkCiTiZlieTJThBWc+0nzwKoTjQST8RsJPK8/6XwPk7dt
 lSb8Ql+vOwnURXhtzPNGtYqsVmkZLACCEKiWU2UAVbYtw+spIOYuenCRhtKBUYRLzdiPCouemZ9
 LDjG+7CJmRtZcqAIdw08vy+VVJBX/F78e0vhSHRkNqevGP6EOnYQyjtzrMmwNMYi2uYiftGnLAU
 U03XCHOT3wPpyEhysW3otWxaY8i4ukF9gyJOJvDf8lLd4C8sXXo7/zMsEBiFordvYlTQKnK9hGS
 UPHZM7fDpz6YiQMuZcQjMxFSSjW8Xa9t0qVSw5kK1+VGAVYEJVr8w1Sexe0BSO0LfdPTz8hmbj7
 3aiNCZAb2mnv1/Zyv9YT9vBIm6Bv2R7J1AVmraK41dYyBh9/Y699Wwp5zSU2uq5Am9Uw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075658_294403_B6F2C379 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
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
