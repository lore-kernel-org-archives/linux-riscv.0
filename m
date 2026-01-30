Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0C6E6BF02
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=URKINX/5FZVZXhk/BxUhm0nTQYQA5+Lqm2PC8L2XIZo=; b=wpfbRQcxui9tH9
	D4M4eksjvRn6ZzZLaKUyx4iFob07xhYGcRn9nABfsukGgfvw62KwUddaMqA+ztOCDgAxYZd1MdADs
	0gJqBIBXBe+vwayqicMSBx6s6cQRiZfQDvUeKTWs3h/ayhg08K2BMYjyAbFNyhqN56AmA8pu5sTtC
	u/bxXlhb465erkBPKyX8SPUy5I1KHcIP//i4JnpcDwwJjaFK2yHP+WDY8deW6bNm4X/f1hN48j2Aq
	neCH3sUT3+a6Rogohl8yYobm660nBUeJSdjCrjcJKewr0aW1ggjTxVwzmoFTpt9fZeW/PDXEuBwud
	op4ZjNWIdLj1RbUi2A+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlma2-00000001QPZ-2h0V;
	Fri, 30 Jan 2026 11:22:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlma0-00000001QPF-3PHB
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 11:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E60446001A;
	Fri, 30 Jan 2026 11:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076A1C4CEF7;
	Fri, 30 Jan 2026 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769772143;
	bh=wpEge0618iQHhy+AsEBZQJc7isjU9ln4SRE/olHsnfE=;
	h=From:Date:Subject:To:Cc:From;
	b=TklEvXAEfFMQq6cMmYsuX4rLzIJJS9uJv8bIIm8jrcnoJVOrPks0CFlSr8B9wU8Rk
	 Ms5FnbGGxRxpb+vUkPBC0nel1quGR9uE2MtkYcv6dhJQvgCv5dUceAxJEFLC3wLgDs
	 8sdeWXWmEngwbOPEWqP56SCcpBKBtUg8JMZ2XSG967uK7C4R5VW1VXRXKkhCnqLwlO
	 PFzeJy2Bre1Aeo78vlR+q3Ti2LCa/SIt1mEX0BWj29WT12gZlduBDBt5MphQFU+30d
	 wMZzsdmaZcuI3hGElDle1y7QQm8Mg72SjlqevRYbylqVli0rRxb2WAYEufnQiG0fA/
	 /Qm80juFDNJ7Q==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 30 Jan 2026 19:22:15 +0800
Subject: [PATCH] dt-bindings: pinctrl: spacemit: fix drive-strength check
 warning
MIME-Version: 1.0
Message-Id: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGaUfGkC/x2MQQqAMAzAviI9W1gnKvgV8aCu06JM6UQE2d8dH
 hNIXoiswhG64gXlW6IcIQOVBczrGBZGcZnBGtsYqgxuFZ4S5kt3lAOd3ujlwXoiamvrRiYPuT2
 Vs/6//ZDSB0hTzLlnAAAA
X-Change-ID: 20260130-k3-pinctrl-io-drv-fix-5b11752dae1f
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=dlan@kernel.org;
 h=from:subject:message-id; bh=wpEge0618iQHhy+AsEBZQJc7isjU9ln4SRE/olHsnfE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpfJRpCQzoCAhf/X3zr7VoIHvrUN2LFmTpcI8va
 XADYq1CaEuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXyUaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0XYBAAl1cxD4kiJIq31CCJktQdJ1B8ARNWBGis2Wsm6/G43dIC3H8tTg3DX
 HAuBqrEoEjSBmiRx0AsY4XSEXdGJFaKO+mABkmpGCe9rZ1EMMGjno0ATE/dFyZDlLtspy7wuuZE
 GheKT98KVtFM6F8s5BeLOsbI9UbnE/Dg9OvFTMvWK+2yl93vW10outSA7a9lSlkf4aIwHBhmXu1
 YK3PSjbiUmgDHSiZXAFVQ0eARrdGBnsrjHxXzI3h76lHW5/2JGe3N14agv9Lzg+E2CyTPHqAI2f
 F2O68tcBk+hFu52+AXgZTaU33aTSqmBx/4zfeMDx8JxywLWr2MZ0EI22cJRLN0MRfakQgCBt63+
 wM5UMEkGpVWMKan9jGizmNbwzFepAijJobAWOFi8wfsuGGjXpd/BV7zv2kWNu6G5td2m30ob75q
 jyqTawiQB0paFUfPXq52WoddElBnoawhfGa2k2Buj3OF4ljQ+//KczybyyK84OJ56vCsAeDqkXc
 X2RHPa2j+mCvDpfjd9GYFF3xDBU+fBFcOPbwI/9bmPbhk0Xqe9XkpO+gI4YkzySOswMgkaW4jqj
 GYiOPyBNf8I3UO6B05Zbq0SsEPphh7m21QSdmdosKKPx6H2Ztpupfa8z3Cr6eboSNArXhap84kj
 l+x09h3RZ6tR54m1kcLqbBIuktJaLc=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

The problem is that one value from drive-strength may match to more than
two different enum groups which lead to DT complaint, switch to use 'anyOf'
to fix this kind warning.

Fixes: c3efac0592f8 ("dt-bindings: pinctrl: spacemit: convert drive strength to schema format")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Doing DT check with command: make dtbs_check W=1, will get this kind
of warning message:

arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: pinctrl@d401e000 (spacemit,k1-pinctrl): gmac0-cfg:gmac0-pins:drive-strength: 21 is valid under each of {'enum': [2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33]}, {'enum': [11, 21, 32, 42]}

Instead of using more complicated minimum and maximum value of property
with constrains of compatibles, we decide to use 'anyOf' to fix this
warning.
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index f009fed87e6b..5194fa92fe93 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -76,7 +76,7 @@ patternProperties:
           drive-strength:
             description:
               typical current (in mA) when the output at high level.
-            oneOf:
+            anyOf:
               - enum: [ 11, 21, 32, 42 ]
                 description: For K1 SoC, 1.8V voltage output
 

---
base-commit: 3fcdb264b61a5bb0eb3fb7272717468aa376a74c
change-id: 20260130-k3-pinctrl-io-drv-fix-5b11752dae1f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
