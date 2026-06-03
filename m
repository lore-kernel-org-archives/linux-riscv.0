Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D262CD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4FIwyItl29eLdrhEuThbdB3To5cC7BWg4qzxo2vW58=; b=PQ8FEeV/VvL455
	3h5elUSG6fgL0E3JEXk9v+8mVXxtZz4xoYC5VdXMBBQx2tXDr1zjko6XP2dUAEHoLnuSqniH3hCoo
	4wd2Ufc0T63DRnzX5VyDFzhkxX8q+jIY4Kb8OSz/BelNTPFF7hLCUMVY3iQ7xRukKkasgMnnzEMfL
	a2keg9Ufh57wXeEBLKgrZILhgCaWpb0jtFGIVmmwENYtfx+PH4rKuEMnGxOy8YTFFTLJMoAFo/9jx
	1G3eM9uPMNtB3HisuxlrXjoczr31vFtzF40GcU1lRXgoo+zrdxw0L70oM5N+hBTb3UAfw7LE7lqtO
	mb5VYjpVvpzUSEF0WL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFv-0000000EV9o-3Qwa;
	Wed, 03 Jun 2026 07:43:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFt-0000000EV8V-21c6
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:43:14 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso2591904b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472593; x=1781077393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEUznx6q1xgPyacCOOmKA9VXsKVblZvEIF1KohfNbRU=;
        b=YYtf+IncnoQVE8SPVKi0y8JQZEFQvZ2wvmG7Xk8CuL8Fs42VYgkh5by7ZA2/aRgzkO
         zk2d3IEgR/cftLRzjy+4x/d6PwYuqJi3HlaxARqyKM8PwVCJ/vJpJMZ0bfpGcKw8dFz+
         EyPM1no4ySidkpLvXDT9rr/yDJ+RGl/aZR6HQvRzSU9x8fXVjDs3aXYHXT11Id6bHXmJ
         pXmbjkQW1WwFbAySHNFMcd1idMVRDpS4zGXOze1GA+JmeNYeJcauk4i4MOoWE93pE6GN
         Jer2yDvZD8w24eNbTGCv1FcgztFMlTxL3gO/uMDjwkyqWUtze6IPSr6+QnWysCoAN4h6
         0bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472593; x=1781077393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEUznx6q1xgPyacCOOmKA9VXsKVblZvEIF1KohfNbRU=;
        b=ZpTDAhIWSym5z1RgyoU0kLHian2y+XA66h5IFIYieXhGLTscYm/sbuw6QorW+pqNB7
         wqniWHQNQ67TeoBIPlKQy+oyhIyck1dAIBd+asEHudpTHcf3tO8pb5ihKupeUHy8tl1H
         bhX/d5WLEa8UmKd1ZH1PzYcgKzTExE7d8OJbElT+wj7hLTSUX91127Svmv24OaGxRLTf
         jo75fAg9CBpknYadFXTo34fTSDmJGMIBbdul1Sxt95yb2HqA7w5Cg0YulRvc3mk3A0uC
         FX3y33felXsaWK5tKCdQ3IRhfLWPcAwo9WV3niX5l/HGI9Lc+2pHK/BuBPeDyf8pHGZP
         Tm4w==
X-Forwarded-Encrypted: i=1; AFNElJ+vEoyhcrxKiBnsL61CIq6xmEecf9ss/rnwRmnrcfls5hSI/5TFXence/fJ/iruk6KyneEAhopNT8MVpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzA1ss/4vWhTzcPk1ZybKDJMMT1Ko3hMDrDYuq2xf5blpLo4D6o
	ojMYRW3pLY3TjbBWyf4EIt8ZUUUfoFX0hpRhXZHSNSKFxIgSJVSLizxq
X-Gm-Gg: Acq92OEX8JLbhjUI08X2H7tML1FWTO8zPk9HERBbpwEXZYMroyqWOl5rrGAs1TFLbLA
	VGfDmBkAfvv0tNf7hfbIuSAT5oybRa1jkjmFa3FIPt1KWa03L0zJtfGTTe+By7gKiOiKH5y7j8l
	QxaKQCDULfQbdU2cjQd6n+xd0hS3CHVYu83AWjokFAjLiHLXK6iEx8MQFRCLVJQxJOP+ZgqQQ6A
	JsKz0Uimd4SMCmbgyiUvpId6HuMy3TiK1MgAPX/RPLerSVkT99uyKvMLiiYwde5CVMlSes4+hD1
	A/6tY2CblKr7tjc82HFgJGq+y026eL6C3Qp6brHQUQHonXscRfi/251wMoHXunwzWCgLWuWpgHF
	ZJPeuANneWuPmHqJUlcAEl7OnMt7xslKsAY3ipPpZQZBc18jx5bkZfF4L4/1it//iAgyKGSowz5
	+2YxYjdNJazb/woqwzw9/RD6wq4PRQqji5QsZBDBCzfTZMeLSYFkGzoPcXlbjr4erZdW0Zpuw3p
	Y4kdyNbEVmcEM39642m/NF/s/Thnc2XPlHPSUS6QIGTzaEBHQaheajvNgJpdj+8
X-Received: by 2002:a05:6a00:2350:b0:842:6099:c55c with SMTP id d2e1a72fcca58-84284dcf4cemr2355605b3a.3.1780472592719;
        Wed, 03 Jun 2026 00:43:12 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
Date: Wed,  3 Jun 2026 17:12:16 +0930
Message-ID: <20260603074222.593243-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004313_528754_1F6E48D9 
X-CRM114-Status: GOOD (  13.80  )
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

Document the bindings for the RISC-V ACLINT.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS                                   |  1 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..43dd9873bbc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23005,6 +23005,7 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
new file mode 100644
index 000000000000..192ff3fcf79f
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advanced Core Local Interruptor (ACLINT)
+
+maintainers:
+  - Joel Stanley <jms@oss.tenstorrent.com>
+
+description:
+  This RISC-V ACLINT specification defines a set of memory mapped devices which
+  provide inter-processor interrupts (IPI) and timer functionalities for each
+  HART on a multi-HART RISC-V platform. The specification can be found at
+  https://github.com/riscvarchive/riscv-aclint/
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tenstorrent,atlantis-aclint
+          - qemu,aclint-mtimer
+      - const: riscv,aclint-mtimer
+
+  reg:
+    minItems: 1
+    maxItems: 4095
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1
+
+    timer@ac000000 {
+      compatible = "tenstorrent,atlantis-aclint", "riscv,aclint-mtimer";
+      interrupts-extended = <&cpu1intc 7>,
+                            <&cpu2intc 7>,
+                            <&cpu3intc 7>,
+                            <&cpu4intc 7>;
+      reg = <0xac000000 0x00010000>;
+    };
+...
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
