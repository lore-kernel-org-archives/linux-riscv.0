Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1CEC624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 13:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxRIdiJFQwOS8mYVybDb9iENOw/wANn3Qmixhms70Wg=; b=nDK07H2b7pgWdT
	J6g7VeEFEZRzTgzaZ1ERx9lbHVMNB7N1lWz2dGcBvNYGSkGJSewV1HzKJIeYjA/P/qRiSmpE2eCip
	qxowZzIc2SRlV974qMfE+aDmDSzc6gpGHRnFIZhPehkyHwGB9OeurzV9MPOmeTZnBS9ejwq+Yjafp
	NjyaybZ2N+J2PQLORHR4VtXTVSwIejjdzsORSWedVIxC8w8UiiAUKqK8H21pOMCyEYHp7fPo5FN/u
	UL7pwwTfv6S2B9IhZ5lpS0avJ2tm/psxWqIJtTFETdvJrWm1fR6iEjT8J5GUfAeSNnTh5szTwGiDV
	k+rOEltSL1e2RVaj9qRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LO-00000009VuW-3sH9;
	Mon, 31 Aug 2026 13:46:40 +0000
Received: from out-104.mta0.migadu.com ([2001:41d0:1004:224b::68] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LH-00000009Vkj-0xxw
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 13:46:32 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yRqRgPijYmsIK6SmmV9Po0rmE7qecT+mk2IoaUzPjf0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788183989; v=1; x=1788788789;
 b=ua0vX6oTRJNXlU4bAIU6ToM90lu0GuSnRtz2vUDdAvKflKt7cV5WM3y1pcBBRNaRoz/0Nf9g
 AWv0r3ER4d5MHzmaqZKqu2KNpPTt5IAhVKvq5FQguEfyV17OwY2MLZ+FLDbFdIaILWwq1DelLH7
 uM5NQ3J0e//qDnKakJkbud4M=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id d6effb9741c8df24;
	Mon, 31 Aug 2026 13:46:28 +0000
X-Mizu-Trace-ID: d6effb9741c8df24
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:37 +0800
Subject: [PATCH v4 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
MIME-Version: 1.0
Message-Id: <20260831-ctl2301-v4-3-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
In-Reply-To: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=yRqRgPijYmsIK6SmmV9Po0rmE7qecT+mk2IoaUzPjf0=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGqVhZyj4hHW3Ytd5gXevNKC/we1F2ZEmdDs/j53zZmht8RD4
 Ih1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmqVhZwACgkQmAnvgPkzNC/e0gEA3YMM
 ZPqTO+6Ykw8I0GX13qF7QDbWzfwVX5ZBdsrgDmMBAKX0Vo48wN2iNivLubwYrFE7mwsDTXYPj2a
 kqUgr20wH
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064631_416244_51EE984A 
X-CRM114-Status: UNSURE (   9.41  )
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

Add the Sensylink CTF2301 temperature sensor and fan controller to the
LM63 family binding. The chip follows the LM63 register model and can
provide a thermal cooling device when #cooling-cells is present.

Do not provide a national,lm63 fallback because the CTF2301 is not fully
compatible with LM63. It uses different conversion-rate encodings,
extended local-temperature registers, additional fan lookup table
entries, and device-specific PWM and ALERT/TACH configuration. An older
LM63 driver would therefore not operate the device correctly.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
index f2e0993cfbef..4c8d0a15fbd1 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -12,7 +12,8 @@ maintainers:
 description: |
   The LM63 family provides local and remote temperature monitoring together
   with fan speed monitoring and PWM fan control. Supported devices include
-  the National Semiconductor LM63, LM64 and LM96163.
+  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
+  CTF2301.
 
 allOf:
   - $ref: hwmon-common.yaml#
@@ -23,6 +24,7 @@ properties:
       - national,lm63
       - national,lm64
       - national,lm96163
+      - sensylink,ctf2301
 
   reg:
     maxItems: 1

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
