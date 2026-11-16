Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CE606A330
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=APU9CAN1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkMZKmLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eHXDhd0zuI+DzjHEOcVZV2rbQWwHabv6T2pmyiqHCCY=; b=APU9CAN1Lm1MK/SzoHs9c8NYAX
	eM9NCuWXGddNVxw5zaWdaH3jTBq2UkMZ/z5yWMsaMbUf8gtkNT7uzQg6Q8p854482li+DDA0i9YKu
	NTjrOofbrq3tY8GCwb2QJRTQFYjbE83zMb2/H7cPXaL2nb8em6OVEWfdCKRTmczqGALRORy5OwATj
	8+hJqRMBvBV5x6ybSZrY716nksNXoZLqIQcNxLvVYi524yVKooA1ORIlfV8/9YXSN/j1qpkSDBFSP
	p45YlIu5Yn9hH+4NZd8S7Qx9CRNxQJ6js/HKDmJIdi+Aao1q2NpLDFZFY5gp+TyTAEBzvkOWS8NmV
	z5yU8csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ8-00000002Fk8-1nk4;
	Mon, 16 Nov 2026 11:55:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ7-00000002FjQ-2tcw
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7136F4632F;
	Mon, 16 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830133;
	b=XCK5Ze7sCjDk4jkzH6j8NwNEs07AQJWGwL4I7wP9re1N1kRyHwuQ2p1i3XCtQ7rpeo74
	 gsz3wpBv4DyQC89GeNWkN0gUtxxv+oLVmN+TysD3DRfX5KzyIFpp/sLVQr8owKkcQ7quW
	 9gcjeW1Kl9jDH3FKQ8JJ1+Bd8DLE1mmbszrxo/2I3IE4S3Zy9bIMR9p66+SxqFecZNBi+
	 mnCgWnaA2SqCURdaOlJ6pgQkkQLTrH4AOEJ7C03+aiQZA+tQ3wAwgKjScT7DEB0sump+a
	 LmWha1KSsZgnFbgfJFNoOyKG7xwIvzzD5lxJIh9DA70OHdG7P00NAYxXIj0Ijy7nrvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830133;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	b=vVEEXKX4vN4eo/UJy+u5l90NRb6degLzOs2umIuYGBcqCbdd5klbd0d4qHZ85pUFKe1I
	 NjksUBKu5ZwIasQ42f2/5kF83um9RLqmDKUwvIrBGqfvtureoPpKxtiK08uapw3NoySWJ
	 vs4UQjDdK+AqlvSlKr4K2vqt70aSxd8s10Z+t0TzH98vVJNcS/KwRKQLGsAyKBtnVrKy+
	 k6sutssPrhvA05TmflqfcmSMt2E6ecCL/ljH0exgS2AaOfSXoQK5rhouzcCDFj/xJ9mdB
	 CY1CjnB4QE0pC5XcoXTpKhhfdRzWmiDlOYkBGGyNOX0SlcDYJiNvR5v5p3xzbQdFOQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 872FD1F000C8;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830133;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dkMZKmLSRL1Ob/0EOkTi5B2BUGwzW/4i3d6FReQZPIbKoqa70RuuyIo6XoyBhAUQb
	 rGXyssekWmUWgRVXkUGddDzW61aimnxIApQ++8TPstaU4lFIEd4no/1R8QuW2YQveJ
	 BSTpS3AAUI+q2Lq18B6lZrHuM5cLq3PDx248y1gKMjp/SP4AQc6zLBP2qXtZGq+zpw
	 Hsg7nXHHTu4QIhbGyWm5FVujpVz/Dncye0qb2QQkc6PjcVh0cqGnloqQeyFbErea+c
	 /HqrDWfa8tZdYl73QzLUgRntAlqxGNiR6CCJZ2VGCUPQIZE4+ukq28ja6PKipwqCBe
	 9jH2TPQrv0ECA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1889E4A45A;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:11 +0100
Subject: [PATCH v3 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-p8700-dts-v3-4-ec5d4b7de39f@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=1430;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=zFOUG0JTBN6Duoy/8XI+grpvovTujt3/U4G1NG7BFIQ=;
 b=2G3aMhBtGSruqDbApBJlAahcUAU+LZ1KKFvWPjahInd+ewDggF0CriiFlj07bvGorM+guUnIa
 UvKC1Z5cG/aADYjMDquLt1vedrCHh1ZQu2Q1w7JhN4YKpNtMp/aBvq7
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e650e3800d8eee2a749fdbbde6108..3255ea666e1560ccca239264786fa49d444e8101 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mswi
           - const: nuclei,ux900-aclint-mswi
+      - const: mips,p8700-aclint-mswi
 
   reg:
     maxItems: 1
@@ -46,4 +47,14 @@ examples:
                             <&cpu4intc 3>;
       reg = <0x94000000 0x00010000>;
     };
+
+  - |
+    mswi@16150000 {
+        compatible = "mips,p8700-aclint-mswi";
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
