Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E11606A331
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 20:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U9rSxV8i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SERwcjTU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CnY1CG1yZlkyphZdCo8qPZx3sk6R5tZeikMdb37TJK0=; b=U9rSxV8ijQrmuwpwI3bdbmuk9t
	1UgQn+6Qn27jdswATE1S9Ar6ubJ8HpVdiETXQlGuDaUZb/MVHJTSvBe9WWZ+nc0fe3v7ecTuRw/Oi
	UfMB0ActxKsC0KSP3iJABeEsTiTzLesReQ/cKnPzdk2LRKBln3/Ka267QRmQINiJBKE5+FCLAkzOO
	jz3N8KRKTYZegzlNP4aI/VR+8ol9BVKs/QwaJhpvFeM4SgyNM/SW3pNmK4iTt9XkmbJixz4XjXSWQ
	swjDDnHWOeOp6hM5Xq/HJOF3rAc8yguaIaiB+ntqgFW1G6dzR552GoOhbqqrlEnaAq0fyBxY6QEoh
	XL/Btbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPLn-00000006ygC-3lDb;
	Tue, 17 Nov 2026 20:00:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPLi-00000006ycp-3URQ
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 20:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48206618A9;
	Tue, 17 Nov 2026 20:00:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945614;
	b=pgsZvkyc56bAVem7A7mTlB7udNZXtN2CLKMEILXBJ/jNgDJ3B5DrU+/zDXvs+O2uKKg0
	 tEmJGJDa4iN8eSq+7ePHwqhiTj67InyF2dYE7+Dc8FdWj0mzn17fjeMCfwNNYUPZfwtyI
	 rZIPtRHG+pLQDvVEDKZHL6YSXxga2WCzlT7SODlH4X+FFfZ1ydRa5rDQCbqUMlxVw7S8J
	 55WnrONzaKnhAiUmQVlBeaXC/C2WPKU6C1LoePt4bV+P7xXYSsmBv8lzHlIRdb9j6udkO
	 sxrLpVlG19BRYbtsOXK5cpS4jRhNJSNcDxsrOo7qs4fTvvoRo0b7FR50HFLQVaAPedg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945614;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CfThdO8f/o1dN6kXq8y+xiket6A8mwn5DpRMwQpz1IM=;
	b=chx92n9g8wfDTOVGkqBSwGyx7p72QwO4fDsAv49Fl2ZDDrp7U8YgTvD1IOvpicYwru1f
	 jAM6M/PdkJyZzMlfoWjZaWxEAZtPnl0IPxRDYMncFa8KH+X9nMAMEwZ3xaWGd2fGmKlY+
	 FW0vb3wdGbAyEb0Nb30sFkd5Xd8cjQ8rIxZVoPXjts1mNxjEbux7xNyhs32V/x4n2uVam
	 qc8qGCPfn1iVUwL6W7GAsohcHxCKjHpVSPpNbfKRmsgiaDGrbO9CCyF85wWGBYeJYFUuC
	 M9k9E7s9Q2Lh8VxtF2Uhy3fK6AjAjDarHIbvAXGByRqCcKOIPoQzQI0OpD1unZqjxPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D226F1F000C7;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945613;
	bh=CfThdO8f/o1dN6kXq8y+xiket6A8mwn5DpRMwQpz1IM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SERwcjTUAax6Oi2NqUswhIBR0wMKqjgchMTu3pIHk1VMCeyQnArW5YrC1c6Io3zVL
	 M2IGYtZkZVdubdrdhjCVN23+keW+1aOGi0G+8iskZDZ7R8JvJk42hDmtPtVAqk/9rN
	 aLEEF+83XVxYE1ors+1lHrtd9txXrHlHhErSdjdTOv01m+UxPhYwg+iwH3nSbVJNBU
	 oY9puOtDmiWtg+g9N1HT0ehrx9hymjRzB+O33ZR49/AoWCcBfH3Ux3lhEo08pjsXW1
	 Xb/Arq860o0Y0kwbL0wtgJSOPtClNJmZYn/VNS+7n4vxmIFrDcAmTYKlx5zSGb+FRu
	 75Z8KuWmrLWXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A12D4AAB9;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 18 Nov 2026 04:00:06 +0800
Subject: [PATCH v2 2/2] riscv: dts: eswin: Add Milk-V Megrez board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-eic7700-megrez-v2-2-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
In-Reply-To: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945611; l=1629;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=QUGwPSZ5IJZOF55+jsHoXOrYxzxrVAnohOX9v3SFw5c=;
 b=8S3rk5VvyppR1x4KTay2bz5XR7TwdRtLNW9udJPa5eB/bNsqOYAZs8ZxYA48p3Snbe9prV8XH
 CuS4PbE2qHGBniA+nu0eQHITSdgiZm9UWsZq7XDDZAQkxy5gmKVtuFX
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
index 0000000000000000000000000000000000000000..a57cb61171087b20a39eb962f9c45d9c8ded3925
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
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
