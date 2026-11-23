Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87268606A332
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hLVgOCtm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyhzciQp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mDLTl/lBzsNXseK/as7SJwdyDFFcxaC8wCcS2E4Zbkk=; b=hLVgOCtmbSvnc84wOj41rVPwM3
	5dcXud49xlQDXoMNGm5aI4gzDCqR5fvSZPe8EZqbNNO21a+MygdvitInyVkIGYBUxbmE8SWFYbP90
	ey6rLMYRO6HuTbu4zxfLogr0Unu7dXUXEyNRsJdnCBBpLZtVgcBLUQtkts8A5pSrnnG5noykbUlI1
	uT/E8zxC7VAXzp5LzptI5puawAe0QtzRpeDClY74rvG5jduKzslo2Z/rRe1+aHNgJ/Fa3xE1UjOq8
	pBFFp+qhteXN5skmsm9fgjI1KDFNBQ+6ZVQ1HVwHCk+PC8MRfF3cB8RHBccH8NnMTKqrBsMq26l99
	eRTS5zFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKp-00000003mus-1BMj;
	Mon, 23 Nov 2026 14:47:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKm-00000003mqY-0cd9
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E196240623;
	Mon, 23 Nov 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445275;
	b=JG2AwbYDrjpoSjj/c5/jcQox+JW7zlunxX6TtOeKx+Ri1LhnZe79L31G38OS2fRcpwIE
	 X8sH5aLfPhu11NbIdQZCVoxUFLF7jE//1jrFNH+GTDwWYzBTCEG87xdxLzsxzu3+2lXa6
	 6dzdfjfiMT/hKUMXRV97ui93Lv+rXNlKay40hk8K7NEdNlyBNVpjkyb207XX+WNzQ6UI5
	 hkfA8Pxlzbn1QILTutOlYVlNx0bpvD0PMYmrF+MKl51jV06ahHHAsf23DY5OWuHb3GGy/
	 2zYJvXsw+vQKyFzRNVDB8OABDkT4KZWFVtYKEk7E/ahGWS3Tl+5iiq7qp6ykRmYzZSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445275;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	b=OZ9qdQkqBXxFRw1kQ+d4IUP7EA6YLXWyxFU4L3rUmgEtzsy2/fyJ5KIQs5Mkv9QkCq3d
	 /OfM6LdI7p4SOMQ4aHQpPtbRtSjl30RufZp9huCqBjwssHUrDe3Z2s6/wKAQp9fySb/zz
	 2KsLJN+EOR3G6yErSDphlQ2qW/UrVssXLdHSNeXHMhgcDifUG+iQzNW4iOmmYyKgBum8I
	 YSr/xFOyYl9uAuIGzwqGfBnMcvdN9fheLDWdNZ51dIwJEw67tgnndg3rAP+qiuJi0twDP
	 piA7sz/qlA0hDLUN7Oj8cW5FEH9HCph9zkRTmg8M9lSDLGjsRuFlki+rPP7AFQzi/rg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF5061F000E1;
	Mon, 23 Nov 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445275;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CyhzciQpVB8aUf63BmEf3fwKNbPmF2St6WXmfCv2EMl5zaZKRjJyHUA4wBIy2UAB2
	 QPGx6005FwM/mDVCfchdhMEP1hhK1dHyGuRqx3DtSneqHc786mYW6g+3e6FesYW12V
	 +G+8xe299QBZN3oA9T76NZs5Inlvens1QSQZNmzFwAeMhiMOOu30uQ4dtasSwDyg7N
	 UzMxlpkJ4mebXA8fmZ1mA8xW1F5nxPCoz5cwoKbQwKx7Og0rUcdwoIpjuC6QgSdSRQ
	 YzYTahksS0rJrpeQPecZo2UNnDg3ISlPEQnjXoYeNFxmv5MGk2Zh1ZqbowFVAkpTNd
	 YcrTJvxWNPM8w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DDC8E4C517;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:47:03 +0100
Subject: [PATCH v4 8/8] riscv: defconfig: Enable MIPS SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-p8700-dts-v4-8-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=702;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=466tDeyPbrAH0ZZbXJHUmWZAi2oQm3IXvaEsJZHNtNU=;
 b=QbJYoDvcuW6rTMceYF+5oDzqORpAQ4g2v6P2iVuhB6hDlCo5rUvgeFenzg/A7wBqX4SgHuwJF
 wI87ry8uZsiC0Ks+ptcdfYOeK7zDZnUfEL7uMktB21Y/VoHrOgsHhdd
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

Build the MIPS P8700 Boston dtb by default.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..1b0b5346603934058d8348ddb3aa9d7616af999c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
+CONFIG_ARCH_MIPS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
