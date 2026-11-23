Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC7E606A68E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQ50naOE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZfR2kwV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dbjTapnmuVAXznMNt9eWIn3rvEeQlgBkf58BOQ828zM=; b=lQ50naOEOANUfHx9Zj52iS6NtW
	7euP/UED16A/E42B/zls0mB81UH2P99Z/hMcyK2ztuUSoR6iMdJrE6Mp2ZAt30WTFf8NbSzujc4Wy
	3asqXEDkLEEpaHF3oQBZUDQCyD+YJHjDUnx8Ota1nFMcs1ktmPUhGm3SNqUKwsy/bBeEYD1dfKkB5
	ckTQ39IrVsjZL1RTHHHZKYwrq+oRCcGqt0n09BGeXRsjhkWZrWFuqyfb1NlrqSD1Ha3rp5tq+OdpX
	quGvdPQbpNJnNt6RjK2499zg+QHSZMZ+KQUPlffLXF6CVWGTTO23KMSqotbSAnmFXGJhc/GbctdiO
	so2XGo5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKp-00000003muz-2DSt;
	Mon, 23 Nov 2026 14:47:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKm-00000003mqZ-0dBy
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2DF445986;
	Mon, 23 Nov 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445275;
	b=Hil4emKvoibOYhDBjtYEDyH4khS0yaqKEns3rReepOYSUj9igxYe5p6pid37L8mHYz+i
	 HMNVxurlaP+47hrM8PJa7vxWppqDBJEtFGwj2MjH0GnbHW8r+OBHq1V+Jqm6sWLhpZIr3
	 xfN78p5kyXIDtfWTX0o+MkAAmiqDAcpxsso6CwJNlnMxHaSts4QrQQpkpyINHf+Pb0IVH
	 CytZfQMwwJit6oBhvJiu8/OPaDgCgKcmEiX446DiCbzz8+letFgtFxq7YdKHNlAL00+p9
	 G3HzBFJcVknH7W3XF4swaDvqLs34ICi+UTis2pR7r0rEyOU9lckiQpekWeBLThJ2DLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445275;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nSKsB4jxpm4xyyNflDDqZwB6al7srQ4yYCsAAvWGnvI=;
	b=ddqAV3GNayolGPgsCKiLLvLvfQRJjaeHxr+Ijh5zDgT3VMna/7qvBdjkT1euGSgaKyLo
	 SFIODnhmBH4hCVggVDOE6fY6lm+VOX49kVu2Po6BclJoB3uSMoXIKm7D2wTEy8UaiMQCW
	 VuI/YHE9DTSTPlU5oqqnRna4dt42w9/meyPqJ1ut2RtXBVtdQqTvC3wYp7LehdiVjc+05
	 9LnXNU+BQOxpS128USVCw8v5XIml+fKuEq4ssV4CYXq4Sdbh6wWIU+UZNpEevj1otiKNN
	 thJ6xkpxDzQW3YpvdH6Ot5jghVqyyBQQCWxtZv8gna58aGmjVHQuoKUqziDMU20tLjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB16F1F000E0;
	Mon, 23 Nov 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445275;
	bh=nSKsB4jxpm4xyyNflDDqZwB6al7srQ4yYCsAAvWGnvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VZfR2kwVnS7csaHmWsCp7jm+Ygya82STtDTj9IwoVR0N++/b5lMc0pEr7wRdbuKt6
	 o1DR+VulFYfy0rOh9SjQTbw7i6w+naYY1+ofDU4NG2sHNCYXilXyC2pIOFE0+bOZxq
	 q7Lg69oxrAioY9qhdVoEAXUkzmUg8XgZq2g6DbqfD9Z0crIbD/zt963Y6u35J7YqxF
	 1vXYc62VA9ZnSmxlmwcvQeYHyuDuWVN+7l0i8Q+Zwfo5ULo5sbr/cn4/GeyfNzCkdA
	 s236/1dW05aiVaoAHhzKeuPXiiOztuKEpnlY5a4/3yS/jhcXJ8GacXP87+wb6B1XSB
	 YH0F73moSXzDA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C21A74C513;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:47:02 +0100
Subject: [PATCH v4 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-p8700-dts-v4-7-60bb7bf8a7a1@htecgroup.com>
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
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=913;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=ZJvf49si5KqHQv1isXMeLQqxt/Hhb8/bQsfjW00EDHE=;
 b=wDSQhjRNNSKODF9urr4mkpjxL6kTtPOw+fAEqjfTUN/fClgZGbCqxzcDiXJZb6QuNTMRv0XGf
 YvR+C4NOJaPBKAnewg2+fq2W5MBc4vOLX4yB049dZzRxkssFfNJ5KuM
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add a MAINTAINERS entry covering the MIPS RISC-V devicetree sources
and the board binding.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c24d58595059ca27b18775919ac12..7b6cd49a4fe2626a946a9153f1ca545d6ad28960 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23542,6 +23542,14 @@ F:	drivers/spi/spi-mpfs.c
 F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
+RISC-V MIPS SoC SUPPORT
+M:	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+T:	git https://github.com/aleksapaunovic-htec/linux.git
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
