Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C17F3D61E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMULGTM2xc5S623JAF+xgnMsTMlHbIPpRzSjMW86Kgc=; b=tF3CCC2P3lVGQy
	HOBL7vOhT+MOsZfwVs3u9BUQ4gvMJ2whuQrJeXiEwa3AzYUVAcweUHuN5IIUWnSzFS2hk/IrX+8dU
	0Q9zv1DBGXWzJnr7iaEXBLTxTgkvQgxu4WBGMRIdOtO6a8JbzEle3Mu+sWme2BeMtn60LcHU++8GO
	UZR9nTODd1z/0I3MvjXjdlgcaMqxrZVvvJwrd/M4XuyzFC9Xt7gY76jHIzq6jNzX1EK4tsBsYWx9l
	BH1kcF/1Wlj62xb5QOBV9sywnBpH5jY0NDF7m3fJA7JBEm0/lZzGnnQefY1NJtYvdU5M9n6S+hVOg
	GJMCYyqX0r96DKf9Yfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788i-0000000AssR-1aH6;
	Mon, 30 Mar 2026 08:38:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788g-0000000Asrk-27vB
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-487035181a7so27430525e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859905; x=1775464705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk1htAS4wrCqLvV0lbmjJX9VFRd6P5+nEK7bdtMsxTU=;
        b=lw2reoZE8HJFdiOnVxJ+yBxuCbM2kWZRtHIoCr/L5mtsL52akpIan8Mz1IqYA/bwiY
         v/8NFeOdsPAblvDDbS8u6ObF7dZjASLCdwxfnGHOUQLcDgMOJWSQqH2AUWU0NyLSq0fg
         zLOTtBtjU/6LN0KRCX0/Hrn9Vp8LjSpzjUOROLVeHC9WZqlRBUkoXM0W4KVVySBGSd/C
         hxDgECYnuuAFT8H9CMSxEAJWvMjGSRJk/EI+sjYqX64KWvuYuh6cygZ+rbvSsedWyE2J
         dA/8AWpGfLWF+F5ZpzyT/EzrujM0WABJdLOBnVDtDLucoYGwHLnleVcB8qBRLY6O0+bz
         yBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859905; x=1775464705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bk1htAS4wrCqLvV0lbmjJX9VFRd6P5+nEK7bdtMsxTU=;
        b=FKYuW+kHC9X39W2k+0DY9l1opSFB8Fn8uHNLP64MM0K/6CA+ysmjJ9qgFR1HW0goLi
         ij/lyC++7qZ+VUZuZLKnFtgz4xFZ9hTLzECt3GTO7capHYVUY/1Q3UCXILfrVYaQa+Df
         XqybslnE2Cb0DpebmkT50ik3FkLMe7YeO+yEw4E65sWhxYsJVePGLVcz/wPI0Hoz5XqV
         cckySOtdO1VAed2QmeBfe2jgZwaccVIAEqAwgRePob3KcUDNuTsFqA7WfFDtwW22NUjY
         03cCBrKsficyX1ug/PQCtxEE/yWpmLnohHKo0TKLhAbj2YcbSoeR5bOQBZCQTZv4YRU5
         Dl6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDvIy9xbV+Cy6obRHF7GScW8rLmgJPjh7fxcmWHekuMEZf62r6zGy1lz+oq97dPJZo4RHpQC72D1Bpwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx1JPAQPmDFejil35eoNN5894k4lVB7zFmf6Gzw6yOgEIo372f
	fifZI2iKJgRLFX23n57UncCYbOdZrY1CYZdCZ1cb6nsU/dQGATcZwyX5
X-Gm-Gg: ATEYQzy5ks9LrbjZLhCAdWYSkt3NkoHkoi9nj2z8MW2bxrc32Xw1dKrCg6aQxLbQntS
	1GDDhommvvJoMx6EDx30Gc5oQcCMUYDPi0jSznMfqh5dkxX3Qty0CcYL+85jfBrwQMwAPEWaygV
	lOd/c5g7lqKnE9P03U8UgmuQwK4aDb4BBUuMwgF9rd3vS9O3yojnFPm2z1dUdf5pPh3yqK6gfQf
	jo2vmXoVAKc7bvYPMhW8Q+zicr9kAo9PO4QKeLgGk+pwM/QQ6Z4U7nczrHO24LqOEjBqK4JvwjM
	/p7DrNKEYthEUTfVR01y6Tg8FegqUhbDNOkFO2TUj3MCVY23xevQXbLwa97bx91pKBJO1OmBV9I
	yynedQvmJgGWRmTwGVa+TLhItd3XN4iIT0g3Ma6CM9He3MpvTpYczdl6d01rJfy4Tl11u4W73PT
	h7bJCaWr9NMgikm2yfBv25IqldMRV8buAGVe4biy5SYRCWGQFvtSRO7/t4+q/5U1Dc
X-Received: by 2002:a05:600c:46c5:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-48727ef0bcemr204913105e9.10.1774859904599;
        Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:24 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:02 +0200
Subject: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013826_564750_A834BC6C 
X-CRM114-Status: UNSURE (   9.34  )
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

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..201ab97f0e88376a4680dcca7917e8b3172bd84a 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,20 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - default
+        - state_uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation
+
 required:
   - compatible
   - reg
@@ -62,4 +76,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "state_uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
