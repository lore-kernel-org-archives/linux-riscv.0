Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA3606A330
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnwY1G/e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bCbiTF91
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DiKiU7FjEYqOqRRm2H4/MtGrFJhwn1PIQLMYBZeHsUY=; b=GnwY1G/eBhGYCqY8usquzWpncf
	+3/AeEmu23fFEJ8LLGQB5e9Ha78Zltk79FC7qnzNZfTw/9wAYw5K56PJJ41h8GFiNpv21d96P4nzH
	HOsAVqhbgrcvYYvy/EhBNfSyxOs4T3Jmu6gM/TUQ4+Yo2a/gho+0WAXAB/CrlbBcKprt1FUTJC7cI
	7igREyTS/AQexZPaBjQJLbp1rBoSCxz6LT6ho2a8rvvk1SNAAHEoaEgR1TdJ8T+xnnKYtWwgdFFRT
	dP5UtTMrvNDFztieltNodY/KqCMqli3WWEm43eyVF/BWGpv0UyPzMTJ4qGPJMUiKVZ0DBNgLoc+cG
	nppX8TqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYV-00000001Tds-30hW;
	Mon, 16 Nov 2026 07:55:11 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYS-00000001TcC-3ynS
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:55:10 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3704d30b84fso3646610eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815708; x=1795420508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
        b=bCbiTF918FkKhUCheQU+/kwMIUxRaH6yTFbvWT/DRx+k3m2ZrZHzbfyBfRGmgbDjE5
         VZJIXZCPsfhk1lorKlM2tTfBW3qNKPMf8rFC4piZLG4kQD0rqP97L7KnjTPO7LnT2bpz
         Zy0j9JFOgYiJ+3ivK6vId5Og1RPJsx1j7uNigzDXyO/9Hzl5M8ZCGB62biuhxQ8LXPc3
         1GLWIoqGBvT3FObUpKaxTlzq8O14UVozeabpXPGLm7IhVIC55zHd8zC7M121v86c0hJF
         iJdYs+2DO+i2GHFjXGXoyXBfEX0HSPTSD77Qw4AIMe7B+MNkY6u0zd1yS0gjkVWxamWK
         AerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815708; x=1795420508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk8pYgMhS/KMO5ZSGHCIBmeCagveRv5obJ7p1m6+Rcc=;
        b=qaLZdInATusFlhRODb6w6zeNqbACHmSPvebJSNNaJ8LOHtXFawEFBtUpejO9x7r6cv
         54sGbiCc1VBEuXtJWCo3oN3n9CvkXnypr110pVQd3/Cqlc69c8cqGge5CPwgQNHELhMT
         mgQ3owX7jXFrYoYG8itPhmvMERirPSgWp3T+jFDEemi+AprO7GbuPceSWsNqNNlLkCnV
         DikGgE3pFnH362qCwD9wWuENBrj65TJWQCvTBs/wTsIWPcakXD/zz4V7Mvf92HxFtiUq
         EZ0nf7iRJiyh9RF8m/GaOzcAgqp6m/MT0NJjEouQcxGbDafBJN3GliBun0PzZPb3d85i
         Mx+Q==
X-Forwarded-Encrypted: i=1; AL+hErELO0XXoYK/rQ9r9csxUVvM16eQIHlEuE176akCwI/EtptAtgiNQWqyt9iUFV+41KdeFGppTo0f+Dd1CA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8B2DfWsmkmwwQduc8Eg7HdJ2t+ElV6kpS7pZCC3An0i8QL6xtB
	jFRo0YCMaPbUtICBZoNcCTFnDqhZQ0MpipMbjYChe4zo9omHot2gixLF
X-Gm-Gg: AYBFou0DQYy0W/e5NRlSRrUhFy33tsNpMpopKNTd1UmSkgZMgD941qJ8/jZBtMzgdiQ
	cx84tZf+r8l8C8kQy4e8ho1Bqw5OkTTId73RVbBhk5LJOF8Ebllk/dgURGSINGzBVgt0y37gTng
	xFrd4ZgC3ylNFaO0z+znpJSBIhlDuv9vkt0IuaG4RUDzi/eclR3antPC464pvpBdVp+aMHF7yvV
	ZEwKonDF6+HTRQZzEWDzpjl4OVFtlhCcO9bvM6Uw2jRKp/yFCh4TItVrnIGiwx4+sSePqZnJamm
	lKJ4BAJGdyaXzCDJ6wA5eF3o4JvEy/7ADivwwzqkFTczicAmRjCGlqZQsgee9MyQQW6pGp3kEwR
	Eckv75GwsQud9V1lvgjbAh95QxQyp3uBAyYcZq6si2cUB85mabkYntqAXpFtUMf5XdawFUMgP3B
	PCQvsEea2V3nWLtRbc74N5tQjB8TEgKu0sLsIO5oggvCAHyaT/SN0OSDAbM7ITTmbtXuwdBvKUn
	Z8uzh/0GAZ5gUh+JVdXAT+s8SVD5IMdquINVHTP/zP2dtFjcSuuA+F1sc6P57dvB/yxsKKOKtOi
	WSnWeutwGca333xsDo4Pp4a/dYeWfFMNYDeXT8mzDGW8m0MPnVLd
X-Received: by 2002:a05:7300:f694:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3796337436amr15249399eec.2.1794815708305;
        Sun, 15 Nov 2026 23:55:08 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:07 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Mon, 16 Nov 2026 15:54:21 +0800
Message-ID: <20261116075423.1519438-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235508_992100_BA9E87CF 
X-CRM114-Status: GOOD (  12.90  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the SpacemiT K3 eFuse controller and its readable bank 0 and
bank 7 shadow windows, which contain temperature calibration parameters
and other configuration data.

Define the AES_WTM clock and reset, little-endian data and
controller-relative NVMEM offsets. Use fixed-layout cells for the
temperature calibration parameters.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..93f4301c8289
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spacemit,k3-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eFuse controller
+
+maintainers:
+  - Jiayu Du <duge1256@gmail.com>
+
+description:
+  The K3 eFuse controller provides configuration and calibration data through
+  shadow registers. NVMEM uses little-endian data and controller-relative
+  offsets. Read access is limited to bank 0 (0x104-0x123) and bank 7 (0x190-0x1af).
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-efuse
+
+  reg:
+    maxItems: 1
+    description: The 0x400-byte eFuse controller register block.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    efuse@f0702800 {
+        compatible = "spacemit,k3-efuse";
+        reg = <0xf0702800 0x400>;
+        clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+        resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            temperature-trim@19a {
+                reg = <0x19a 0x2>;
+                bits = <4 8>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..0a9eb764ffee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26525,6 +26525,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
 F:	sound/soc/spacemit/k1_i2s.c
 
+SPACEMIT K3 EFUSE DRIVER
+M:	Jiayu Du <duge1256@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
