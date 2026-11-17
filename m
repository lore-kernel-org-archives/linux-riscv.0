Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147D8606A333
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q1rBi74f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5iLUPhu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=trpOCUksS5sRuATuu3HkRr9gqF8xZGERZRu0EkgkyWI=; b=q1rBi74fRCbK2YXirFIC6cCTS9
	s/d5FTfGteK0fEtAlhtWJnZQe32trkhzh11FV2MRbOk2UeDCU0AC2ToDmli/aiAX6ARCQkbWERChq
	u2qnWTZ/PZBctup/XsHI21fz6ok9w6uxBWBcTUosW0XvZE07lvkX2rA/+/PkNna5X2+9g2gtvvvTs
	SRhYmJOn/uH/ociCo+FEHOpjAiKELYsh9sKQ3P4rzOar+aANxY5xWc72YVx9Wha8z4n3/GFt181Z3
	6CwduPpky6UXhGjIwGJZgU7DM7DAlLfh1H1o15H/sDRxqpTmvFQky6OAwOOjiHHLUAbDVMmzFZC4r
	r32b8eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPHP-00000006xfl-34Ii;
	Tue, 17 Nov 2026 19:55:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPHO-00000006xfL-0Qfd
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 19:55:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96BB440E2B;
	Tue, 17 Nov 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945345;
	b=XWwp0Vn3gnGhipSiOd2S5q3R6I0qULDTWJD8m/lqg65YtqZrwMjlMGcfUpFr9b1wySrP
	 kctIRKXEJ4kUmlJAzCeRAD2hxZv0XC18aSkVPJC68truXoJ58mJvjciLmI0Coq6RVP9ld
	 2/YWiW6KdtOde8GMHCKQOoXsysYKUYVMIITxTKKprjIgP0xScrMGxVXne0IPNdsT1JUqs
	 V8OX0VfN4nXMppqy8RyaYGcUZCpeJ7ZZWLYL/cO6PAnwH0wz5DAS3/mcKpJTp3HYrXvK/
	 4zMXXVy7Zsu2tNs4FvSWJq2q/cJ8D+GwF24Tx6yVz0iIdAeLBo1fkzunmYiQI5JJjyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945345;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hUhYh4Z/PDezI8cONEqRZjSHAQnYq8Uu/Su5P7ciz7g=;
	b=xFstLGEsLNHUWX1fcZYWPf+UXw+9REwFkRKAvoHBJY8WTb/gEOk8XcbU+GbQ7nLsl7d1
	 ePw0FRpjfCWKXYTBo+oyBvF9O/qSM7UCBNrGntJHKeZ3tGgVOqVD2E4RmMiDxesFyb8FQ
	 IfLolasZdNVGW0ZSALiXrzO0tSxhOwUSbMMBqEecjhA8uQVpSZmY86vJHE4W9EwNv5fRo
	 Vg2S4C8soTu2+Q9uiHg/bZ9IKpSs6+pElEvqq4WAIvkW8Nij6RSeGHhC/ITD4yxYqm8QW
	 iGu0xPIRGr8Trcni+aFej+ip+v0lYWyqeV2M2YIMW0g6mEPz7f31RKxtCCeX51KlI8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9486E1F000C7;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945345;
	bh=hUhYh4Z/PDezI8cONEqRZjSHAQnYq8Uu/Su5P7ciz7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I5iLUPhu3NwUjaP7SwP77r4Rd5x4pRXQ3IQvfDNQTF/MNameMZJIMnxPMPqL8q8aj
	 OPAp9S9moOydHlPxixy0zKbFMX2gtwCnTq9Q2Xm7SNgTRYEraySHJXOpKNRvBLgUkG
	 vpYxIzz8VZEMCCvL1fM5hTjWE33tDhxm5htC2l7/nx/FORXER1n4s7+3yweBdBXooF
	 oWyQemsz3oswrlqGojTwwhfG8uAWf8/bGAbx/4jgtKtF20XIHBbcI4idktFHiM3THu
	 5uq6QdEdg8RcXQoU3isv+tSVf8a8RUHQKQTAC6+i3bjSTUy5s7FFAyO4aj03bf87AN
	 Slv+TmtKWzWKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D5224AAAE;
	Tue, 17 Nov 2026 19:55:44 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 03:55:32 +0800
Subject: [PATCH 2/2] riscv: dts: eswin: Add Milk-V Megrez board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-eic7700-megrez-v1-2-af8334b88336@iscas.ac.cn>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945342; l=1608;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=5UoIVWI3E0hRT2YTxV7p/RQ7wPueg9djF6ac68d/O7I=;
 b=eOiA75gawpPq6IKE0fE092dhk/5ohmTbM2e6yYWxs8B5o12sKpTdTytekzbghUGprexUcXV2/
 kYp9Q3p8HGUCjJyWfM4grO9eA14GhpgsbMN+/u0c2ajp2Fc+MspDRCW
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

The Milk-V Megrez is a Mini-ITX board based on the ESWIN EIC7700X SoC.

Add a minimal device tree that enables UART0, which is connected to the
USB-C debug port through a CH340 USB-to-UART bridge, and use it as the
serial console.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/eswin/Makefile                 |  1 +
 arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
index 224101ae471e8d89996f7cbfc616425f704af37e..5daade822e15eda43eee111cbf89bc386bb06f32 100644
--- a/arch/riscv/boot/dts/eswin/Makefile
+++ b/arch/riscv/boot/dts/eswin/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
+dtb-$(CONFIG_ARCH_ESWIN) += eic7700-milkv-megrez.dtb
diff --git a/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
new file mode 100644
index 0000000000000000000000000000000000000000..2ca6d36c5edca271381b677ab14e9a459fdaafce
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 Han Gao
+ */
+
+/dts-v1/;
+
+#include "eic7700.dtsi"
+
+/ {
+	compatible = "milkv,megrez", "eswin,eic7700";
+	model = "Milk-V Megrez";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.47.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
