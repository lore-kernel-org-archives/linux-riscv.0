Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0366071A0A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZrEDx28+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5/DGoAP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q31DXHEMrZkr4M7aiYBj8yiZXRBiPzZZ4QrtFhAGHcY=; b=ZrEDx28+YTbquvGCda01qO0+/O
	m7ht2S3F5Mz6kQBIxcjmkUxDttVPOnsaGSUjAhxeyl14me7FCuhq0VAGKSoyHVqO2p9f2eqbly7au
	hNIJMvhdt9dB2QtK2vo/cucvzTfX/VZzfkhsWlSUFQ41oy94c8WKa/cmj9e5y23CiboBQ+BWhlSM+
	mfwHL2DxdtFcb7hvbt5OL/iLVGMFcrs9HqGHf1klhK1tz4l7aZkfxOVFXYgmwRrCfuY62+dCanYAN
	Uoe6IbijbW2puFUqmU2tHn/EMq+kmrZyfOk+YoDDIid/8t/9DqC1e2PhHk/edb2PpMb138GEHiolp
	1AEhiAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAk-00000002s14-3wNx;
	Tue, 03 Nov 2026 15:11:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAj-00000002rzm-2KMi
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:11:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48F5B40022;
	Tue,  3 Nov 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718697;
	b=nEJQ5A3MGj7zgw2Dmz3o4tUi0zLy1ef9/J9YBT+XasGWqpJTonAOTangaPcv/OqefRpI
	 AfjMW8mUZGQRilcuvoPw7cbcPJG7JX+YfAzhkgPR86JyHR3qjFiWFDfgC0pHQNisyj9fk
	 WrEoOD1nrhCzqH9/GWX8IUul5/k1yVvhG/mwbLtlHdHotbLHrA6ueeZweinE8oSDPL+y5
	 12nhxVpKvS5b7jbroyLpO54nMlNUpt1moVXzSz4vjg4+FzyNcp1wyeamd9RJc5pdqWxRv
	 NuSfcPedsIdPkkucynJ2rY3ebMJ3IIt/QegJ6k9kw5rr6QQucT+6/vXXUQ49e3CU7Qw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718697;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6AL2MPWhYMFha6/0+wQgfqbPtnl86NoMvZ4teyoUkCs=;
	b=VjZBuKxvrJp0ys09/EpfZgqK7p/B9Tf5yqF13jOLgQDwfYHA9wuQFQZ0eSJ2DAbFO/G4
	 qSGzSZdwxmkOXqTJRGasDfcjfYhaFrlKfWkx6/9t8wKN57JYivMWHJCV7YQR3/l9KXuav
	 vTqMWQj+u1LmZOTqCD1f8yxzxnP3sfLqOBiag94WtR1vTGR/KSepTVo9cTepemf5qi0qw
	 Nusf0t9u7KYuuCZEU3SOZ/uESoBU5e4KAXXnQ2Zdl6eWYk9uOPsUb6Bs3GNDdrmnRG/y6
	 FCfwp7OhOPZRfW3Gn//zQEnHNv5mBCzb8Oy+kMg1xo7BjQRXLLEVvIo0NcgmXBBU15Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80A541F0093A;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718697;
	bh=6AL2MPWhYMFha6/0+wQgfqbPtnl86NoMvZ4teyoUkCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=J5/DGoAPfYQK6NxUnrHhZ/tqdvOWkQ3lAlSHXaYdhQ1Ok75JgHKjX5tv4OI7Pj354
	 7YVJ81nfj4+MsBHHgxHpeqj2fFzezIHT9S1jI5ezTQkUJuqx7S9KdsBsllLH7FbB46
	 1w1Xd25Rm3qJwOQG50yOsUcQcq5/YEQABvWwKlHDgrp/F/ruEQFfjoPCsCsJ0+MUZF
	 E17z4AhxH4WiePEpL7UoK+ZD9ctEudUHlExjvA4JGQ95g5vvqqFDmSk8/owYmfJkTL
	 mdiqwBYVw3oh56TAS16kLhyIk4BXKxuhNbRhg9E1MnUMy7Zb2a8G1hJEeriEUYqKTZ
	 k8xepQykJOHVQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 00F3E469CE;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:27 +0100
Subject: [PATCH v2 3/8] dt-bindings: riscv: Add MIPS Boston board
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-p8700-dts-v2-3-3ac5d49f2c37@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=1669;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=EItxz8r0hyN/VApyZV3qlO9LX+SwI1DtA7fa/j5i9pE=;
 b=6psxdYXLaXtN/U/MFV1oth3CXp4XITMMtfyYpYCyYQGaZlCVN1qyrvQe3Hm3kY0M4dcLoJ+BI
 ZrHj1bwCJh9A56B7gjT+041wOkSuk2T8S3mdGJVAI14bqPsNiBeLiDF
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

Document the MIPS Boston board compatible with a P8700 bitfile.

Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/gf.yaml | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/gf.yaml b/Documentation/devicetree/bindings/riscv/gf.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fbb405abe9b94e3fd40ec61fd50942a30374b7ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/gf.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/gf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GlobalFoundries MIPS SoC-based boards
+
+maintainers:
+  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  GlobalFoundries MIPS SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: |
+          Boston FPGA development board with a MIPS P8700 bitfile
+
+          The Boston board carries a Xilinx XC7V2000T FPGA and fixed
+          peripherals: a Xilinx AXI PCIe root port, an Intel EG20T PCH,
+          a UART and an ASCII LCD.
+        items:
+          - const: gf,mips-p8700-boston-rtl-5057225-202410011144
+          - const: gf,mips-p8700-boston
+
+additionalProperties: true
+
+...

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
