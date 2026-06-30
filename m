Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCBDC43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEWsibE0MLetY/wkq+eXjvKULEz/Wt0cYoYbQAB7fqo=; b=VFyXTOq71tGnDX
	fQYPB/BFUAnC0d/U2JRFTivekrsAErXpH2aKYrMX/GAOY7aQD4FT1Zs5XXwlLoTrI6rTj/Zl208b4
	wAdggw+Bb4G9VTtQ06Wr+dI49Vhohaj/NW+o5WGSZGW34hJy7A8V7zmYhfCDaRIcS6vpvh4qqyYxr
	8YnxMkLS4ls1xVGC9cq1bXzdJ5t7DvWAReUikU2W5TACFoUWlQY/xSzdlSDCn64TI+kZDlI3VCoFw
	76WAflq7P578J4pktnMw0xhibhLF2FAl+Zjy4HHgN8S66Y5mwz5r88mHStta+bWVpVrZy5PAOZ8LT
	5wqzpIw6wAGgMOjVLq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3P-0000000GVEW-3qjT;
	Tue, 30 Jun 2026 09:46:55 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3M-0000000GVDP-2LXr
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:46:53 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c8c30492a0so36262465ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812812; x=1783417612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWg7g3fm5AGzhOqj0AZfrV2kQgiHMqxvuQptIptT+5c=;
        b=j0Gywox2AgHxSxQ6Lnddt/ZBSDDl0P6Gb5n0sV0Xk3kkhXdyrmxRKde/HSq4QGdAQK
         vkfgxPACLhEy6vO1nQrW9GNPyTRkDgxfB0i+LC+SmFRRetiXwM+KoZVGM15uv3wuP2zU
         HOu3krOeGfsUkdFDSrW3+ntc1HQNkY0apYp6wxdYBBCxfJeaeFmLL2U7RtmszEGhvPE6
         hfDSdgfNDDVrS/6XKECeBtfd/GOgcOSKi+LoqaeDUNzUDgVSzOcY0ZLFNfVb3teC5Dtj
         IikmFd397ylJL+P4eIcUH7woUILcA7DzS9IkxndvM/jxL22PDZFJwvEQI8QgihexMWAp
         3DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812812; x=1783417612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VWg7g3fm5AGzhOqj0AZfrV2kQgiHMqxvuQptIptT+5c=;
        b=dlXpMjpE/17TksWBBofPZU6wTVLXjj9D8jjFp4dBu1DdVHE9vfQRFvpKG87h0hA8ga
         lN8oQqN4wE2kmIAUUKy41leSmv/i4+hgsdyqFkwJxuirYCbzTqq7u9SLfL5whryRliJ7
         aM++VGKPWvOXrxbvlgqAj3WR8hm+wc5kv0IFt5FkmZUjnQSRppaV845un/kNhyuPnLIf
         Jdqu+7DQwNh00eDCpc5e7Unx7Jb8tPENL3cWjVI+3LPMQ9jacmX/Z446t/Zm+0WNNqce
         RqKtE1giM6zdLXujtyMGSW4e7zlsnXuc8T92nwIfVybhtBRJWqAnzK+maMuRNMsbp3be
         u5Ng==
X-Gm-Message-State: AOJu0Yx33loYGeb/BDi61Ch4nSFCyZ26+Eln2sLukdaF8YGlhxNXHI1K
	iIwhjK0fUbRfhi9q0Lfrl4fbZ/iOExyQG7YYwc0sNx8MJhwujl4GBveoD4PH7mYjEpU=
X-Gm-Gg: AfdE7clgBoX7I3dSGpduW8DZV1ZiPxvMgkHYUZKrfxTHi0QUGjjzgwakDul5e0/OPpp
	G+lBGCOvjjcxPVp6ALDqjx5k0Vn5vNYRMMgQd4MAiepiD+EtqB8s2bXXQasezwkS/gIum0BcbeR
	WYhO2e0XZcHC8xqL0w3LQAKI41WgKNC+7JMl72BKWsQZwFA7gCnmey+sQkFZs2j6wZNKxZVWvo3
	9Xd1KCZwIFc7OPaOHV+8aD+t9j65/fun2eaUSb8iKx7yTfiTVITXntlGFY2TLaT3GiQz0BwM0xU
	oxrAh7w2OD+E/IKUyKj2rq8EWgkzJxwS70B2CnelLCZ/IQVL6TSYlQ8qlHhUwGTFH8hP3oYGTmc
	2Ob6OUR1fZaNwJwbzXONYLgV9IBLQnQ9Us69IhX0HR6RptuN5no9AwJIkvPpZNIdgc3wkLXEv39
	mi6/U72ztw3bfqNiApgFHTY/Zm7TMB6Bs=
X-Received: by 2002:a17:903:283:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2ca2d3d173emr23138885ad.0.1782812811689;
        Tue, 30 Jun 2026 02:46:51 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:46:51 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:24 +0800
Subject: [PATCH RFC 01/12] dt-bindings: riscv: Add SiFive pre-ratified
 trace components
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-1-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=3629;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=LKKqj8wK/zRa52p1Z1hwx3tYVATwyfEAhduXEkkwS9Q=;
 b=F3XqnwGVGBr2rfVhsZoSpQwG7aatf5ROijOBMiyw7Eiz0GiPCYCZ85sOZPx0WQCzMKJAq4q1o
 UOfrIRe5zE7AsCFUL5jIOkHTs8IXL+uiK68C0jG2g1EyT/KvXbGzUC1
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024652_617091_F3BAC964 
X-CRM114-Status: GOOD (  10.72  )
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

Add compatible strings for the SiFive pre-ratified encoder and funnel
trace components. These implement version 0.x of the RISC-V trace
specification and do not support the generic riscv,trace-component
fallback.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 .../bindings/riscv/riscv,trace-component.yaml      | 73 +++++++++++++++++++---
 1 file changed, 66 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
index bb519bc4a163..70c8d257b46f 100644
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
@@ -117,4 +124,56 @@ examples:
       };
     };
 
+  - |
+    // Example 2: SiFive trace encoder and funnel connection
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
