Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19052CD98F6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mU4zmyiTSz7Cqeg7zvf7w+xe7tZdpv5n37Na/1IOGKI=; b=11KkFx/jBXQUQH
	0wywsKdQnBNmzXMWBWqDJ7NcuJBA/dlbrcOputajvdV5Jajf/J8FoJB0DUgWLjSBbU46eF47lbN02
	3hg+AghGMbVwny0vT2oq29b2PY73+L3oIdZutPzmIgud6+91ETD8CpLgHEd/h9eZCMKoEW1e8otZG
	wrPTMiiwwPbmwpG6tMsPr4JB3qy6YMvHAXjyR9N28Vq5dmDm0fN9/FCDFCbY7hYTtrzGREvVhARo0
	EwiiCig1ULDatI9TK6icEJIuS5w/K5M36p3p92NgO/fxijMDY2BLkNYoVIfqvn/GmwbxtAA5d8vlX
	xKPLGMhhh4G5zEVC83IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWow-00000002ImU-47rn;
	Fri, 19 Jun 2026 10:51:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWof-00000002Iiz-3CZE
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 10:51:22 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c89370405aaso931106a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jun 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781866277; x=1782471077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rHI57LOVR8733JBEs8vxZRTMzLV4k08aXTwDaS1V6g=;
        b=et9zxTVciwNsRS508949ZmfSlUsOTPSmxFb/GFyidEQ1cL4dgXFrA0xPdkunHuHdFA
         zHJz96/0s//lqYeMnHktSfBUUG3y2xBK+hmNdRTY6oYnW9Nk3PMELCeJjmws0JLE3NEH
         Sm91YLslmOycqxZaI41MK2DN2NTnVdxVl1riBrSVjhQ7iwYIzBzd9XiPPcMnXIP7Cr3L
         6zTorLXnKHJJ7wYJsb8vafAcQfuJQ/43sZxbbYHVkzmQ4lit5mL7oqVHC2Yz8ntDd31I
         /sXb8ZzJ6lc5pPzTHbZQJFHyal8b1VPuG0PEEg9rtQS45Z4Q39LQDR5wXOFq9Ej6Vowt
         K6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866277; x=1782471077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rHI57LOVR8733JBEs8vxZRTMzLV4k08aXTwDaS1V6g=;
        b=SeCOvTGvCQxq7ijeBrI0G/tyDpBg7bPSPeva5Wn8AtxYx26VKMUa/1VCrtBzFFh/xn
         NajdrYusGkfWwwJE1K7q1CHACSQZKnqcr50NyYlzymCRq671KhqQmLzO+B0O83T3peyb
         ELvt+RY1M1s26xFjAnWPlPjRnOJcg9gFomfycFtZYgqVoYk4D6bh/OJcmjy0+IpYRHyi
         Yls+rLw/OBdDHy2rhf9xbnKVsd845Z8dfGq5U9PWAC5Iks078bcB/lVB6s3WW27jhytZ
         donxDHpxmkBaWNh8m4UQkV1V24cMeR73FIYn+7kBR8VpRKvMy2IA9CIbYr1QkA0Odh/3
         rk2w==
X-Forwarded-Encrypted: i=1; AFNElJ88wpsP0Py7AY/N69hkE/EZb9aerIfHU7niohaYgDlyiGZlNr43hsR4EuiPHiJpsq+z+qPX7f5wZyxoDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeOqlJOsbDnu775S8WIyUjJ0Yd9698dhnDai1G/kSSfkeP/Cy+
	5mL+vliB0Ek49f6LgGmKu4my05WuW4paD8xJsQypM8eKeDXm1UohdyA9mD2qJFxggek=
X-Gm-Gg: AfdE7ckQxdwyDao6KS+XA3zFSuamQYosogTJwy8sEtF3LtE5aEZ9qO/7MlwWdJgMBgp
	0DKbaJPNoPz8dI7UFJr6/WsCJ+GsVN58ZZGDYWCu57i3R2XOiqXDEl9xBq/Bspjdnqh1hKZLdHx
	5gC0fOjPokiP4YgRtHbUfD666ODytiN0mzV9w5xtMG1pYiHnjEgm6oYmmXSvO1oNJF3psECaV+J
	YbkUjZYF9y0O7C0g3Fd8nhYHx5LKmTup39sqDKDZsX/aNSFrqpSVBbo/5E6bXdE9ehNEnYaLxWX
	hdZ9jm1wwRqBihWhzbHJXPK/41oYn30dcqBrNJBMCv7UGdmbNlFxG3VoG2iRiSzh8RIwasZXsP7
	TGRS0YeeCF2BPVm0XSiNmT8CHuN6QDH+EQVeNfqBjrumxhbsMJ1ZgkqyFzDYzrBftR6K1XsP2cz
	6BdBxlH478zw8RexdtadbkghZ9hQ+g24gecLqM
X-Received: by 2002:a05:6a20:6a21:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3bb6c4644e7mr2625478637.38.1781866276775;
        Fri, 19 Jun 2026 03:51:16 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a84c6eb1bsm1993583a12.2.2026.06.19.03.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:51:16 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	guodong@riscstar.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Date: Fri, 19 Jun 2026 18:58:33 +0800
Message-ID: <20260619105834.1277302-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260619105834.1277302-1-peter.lin@sifive.com>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035117_812148_C6F9E9D1 
X-CRM114-Status: GOOD (  16.46  )
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

Add per-hart DT properties for RISC-V Worlds architecture:
riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
platform-defined values are primarily used by M-mode firmware
to configure World ID CSRs and restrict WID usage across
privilege levels.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
 .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..4b5778b6d3e7 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,7 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - $ref: worlds.yaml
   - if:
       not:
         properties:
@@ -120,11 +121,31 @@ properties:
       thead systems where the vector register length is not identical on all harts, or
       the vlenb CSR is not available.
 
+  riscv,pmwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Platform-defined M-mode World ID (WID) assigned to this hart.
+    minimum: 0
+    maximum: 63
+
+  riscv,pmwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
+
+  riscv,pmlwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Platform-defined bitmap of World IDs (WIDs) that S-mode and U-mode may use
+      on this hart.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
+  # RISC-V requires 'riscv,nworlds' in /cpus, so disallow it here
+  riscv,nworlds: false
 
   interrupt-controller:
     type: object
diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
new file mode 100644
index 000000000000..cc8b3747591e
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/worlds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Worlds Extension
+
+maintainers:
+  - Yu-Chien Peter Lin <peter.lin@sifive.com>
+
+description: |
+  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
+  Specification, adds World ID tagging for context isolation.
+
+  This binding describes the system-wide Worlds configuration for the /cpus node
+  and is used alongside per-hart Worlds-related properties such as riscv,pmwid in
+  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
+  riscv,isa-extensions.
+
+select:
+  properties:
+    $nodename:
+      pattern: "^cpus$"
+
+properties:
+  riscv,nworlds:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Number of World IDs (WIDs) supported by the platform. This is a system-wide
+      property that describes the total number of isolation contexts available.
+      Hardware components such as the WorldGuard Checker use this to determine
+      the valid range of WID values.
+    minimum: 2
+    maximum: 64
+
+additionalProperties: true
+
+examples:
+  - |
+    // Example: System with 4 World IDs
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <4>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "sifive,bullet0", "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            riscv,pmwid = <0>;
+
+            interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+
+        cpu@1 {
+            device_type = "cpu";
+            reg = <1>;
+            compatible = "sifive,bullet0", "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            riscv,pmwid = <1>;
+
+            interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+    };
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
