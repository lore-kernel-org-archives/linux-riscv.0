Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A40D606D82A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 06:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wtaHTf+8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcJ9Zq0u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9h22IpJU4qWCOqOFGbRwtjNiKzVnMk3AU/M7OoFzkHA=; b=wtaHTf+8A031eG3DAJGZnSUrB/
	pH+mCVblvcKlver2kk3KMQ2d+afvYUSc1L7xenJDTIu9Bnz9N5fJSCCkRpYhAcZEJFumLtKs14m4B
	DH2nCoTuiBYBDGwYLRWIYvwftFIkBeJpVJvxs/iz45LOA12AdFU7d062BI+Xnkq8sJat23gkknCdU
	QS61iS6BcBiWiQB/b62aerNuyTap6IrFfxRjMLw0uvY/K2hTs4dsFUiWu3lsjUKVnZLc2HGYueyWF
	eKBrtG5jd5MYJxSwqmRW6aZnoRb39iGW1JjZUlqQ2a7vsVcFQY8FTn/IDj4bv2AzMV/cDUKvUjwRP
	cp6bUovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6R-0000000BJuh-3GCM;
	Fri, 06 Nov 2026 06:07:07 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6P-0000000BJtU-2DoO
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 06:07:06 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1a2761c69fbso802786c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 22:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945225; x=1794550025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=pcJ9Zq0uPnQiQHvq/bkWlTi67bPvC3RLf5RzcAHo1ap6+NTJwoHPpGAHsTrbUZYoEN
         /oat65+QXU6BSfBTZXehhZOUnPrivonNeb94rvx1lEU4ISoAxI7qHXIUsMurrB6Nx4L5
         cSDYHOJLUXu4ZST/AG0pHgzUTCH46rs3haW/OAmSDoyzGchHNxq6uEX5fpUwp3sUX7Z7
         hSbWBUB1g1aS47tijFuD5bl2rgBnc6SpNyY5Kkpmm4Cfpl8LJKARj7NeBELpT2YkFRXF
         Z/fHxvm6SOHoglNQ9D2cRchyEM2ZomcMxDa17l5Zu1KrzrANjXbSSS1WV1QlhDmyulpQ
         RIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945225; x=1794550025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=kvo++2vYttGiGJ7FEYqALWvXlELuB/r15Xp6fQVo8H0RLyAweIVUVzjpLQP93uLxjO
         UG2WT4F/5Sskyg5r3eKWIHxigsYMqgOtdgeT/WeK993zQKqagP0PKKWYG5ESG5QKzHrs
         xPYrtD11lKYTWs7qXAKrLdv2Q1CLpiGAfWia5d/GIqBCLrfIkLjqDy4f0yrF+AvJY5Vz
         +aJruhJzO9vgKNZuL0v65Op9f8kvS5mliqJwy9HqE9HuDz5guquJfT0UZSJVfAslO4mG
         03XqLco0id+bliYURqELSC8P5w9NcXKF0Lvn+dWIDKc2JaI7KaAt5cVA0pos8d91a2M3
         hbBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVAW68raJkoIhd3S9KlL7EnHUEBUzXATKbTyC6BVbJhI5aQjzl985az5rQ2ECvhsQOjbTzrP+DlURvdA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+0sYxGD66OaUNPVqwarOc4IwMtwnoH2K2oCDu0fNQ97eYwhOeq
	sOwaHIY4WrFuCZ+sjxHjGZGiHaRgjyWrqsu9yAV8uVqh04yox9k3CnB8
X-Gm-Gg: AYBFou1Rz8u1xsjuhmE6n+pALihS5Dx7sk7uT5p1qHvRwcW7fDZyOgIFx7wXK+s+F+6
	xNuneOtVtTj/DgEzkQ5O06DvUJAb7/TXtUTyHn56lc7VQmxLEEyIndcjpXqA1hIo5gffJDoIW61
	TcPCW/0q6Jkac4CbhUqeN2c6BsnFDhXczlzjEWmnqy/+c5F+xxS6q3e1O96Ky84TPpSef/PENfd
	MDSJMB4QRAgm5Gr05Oys0G3K6bmaBESbm7sQ4nQpatj+xjJO7xewpGNkP8SBcu6eS0buUZMrvAo
	/cTmTI2pWvqHu/4PJILjB97NsiwSX/sDGg4lOxxcnHikDzxRqChGKPMH5BoejO8gs8XSRJlqcEe
	FdWd95qL/JGqGpDGQyOeeOgyGfKOwE9GvxtuDDzP3QMwxg/9QUVRZRv6LeXOdpPN8diYTt2zW5g
	cUOd1FQOCGVlCua3lW6HDDnbbMM62T+cRtDlBk26vafymi8A5HfaZC8s3WHDJV/3ZHLSfGtTgl1
	jnwJpLafHjbp+my6srOffYUs5k0EbT9Ch39Sv1Y55UDggjGO/I33f+H9wpcczB0c37ikVFH+c8W
	1PSvuRBkp5BFrjwsmt3TN37SRX43E1Rjm7zZeNMtptEvpGjEaMag
X-Received: by 2002:a05:701b:450e:10b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b25d35462bmr1797486c88.35.1793945224722;
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
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
Subject: [PATCH 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Fri,  6 Nov 2026 14:05:23 +0800
Message-ID: <20261106060525.346873-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220705_573350_DAA6938E 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: -1.8 (-)
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
