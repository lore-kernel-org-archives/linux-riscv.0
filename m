Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176AC60A2620
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wcIWgrCF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o06O0Wla
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1EODZIVPaAfCdXoD7qT6wzn5cdYAz5kXV/cX6HHX9rI=; b=wcIWgrCF9EcSnd/TtU0MSlqwKc
	gCC5SSZHLplO3uhn8jS6lit+cfWVBZnJZIjvGrGEfB7KP1IoozfU0W3S9XQlZK7X6QxuaLowd/AhP
	Wfd/0j1TC1kIAHTmhAK/LcyXvwEgacGYsErdhONl6nyJaGVFpowqrJTX0gXqb5io5c9wYkKZP+kGI
	8X62k3mALPbPEhb9QtKDbXIX/PfhaJ+rHtZ3PBV0twiYnNZvOsmNn+xP0e1uMZdHPVm1AhBpFZFVo
	ILD4v8QptRFASoK8NPAoe1zhnqN8UijT1LOAoGrSzKCyE+STajH25w4g1uFzqjXQgcOB8K83rWEVh
	t0KEtrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ8-00000002Fjr-0sNu;
	Mon, 16 Nov 2026 11:55:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ7-00000002Fip-0NaP
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACDE0462C6;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830132;
	b=KAJ2uQiWymrf9CdQFgEoDxhDXJLFcxg8ZU9fbDOK97gbeyTNTj4oUa74wTWxvx8Cl/ZU
	 geg9MH/xYT0d+SyEk4acjGca9ZbVC12OYgHUWlQxBhdYkvdE/kUQxtDHHFXLGUSwulnED
	 cFDYg5gkrWhVRDiXmYifQ/Gisg2ELzcuN72sXqGDGRW4+INeNI9R4Z4TGHYKYhpduyv2t
	 qqvj/rQuw/oUHG/brXGnO8LbfwQwB9iaOHgbVmDS9pPL8unTVDd3kZTaWqePZOf/X/GoD
	 aYkheUTHdku7KzO8x/wK6t0DQ90ZHeXs76m4n/V0zxX15BljyMQ7OQgG0x8azWt4soA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830132;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WWM/XkHqroywPq1Y6qjpupk851Qi+MmSf1AGGFT1YEQ=;
	b=diWtClmE6CmoE7Qd6LLsYH/zje3W43/bEjFs4af8WEhnoVwIFLRZ8a363RQuO9La8Q0C
	 Zj612WuL0Sy0LbxgXgV3wd6+5j+GVyWLn7B/NXiQoXESX16x2PqwkWSQJslR1GW+4x0kU
	 ORgkLuCujv/GSUnTiSAUjil4IwLK/F90pm+BwW9pBTGO9W3rBUZ253DAh3NrUDgV09PRs
	 xxNe5csB9yrt8wxAouOzxbEFPWYYtpVgXnESflmSl0f3amKkLnH4C8sO4MFLj5CJw/xcS
	 1bp8GZDpxe16xy9bdPnSVGL+T45eDUEjzf3q/eRUAU2VPnukhq2e1+JK3VqbNDb1jZw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71B071F000C7;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830132;
	bh=WWM/XkHqroywPq1Y6qjpupk851Qi+MmSf1AGGFT1YEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=o06O0Wla9LzTJo7IduIZwxldyhH+RhsJyJGRlpc/fK8aFbmzGuTQ/yqfmY5ozQpv6
	 7IUiMAvTfS6QPUTpkeG7TcgvPsO8U84//TGqBdM49/YsiklliMij+/y1Vhe8zhGi7j
	 uVfLQstRrT/jGdb43W7qdJXHoRtgDwqcUknZXbZPufo90+rp7lL7LYCreSB5tlcyKN
	 IHez2Y/YYXxHmIyYwPdRyPcG2F37EWr+JBTRQSC/b5HFLM1ASC2UjdbaZIevtUPB64
	 Clod03EpbINXQSeDqp0476aiEmu+wwdE8r+MJDjgpVROpiIjJd6hIrl75BsLep0cnm
	 XHzst66Rrh6qw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 016684A456;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:10 +0100
Subject: [PATCH v3 3/8] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-p8700-dts-v3-3-ec5d4b7de39f@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=913;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=nrrwazwcP9azGUHCUTNRCM9hJiAPuvFJXrmCXH0ud7s=;
 b=sghE3S8GwI2vqMWyekkp9g8y+HwNMJqSxvi6gFWDWZhz2iY/D2N/Vl67BVo+q0nWRBugPRzd4
 /G3ozQRWhEMBYMHJaSNxxt+nNUDNSL+iEWk3lMjwnv3NakGbYvw5JkB
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

Document the aplic compatible for the MIPS P8700.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d29fbfa36283fc9666e8cecd6f77e7..2ab60031ac5d2379a361dfa2bb334796472cf039 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - mips,p8700-aplic
           - qemu,aplic
           - spacemit,k3-aplic
       - const: riscv,aplic

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
