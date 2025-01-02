Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787F9E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMQiWJM/5UCJfKiBrkOQHvoQxreK3CMToXWGQnmN1RM=; b=JshLK1h+LGtOi1
	/PN3/zjd+kFTQ2Gy09M9XQAuj/UIwzV6zI/utJNBjnHPggIePOr0Vgu8i7O+tJBqMQEwD67xzoo3D
	+ajCGTp8JoOFz76W4cO0Owj+xHE9Z2YQj4PGRjsO/Qyv4sTib3/XeQKz2UIMGiJdGkO7C/oFo24iZ
	KqV2nhAG988+EHCd6SOXtR2GgakHZC3CDvB7kj4Zh4LvL7lp9R9TeIthQuTirPazYnD2nRkWQQJvS
	OnHZPp7qvcGdw8gPSiymy+T1CiQhoTWH/w5SM03T/XYt+T3iC+CySdUtzINgXDrBS1NG8/frz1bHY
	xy4hq1iYN6yr1KpQ1DcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHlr-0000000A52n-0p0n;
	Thu, 02 Jan 2025 09:45:39 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHiI-0000000A4RL-31DT
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 09:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1735810918; x=1767346918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DZuH0P4u6QKI0PKdsHIC6lASS4fQsi4VxU0oXp8o5pU=;
  b=VczomLBAMMCSAeuk3cb9RLWuFeU/A8Pg0syjRPQWBTXOnXB6zIsEdgpo
   szan70SVv+H2u8McsO0gh6R8Bfw/2+pX4bDiw5YFjQKPowvQIjS9S9wX7
   bd9Pc5cf+rOHw9C26ulCMgNTbPi11UF3yYhiHi0CWmY3WyLriE+prdN8C
   gyWOLn7ebZIPATHm0gfFfd0Cr/HxttrakOqUCMXwrKfCDy51+EN9NHJ5m
   5ngr8F3me28uj+ET1K/EFD5wk7Ogl+HbRrm36n1AzC3TCbqEqFD6uuj8K
   FYx0J75qlJ1jFbEjSc0YK/13rIAsW8k1HeuytHRlSLF0xrSyTQiGQHx/h
   A==;
X-CSE-ConnectionGUID: kxEyuG2WQk+Yv0T7tzaTxg==
X-CSE-MsgGUID: d9KdoccHSqCttqNYNbtyVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 11:41:46 +0200
X-CSE-ConnectionGUID: XIzWEho7TBGEChEjX1VO/g==
X-CSE-MsgGUID: /dQztNDhRyCZ0jgqSeNhHg==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.1])
  by ces04_data.me-crop.lan with SMTP; 02 Jan 2025 11:41:45 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Thu, 02 Jan 2025 11:41:46 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: add risc-v,aplic hart indexes
Date: Thu,  2 Jan 2025 11:41:15 +0200
Message-ID: <20250102094116.3847894-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014159_068065_EDF4D260 
X-CRM114-Status: GOOD (  10.19  )
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

Document optional property "riscv,hart-index"

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 .../bindings/interrupt-controller/riscv,aplic.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 190a6499c932..e163c8de3524 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -91,6 +91,14 @@ properties:
       Firmware must configure interrupt delegation registers based on
       interrupt delegation list.
 
+  riscv,hart-index:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 16384
+    description:
+      A list of hart indexes that APLIC should use to address each hart
+      that is mentioned in the "interrupts-extended"
+
 dependencies:
   riscv,delegation: [ "riscv,children" ]
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
