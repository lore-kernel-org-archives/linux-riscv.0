Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2039C606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LGjDpJJ4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=nOf4rD6S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6rMyHbhuYCrBZCMWpHdezwSFkBCb8ZdtQ4ev+aJz7b8=; b=LGjDpJJ4pVUDpqY8n34twhLEoa
	c8zOCw03bYXa0IJyj/0Ncw5yO5Ka7hlzIS2kFCoLaQ3FtD7c+/MkKfLGemTOgw+v6exsTuIQdakom
	Q6lrYqKMiXTXDwtvlNQMP5czlIqdI94RqZHS1qj+QCy5uMxolEqPiiDiwXTsMGtXwQjPe/341lyK2
	XQFlnxQSnj4EcVyj9L0LFC1GLtgUG7rk4q9t3B9PDrkwiBSjG76tAbyDCQ0pxkoSCC3HCO5+M0kb+
	Gt6zRow3UZduYZ++8XBXTyRSPHf7+Xd6tbPlTBG4dpjkZYpYI/bRQuIP5Hm0qRfP5uDOdtTlekgPR
	Pc4SuQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFlE-00000005AjE-1syq;
	Tue, 17 Nov 2026 09:45:56 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFl2-00000005ARf-2lKV
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908720;
	bh=5FN8m7PE/nm8LadW/EpmCHNTSgvk1Y0b2hsF8AG+DuU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=nOf4rD6SCMAveB7+WoFEy/+q/YeEgWxnM8achCEKzTDKHzVVVgdstOr9JcYwBjKLm
	 El+GuLlJBSj32lsSTUY0XlDKsvJZuV8c1KWLHJVMFWRmlwp+rIo44SM95wPJPly05H
	 rm1wBDKaYcYsMXqICLPjM4qVHPiqXo3hh1YQopnE=
X-QQ-mid: esmtpgz11t1794908718tdb303e4a
X-QQ-Originating-IP: dtrLbmaYt2sv6eJsGfDy4TFsZIMUiZQaDfHcfljLNQo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2333346560292728604
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:09 +0000
Subject: [PATCH v2 1/5] dt-bindings: timer: Add SpacemiT K1 timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-spacemit-soc-timer-v2-1-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=YTzIYqz5yG8XkouJ9NazRxZn63OsQlQGGOsumRdwLmQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNQab02RmSZvduK88eHMd8/fpc542pm32e/YRgMZp
 XNXovlVOkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACYy/wHD/6BDoVdKXoTOVrVV
 7PeuMT2cxK7CWtPO9F1g8imOxxvD9jL8j1w9+fP2OZpnT62eOY9FRFX1pHzg0cpLO5Id9t47vMw
 2hQEA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYjaY80FOgjav1vHGpRTOq+RDPewvR0uvLEDeFAY2Mr5WKiCpxS3S8aZ
	TK9oPHN0Yf/sOk1g/YywkOVUK86BRNxGJZl4bl4C+AzmQkSbfVHtaj8C63Y784sC7IzW97I
	vw3TuJ4Oe0vja8BCgf3ECs7l3cKupqbp2t4zxmTjW7TOcT4TPOEh66Fz5xLMXwC4iUrr/kR
	1lO6UjWRAhauKJlxb4LU8EnCRjN1PqQH3wDQSGE8KsZ91VxqYfcTjHN9XNLd/VLtXdMsPKx
	La1+v2h2N734XbELYrZa1TGlf8SAvha9cbUlh2GwnqqkxxtTW4ZkV2M3d9i4SO76wC9Mt9g
	Ey+7yICBypP3deZEKlMQhPsxtElQRqmcU9BD+pPmUA/JCUlR7Xi2L8v2X5SB+588aiIAuQ3
	/9L3NxMmE6d3OsidtetQVWzemA9zDqXBaFrwc1zw8MIuEjUa5La2bS0MtUFcOVoUZyUGsI0
	UjiZJTXk8YuZVVkWlwLcmND6uSvidK+JN9FJjsXQ+nRiIhD4QNOqSxYFWOYqvxtipAwV7Da
	uAaRPBVag9s19EXwNu9BsecjQx8KuWAS86+tVJpfjfP1v6L4NGXGQAhcuvNEqL3HEdEEdrD
	GsIhumwFmVvbyAYq0Jdt86YlYWCRI1jXLsM1sGqIHVNE4M91RlOwslDZzTMDgl9cop9Hqfi
	zx8OMlgqmSMng25qrsXEQgt5qwqK0wgF7RbCsxnXypJAosENl2/TyXIqRaqXs8ODavCUOcQ
	870VKmE3aF1jnLqBQN5npCsVEHUgYqYPn8CotxbUtM1YYPf7ZXZzMqyftMLaI2So3rcvjsF
	sI5OOOjjes/CwJo1J/0AByN6OnyDv/Cru5c03xJoz2EZF5+uNRj4JrY5DSvIb2+6A/aYfuN
	CC/bGqfdVtkjOgaU1k/kaiKxdcJSsLoDu6M3NmvSM6kOHw1jaiw7xmwpDP68R7s9AvvIndr
	nD9GeAxauyExek+j9j6/dsaBqr7OSzHWzmb1mcm/XYQpJYuj/o6/gKXZ6FRnzXXjNvK3mzP
	D7eDEirCq1ESxQyy5/OK3jIRVLhj5dYJUps7+Z3CrEkj/gDyclWuVecsKSbWNSYxcjUl1sm
	2hFuW6Uhzts3fwz/mdWB7A=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014545_092146_9E2D0E21 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

The SpacemiT timer block provides three 32-bit counters, each with three
match comparators and an interrupt output. Describe its register range,
interrupts, functional and bus clocks, and reset.

K3 uses the same register interface, so describe its timer with a
SoC-specific compatible followed by the K1 fallback.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../bindings/timer/spacemit,k1-timer.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml b/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
new file mode 100644
index 000000000000..b71785b8aa94
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/spacemit,k1-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 timer
+
+maintainers:
+  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
+
+description:
+  The timer block contains three 32-bit up counters, each with three match
+  comparators and an interrupt output. Each counter can use the functional
+  clock or the internal 32.768 kHz clock and supports free-running and
+  periodic operation.
+
+properties:
+  compatible:
+    oneOf:
+      - const: spacemit,k1-timer
+      - items:
+          - const: spacemit,k3-timer
+          - const: spacemit,k1-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Counter 0 interrupt
+      - description: Counter 1 interrupt
+      - description: Counter 2 interrupt
+
+  clocks:
+    items:
+      - description: Functional clock
+      - description: APB bus clock
+
+  clock-names:
+    items:
+      - const: func
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    timer@d4014000 {
+        compatible = "spacemit,k1-timer";
+        reg = <0xd4014000 0x100>;
+        interrupts = <23>;
+        clocks = <&syscon_apbc CLK_TIMERS1>,
+                 <&syscon_apbc CLK_TIMERS1_BUS>;
+        clock-names = "func", "bus";
+        resets = <&syscon_apbc RESET_TIMERS1>;
+    };

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
