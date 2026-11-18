Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C66B606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kbOEGtf+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=YW+7OmIm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:To:In-Reply-To:
	Subject:Cc:References:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gKdxvQiI+Q9hV1CwjONPUCbd4n2I5UUiZzouDxUw99U=; b=kbOEGtf+34q3epZKeemJ7PS0s2
	8ojISMcSav7B9wE+HnMILFlsz2zJ6ToR+a34Odx9dIbGGk+qPAqeiohhUQqOB2g+TrKgoCzImtgtx
	dDr94dWGRxmF3l0jd6UPyGE+hDWATBHXcKgYxnJdu8uxFC6/uRzC9LIUqKNhYHKDM2SnZfKR38FWw
	s+n2L7oKPKxtkQfNhfPwJm6EESHGaaCVJecNWD86BugdPdwWNZDWO+TTbfVyy4Yh/LUAYP9BPWIIE
	Rvhc+6SEILGkUYh4QRMuybDSAZEGCg3Klpzc+dVf0ROvfFz3FmntfO1527LHX9Y/ywoc+8R/5gSTI
	6lhhhOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbVw-00000008GdW-3nC8;
	Wed, 18 Nov 2026 08:59:36 +0000
Received: from lf-2-41.ptr.blmpb.com ([101.36.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbVt-00000008Gar-34bH
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992300;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2VyhfTXkTaroHFBv8TOZc7YD5SyTk+wxbID6QQMvh+Q=;
 b=YW+7OmImX4Xm2itALj/aUzewKjrwOunBjx3qugvgZ8JyzXcqEUUeOFX/9kAgVJvKDMe6Kb
 DL+23zMmCrYZjH+3JuvlCAk7c84M1BUxLpj2oVvErHRGxn/M+/DH2LZFUf+PmOpABKV2+2
 00PTLeaJYbkZ2AvXbggFu26I+B+rBDi/szgxhr3TKJprgdifwNUIf4w+IRZYTfdO1Ysx+0
 5k/Bksbl3LMbWBuQfd1JtIl3+MOE4KrXze6w5W7ngJyz0IKjCCdLmR1PepItORJCqhZfVk
 krvbkYJ8PKE5JEVjuuX8eYXowvMl1HQJVBy9b6HKYybbexAMhzTjMm8NRmJ8Dg==
From: "Wang Yang" <yang.wang@deepcomputing.io>
Date: Wed, 18 Nov 2026 16:57:41 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 8/9] riscv: dts: spacemit: Enable the FML13V05 EC keyboard
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd68a9+0a817c+lists.infradead.org+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:16 +0800
Message-Id: <20261118085742.1817536-9-yang.wang@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005934_485177_43C52DB6 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Connect the board EC to the eSPI peripheral window and GPIO43 rising-
edge interrupt. Describe the vendor 8 by 16 keyboard matrix and its Fn
mappings for the existing google,cros-ec-keyb driver.

Preserve the upstream model and compatible strings and keep the EC child
local to this board.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index b5d5112de..214c8bbb5 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -3,6 +3,8 @@
  * Copyright (C) 2026 DeepComputing (HK) Limited
  */
 
+#include <dt-bindings/input/input.h>
+
 #include "k3.dtsi"
 #include "k3-pinctrl.dtsi"
 
@@ -29,3 +31,138 @@ &uart0 {
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&espi0 {
+	pinctrl-0 = <&espi0_2_cfg>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ec: ec@0 {
+		compatible = "spacemit,k3-cros-ec";
+		reg = <0x0 0x1000>;
+		interrupt-parent = <&gpio>;
+		interrupts = <1 11 IRQ_TYPE_EDGE_RISING>;
+
+		keyboard-controller {
+			compatible = "google,cros-ec-keyb";
+			keypad,num-rows = <8>;
+			keypad,num-columns = <16>;
+			linux,keymap = <
+					/* Row 0 */
+					MATRIX_KEY(0x00, 0x00, KEY_C)
+					MATRIX_KEY(0x00, 0x01, KEY_DELETE)
+					MATRIX_KEY(0x00, 0x02, KEY_Q)
+					MATRIX_KEY(0x00, 0x03, KEY_RIGHTALT)
+					MATRIX_KEY(0x00, 0x05, KEY_X)
+					MATRIX_KEY(0x00, 0x06, KEY_V)
+					MATRIX_KEY(0x00, 0x07, KEY_M)
+					MATRIX_KEY(0x00, 0x08, KEY_DOT)
+					MATRIX_KEY(0x00, 0x09, KEY_RIGHTSHIFT)
+					MATRIX_KEY(0x00, 0x0a, KEY_COMMA)
+					MATRIX_KEY(0x00, 0x0c, KEY_RIGHTCTRL)
+					MATRIX_KEY(0x00, 0x0d, KEY_SLASH)
+					MATRIX_KEY(0x00, 0x0e, KEY_APOSTROPHE)
+
+					/* Row 1 */
+					MATRIX_KEY(0x01, 0x03, KEY_LEFTALT)
+					MATRIX_KEY(0x01, 0x04, KEY_SPACE)
+					MATRIX_KEY(0x01, 0x05, KEY_Z)
+					MATRIX_KEY(0x01, 0x06, KEY_B)
+					MATRIX_KEY(0x01, 0x07, KEY_N)
+					MATRIX_KEY(0x01, 0x08, KEY_DOWN)
+					MATRIX_KEY(0x01, 0x09, KEY_LEFTSHIFT)
+					MATRIX_KEY(0x01, 0x0c, KEY_LEFTCTRL)
+					MATRIX_KEY(0x01, 0x0d, KEY_UP)
+					MATRIX_KEY(0x01, 0x0e, KEY_ENTER)
+					MATRIX_KEY(0x01, 0x0f, KEY_F8)
+
+					/* Row 2 */
+					MATRIX_KEY(0x02, 0x02, KEY_FN)
+					MATRIX_KEY(0x02, 0x04, KEY_E)
+					MATRIX_KEY(0x02, 0x05, KEY_F2)
+					MATRIX_KEY(0x02, 0x06, KEY_G)
+					MATRIX_KEY(0x02, 0x07, KEY_H)
+					MATRIX_KEY(0x02, 0x08, KEY_BACKSLASH)
+					MATRIX_KEY(0x02, 0x0a, KEY_F7)
+					MATRIX_KEY(0x02, 0x0d, KEY_MINUS)
+					MATRIX_KEY(0x02, 0x0f, KEY_RIGHT)
+
+					/* Row 3 */
+					MATRIX_KEY(0x03, 0x01, KEY_LEFTMETA)
+					MATRIX_KEY(0x03, 0x02, KEY_TAB)
+					MATRIX_KEY(0x03, 0x04, KEY_F4)
+					MATRIX_KEY(0x03, 0x05, KEY_F1)
+					MATRIX_KEY(0x03, 0x06, KEY_T)
+					MATRIX_KEY(0x03, 0x07, KEY_Y)
+					MATRIX_KEY(0x03, 0x08, KEY_O)
+					MATRIX_KEY(0x03, 0x0a, KEY_F6)
+					MATRIX_KEY(0x03, 0x0b, KEY_F9)
+					MATRIX_KEY(0x03, 0x0d, KEY_F12)
+
+					/* Row 4 */
+					MATRIX_KEY(0x04, 0x02, KEY_GRAVE)
+					MATRIX_KEY(0x04, 0x04, KEY_CAPSLOCK)
+					MATRIX_KEY(0x04, 0x05, KEY_S)
+					MATRIX_KEY(0x04, 0x06, KEY_5)
+					MATRIX_KEY(0x04, 0x07, KEY_6)
+					MATRIX_KEY(0x04, 0x08, KEY_F10)
+					MATRIX_KEY(0x04, 0x0a, KEY_F5)
+					MATRIX_KEY(0x04, 0x0d, KEY_0)
+					MATRIX_KEY(0x04, 0x0e, KEY_EQUAL)
+
+					/* Row 5 */
+					MATRIX_KEY(0x05, 0x02, KEY_1)
+					MATRIX_KEY(0x05, 0x04, KEY_3)
+					MATRIX_KEY(0x05, 0x05, KEY_2)
+					MATRIX_KEY(0x05, 0x06, KEY_4)
+					MATRIX_KEY(0x05, 0x07, KEY_7)
+					MATRIX_KEY(0x05, 0x08, KEY_9)
+					MATRIX_KEY(0x05, 0x0a, KEY_8)
+					MATRIX_KEY(0x05, 0x0b, KEY_102ND)
+					MATRIX_KEY(0x05, 0x0d, KEY_P)
+					MATRIX_KEY(0x05, 0x0e, KEY_BACKSPACE)
+
+					/* Row 6 */
+					MATRIX_KEY(0x06, 0x04, KEY_F3)
+					MATRIX_KEY(0x06, 0x05, KEY_W)
+					MATRIX_KEY(0x06, 0x06, KEY_R)
+					MATRIX_KEY(0x06, 0x07, KEY_U)
+					MATRIX_KEY(0x06, 0x08, KEY_F11)
+					MATRIX_KEY(0x06, 0x0a, KEY_I)
+					MATRIX_KEY(0x06, 0x0b, KEY_LEFT)
+					MATRIX_KEY(0x06, 0x0d, KEY_LEFTBRACE)
+					MATRIX_KEY(0x06, 0x0e, KEY_RIGHTBRACE)
+
+					/* Row 7 */
+					MATRIX_KEY(0x07, 0x02, KEY_A)
+					MATRIX_KEY(0x07, 0x05, KEY_ESC)
+					MATRIX_KEY(0x07, 0x06, KEY_F)
+					MATRIX_KEY(0x07, 0x07, KEY_J)
+					MATRIX_KEY(0x07, 0x08, KEY_L)
+					MATRIX_KEY(0x07, 0x0a, KEY_K)
+					MATRIX_KEY(0x07, 0x0d, KEY_SEMICOLON)
+					MATRIX_KEY(0x07, 0x0e, KEY_D)
+
+					/* Fn layer (row + 8). */
+					MATRIX_KEY(0x08, 0x01, KEY_INSERT)        /* Fn+Delete */
+					MATRIX_KEY(0x09, 0x08, KEY_PAGEDOWN)      /* Fn+Down */
+					MATRIX_KEY(0x09, 0x0d, KEY_PAGEUP)        /* Fn+Up */
+					MATRIX_KEY(0x09, 0x0f, KEY_BRIGHTNESSUP)  /* Fn+F8 */
+					MATRIX_KEY(0x0a, 0x05, KEY_VOLUMEDOWN)    /* Fn+F2 */
+					MATRIX_KEY(0x0a, 0x0a, KEY_BRIGHTNESSDOWN) /* Fn+F7 */
+					MATRIX_KEY(0x0a, 0x0f, KEY_END)           /* Fn+Right */
+					MATRIX_KEY(0x0b, 0x04, KEY_PREVIOUSSONG)  /* Fn+F4 */
+					MATRIX_KEY(0x0b, 0x05, KEY_MUTE)          /* Fn+F1 */
+					MATRIX_KEY(0x0b, 0x0a, KEY_NEXTSONG)      /* Fn+F6 */
+					MATRIX_KEY(0x0b, 0x0b, KEY_SWITCHVIDEOMODE) /* Fn+F9 */
+					MATRIX_KEY(0x0b, 0x0d, KEY_CONFIG)        /* Fn+F12 */
+					MATRIX_KEY(0x0c, 0x08, KEY_RFKILL)        /* Fn+F10 */
+					MATRIX_KEY(0x0c, 0x0a, KEY_PLAYPAUSE)     /* Fn+F5 */
+					MATRIX_KEY(0x0e, 0x04, KEY_VOLUMEUP)      /* Fn+F3 */
+					MATRIX_KEY(0x0e, 0x08, KEY_SYSRQ)         /* Fn+F11 */
+					MATRIX_KEY(0x0e, 0x0b, KEY_HOME)          /* Fn+Left */
+					>;
+		};
+	};
+};
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
