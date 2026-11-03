Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB1606A7A5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jrgs0ykJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VbWR2xhY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ql+TRtHrF8xb/QosgXHHlt5JVH525sbu8zPsmrU39cw=; b=jrgs0ykJxNPerYo6YHXdNKfyBQ
	HTo59bq98pAXawLqBLSyNa3NAs6/XK0jJ71/j8SZl3joBl3NM5JeGzq9Mf9G/2O8+V260NmfV7uRg
	sbJpoQJxK3rf+n52idAnsi1/kD550/fB5yATvaY43NcJ2aI5U82sIb/c7yPC/IU3KGGTqaVgyECNQ
	LZ2Z1k0GL5j0pybDXnqHTRHr9GbJYym8TPcNgaY8R2bJldHnDElfolRVhHJ8zZ8A+IPM/ui7sRRTe
	lyUwQ/19H3yMKJzALYn3VmbHf+2xCTPeiCsz/D+Z2ZUborn4lZauQSZIIFTpaUBiDOP/ymQq5gR7s
	+T1mNLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAp-00000002s5h-3M6I;
	Tue, 03 Nov 2026 15:11:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAn-00000002s3R-12pY
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:11:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0A6843CA2;
	Tue,  3 Nov 2026 15:11:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718700;
	b=e/6rXCSb1H3k1LpnI7N72ZS0k8IrVRXjDxM9Gx0FYjsjIcn5eU/+phQHIWoDnF0ps7pT
	 NzceGp7bFBtTQZgZjEJOmmwG6ZlIYzYknFU5Mqa6tmCk0P2XTfr1MjtP9T1aT0z5Ou4Er
	 RnyCTyPKoV3ETG3D9AZo6pZhlKbtA3lWix47BuyK3VnpB5QdurmUhD1QBtBYec/36qAVt
	 5QzaMiDIrDHIQgRYSyrR1oZMtbf+4hUoYUY8PhfPGc90T9Fys70QV50S+a3pGolWqMioy
	 hWbx8X0Az5lvpVnS9DTVrN6RWtrR3FpsyABHJGZWIJag55DuYdqM0s5VobAdUTPg7ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718700;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xbNaWXgIxtjFAfRnL9sJC5jpoQZJskcfQzZpxj/gf9M=;
	b=sIcElXtCeaTCgkIkzHzRL1PeAv8DsCuzXef8aI1KrElKFTnK+qheFibPIXp8iPJphC2G
	 xNFboYlnw5GyyEm21TTVt47QvpImzmCY5EHi4mVgIii6S8v7bpibaZafpMwSQdZ0A+wor
	 fykQ8K22aHDYGqcgOFWZcRGtUxQ8QhVMFU7TkF0ke2bzWfzROP8HTv6Q7ZPpqT+QH0dlc
	 1kL6awIoMDVMEzuvdeRflYKyrUNbXezqzWNkwlKK5Re2Gqs6HmEIv36cZvx32j0x6nnit
	 D51vGgCDVgV3yj45emcGaMAXj8VSnVyxoFCbzyDwiyF76Yc/bnfvIpxqmfVkubGJ/kg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD8E41F00A1B;
	Tue,  3 Nov 2026 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718700;
	bh=xbNaWXgIxtjFAfRnL9sJC5jpoQZJskcfQzZpxj/gf9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VbWR2xhYIAqTEbfCy1sV4s/p1kDvi2bT5kRmh8Ki/I53fNvCh+yRSnnJxyKVnUUd6
	 Db4Uk/zmoTlbQD+DMrjjDg+Hple7Itv9GW57xYL2Ybu5efX1b0F0iQQ7Mp4Xmj5k1j
	 CJmKhPr8L6IhnGOuXup9h8Pv5g6GlLoVGTPmH4rji9ohwokLWzz+TSQgsN+15IaaPP
	 GmIHDv9xTm91zmuakP6QVIe9WIOQfZC0wil3Kp+//XmRF2Jzw27cOvj2xaHDrb8j0p
	 YNC92wJmpKTivnsx/wAYDRX8ebkLFuTlNyam1+ziC4cVl2xfEfqx4o8fQHGoHfSsCM
	 4Q9YAITNBzvTw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1940C469D6;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:29 +0100
Subject: [PATCH v2 5/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-p8700-dts-v2-5-3ac5d49f2c37@htecgroup.com>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=1383;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=8H7mZGQgDyjY2/87nVSqZXQAWw1ccS1opV09eqf+z34=;
 b=HV7m05I2TRG03b06Pm9h/xoZC4mqF/M0duyfhgEZ4fB7/RsX5xw0rH8MuZ1rYz1RnuwA6Uh5Q
 TzYG/CcAzk/Ak5wzDNXIQQ3rQBbuEIiUWEVnsf7X8R0Yxn2ZN+TPzsd
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aclint mswi compatible for the MIPS P8700.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e650e3800d8eee2a749fdbbde6108..ca91b650caab8927b3a4ed91f1f7f142e3790a97 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mswi
           - const: nuclei,ux900-aclint-mswi
+      - const: gf,mips-p8700-aclint-mswi
 
   reg:
     maxItems: 1
@@ -46,4 +47,14 @@ examples:
                             <&cpu4intc 3>;
       reg = <0x94000000 0x00010000>;
     };
+
+  - |
+    mswi@16150000 {
+        compatible = "gf,mips-p8700-aclint-mswi";
+        reg = <0x16150000 0x4000>;
+        interrupts-extended = <&cpu1intc 3>,
+                              <&cpu2intc 3>,
+                              <&cpu3intc 3>,
+                              <&cpu4intc 3>;
+    };
 ...

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
