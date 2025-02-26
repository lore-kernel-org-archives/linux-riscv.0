Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0597FC021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 23:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIqXIoJ7x5a5jldOHNC0oAFZPmVlR97sBLV0PcHCB60=; b=LTaZu4rsonwbok
	5u2f0PHFSeLMviFWTY9rIowqnyy2oZprWwYjs9Z8FL+t+TeK/PF4XA/1lbxMgU+ltT4PZkcIBbLcp
	V0etq0wBGll/C4G5AgvCU+zOoFJnt3tBoEpAVwM2xSCMxEld0XA7sH7qq34zj6Y5sybpvHIK0+b0G
	tJLxRF4/dhWESTTMlOFIZpjTzPh6CqTyLnmW+vYjun3FsZcJqFlTnY6ha3fzBV793qYhr3xB7qBrH
	kTH3KC38j2s5mEybKriCWC79N134QbAgqAVQUBh/ua4zz+Nje4qasAM1qByA04tpeUqF8PVub+q3r
	ZxwH5aPyuMvd6q2bWifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3P-00000005izu-3Juc;
	Wed, 26 Feb 2025 23:43:03 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3N-00000005izK-3edo
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 23:43:03 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-471eb0e3536so6239551cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 15:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613380; x=1741218180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1+lP/WIL+F/rv1NC/9PUv+dZq+2rnJ1+5/Qq+1dd3M=;
        b=P0wuIJlxLJ3jsFqtZbfGpr2Y00TYyzGAUWvPXICu235cYwptONOtJxVrrSOOfy8vFt
         aS/niXni8/TKHcdPibbCoN1v0PTyZxfC+aG14cKsXlg9VzPE9dZL9GriDBGf9TOM3pge
         eYjXDBhPJjhIfqTTe6+kU/LQSFe5j67RDMzZCxd1iXftLvNfh8LvbQtUTblrivFsJ1NZ
         /O2/NTo/UT19ypwxWqXfVsivsIzwP/yLk+l3rtl7Sb+r3TD2z1/GQy7mwcA9d78EjCKl
         AiGS5oQvPGDforJOJ9ymZ0BHx6+Vn59cyB8W+ELHHvn2apTTupPCwhZ4+mCFdLTcB+45
         k5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613380; x=1741218180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1+lP/WIL+F/rv1NC/9PUv+dZq+2rnJ1+5/Qq+1dd3M=;
        b=YHYVf98OfeY3PIjljwUZ+MUbInEJBvwGEKwbunUzcQy0SrTVfNRtJbRUhUX//tRgZf
         e5RjZZGtUESXFHjSaWDC4MsRvMBhjiZ9J2KGeXvCLk92grkoG/GRHQzr67UnL11vMG/F
         n4DQxoU/ip54Pan2rBZuwhZEYhzaxqMnOT6PKhNDJ7rUHOYjwqaQFwJRKn4rK1DljUPm
         RNGOo38FG+dE2KRpZzd2pwOUe4HeqU2abv6avdN4DAMi5De3P8vVeafpuFuTqvJ4NhdQ
         afobh16i6BP3GYjisauJjy8Vng0AFRkkAMaz5A0BVELnIsgLI6Z8lNNqi8vVGyBLsmvB
         sgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCAf6odT4gqgWaSXBtioQkDAO9WgFD7J/Bn4VQyKdnfu8NKOWUMPc1ELvaxbNZUml/Qx3V67hDr6wqcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUencdNWr+/eE0B9ujl1vurkaBCNR2LbwW3MIQiOnagmpG8zVZ
	pIHvvYdbX0FHaUX00/Ace2Hs3HFIrDHnFs00uTpEQVBxagHXCXN0
X-Gm-Gg: ASbGncuqTij4zHmF2xptVZ913d5okmDqmiOYaAavivEuEBbfXimBbLDYDuvTlglZ2rg
	Kh+LOjx+1Kj+CES5Al3rgH757eFnw1Sdtb2xNKnqLQ0WYRbpSbqvy0Lm3HRWiHO44d3satBFhxU
	G2rxtO+eu7RL5M6S18VH5fMqE6xEop+VY1toHIG1jmy38rcx/jMkW4b1TVSGt56WhRc5HpWwIKO
	VYUI2mEAMujmowRZMzfYT6/pWVOZhzoKsolOu03gPPwinaBTOh81gti2/Sa47RrVuBLZuZh00b6
	aQ==
X-Google-Smtp-Source: AGHT+IE44ZeBH/IrSFQFlBWBOeEM9K3xucoChT7wDAEvDlnvzZniYENcKpDmeUtZGqquKBj12bm2Iw==
X-Received: by 2002:ac8:7c41:0:b0:472:1de:c912 with SMTP id d75a77b69052e-473772722edmr140400091cf.50.1740613380578;
        Wed, 26 Feb 2025 15:43:00 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47472430d89sm2637701cf.68.2025.02.26.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:00 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/5] dt-bindings: reset: add generic bit reset controller
Date: Thu, 27 Feb 2025 07:42:29 +0800
Message-ID: <20250226234234.125305-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_154301_908155_81C50B26 
X-CRM114-Status: GOOD (  19.57  )
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

Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
a simple reset controller by toggling bit. It is a hard time
for each device to add its own compatible to the driver.
Since these devices share a common design, it is possible to
add a common device to reduce these unnecessary change for
the driver.

Add common binding for these kind generic reset controller.
Check the binding description for its requirement and
suitable scenarios.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/reset/reset-simple.yaml          | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
new file mode 100644
index 000000000000..86c33a608148
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Bit Reset Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description: |
+  This document defines device tree properties common to reset
+  controller devices that perform assert/deassert by simply
+  toggling bit.
+
+  All devices in this binding should satisfy the following requirement:
+  - There is a single, contiguous range of 32-bit registers.
+  - All bits in each register directly control a reset line.
+     - There are no self-deasserting resets.
+     - There are no timing requirements.
+     - The bits are exclusively resets, nothing else.
+  - All bits behave the same, so all reset bits are either
+    active-high or all are active-low.
+  - The bits can be read back, but the read status may
+    be active-low independently from the writes.
+
+  If the device is not meet the requirement, it should use its
+  own binding to describe the device.
+
+properties:
+  compatible:
+    const: reset-simple
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+  active-low:
+    type: boolean
+    description:
+      If true, bits are cleared to assert the reset. Otherwise,
+      bits are set to assert the reset. This also applies to
+      read back.
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@1000000 {
+        compatible = "reset-simple";
+        reg = <0x1000000 0x1000>;
+        #reset-cells = <1>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
