Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42278C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4822082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQneNxex";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="khOrw03v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4822082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wESgXSWt1E0mVqUiK3rrjLlKQrVwgtkJr2q4TgMXKog=; b=NQneNxexummqdp
	D4zntp8jQPUmob3QY+ed2Ne3NsU5dIsxtOvvmACPcwuP5nfoTC+BYbpYfPqOZOCNHRFv+X4WOUbGt
	CZaM3QX8391FluaK4wzS+l07YrmBXQCKjj0oy5gJ4DSo5aXkamwiGga8VYp/oGGPHsSFaeO3EkEjr
	SjHzYq7d/gO+emxFOl+002Mbhzpfjmiqh54V5PLSx/t8HkFoWi7qNas9tDC1q5FC1v4Mp7g1VU4/G
	qR/R2RF+c/tlz5RfH+QQOFDO5+netEBcrP9ZRTW/sNb8Mrbwz41EZuGpP5BlOsKMoXiqXX+lLpRfL
	BrcUqEmozPX8bHOeo33w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVIq-0000mH-2m; Thu, 11 Apr 2019 08:43:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVIn-0000lq-PG
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:43:23 +0000
Received: by mail-pg1-x541.google.com with SMTP id k3so3183363pga.6
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xoHECi6lj7fMC6tlsVhg7Jcmo6YyCWRR0WfAwqgJ48=;
 b=khOrw03vIb9UhZ7m0LIMjh4FpXvNpVedmeIX+eIZd69A78F3wEmeOyGWBR6WLdXDHZ
 Lj+IFe947TWb83tZEtXX3mapIuvgjmAKyndroSokHQRqvs8IbuvTMh5LMLACkJW+s+sV
 IHud4aUHgQVV6tfxX0Z9j9FOYfi/BfSoPgy3ykhlwugRVBX7Xr64gMSNMyTOEBei/sdC
 8mi8e57qyJwAUY/XPbuSfouThQ0saZd4r+y+5IvVicryVUbhwdjOhfxjymKnaV91qnng
 dVoORxbXRIxal0PljwbqY/yfZ38uoQf3ErZlOwcfEZRuKKmJxxKLKbdbxxEUuoa+3S/t
 kung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8xoHECi6lj7fMC6tlsVhg7Jcmo6YyCWRR0WfAwqgJ48=;
 b=qsz8J+ggAPeBSqBgiCG5mcfTZYX5GOkGylNZp+fMTG/MhjwLglejnkTd+We097qAOu
 I25xZ79UVNL8Qrh5r2CXIgEX52P0YTvilYnqjAYdsSDyjCLI+nVGivmHzSz8x/QCRB5L
 wrIwjFb+ifdkfcErBXJySPyHoULNQqzyUNY4lDXN5FGHIS9Lhl69ZyY3wdLSfPK15sRQ
 gvT5ui4MvBWqp+dnDa9Ab3/DU/3UlPZYnQrV+y7ogsaOAqyTucW01ZL8c7M6P2I6o3dx
 KV8GhdWP9Vbi7PcUCq6CMg6u5fBc3i560hDHWQ2q4ONlYEDzRz40Tr7AMFx5t6Tc3dNB
 BRRA==
X-Gm-Message-State: APjAAAWChzhcckAQYiND4uUNcC4h8LIgjp9qTDD2WH6h9HSb34I+6inE
 tee5vWh9Nly6Fk+g32m68bw4YA==
X-Google-Smtp-Source: APXvYqyYvQWd9nBI49eomlPWKSMm8VTV/dyQjRJQ5df52R3gT77jdsPHvxMTagDv7ckO6TyTtxEGvg==
X-Received: by 2002:a63:1918:: with SMTP id z24mr43751274pgl.406.1554972201211; 
 Thu, 11 Apr 2019 01:43:21 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a3sm61699456pfn.182.2019.04.11.01.43.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:43:20 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/6] arch: riscv: add support for building DTB files from DT
 source data
Date: Thu, 11 Apr 2019 01:42:59 -0700
Message-Id: <20190411084304.5072-2-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014321_825697_9ADB227C 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Similar to ARM64, add support for building DTB files from DT source
data for RISC-V boards.

This patch starts with the infrastructure needed for SiFive boards.
Boards from other vendors would add support here in a similar form.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/Kconfig           | 2 ++
 arch/riscv/Kconfig.platforms | 8 ++++++++
 arch/riscv/boot/dts/Makefile | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 arch/riscv/Kconfig.platforms
 create mode 100644 arch/riscv/boot/dts/Makefile

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82d8aa1..10e818816017 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -127,6 +127,8 @@ config ARCH_RV64I
 
 endchoice
 
+source "arch/riscv/Kconfig.platforms"
+
 # We must be able to map all physical memory into the kernel, but the compiler
 # is still a bit more efficient when generating code if it's setup in a manner
 # such that it can only map 2GiB of memory.
diff --git a/arch/riscv/Kconfig.platforms b/arch/riscv/Kconfig.platforms
new file mode 100644
index 000000000000..bd3d2642bcff
--- /dev/null
+++ b/arch/riscv/Kconfig.platforms
@@ -0,0 +1,8 @@
+menu "Platform selection"
+
+config ARCH_SIFIVE
+        bool "SiFive platforms"
+        help
+          This enables direct support for SiFive SoC platform hardware.
+
+endmenu
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
new file mode 100644
index 000000000000..dcc3ada78455
--- /dev/null
+++ b/arch/riscv/boot/dts/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-y += sifive
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
