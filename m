Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C718606A333
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C3HqPrlJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nk2bQFKZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UJvfz70sjlN1Hj4I+UaIkZfzOjO5g3ulfMB3MQ4Bp0Y=; b=C3HqPrlJNRqudRZ4RnspDEsupI
	mFJDMT8XknQ/uMPb5NJsDuY5b/ezSnUht3Nj5O+0c1jeBLydl6u8agB3ZdcgYdA6Hc7aPHQ53ePMI
	ml5I6vvju0MyyobL7iqPGxN6E0vI/cTAw+ObHA1I2CNmn+rL7lcHaFy55n1OeQVL0hTBviJHEilO3
	nSX4p5YBSgNuiTcHZXlQ/JereegNFcgzzkyZfYronbcs6ao03nAbXr1iOeYBUwbK/qBHtMAZBKRot
	fZYD0avoQdFGfSaaYYaRQa172fqNhRXv5yuT55k6JLt6AMKUWJzwDV97YYcRdwuVz20lpr7e2lmgH
	2r7P0f2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWb-00000001RwO-2vv9;
	Sun, 22 Nov 2026 17:38:49 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWZ-00000001Rvf-27TU
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 17:38:48 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-386ab9ab619so789237eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369126; x=1795973926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=nk2bQFKZ9rjYw6MK7tRaUJ/YbaWZAfiwK3HqxnwUJsyoqBLZZIgCp/y6lVW9rYBLB8
         mnLWxkJDc+J7WsdzeuiZQkcPdPs9XOjs+/oGY/sj4ZV2dwQxv7elo29R3ZWG5FYxLG1V
         Lv8teGbZp/3noqUWYBKzhLPEcnWo2L1UC+BrfUhpagPT4ltKe23Rbhz+UCdbgoAcJKbu
         uGVeDvRsyRVx3/HZQsqlhyuj1QAZxsA7MrrEJdAnkyHgUZtxk/rxLPTfwrcbyMRG9kFC
         PU9vD2md8hRgfYqVK4/IIzRnD+xzI/FCSs5E2e1oTpOP8Q5RqAjzrk8I/KI1REGxmGpP
         AJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369126; x=1795973926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtPpwqT0RY3R6ujRgb/ym5DFrcjRWn/+cm9aN5vCi9Q=;
        b=Stod4DrbQ+uqr1uAHn9N/wWNZ6cIixJMk0NQErAop0t0iIQ60Hq18oeFS6EFohAyyH
         cGeq+Dv1U/uWtaFIYIQS6V84LvjvYwNI1jISAP5uY2f44r1BQzkd/tfLBc3jTvNA+e0h
         mChIcpHQ4TWfnZ4ByTSoDqy6ncD0ywej46O3AssO49Bl1GOAPnEkQG6/+gKGLlcgED/e
         GIHVmzECgp8m8wqobSVGrXQfEmrzVWYqLd7rbGWqdXr5Nx8QzmvD+25oCsuVaGEJeMxA
         K/aNCjAqX9LJCFPqnp52GGDS2kIulzrackppnEWiDX13XgYoVWo5x6K1L+O7rO5/gnKJ
         N3HQ==
X-Forwarded-Encrypted: i=1; AL+hErEjg7eA17LX6qc5lZHIhAaibR7LPwWt5w8b3pEauQkNsHwROz8k5ODIWRCnP/wdW8CmKp4cn9ugiwcCiQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z92MTaB8q1UEnLug89jL4dhyzOoYmxjWAJWKaZ92zN13+9ic7/k
	M5CrxI4KCxqg/+DoofR15C5+NsNsAe6au1uJKN/I6r+d25yuzBX0yrQY
X-Gm-Gg: AZFdTZf/zGkwCrKw3VNyMzJHnffLlzrnJ9zdOpGXmctE0kEwPK7fOZ8teSFgVSyP5fp
	frWo0wtu/7pSyeJ0OBu71JFWlq0xNOeqFQc8kvt7ZODfe6/J1vNFzsaLFlh0EtweFQauESfTVGO
	Dd7Axs1Nht96cKgurZQEDYfFUKpFZuErL6yIdM8Ex7VDAMv13cbtyux+jqdQqLqMhQ6l1Mu2ask
	N4wrrCKIW51VnCfZxt2/4geCYygAkaRRLmlLUMEnr/NRlQx6+Ou2m3jnUqug7AvLIdPzdGZ2PGY
	qTAUjauomkd/3qw1SBXaZdTGNrIcTw127gzqHF+AILZf73L7rwLaNrycfjVNrUOj1PDof6Ha87z
	VtxWryWnTuyiRNhqK6bAUwN2HNWkIzLn7gh/XVp/g7rLKEByWZnlCQq92mvjJebbmAOObRFK9pG
	7lV95OeuRg00xVjRHcw7CS1PzsW4tgR/p1ihaMjlA77p1juQwjaFv/Gywhk7obirDg91KW1XPiV
	VrX4fajBFA4OjI+7rJMn5njBFNmNyfpO4kA+K4QCcEvQbafMTC1mvc1Y3wQXYs2Q7lIMqsvbr+u
	5ENc7mDsE6J/bXwLkp2QHvs4lse354eOaS91OMKWSeCJBJD0kg==
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr11040411eec.5.1795369126430;
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:46 -0800 (PST)
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
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Mon, 23 Nov 2026 01:38:08 +0800
Message-ID: <20261122173810.2409146-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_093847_549905_023AEEA9 
X-CRM114-Status: GOOD (  12.89  )
X-Spam-Score: 1.5 (+)
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

Describe the SpacemiT K3 eFuse controller, its clock and reset, and the
bank-based NVMEM layout. Banks 0 and 7 provide configuration and
temperature calibration data.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
Conor's Acked-by from v1 is not carried over because this version changes
the NVMEM address layout described by the binding.

 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..a7c27ed1e3d3
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
+  The K3 eFuse contains 16 banks of 32 bytes. NVMEM uses little-endian data
+  and places bank N at offset N * 32 bytes. Read access is limited to
+  banks 0 and 7.
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
+            temperature-trim@ea {
+                reg = <0xea 0x2>;
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
