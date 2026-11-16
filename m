Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FB3606A88E
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YjW5ZBaZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZ0R2flg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7j2swC6EtqkBx2woZtEwmyvGf9E4AEuSEUtlSUMa8zw=; b=YjW5ZBaZw/B33ydAzh7hlC5j8A
	wnz4/JOn5yZJu7hZ/aRkRd7RTYEUmGG8yORWXcrlvahU2l624y44YOcR3vNZV5HxMAuHxJyVxnEW0
	wL2tm1uNJZi9VCefCkeoDsNaMEWihQoTVbqhvv390GSx77i2R5Zsj29ccFANd+uqCxmPF4irUIVQG
	LDs1BzxfIDQGRth2pBgSOUOsowFwRX2oqbf0cZq5c2P77dssOENRribUT4+2ctztFS5xvQEAvOdf/
	3jWlE45pamODSkFNPGJQYEzIw7ylYRHXTaeS9+zDOKtVc9J1OvrcYxuFt6Ca5Lo7Lcnk+lCf2U1Oa
	yyyBJt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ8-00000002Fjm-0UTA;
	Mon, 16 Nov 2026 11:55:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ7-00000002Fio-0Nae
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 994914594D;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830132;
	b=QAz9IgbW7DnTQDeLAqoA+K/e8GKp8voyqdBJwGyvFhJ10mrxwh7OHJYcxmhqv3En+yiI
	 BeHNCFbUTmAA7J1MqTFqg/XUCa3qpthr7mWh/zuvPEUQrL29nFkhyyzdzPlWpW7USihBu
	 8QaYAON16uTu6fnGYg9dtRxwMQKeppegyKGAxLxDGibT6iXe4AacMBwNb7+Nxyl+BAXSG
	 bTfQNFTzOnY2zxEfE4bh5ILwbuN5/xVMUpbIDSRhXj09YhnVcxQItiG3pb6bNpKlrxSl2
	 kBYcAWGw2o7z4n1JrAokLqruAaLe0D2/ZyGWZ9ae7Nn/xGUwJKCvA7OGPgrpvtuti7Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830132;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	b=0WEAv9tiO/ogBUfQx18bR7F2cYsZlY0IcNHm1+Mw+Zbkh3MFfyQWxU05bAWmBXbVeWTk
	 yAbKrpKclMm2FqcS7wNbsoGxR/NZCRW96+3dOdz7ALeaDPdszFVoBcBBN/1mlkLzc3cKf
	 JH0IA0Pggp66lMxWUF+xrAF+uwUIOiH0Icu7ClX0UwKeIhB+ASaYm5b2FtQoTw15lBFgh
	 1xWT0K1MKW5X8ImJMPDy75mRLwwLaxNim+bBJGcPAgdQ6VssCQxasR5PIVoy+Ms3lXBol
	 6EYYzGS17vJoZdYBjRJPLfBST+PL+LfB33iSNlr4x7gdESAs7FT0g9MGz3hUFT11obw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 592D71F000C6;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830132;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WZ0R2flgdT1OGLWNTBCBWXVwM436xCfFBdKKY6DapTRSqtpM4KE+xvwpnRoP/XS/B
	 5sRw+638FVdOlcuGM4PD0OcvamMX09/v1KnMF4RT+/IXeGVxu8EBnojn2q0coYj+Y7
	 6lAS1I3gCjJFH7zkp/0HcIp0ytevw1fkCEpcp2XmkpvvKcAnokkkqQi/6HlhS3L+VS
	 r1/UCoOEc2xAWrsS/dxqCRJf6GXEzswVB3m9dSqEE+GoOZmA6XUAEiGdzXpJv1AukM
	 uqyonhrxX+9Zx+vpza3ntibYT2bGbZmoErQxj2ZU9RH16q9A/moyVgqW8q7IkfC4TB
	 L1mpFfo1bTYgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DEF7C4A452;
	Mon, 16 Nov 2026 11:55:30 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:09 +0100
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add MIPS Boston board
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-p8700-dts-v3-2-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=1692;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=5xVOseiOua96OFvJrDMkH+ySfMmO2vu4mBB4SPO9IZo=;
 b=CFEMhFviJqzLiCWV/idM/1CfSBhuzsjSnorw0V62mkGAPjmQbpm486MJVAKXrKB7Wv7rMNzA7
 Oov0uPhn1bdC8rr0d20Fzijr3aNlmdAlcC6SW4CawWXCWnGhQt73R9r
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/mips.yaml | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/mips.yaml b/Documentation/devicetree/bindings/riscv/mips.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bb251a7b1bcc762876fb94f0b636415774024183
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/mips.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/mips.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS SoC-based boards
+
+maintainers:
+  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  MIPS SoC-based boards
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
+          - const: mips,p8700-boston-rtl-5057225-202410011144
+          - const: mips,p8700-boston
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
