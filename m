Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363BB60A262D
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wiz+t4Ye;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=int4A698
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mlUymui96ZR7/MsErvapvXNFuH+8Q57PrOui3DWQwGs=; b=Wiz+t4Ye6IChHw7z1pQR5V/C5k
	dg34Lwevxs8W4/2wIrreensq1l6RN7Q2V3IM89do/EUmhH8CGZ7tQu0N2nGguJCbC/SCkFlJUBRcD
	Mgr9+wGf/pvzYOmZi59q6FFadOOrkn2ZGRit1sujbTIo5sRKXv2Mlpd2MfN/vca6VtISNqdQhzU7o
	LQ7327gGrVqBu7kYI6Fzw+bqC7CXMX5cYJGbGRsAAUGSl1RAjFzRWeniiDEM4wQueIZ46/vRm2uWE
	8WOc/h8Cja8p7IKy8fHU0eCu4D0wYfk2zcQoTs+rzXvA+0ussBS3I1a5N9+UtpvMy96sKZHbSaGDC
	v8Kosrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ9-00000002Flo-2FW4;
	Mon, 16 Nov 2026 11:55:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ7-00000002FjY-4C80
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:55:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B900145949;
	Mon, 16 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830133;
	b=iJZz/mQ4lmbDsEQo71368XD2PbX5MNjNZ/yTFQMzC7lwAKqHtt4+ftGjXVMc6TJhL/Aj
	 HHlfVPDL+ZMURkgYeo6xzU7Me3rynj0oAnapZxw8XwLa3Tk9qFhF/hVt54faHXJYKo4SX
	 nKiXrPZtSwo/VH/IzVEHzRzJqLEtxZWHWYZjp/vkmWDDWw3HQumacZJOV+AkOGsTJgELi
	 QSsSLQ48SqjNFYZHThxO52v6o8lm614PtmOlvSDfxbaRzCAlmQMrwyHKxv9Eynusb8ESU
	 T3GL3jTAWwZMgTKQSwzhYqP/3nEPGhERqYS6WDOuEkXphNhEz0RwUdULywKYHHwNiAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830133;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3ELK7UCbUvGWQM4M18vVS2rXctTaHyXhFbh0W654D0c=;
	b=LsQI2EEODgcmMb0UopWRXgfCqEftxTOfR5xVh7Te4R12Fxru1XE/YIL59BWayGGNLqwj
	 piJXP2UwcJOkNbUosTcIVyAD4NtRDCvtbo3yGxHFS8A7ECWJnluFuEkIN47pe5e8ikpsg
	 pYN9jdKstsg9nHC5vwzVhwCHYBjf0ECvO+xQzV6t0+SfFHythqcpkkprSfp/2qRxOkQkP
	 3a3bDn0jUvrO//L7ossKaYn8tvGOaeHMi15RTnHzoVR9kURFoJz4hwRCAuwaIR8X4KVdk
	 jO78f9TmecHrl4/K8WoLwXfb7q3/vnA4t8wX2FeTuuT0/5FGFlw2ElxMkNvF5iUtgpQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69C641F000D0;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830133;
	bh=3ELK7UCbUvGWQM4M18vVS2rXctTaHyXhFbh0W654D0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=int4A698GcM0JpXWU0bVXDfNt9JbnlHJcV0j83MkJZWCWxqRnXqq74QkH/WxqMeX9
	 9XN7clvrX4LTJTvSwd8fHEXM+nNcwamH4pLGLVMGR7zIcrT2c6Jx1VUQaKrIvTCq8l
	 L615ifgF3N9XfPn/h2/Y29axyjbIZdSCK4NUp4pZG7+fQv/xBDxaig+9Rirz4Nbz6o
	 mIdxwY39F3COkbZufINytfga0W9E69eoxXxbhA5pq8MLW+NpYVRYSa6+dEtThCmF1+
	 m0xVu1HFjOSU68eq0mzu7L6sHGDivcObqo0PawLWBpHVCXrakQKAxBzPCaEpcQRqOq
	 rsjVj107ET5rA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F06A4A45E;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:12 +0100
Subject: [PATCH v3 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-p8700-dts-v3-5-ec5d4b7de39f@htecgroup.com>
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
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=2281;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=NJe+9FUIucxCmNXZnGjS07SXJ64Ib/0GQbLsdG2nvOM=;
 b=YxdDK4koG2rM6wnlapd4vaY+E2+hhCtPnx271NUbwJPio1A3ajKWu3wHmKxS1rDXbn6EAC/sQ
 CYTOKULvqitCHqXVF4KGAl5GOIaKEKu0HJ27gV/ZiWACf6AWCFNzjXq
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

Document the MIPS P8700 ACLINT MTIMER.
Extend support for both mtimecmp and mtime registers
within the ACLINT MTIMER, identified via reg-names.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f674afcf59fc726742dc4f49c1a820..a5ebe04ade9ed61c8beac5017aab94ab12afa9ea 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -21,13 +21,19 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mtimer
           - const: nuclei,ux900-aclint-mtimer
+      - const: mips,p8700-aclint-mtimer
 
   reg:
+    minItems: 1
     items:
+      - description: MTIME Registers, or MTIMECMP Registers if only one
+          region is present
       - description: MTIMECMP Registers
 
   reg-names:
+    minItems: 1
     items:
+      - enum: [ mtime, mtimecmp ]
       - const: mtimecmp
 
   interrupts-extended:
@@ -42,6 +48,26 @@ required:
   - reg-names
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mips,p8700-aclint-mtimer
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: mtimecmp
+
 examples:
   - |
     timer@ac000000 {
@@ -53,4 +79,15 @@ examples:
       reg = <0xac000000 0x00010000>;
       reg-names = "mtimecmp";
     };
+
+  - |
+    timer@16108050 {
+        compatible = "mips,p8700-aclint-mtimer";
+        reg = <0x16108050 0x8>, <0x16154000 0x7ff8>;
+        reg-names = "mtime", "mtimecmp";
+        interrupts-extended = <&cpu1intc 7>,
+                              <&cpu2intc 7>,
+                              <&cpu3intc 7>,
+                              <&cpu4intc 7>;
+    };
 ...

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
