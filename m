Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E43606A695
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ll9dbsq1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=XpbVz7Ie
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kcMCnXLS3/xblOjLVOd7S4dM8pJQpj9X6gOPwYcZ/Ls=; b=ll9dbsq1+HR1ZQTDqMFFuXC1zR
	4EU4nsvgYev7tdyYs9obcA0PZv+K08GF5YK4+ottmHLfv1ZP+I8wsjbEemZk7Mw1Q2gd7v5QBy/r3
	kETwR2W+0pL90ipCLw6hjt2VDa/PMR+tVd0MULh/PwQGzcKcmI/cjFds2RjnELDTGGxFmBjreB8tJ
	j1VEq17bQtLRzI8bnFvrCXN3AbevmYjBQjCppRbB/6urz/0f6DN0QYaSKI/umsA0/bMKlPCGYoBsW
	viZhxbF+8ksQfexpn0CDfcACF6mbbmo/06bL+/FpCR+QUzBAZInFnhcS6/UlzvbzDTfgXocWBbiQC
	JGUwT+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRw-0000000CU4n-3IES;
	Thu, 26 Nov 2026 09:07:28 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRr-0000000CU20-3bjv
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:25 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-386bd881d39so6507406eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684043; x=1796288843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
        b=XpbVz7IeDfGNzaGBe+kn8McYSxJg3I11ynrF6OXuMIUkaMD0Dh0xJZxtVYMQRumGqY
         vkYb2RNehz0DksKkDJleSbmZBYsTS3PmOmn3NdcUEm+pA9dwcarWmLDTAgJH+Lx9Sm9e
         UjnVzCCpGBqn09yx6d61Bf8rO0LaAv0WLn0Ymme6hD4L9XYZVp7l4l/gToqjv5tvChhe
         aJvYL7UFCnZbb352vFTv7gLIehgPEezn9FpITzdwj5EDoceoPee3ct4y3Q6TIfWTd9yN
         ZPfdsg078mS21+0jjPQLVMIOI8lu5rfWNiuct/6VJKZreCTvO2ZH7HJ2W6XB0ppB4+sy
         P6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684043; x=1796288843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN1kVMysduhM1CTMvsxUGOmjxBfuDSc8t5gMB3kEQI0=;
        b=kcULI0FQDS1Av1dK847GuTISyQyYoODNAxL4INUvClK28+27S2KlPaHqlJZ8t5Jdvi
         yH+eSl3rJO2ugY75+MT+zVIEyvC79WWE6DR9kLVALDH4phju9RA9LrWzg6XEEh5ZQW6K
         oWcPkYLv50IPdwSMqVHi3zQfrZLZmMT/RF8JJ/taNCl6v1aGDHAHWJyLK1iYT/Vt54RZ
         C5XDJZFIyoRbuo82F1po39WU1sU/pxnD6AbMBiLD2FJW9fR24gJxdH2sXH4lELw1hL97
         OT5CvqhHfZ4XLqEhnw8uPNXGYc+xpvo+rigYHMu03XnRA30MiNOpVoRpN4PiSmlbyP/z
         pm9A==
X-Gm-Message-State: APuU4Z/a9Zge6ZZfpW7SOS1LFBIW+xw7kfo/Xf0LlCMAuY1nEzLN39Xo
	9pnCa96kLRSSuSnsxp/HwN2Lxxr7zM2FASNEKVWYOUK74AJ98BK47ZnPgIh14MBXYus=
X-Gm-Gg: AZFdTZe63mwsiEdmsoYwhdhFQI7FBmvlg3+NBQsCYHgqJkhvENgdNmfjq/TL14Lrj1e
	yOxx1GoFJ/RpfjCqhaRvdUPiKpnRJUEytfwYsPhILWwUfp1hDWgYRz3y0RDF/kT1Pi+EuLHUY5P
	ydC9UmcCZfzRTcGymeplBKT9ApiZxvF7RsWmzB9Xwhy/rDfGx4NeXbqcezljJfehoRESAnVifX7
	ktGIsW01qwTrfHb+gxV0OcNefFxxAigP9ufa/AUyb6qsKFtz+4wMAZcf4GIl0kTCb9ef9NKys/+
	oQhuwKzZSTnIpw8vuAgRQt4SosZhM5P2vT5ekxDLbTY4I9dPE9nY3TKol+4tE0JQ7wKmNIkecwL
	TB4E/kLZCeTtDGIjitRilyJ90kmipwsM+JQlWn3LUqOQPbk87+KDK92JEcw3a3G/4PO3fn3g6Ow
	F+v9rBEd6cmK+suKzS0uSyco3VxPjLpCC2bzkHdWCsMZbhKwlhSnYT1EJaIDqc3DAnUQgwcpbIt
	e9LfQXgRncstz/9nsaiKTRGB/nYXNmXr4fKbiIaBeReIdTdjNWvGraMtAiAFOsN3thWvELtPXKF
	wj7DlC/vxU9S6N5xc8t3G/ZtfyiOA4yLmI7k3sUasAM7
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-38570f27b33mr21020696eec.29.1795684042660;
        Thu, 26 Nov 2026 01:07:22 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:22 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:07 -0800
Subject: [PATCH 01/10] dt-bindings: riscv: Add SiFive pre-ratified trace
 components
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-1-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_010723_907822_A7BF9FFF 
X-CRM114-Status: GOOD (  14.44  )
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

From: Eric Lin <eric.lin@sifive.com>

Add compatible strings for the SiFive pre-ratified encoder and funnel
trace components. These implement version 0.x of the RISC-V trace
specification and do not support the generic riscv,trace-component
fallback.

A pre-ratified component with an embedded RAM sink can use a reserved
memory region for its trace buffer, as the sink registers restrict the
buffer to a single 4GB window. Add an optional memory-region property
for this.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 .../bindings/riscv/riscv,trace-component.yaml      | 96 ++++++++++++++++++++--
 1 file changed, 89 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
index bb519bc4a163..10660b8ce071 100644
--- a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -16,16 +16,23 @@ description:
   The RISC-V trace components have implementation specific directed acyclic
   graph style interdependency where output of one component serves as input
   to another component and certain components (such as funnel) can take inputs
-  from multiple components. The type and version of a RISC-V trace component
-  can be discovered from it's IMPL memory mapped register hence component
-  specific compatible strings are not needed.
+  from multiple components. While the type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register, specific compatible strings
+  are used for pre-ratified trace components.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qemu,trace-component
-      - const: riscv,trace-component
+    oneOf:
+      - items:
+          - enum:
+              - qemu,trace-component
+          - const: riscv,trace-component
+      - items:
+          - const: sifive,trace-encoder0
+        description: SiFive Pre-ratified Encoder Trace Component
+      - items:
+          - const: sifive,trace-funnel0
+        description: SiFive Pre-ratified Funnel Trace Component
 
   reg:
     maxItems: 1
@@ -35,6 +42,16 @@ properties:
     description:
       phandle to the cpu to which the RISC-V trace component is bound.
 
+  memory-region:
+    maxItems: 1
+    description:
+      phandle to a reserved memory region (shared-dma-pool) used for the
+      trace buffer of a pre-ratified trace component which has an embedded
+      RAM sink. The sink limit and write pointer registers of such a
+      component share their upper 32 bits with the sink base address
+      register, so the trace buffer must not cross a 4GB boundary. The
+      region must be aligned and sized accordingly.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
@@ -117,4 +134,69 @@ examples:
       };
     };
 
+  - |
+    // Example 2: SiFive trace encoder and funnel connection
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        trace_buf: trace@80000000 {
+            compatible = "shared-dma-pool";
+            reg = <0x80000000 0x1000000>;
+            reusable;
+        };
+    };
+
+    encoder-0@2000000 {
+        compatible = "sifive,trace-encoder0";
+        reg = <0x2000000 0x1000>;
+        cpus = <&CPU0>;
+
+        out-ports {
+            port {
+                encoder0_out: endpoint {
+                  remote-endpoint = <&funnel_in0>;
+                };
+            };
+        };
+    };
+
+    encoder-1@2001000 {
+        compatible = "sifive,trace-encoder0";
+        reg = <0x2001000 0x1000>;
+        cpus = <&CPU1>;
+
+        out-ports {
+            port {
+                encoder1_out: endpoint {
+                  remote-endpoint = <&funnel_in1>;
+                };
+            };
+        };
+    };
+
+    funnel-0@2002000 {
+        compatible = "sifive,trace-funnel0";
+        reg = <0x2002000 0x1000>;
+        memory-region = <&trace_buf>;
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0x0>;
+                funnel_in0: endpoint {
+                    remote-endpoint = <&encoder0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <0x1>;
+                funnel_in1: endpoint {
+                    remote-endpoint = <&encoder1_out>;
+                };
+            };
+        };
+    };
 ...

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
