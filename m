Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B92660A2625
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AgzUfryN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0uumM/2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3pafdY9xRJ9zta5PxmWHqBWqdJe4oidgP1jboaXj+Fk=; b=AgzUfryNV0pl7GEm7DtlfDslYe
	gX0icdMbBb+LQ7CqQFZtwsEIxbLtNEpFC9pUV6nQPYsmNSgxHsEjt58zA9WekgZVCfVd5xbKFNPsS
	v/ufpOI+hND4OaRDkqANIhCNe9d4Rn/jQTxlgt49diMoRK1bMROOHdg5daRotxjHxyguFDNoNe/Rw
	g7dUFUVy5c8UkSv1xhEPpKywAZiShe7TYSKGeGvFLa9WxJis/Q1BlFK2mSLCCIqWzrO+A632fIKib
	2v5kNdhRw7y2pqwaFltFQZ7esw5Vle9W4cssKfotU7Z4VK0FK1RjCw14ZVqt/e3AHAZ2e3vqQHz/R
	aPlb+sYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6Y-0000000G2Rv-28Ah;
	Fri, 20 Nov 2026 19:17:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6P-0000000G2Kk-1mHE
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D73FF620FB;
	Fri, 20 Nov 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202212;
	b=AgRYJMmErCe6+Ok1nc5BNJp+x4FQ9GHPTTIX8koQDH78gjk8ZQLZFiKdVprzN6fS+FZa
	 BrAlcdatF6Q7Ee7y5Ww+uaDVUbLsdgMz9hc0skispk8gyMF/lye1jfLF31GSioqSv+LUO
	 qqz0U2JUELR6QLUtDuGzwVT2kEwQ6PISW2tVrQsdByNdCMbtbzKl3dyXJYFjM7lF4yKhU
	 xJbq2/8VaUlwIvPAiKRDcnDPEuISw3uQWHwMWIbLFnE/q0wXZl8WklwQcEhAGTD/D3saP
	 Hy4nRhxRa+T8KE1AjdWY0eceg++T4ahfANUAYeWl/3qMLkDTFMKPUMnKdwNLhVgoY5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202212;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	b=l4q/EoQRxKqsSb6q2PgUqjITNfImUPaX/FvI7iqhDoMTGjLV2pi7RJC8/yzHyY4uz34a
	 NuPeuEP66ehkhUGmZiGAgOrlMk4bqvwTgquSv0/YBphZV4jsi86mfy6EcnU+SZltlxpXr
	 sxxq/eEccTxe/Z+lxYsKVgnEzOp00UUt/iz0sP96W+KpATyVnIo8rSE/QG9a8gqv3w10b
	 Zu7lJ/wRNwfCuLRpCD9SpcuvJyHmMz1+5DRIHb4jDUdRHP4WlSM4/qa2TONT+omslbXT3
	 VWHaCb9T9sFD+ki2oSlCyGGkM8R0ePFg5nQjPAJPPSzJ2RdB2pqcT0fr+yCTVp1RijA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 051871F000CF;
	Fri, 20 Nov 2026 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202212;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n0uumM/2f4e4WX1djaV+kb2DrCvFpm+emAAWizF8ndmVmuoWb/9pCKG8n/IZQMrlK
	 VdLMAsADCCKWNH6QVr6RQrGVvhNCuujeMW6JCdgNmZ/8tB9nI4QAh7kbQds50hSfLu
	 kyCrwh6ZUbK78P6stMznbax8v8TwYBpY5c2oTxG0H2vDfvBJH0u9ATk550xAsJmjUP
	 uZDdJ4VtDgBIxKcBAnHbl646V53TQ4O76ZQYbiRSRneLQgI+htYdH/NnbPPk1QnXB4
	 rV4M5HAN9ek1sXSPU8Ip0Nbn1eb7qI2q46vNaAP/4ZKRjej2RLLOFuGDJ4FmeRsM8M
	 +Z1C9FKMqQ29g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 189954B9DE;
	Fri, 20 Nov 2026 19:16:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:56 +0800
Subject: [PATCH v4 10/13] riscv: dts: zhihe: add A210 module memory
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-10-4a795a0a9fc9@iscas.ac.cn>
References: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
In-Reply-To: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=777;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=YcgMhPuDLQowVTt+MvNEeWTBEwtrbKzVnPLSZwTdXCU=;
 b=UCyyELTjinwGxSiobkxFax1VS8/WmZZD+1yWwZXAf4WG0exoNvFai7aW2vn3dGB7NugVpqKtB
 VP/INK+1K3wBjMg+f42Z0GgT06wejuMZZI4nPHk+b1FCe6Zckc1FVnH
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

Add the A210 module memory node with a default 4 GiB range for boot
firmware to update with the detected capacity.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210-som.dtsi b/arch/riscv/boot/dts/zhihe/a210-som.dtsi
new file mode 100644
index 000000000000..a77447e402d7
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-som.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include "a210.dtsi"
+
+/ {
+	/* The loader replaces this reference capacity after DDR training. */
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1 0x0>;
+	};
+};

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
