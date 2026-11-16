Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A143606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rsx1XuH7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQpycu5L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mDLTl/lBzsNXseK/as7SJwdyDFFcxaC8wCcS2E4Zbkk=; b=rsx1XuH7hPz/kyJuaLPUg9HaUb
	RTlXxd+lBmjT70rZjj1s4GinxRLdT3KxwgzXQQPRpuX8wvQNnGOP8DOtTm7d0U7G/oAfA+YTax8uQ
	ppR7CKkiUWW1+tqH+2t4Z5Mtb1J8JyOrDljoCPB4TbYuhlRyJc0BSOyUKFHK7gPq2M62Nau56fidZ
	YieeZ/orK3yIxjdIQCB5COhka9049PPDkiBUK9fRas2zPl6veC5Cd7a/YT4oJIJY/4t8XSVY74pJo
	LaHHAsWDExO7HawFSMYiNMky5y5Oum1ZFF86Q6mJ4VsxnIVkuNPlXD8BZZr2ewWDMhC/cLVbLxcla
	a3XiknUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJA-00000002FmO-0LjR;
	Mon, 16 Nov 2026 11:55:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvJ8-00000002FkS-2aBL
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:55:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C48045600;
	Mon, 16 Nov 2026 11:55:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830134;
	b=KiQvKYFmA+Xclt3aJk8tc05KIloqbc60B/sHleh0YZff7WYHu0EEWkzQkZHnY0SBQlUu
	 gXgBK2lkNACymYKX6O3sQbQL67Af68WNLBlgNA6+8+nHtrFXscR63CvE3D79oujbeUxbd
	 /9z0UqeHJl2ve7kSwyMmX5q6NwgqOTe2t+Dq3phMMuY3RQJCuv+rA67RGPeKnFqqFK+sm
	 63wGkHTGMo2/mPJvDb7nFPrEQPRThx2UmY3z4bMPoUQGYYaIBHWi/lxFDjHTjmOV88C9s
	 rBE+F6YbvkvTIQF7DfS/K6MVJltK7HcoptpbCUa1rK/NMbmfXN23krNjh8G2AsBcqmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	b=T3bYZ6vXhoAyFBzMr2pfRi05CZyRdw3KjEGkxa62noihzal/M6eC3b6Go8yTsGWwLXER
	 tZCMQ8PDUB4kLuSCyXqKHEYaDOQTAmKn5JrAQM7Cg0eA3wwEVbFthsW+/HfFod7/IwEHS
	 GoXvcg11pWB4Xw6mz94aYb5RR1hteepG+ZRPZzxGbDGxciuGmZY8xlQvm42ivBzNBJv/+
	 yDYSPCco4n2xYIL0bkhGfE5IVyCHqZ6eNP0y6sln+LTJWe44nL2bUqhKPWxj60C+GFBhQ
	 T8x0eN8Vj/ZIjnAmGUgPLfzVwn+5L+PSQhJzT3GqqRyNWds1olfjUrB/yCKiHj8n0XA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB74E1F00923;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830134;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HQpycu5LpWJCK1jQ8LUZ/UGSM2GUCsnsp6WM+uTl+lVIR90gfwjOc4Jpj85ZMRYCd
	 uh4fWlYbMq2FzAn+5jqAGuG5ViuxmsLNlTee6qUXXGx1xGObfPsFlm1N61uo/v2qRD
	 H7/GPaZ/w5i8bSWg8u8eG22XBqSp3197PhaT3uiIyI+zE5NKlj50gpEqWeHxa2TWpT
	 /2g14D1u6eFNegrWx8/bcYkcFQuZf+cR5ByzNtOsHnMuenun0ph9J/VaUi266KSltP
	 C+pulO1b/2mS2eebGbLEnkYfgbRycvSsKJNbJzvXPaYCB8b78kMkBFO9PmH8Z/0SFV
	 lqeV7iOa0Ej8Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6F40A4A46A;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:15 +0100
Subject: [PATCH v3 8/8] riscv: defconfig: Enable MIPS SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-p8700-dts-v3-8-ec5d4b7de39f@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=702;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=466tDeyPbrAH0ZZbXJHUmWZAi2oQm3IXvaEsJZHNtNU=;
 b=V/9j8MpCMt8whhuC9mZX8aB9c75Lj6yWWaWFtpQUoxsQVLHWQwc/LZbRxYxLv+BQuuAq3ipyi
 D1kWAWKu+JpDga9AQJ4b7V79T02NruFzyZs3b8GxdVt8kE0VPS/F8B+
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
