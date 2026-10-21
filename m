Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F060606A33B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vC3zj7g+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhLuSc4U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pafdY9xRJ9zta5PxmWHqBWqdJe4oidgP1jboaXj+Fk=; b=vC3zj7g+2SprMh
	fXC5M7wRHIhjgbd0QF7qZ2HmBnM+WIVtqwireeiI0m0ej2DR9P53kRIZONbgD1NeM5dw3/zYNjldQ
	OBDlDaASOCE0Ycw8+6qEdDEWSv5hMizR1KMmca2WQLg2u9yQDSPSU2Dc0iIHHkecn2TGf4/piOZn2
	wSvSby+9nsUS3X7WlwVMxX/U/WS1bkDdCKKlDbFis37KwgeN5bGgnEWuetKCdLQvofiNegCgXQtkg
	TB2EwayFN8TnEBuslDtr/9h0epY5kNj7Kxgu7Aphjr9pvQFXcAvWn0gfAxid8+qF+7B9XF/MVe53o
	eLdxIk4qhsXoRxFsFRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNY-0000000Cmmf-2Jfw;
	Wed, 21 Oct 2026 19:53:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNT-0000000Cmdr-3w0i
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60A7E60219;
	Wed, 21 Oct 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612415;
	b=iyEp+i81hyWqzy28aOos2CvLpzq56vl3i45N4uFqFKu3g8FUJs5OI38UBqNmcdL2vSfS
	 QIkh0/hmy0uiQhCACjkLqW1vvAra6aLG5eIWDVTdz8hv0jR1LbZ5TNv1bdZv2p2g7J+x9
	 UBvernSdptOAw0WHkXIXXs4f0uPjYRbV3ymD13VbcDVE6Fskge4qZgV8di5nxqeCdkFma
	 K6FlQr5nQbiqaH1s/A1aP7EWlHed9Eh/AmyV8Ft5iKtqOzGhsxQd3P6o7MuMRyhO4sR52
	 q7ec8vITPewYnycYF6YNhBjYCM2UJhNHbGMgmh9Qcg8gIRLyxorAIzyDgBTY4wihAug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612415;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	b=i8MxbxIHq3vcZmwJ5a7AhSEObbQ56xOFv7VPSskov+M7uU1ldmP6tmfDn/8RMvGVr83y
	 8yqL2uT+3Li/1EZQfg7kwkyMevWNBGBGcIQFK+wxPdmMhL7bUcJcdKtiaBoPnxeXAWKJy
	 ydAbzKOkbWOFej2ULqRMk/xrs/1uD6EOAGaAZImtT4/Oxxv7YSZA8qJJnP+Mq8sZgi2wF
	 uqpQ0EydeeFlDFf+GVGtYH816lUb2/r3jqkdgLGLn0b77QNiWqVhQqQz625Lx6TDGl7n0
	 QASUsAJZeeZ7uHNhq0OsWAqOUJfvQRA11CSN05OhhH3oTMWMQnNg71c39rzbYSwOUbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AA2A1F000D4;
	Wed, 21 Oct 2026 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612415;
	bh=E+Sl1Gk0Izp8iNjXVvH7BXDYK1wVBrrJEHxdo0B8yl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bhLuSc4UEo3I92a7vSoSv14w74ZUpge2/fhF/uMi8aPQ1UKAirHeLvIsmTgBJuj16
	 YlC2it2g45/5n/ydbatY+CbENqoMh7U5sihAd0XbfD90Uxlja8FwG0ODCa1BhE70qw
	 PVSK7QsSrBo3e2JPxm35vAcv0I8Qxnx5A1twWjn1HgBjixySPL9hVg8U+CO+hMeWiG
	 mzv8tSe5gLpgZfkhgD2YrK7QryBxOgju462Ic7AO3ihJFsy0PKS5BXvn4LAvE2YiLI
	 /+ycUEPs110/wpzrN8B8SxJKYeStI0p42Jo60sd2Chc4lpjCsNaVa/pwTNj5eDfCmr
	 ihW+2QMo2vq1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6216E43464;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:35 +0800
Subject: [PATCH 15/18] riscv: dts: zhihe: add A210 module memory
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-15-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=777;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=YcgMhPuDLQowVTt+MvNEeWTBEwtrbKzVnPLSZwTdXCU=;
 b=7FVapF06qGWWFbpf+pvIp7XV4KNu0FnbhwW/os88PUcpYDhxrgEmJkSZsfNWjDtcyyZNAO5Ar
 7UVdQqHS5UsAL544TFhau3wgzJoAHEBHkfNupO/IKz+REpLLwdie55N
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
