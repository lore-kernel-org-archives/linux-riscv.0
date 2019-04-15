Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976C7C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 11:41:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A15C20645
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 11:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dHFR8i/F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ey/A3VHO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A15C20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9h47exvE3YD8sJ+lGcjtx8p1ioi4RWLwwSq9zofQgHg=; b=dHFR8i/FutCzV9n1itF9C4SL85
	k2jsrNLeKzRRN+tm+Uic2ZBNWmen9MnX5VYwg8IjcS4r5pR7fcyWztOVjtdfxpR/G5zC3ZXiWequl
	7VLKxGdvbnWFa+Yww24jCdwcpZ/HFhuL5VGI/SEyMD2LBcq3DO1M/Ef+4OYDZd+vP4kueiluZLnLc
	Oj0478EqlAY3Jid6L6vntdC9dubm9C6Sp4byS0IFM+mRulBf4mWF11THV3hCO2w6i5iyFVzW3IYdV
	D1DIQbtzeEGogbzvqDfo4mNW2g/VnuBvmabz8LfCgG2CsWFkz1TJEoBK2isiueqCRyEmPtNRqAM8l
	WE917oaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFzzX-0004zQ-6v; Mon, 15 Apr 2019 11:41:39 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFzzU-0004yn-Bo
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 11:41:37 +0000
Received: by mail-pg1-x541.google.com with SMTP id q1so8432426pgv.13
 for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2019 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4x3PZ0m4B0BDc7pgveF+ss1l/Njj30x4kKCYTwJnwrE=;
 b=ey/A3VHOwfSDofaeIV2lHRKJb5sEANApgl6wL6VPhkVZbyQcd8pcu/1GYYKC0iGTTy
 /CwZt9tlv4hIIz7j4z+Lp1m/dyo2OrsBJ/h2sGyw0zvlQZBcBjNJbbVaKWnyLhso4kKU
 1WZljXYBVzQFJPsLMXwdnOEf3RGZd3U7gdovghAsEoAynTccPBcGN1kIUDJSoOo3pqob
 mEMEEwE+iekK603dYyBNYLdHShMM+Wiq5/Vi34OPxYkzUqlHdkm7Dt3BwiVcZoc5lEar
 4fY2A4e68dXKW4rNUiPgwx8VQRQw669JmsYYnp9WtEtX+aEIRvKNVaGSwmNDwKxQFLrO
 6fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4x3PZ0m4B0BDc7pgveF+ss1l/Njj30x4kKCYTwJnwrE=;
 b=Ki+xbbjSKC9mkBZWM97h6E/oaQpgivBzeMu59lU5WEOZ2w6V0nFAtww2Y8TsuIh1Ho
 MhZlDqiTCk/3yeR32O6HchwJzsTdhOJVNU7VB2FFMv9Lp9im/1PP5Mdg4l8BuJIYlRu3
 j3J2gCt+94qZovKyFjzx+fH3Lj4IETcGqemCwEACInF7wMHbkem+qyFOmVKsbjmJB4WS
 4ClePHUUJZ5xYXg9gFuF4E2JC0z67aZ3gbf06929sPzOT2PIW9sMjbSNWs0y6YLNISAe
 eZS0z+waH6HX0F8t04Iz7EjMRnZoYXdfnOzEr23u8oJqOJ4YhRfdQhdY95ymVaMp2uX5
 Rt6w==
X-Gm-Message-State: APjAAAXUsYnjLdUDQhhHLFcKV1CRWT4lwi9VlHMetzr7Vhc46+jUiscU
 QsBuWhNEi1W0ZIR04AeuNf9D6Q==
X-Google-Smtp-Source: APXvYqyyXuSMV7qYfPCLMYOL8Y/aU7ButgBj5OSBrMwc9kzENvL5nZP2gcOIvgW4uhxOpiyIzvfgNg==
X-Received: by 2002:a63:c046:: with SMTP id z6mr65559715pgi.81.1555328495776; 
 Mon, 15 Apr 2019 04:41:35 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id l4sm32317273pgh.17.2019.04.15.04.41.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 15 Apr 2019 04:41:35 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Subject: [PATCH 1/3] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Date: Mon, 15 Apr 2019 17:10:41 +0530
Message-Id: <1555328443-30874-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
References: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_044136_400537_A1F14FAE 
X-CRM114-Status: GOOD (  12.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 bp@alien8.de, paul.walmsley@sifive.com, james.morse@arm.com,
 mchehab@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch adds device tree bindings for SiFive FU540 L2 cache controller
driver

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
new file mode 100644
index 0000000..15132e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
@@ -0,0 +1,53 @@
+SiFive L2 Cache Controller
+--------------------------
+The SiFive Level 2 Cache Controller is used to provide access to fast copies
+of memory for masters in a Core Complex. The Level 2 Cache Controller also
+acts as directory-based coherency manager.
+
+Required Properties:
+--------------------
+- compatible: Should be "sifive,fu540-c000-ccache"
+
+- cache-block-size: Specifies the block size in bytes of the cache
+
+- cache-level: Should be set to 2 for a level 2 cache
+
+- cache-sets: Specifies the number of associativity sets of the cache
+
+- cache-size: Specifies the size in bytes of the cache
+
+- cache-unified: Specifies the cache is a unified cache
+
+- interrupt-parent: Must be core interrupt controller
+
+- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
+
+- reg: Physical base address and size of L2 cache controller registers map
+
+- reg-names: Should be "control"
+
+Optional Properties:
+--------------------
+- next-level-cache: phandle to the next level cache if present.
+
+- memory-region: reference to the reserved-memory for the L2 Loosely Integrated
+  Memory region. The reserved memory node should be defined as per the bindings
+  in reserved-memory.txt
+
+
+Example:
+
+	cache-controller@2010000 {
+		compatible = "sifive,fu540-c000-ccache";
+		cache-block-size = <0x40>;
+		cache-level = <0x2>;
+		cache-sets = <0x400>;
+		cache-size = <0x100000>;
+		cache-unified;
+		interrupt-parent = <&plic0>;
+		interrupts = <1 2 3>;
+		reg = <0x0 0x2010000 0x0 0x1000>;
+		reg-names = "control";
+		next-level-cache = <&L25 &L40 &L36>;
+		memory-region = <&l2_lim>;
+	};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
