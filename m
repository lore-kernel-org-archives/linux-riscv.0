Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52757C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED28214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VeSPUNuq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ux2gd/pl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ED28214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FbU3ZPn5qDgwp0VgOeVL14Dr8HZ7njSNLUqCKn2qkYo=; b=VeSPUNuqereMZz5ZFF7qveyM++
	lLUsSKKimmQS4DjHj5b3ee62IzZ5plXxrLy22l1GiaNM2bvk8HMKfEaWZ9Y8xEjAIPUXtuUOLQtto
	kq8pKOTmod66+1SUD8rDSpmHichS77jxOSwFx7kAQrhELjvIs9WUKfaxsjlVk1zrFEx8i/tC9Bvgd
	IDrlFArvuQ1uvmANVarBLo9zCQ4vqJ9HfuqFYkNsJ0LFf8Zu4LfiaK9Qdbw9R1xjXLNk8HG+r77Cz
	Is1kDjsR5z15hf3vts0T97RJVWcbZaJEece7Xa1zHBQGp8PKZ3aH+NPSHv2cZkXQ/PSXcXdhILHCX
	8GxU0Uqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJXLx-0007ks-SB; Thu, 25 Apr 2019 05:55:25 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJXLu-0007gf-GO
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 05:55:24 +0000
Received: by mail-pf1-x444.google.com with SMTP id e24so10531906pfi.12
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 22:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YaYDQDcCmsf6X5YiAjwhcu4gT8l58g/qvU6lg855U9k=;
 b=Ux2gd/plLuwYUgdPTDiuOasGP6nVzQPLIJXLAioJaUoXM4y8KntrU8EHrDfCNhqSYI
 cd+byvH3owt6wMKSuP0dwAmMmDVZHFXkVgFIoM5xKfChPcDko2W+inLwbip619c3owve
 wV+0H5bVO3Vd2wPLlROaQNj0z6/4JSZELm9ZzCsLnjOm/9WJ7ZT/fq3ewXD+MRfxOxf1
 hSkZuM4ndYWqQn7O2CxJynCTh1cQHcV2n5s0PiMWrSUQxggjqWiSGaFysG5MkwjLuUgi
 D646VhzZijPVR/JBMOfip859XMnNixAIQm+P5bJMFiSybVXCdcvBFdySAjUtwkkNNpRs
 g7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YaYDQDcCmsf6X5YiAjwhcu4gT8l58g/qvU6lg855U9k=;
 b=SC7Sn02R7oMvUoBpEdX/0G9VwOlVbq24ueVt1OLkUb0aK/V5VTVEQLsNh9B9lIzCxr
 unKH2TsnzhV+jqtqu2FfyhIQoL1iC96pMoDq21HSg9rjfuN8dlwrnt2IS2wjkoJkyoQa
 aHv84VqnYQSMGQQJHuOECILsEbRby/KDQ7ZlpWuWIdC/c4xyB6IFa9naO5+2sjc0agbh
 GQ+aK3XwwUYZZpb4vouXT6yLE9XemUnYT4SJ5UhtBAI/O6bHbbtfzJNvGWii5I0spctN
 Iep1/FrgZynDS7/nrjbwSlX4I+qiLX5CgjDuBaDEoxB0r2tBDOl1pXTlO+7z3RX10EQd
 /Sug==
X-Gm-Message-State: APjAAAXPWZ3FHF1+/QnNMirzz9NLXe9dlM4VOojaOsQFsayz8KxUq5KN
 rO/2EUs1LwISDTLbpZtnEedqNiZzE2c=
X-Google-Smtp-Source: APXvYqwjtZwaxfvqrhUita0yd99RZtr81g2DROY5MuMykfNIEkKP3LhIQvkBesB4YHt2jsYkANEK2A==
X-Received: by 2002:a65:63cb:: with SMTP id n11mr3184865pgv.236.1556171721463; 
 Wed, 24 Apr 2019 22:55:21 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id m16sm46332170pfi.29.2019.04.24.22.55.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Apr 2019 22:55:20 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 palmer@sifive.com
Subject: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Date: Thu, 25 Apr 2019 11:24:55 +0530
Message-Id: <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_225522_741802_A2941209 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: mark.rutland@arm.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for SiFive FU540 L2 cache controller driver

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
