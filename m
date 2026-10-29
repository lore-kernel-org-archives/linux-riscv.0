Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA77606A336
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fZk5ciR0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+fg2UCH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yZoZgaWRLV73Wn2zkAUxJ8Pz+H5YJUz9POA52Hj6VCk=; b=fZk5ciR0hrqGZyIScT+8La+0B9
	KgjomJk/SRB7lFl5wd6vTrZsITwMk3nGbAxZbIe+RLeUJGmWC0qG8z3UZnf+Yz6AzSyPS5th6A9Co
	xvN5w0xJdbj3CY4gh/pjbWx2QmmX0UBBUT8iO6nTdfbE2RV/VUIGOx96alqbKQtjsMxKbY6v2/IT9
	hgdXNJM9XZ4tAo1GzlNzPCs/XpJL8v4W16q7fWoMbtycEWe+4FUJLISbToyXy3LD4EXjqWlwf0VRX
	1qvQEoxQ16ywxB/3ggoma6xtRVUVEOqtnQbmKPuoSaJAP+OBDbY+H9652rP+9vvbcLZPGXh5HbIA3
	5sTWoZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILa-00000008Mp4-0vOi;
	Thu, 29 Oct 2026 05:06:42 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILW-00000008Mms-0aXt
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:06:41 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2e96b8bfb43so5551075ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250397; x=1793855197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
        b=e+fg2UCH157cWD37CAwxfRHGXh4SJsvMXTNTKyG/P9YEbsRagQOc/dSjP3FaqiZef8
         0cUCKDhf8cwDo0DxYez7Bcc9gwYU8BbtpkGSF4KYEBEkAxZh/XnL9Fpa2aFwOyUkUaDw
         ApfpUFvcIHXOun4qlT6qA3V5ZqaeRQCttEffvKbE7fNrMtBGtVk1PIHsj3tl4B+y+iKR
         3phK5NgVWrxHDOMq1y/hmiloVJaKLrAIP+rMhxbeRV7bgTfiuEzjSoXztjySxhXDj7ay
         5Q78k2IO5SjOyzsFpFGiMXoGbwRLqVE0y3YN85gBA15oRO62uS0JhS4VkxTd/EmD9Q0t
         zAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250397; x=1793855197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrjcbC2vvSsIhs0KIikEko6Gkv8aDugjcrbnMMA8X9U=;
        b=giHH0bvFdrwMrAf4LFFEKZ13sPOf8H/+6qWvV4XiDdgnLvCckIeIg6gEOAFuR9vxky
         OSE9ogFnQSbaKIIgVv03wHxTC1iMRYqHjFrYpoIZjMFqi+2E2BnB+i3O4/DFlNuej1xh
         vS4rpnQBPzCXYhijdBXOlf1er3eJqPIRQlwIa9k1d86kTRJV9N+bKKDOYi0I0rHWvtJV
         trRVIzupMQmTvOp8mfsfZevxU5kxDWvWmQo9FTG9/I+WtoajPpG46+vIMM41jRGxkP2J
         haLm6fFQkJtdn1nt7toRoJxTafG3/CqBsft59fGyuVt1AIYa85lM0EvVmSRM4aXSvx38
         pkJw==
X-Forwarded-Encrypted: i=1; AKwUvByPk/1GY/Rpz+y4fT/uGT+6XW4xRwibI0KpaJ8EG1J234qxdDbSXer92VSUFkSAnvb/PbkKUXiaymFNLQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJAYdzzqJkoH7n4rB/2EhiS5z7RUnpHGwobducs2ZsuBree75FQ
	njSHC/+aecLwXU0+PIFz0UMVGx9v2cQ2JRza1qrWVG3UMq3g9ZtSaAaS
X-Gm-Gg: AYBFou1+SX0OsHgOtI4zZN0MAEtRMnFnhYU6hEkXxb/gd+faA75UtfhbDQ6lFlcqxlh
	cN1TntSd53IWCGn/pOuQ+B4BCbjZQL0uBgSKtFG5UXiLKS7RUirf9PCy5pYoVV44P9EwyHrdF/H
	MVv1XvVt9Q7SwjKKQxlMlCHs3IZ6ACZ2ZItY93z+aWziCzzFMxZ6OZuK8gTTTfm82R7xsPPsJpS
	8jw5LHS/ElJc8/iUy9A52FAS9v9upAXaK55Ny4cQa4anNsfgAHIrfrLwiZVQTv5yEoJDVvXAm5M
	asL4s4pYbSLAOx06bGFpecAQN81upHItNYITMsqctAQHMwpXlDczx8p3Uv29r7qFRKfDJy8l2YH
	K8ULtnVvLTfKEtO8aNIIMlnmQX8UmkS3TTXo/NXIaD/AkKCpxZk18kgn/MW+Ur+HyDfXu1MR4e2
	Th1njbtNhuU+iZ6sKiAz78HI3PW7V+uo+V0dQEZ64br7G00DXY8RBy488LAN8ORBaBDcKUHpoEe
	kM6SpAmPZIGRSvoqelZMeVdQkUu1VT+QHChsRaV9bTYBVRmea/nbA0X+sf8K3mAwnYHhnmXVGmY
	ysaOAuLzLnqmxvV4G3ze5WLCYpBw
X-Received: by 2002:a17:903:3bc3:b0:2e9:5ec6:bfc9 with SMTP id d9443c01a7336-2eb00338d1emr39201665ad.9.1793250396614;
        Wed, 28 Oct 2026 22:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:36 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:46 -0400
Subject: [PATCH RFC 05/12] dt-bindings: serial: Add BL808 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_220638_190194_463F8994 
X-CRM114-Status: GOOD (  10.58  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the UART register range, interrupt and baud clock input.
Initial Linux support targets the BL808 32-byte FIFO and reuses
Zephyr's bflb,uart compatible. UART3 is D0 PLIC source 20.

Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 .../devicetree/bindings/serial/bflb,uart.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/bflb,uart.yaml b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..df29d258f0a1c6d7bb283cf19c4157436991b64b
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/bflb,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab UART Controller
+
+description: |
+  UART IP used by Bouffalo Lab SoCs. Initial Linux support covers the
+  BL808 controller with a 32-byte FIFO. The compatible follows Zephyr.
+
+maintainers:
+  - Kwanghoon Son <asdfkwang@gmail.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: bflb,uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Baud rate generator clock
+
+  clock-names:
+    items:
+      - const: baud
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    uart3: serial@30002000 {
+        compatible = "bflb,uart";
+        reg = <0x30002000 0x1000>;
+        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&uart_baud>;
+        clock-names = "baud";
+    };
+...

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
