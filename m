Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AB606A330
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1KP9VBj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Umfh6l6S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DDLqe1jDMm8KvY+No2MoK98KrO9BoXdkcuhWjrg6+o4=; b=Y1KP9VBji2AKafML8Bj0uNm4x3
	lcwBKSVzd86mh9PGQ9d3LJsiypxT0Je0T0AwiPSARcmB7Ez37WSSASvL1FydUPMaeaN5KxN98DWMk
	e81PO1VR+CcNSs+BRmJAmoEANLdFug+5TvNenvZOTLJE9HFkbDgKULFeYs/Ah2G4fcrokI9X6gNi/
	eOIeVxwBCC4hrnWt5yKsa6R96E+9SlDh3NGhoE5gAAbgy9N8JzIv6zV5WGjeb2LzUWZWMRR0NALgu
	q7Vl7DagnOk5vVWfF1Ni7xdNiuWNK/YH249Wogk8+bQnxH4naihAFBrCt8M+JkYCHn701DQLbUAS7
	N/3oVxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ9-00000002Fm3-3RS7;
	Mon, 16 Nov 2026 11:55:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ8-00000002Fjg-12F8
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:55:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E80D646292;
	Mon, 16 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830133;
	b=dEqk9UHzScEThq2FYl8jVbJy7yDcYMJEYMJfSJQipKbOwESrEcuA2xNVSyTbmVa7fmQ3
	 UaJ8vOYnupqiH91V1GpuTYaX/gv6pszfFmAURVfjgoy5TSp70LHEbKTfIPxSrak+memH+
	 ECG3bB514JtZDKyAb/m2tHU7OUI4K/hhGrS7SwimzOWy2Znu5m5V6OjFsfE4F+LCufK5a
	 0jHL8e4Md4v59U7NzHVAgPAgoQOeyRiK6G5iRqPkPlrh+j16b23YmaI8OXOBQJN7Nm0Bv
	 /4BnIgZFqx7CDQDNakjqrY3gmUFLjFPQwBgL4EYE8MPDaps9UHaLl/1Hmx87exU+MJw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830133;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nRcfcPqfetT5jsi4BrjqJuRmHpuTHA7ybDz4X2ZZ5WM=;
	b=BiNxOPjJ7NzkEnqAtzPj6IEdEKu2cREe44GiI2AHp2UAFj3IV4fbWZHBMu7XyZB8kgz2
	 /s6fNMjvY6wv/aTTgEvzcHOqaqwSNyhZIk66burcTu/tJBSpBptWxgOzP+kgYF0O1sR1+
	 pNbi6qa0xdZqiTVCtTw1EcQYOb5Nku9oH5Xh3N9I8MzsVqfuCzOBaZrS3sf8oJuMmB0nA
	 Nd0HJ/Do2SoHiqQ6rS4C4+7jNrjrH2e+7yEHMDemLoXutoNTf7eOUQMSOBY+az9vaic/5
	 Z5tQcun21hNBAu9EinEsF+xpMENmGFIejjFmD8hGX39K9Kb12vYk/6Fa8W0c35nVVrQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D14A21F000D4;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830133;
	bh=nRcfcPqfetT5jsi4BrjqJuRmHpuTHA7ybDz4X2ZZ5WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Umfh6l6Sefa2wtszH/GKJ8z2gcKxpK2261KlfpcQCNAfu71UQ4rDMW7fqVQP6W5LM
	 zQ6utfpxWIL6iIxFB/ud7+y8ctAmHlz4my59T4gANH1+zsq4gdW8+JaAaAwciGgkSv
	 VbbYCphzh5Zghn6h00rnMddBr2Nf6k/wRE38Gq9Yr3nj9pQVHJTmbkAGkwNzts3Weq
	 TYpGzZmFKFMYcowRpW/tkrIHQ86SzK5/Q0Y0IQUbakk176xcBcDUEIsFLgVu4jptiZ
	 hPEywfp5nrEc5joS2qjKbjGYtSVVSnQqPtAYXlCIsuhrZJbbYV5zz1bz7A3xx/OWTs
	 N6v3RDPiXn8cQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A33B4A466;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:14 +0100
Subject: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-p8700-dts-v3-7-ec5d4b7de39f@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=854;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=vb61DMpqL5a39NmtlZJUf76Y1KgC0WwgwIwdSxwuzoQ=;
 b=HLSKtg/bptyTUBFjrFU6X/ri6p+ErLOY6x04krRt8MeXvHr5BqJa/qcZumgbU7yE57ZHwcorc
 qqqPV8Q09V7B96H7++yRVnj9OwvwNJRDuKvXXJhRtz9xlkcslYqb6vH
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

Add a MAINTAINERS entry covering the MIPS RISC-V devicetree sources
and the board binding.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c24d58595059ca27b18775919ac12..a00f1a801be3c532c33918e673c7977d9de91823 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23542,6 +23542,13 @@ F:	drivers/spi/spi-mpfs.c
 F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
+RISC-V MIPS SoC SUPPORT
+M:	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	Documentation/devicetree/bindings/riscv/mips.yaml
+F:	arch/riscv/boot/dts/mips/
+
 RISC-V MISC SOC SUPPORT
 M:	Conor Dooley <conor@kernel.org>
 L:	linux-riscv@lists.infradead.org

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
