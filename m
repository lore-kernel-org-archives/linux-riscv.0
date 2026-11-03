Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE186071A26
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xAKaM4ma;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9gQCSXd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Au6yRCKnXy9k++HaFWtIkaHskgRlXuOzm/M0I3UojYw=; b=xAKaM4ma6E8rYM3huY0ZxbbLh0
	+ucgItWIoD6X794bOrkHJD/VfYaDECsKhel82KaNZXNSxfg7/UOPZWY1Ahxb41B3k9T6nw3JVcPQk
	cMh7AU1NVsmUCDUi5LJXQxSlPUVJ02Kmp+dFZ3vJoZdp1/akcRb4GIGDz58Iwtwj9mhx/6Z7pNimW
	hymV56xomI49EkDJhUmU/iZTth4YzI8MAi8QKHf/j60OHHQGVsQJ93opmP/YD3wbFp1TFs5dlqi38
	MuwDaTDqcOHNdWmPWfJnLZi9Ax9KXt59R9JKZ0QIQMQKfqUyZNb7C+1g95+ZBqhew3U7jqFPaOOhf
	8f8ScBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAm-00000002s2I-0IeN;
	Tue, 03 Nov 2026 15:11:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAk-00000002s0Z-2Vao
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:11:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5779E43896;
	Tue,  3 Nov 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718698;
	b=2bfMFHZY8qxWH2YV0FfJB/v5znEXofF272T3q4YdYUfvlK0Fg+NhYOIMHdH/nmP1USpd
	 NYMH95U2N00U9y7D/n3Q3VnxZwcJh9Kat7IGDAA74D7aCTMoZxUR0ySVJgf4kvkTaysh5
	 fjjZh08zmMpvAUh3sMR23XpBAyoBewYWbTkv9kE5d/36oBZ5bBYjh8t421TG+sdI8axga
	 marKt1hRmzU558zJ4Hn1YjIac+T7BOpQnAQ89YaR+zNvmglm282V981DvjZJsFx+PaJDF
	 6+WlpPTDBUKxg0nSww113CKw96LVX/inGbCveL4Ir2URl3PmYFJ/uK+IPaz/uqUYkbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718698;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4+NonyAXN/54L4B5J1GdAxssGMZv7U7qe2SeN3qFx78=;
	b=AaF/jqFOm/qU42WeDBLJloB+rUZBdJbBHvrFdWYPULwoZn/VOYopXFTEQc/tyoVvGUQe
	 7skXMPA1d5xv7UiqCntMsd3wwKb0YglEwOUpx5dmTWkKg4hsuNUQvEBeFsuVbtpVj2TEO
	 7LtJa6XLn3kQNtMXjmeB5VSN2IUQ82jLAEV/X8dAYVgFv6Ch23pyOtfPJsNTmN96IdO56
	 xKy9kAFpW/6b01WDqCaklVRb9rsPSG5pm3Wl2l/xP/cdBmQFiBmoreIw83ud8WYvvITIR
	 HKYDYI3noQliK3iMMxld6/HPOuxe7+G9Jea3rkHhLcJZcY7rksU48E1C8sPdfq12bwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 809A81F00919;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718698;
	bh=4+NonyAXN/54L4B5J1GdAxssGMZv7U7qe2SeN3qFx78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j9gQCSXdMNbaZ8cZ/S2FzSxtYkt8ZYZ6xj4khI1hM/ZQSgpzcFrk4Rzecl5gjipzJ
	 38f51C1Duq7NJUwW43iYZ+GP6pp4CXQbAInXqnne4+l9DmhjeeskQDl1qnf2zMRI+e
	 SUXd31l/RwuhBkAsDsyWphKbru+2RhrMihiw27K4xDVG7uwol9clCYbxFMB9l3w/hB
	 r4iVnsOEmaTy8dl31pOSDRHL/RitEaRBD2KX3X8EHktEU1b/kqx3uIRjMROEqBvZ7e
	 i1mg0f0gf6rtHZXNNkPKAg737ibWzUQ7R4kNRI8EZ6Z2akmf2/qFkTrH024lijiWck
	 yaB+3xkL2YnsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD59E469CA;
	Tue,  3 Nov 2026 15:11:35 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:25 +0100
Subject: [PATCH v2 1/8] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-p8700-dts-v2-1-3ac5d49f2c37@htecgroup.com>
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
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=1355;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=9qjHBKUSAQcCeAu/Qtd3snEiEJmunnX9GsHooFoy87M=;
 b=FQWNfNXPVPyp9HJv9Ro8JIQfGPRSFgeAR5mxjbX3Yj2tWFah2fC2WlJBGPsEWhms7Kehkze/9
 coy1AgxDG2ZAdwB4eu1SQoofaw4GGP2gKwswIauZ/qaGaNSvqUbszk8
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

GlobalFoundries acquired MIPS. All MIPS RISC-V
compatibles should be labeled with the 'gf' prefix in the future.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373433b1f48118872c46cf7bcfff276..eea7f86ebed0d038c53cd3c22d2dd71514224475 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -668,6 +668,8 @@ patternProperties:
     description: Genexis BV/AB
   "^geniatech,.*":
     description: Geniatech, Inc.
+  "^gf,.*":
+    description: GlobalFoundries, Inc.
   "^giantec,.*":
     description: Giantec Semiconductor, Inc.
   "^giantplus,.*":
@@ -1104,7 +1106,7 @@ patternProperties:
   "^minix,.*":
     description: MINIX Technology Ltd.
   "^mips,.*":
-    description: MIPS Technology (deprecated, use 'mti' or 'img')
+    description: MIPS Technologies Inc. (deprecated, use 'mti', 'img', or 'gf')
     deprecated: true
   "^miramems,.*":
     description: MiraMEMS Sensing Technology Co., Ltd.

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
