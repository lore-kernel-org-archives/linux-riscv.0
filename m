Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0040CC5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNMHECatl5WJbNxOSAt07c44DLakRJAc5z6sN5RC5mA=; b=v+wmw8dnEdpCLi
	NTcKUvXu6fvX1yjPAWY8ykNUjCxEBSMPyk6EG5nlwK7IpmAvLlLySPkgjyTO/gM0rOOpwMW9pgRpw
	qVuDju+gUmEXFwVe6VPG3u4f2KicyRWQzMf5KdZT6nVxtgXjpEwQXjaRP1Vkq0Ia50CnV1kFLxk6i
	ZtY+r8mar4EVB071y7PjWUyQ2JADZ+5TGOS0FMPzM4ga7NGy0yuHPjWQoACw0lyZvYp6QmB8W5Mn7
	Qq0BWb5MnDrOiZ+fNUgISgOFJDlTGyeZnI9chYZwdtBjny0FMn1aLJY54nG7efokrtowZR9P7yUHQ
	6BoOgS/kPc8id6b/hKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj2p-0000000AAJ5-3mV1;
	Wed, 19 Aug 2026 16:21:39 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj2m-0000000AAGW-3Ahf
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 16:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FRQS4Gu3K1UkoAbTFDfDTx1Q+vsx7N9SeYOIsx1Uuv4=; b=iYW88pKrgC/MSw4gpXaiLJ7tHt
	McrtUQTYMOYe9QtDUuh4R5ChwP1kcy9d82pslQJehwPquNgL49APlh9gzZlQMRqBL+fR1r5XOpRHH
	9ZQk8zdJBTJ4UWFSomHbVesv7M1OE5RJ5mt4/kBjcbBanJptOf5We9kKcOnKL//bRrNHKlRNiSU6c
	oT4pMEOll46GgyETzmPr84TkyidtGPDjFVQQJXFR91so0waZGJVbu3CPQBGwCXz8IUdF+/Nh0nfCu
	PXMptrEPzi6AJiFdTvOKB6KrE7dM+Kz5IJ/c5RAvJ5WDEc1FHwaz7PLdm3yR8u2Wmqko9OZHFOmYv
	+6yCSS7g==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2e-0000000D4kp-1prc;
	Wed, 19 Aug 2026 18:21:28 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 4/5] riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board
Date: Wed, 19 Aug 2026 18:15:45 +0200
Message-ID: <20260819162115.2252812-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819162115.2252812-1-aurelien@aurel32.net>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_092136_798554_55EF1B2B 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On the K3 Pico-ITX board, by default the GPIO pin that connects to the
RTL8852BE WLAN enable signal is driven low, resulting in impossibility
to connect to any network. Add a DT node to expose it as an RFKILL
device, which lets the WLAN driver or userspace toggle it as required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index d2e8df5ebeec..68f8224eabcd 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -44,6 +44,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+	};
+
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
