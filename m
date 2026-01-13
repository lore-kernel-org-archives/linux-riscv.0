Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856AAD29DDE
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 07:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5w44ix0C0Svw7Sa8zdBLQTscNfEdFl8sNMAvTH9MOq8=; b=LTT2LBG8BjhIho
	hIPFSEPwQDSoDWfb5sNljeXSR8hXMt4O7mppEiTWgKL1qFkBuDnxGvHJux1LmuvAfjmzkriBtSK9X
	RAqRTRBC+p2WhycxbjWmIjdCog7M8rHm+K640rlSoSu3LgAh5Q4QOE3sIn6dgxpS776gjHcG2rxYS
	5s+MnI+8oEM6Jxn3s3Y1CwqUWB32Ed6ydj2Pe/m08rwgFNMhTw8v6WUeSw/JnucMIusiqM13yrtRy
	08UBtEnB8PHRV18I9Ca9CjaIyh0xD9GZyozpllcNXGzFr3PRXzpn1IOIWLeNgHNFFUkqVnB3rqdto
	qirqdc+b5s5Kh4pljFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ6n-00000006g0O-3746;
	Tue, 13 Jan 2026 07:46:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZ6g-00000006fyg-3kVt
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 07:46:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0f3f74587so53999285ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 23:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290386; x=1768895186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CjXm7ZFbZN2te+mbZ4FufAt+vGFRDn4qFlHrXyIeIA=;
        b=nSNv1DxecptJa5jj5w95jRs9NPboYjEQe+UY6PZDq4l/2r1hA6IbHEt4IOVr0Qfz6m
         RQEu8fvvnGjY/3A8yxV266yQGi/SBunBdrdQjwKD66cK0+u9tzGToMZbT2tQH40RZWAN
         oT/JUUaQWjQ+ZujYTUtD6whiXUI2/HhGDdZN+7jVCPC8aYeiInq019lo2VBUuyi0LsvN
         X/bdWgusUjDa3ts4wrRDtHkSOwTkXkBXA8HMMsHf653qswrHTSZ8W8P9k2pNm6NlNX/+
         7ch+m8IO1KkLCmPs4daA00dPqjjRd68eUtmjErRFFo/34iFUj/3wcMyKEOTnd481DC2Z
         nFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290386; x=1768895186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4CjXm7ZFbZN2te+mbZ4FufAt+vGFRDn4qFlHrXyIeIA=;
        b=Tm2kPi0q7yh+Mrq0wmhwkxSfB090B6cB3p8JMz+vsbkzY2hp7neGudSq4gmWdLJGST
         Kv8xr3s19ttHYvRP8W8jvkbtn4eeSUH/JkKepHy3xkemWLkHcXglIZPrLfQohfwyPh4V
         UNC9FKpXw8totQyI7aWGTQ1o7l2taP8DSjQFle5HlYaIoZrvcV2b3lrlQG9E6A4MSN9p
         +GJLTwAyx/KLcrn1ZAV18HgmfSuXONihGub+c/pV0N9QZNZiEv0AhBA1+j9Mrdh6sUZk
         kto9+KOQy00Y2HMnuYZ8dtSgmleXHPSQfkQT8BAUS7+bz/Qa8U9lRc8/gMPCZIj80sej
         N35w==
X-Forwarded-Encrypted: i=1; AJvYcCUGEcxin40DS8SBfp1lxl256ipVNY/QMHgbIyJhqb3h8cnwFWUCpDcvJVA8Die0I6YUnYsxMKeSYNLQ+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRe+RUjZ0OxSDhmpCfSArAkyZB/R6paGqC0V6oeaLtqJkBeF3v
	HeAimwa7CQqdXjjtEgvwcdyUwoBbGm1CkkmZRVKkQ6YQ3EcFPyOJwEk1w7scZb3zlH4=
X-Gm-Gg: AY/fxX5X3HRU4L999MPg3EPRXmOHw39vj5OVg+YP0acrpOBvhSbE7c9vfHL/EZ8dKNq
	XhhET730QyQk/IJycepz+cVqvPyB+r5eh8Bfrb5+hOjJzye0n4YcLyDUqrjNbnqSV2ekKr3Y2bt
	mEPH0xCTyqT/A46YscYklg0K6YufIal6FBxFwxGGLq7ltWY2S92ecg7o9EkFYoQgmLsJUOLBnqB
	ZAni+IW69R8YUZaZXo6vRd+kLR9Ul9CiUIQFzWJXEKyEr6MjL+XP29B7qXtXv0HcmllKQd6yYM8
	xuS8JicgOCZjEmFjl0xgbM+9BtmRdviPl3UppZ0/54MRICqcSeTKVMSF3N8eixIrD9pM7OlNcgr
	hJBv4x3obbDIJuhJXKSZc4303M30sJwNV4XlTS1aCWFJ+hG1IZ0yxEMiC06tOEkXrVklgMiJkA1
	Ks020ROJt+ouTz9V9yDKNsEXYg5SbjOMuXckgm216zilg9pyDfv2lR7Q==
X-Google-Smtp-Source: AGHT+IEtfxvE8QKKhCFEr0sgtwaNG0lOe7lCzN1GyYwvIvldk9sYRgUVjb3dpl8lLAX/fxKuhy9oLQ==
X-Received: by 2002:a17:903:234c:b0:29d:6b8e:d565 with SMTP id d9443c01a7336-2a3ee4c0e80mr168277035ad.38.1768290385628;
        Mon, 12 Jan 2026 23:46:25 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:25 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 15:45:54 +0800
Subject: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
MIME-Version: 1.0
Message-Id: <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
In-Reply-To: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_234627_441909_5F8854C0 
X-CRM114-Status: GOOD (  10.54  )
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

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update existing devicetree files to conform to this rule. Line balancing
is performed where needed to improve readability.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
 3 files changed, 147 insertions(+), 146 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index a5d0765ade3231ece0afbe8835d95cd918a44ad9..9fe183f5f5c8d3a51ef38384ea11147637aff8cd 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -27,8 +27,9 @@ cpu@0 {
 			mmu-type = "riscv,sv39";
 			reg = <0>;
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
-					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b",
+					       "zba", "zbb", "zbc", "zbkc", "zbs",
+					       "zicntr", "zicsr", "zifencei",
 					       "zihintpause", "zihpm";
 
 			cpu0_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 523799a1a8b821dceb476e8bdc16e5c372e04d09..3135409c21492fc69766e6205ac3ab2b571a8718 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -24,10 +24,10 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -60,10 +60,10 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -96,10 +96,10 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -132,10 +132,10 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache0>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -168,10 +168,10 @@ cpu4: cpu@4 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -204,10 +204,10 @@ cpu5: cpu@5 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -240,10 +240,10 @@ cpu6: cpu@6 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -276,10 +276,10 @@ cpu7: cpu@7 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache1>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -312,10 +312,10 @@ cpu8: cpu@8 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -348,10 +348,10 @@ cpu9: cpu@9 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -384,10 +384,10 @@ cpu10: cpu@10 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -420,10 +420,10 @@ cpu11: cpu@11 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache2>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -456,10 +456,10 @@ cpu12: cpu@12 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -492,10 +492,10 @@ cpu13: cpu@13 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -528,10 +528,10 @@ cpu14: cpu@14 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -564,10 +564,10 @@ cpu15: cpu@15 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache3>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -600,10 +600,10 @@ cpu16: cpu@16 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -636,10 +636,10 @@ cpu17: cpu@17 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -672,10 +672,10 @@ cpu18: cpu@18 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -708,10 +708,10 @@ cpu19: cpu@19 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache4>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -744,10 +744,10 @@ cpu20: cpu@20 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -780,10 +780,10 @@ cpu21: cpu@21 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -816,10 +816,10 @@ cpu22: cpu@22 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -852,10 +852,10 @@ cpu23: cpu@23 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache5>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -888,10 +888,10 @@ cpu24: cpu@24 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -924,10 +924,10 @@ cpu25: cpu@25 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -960,10 +960,10 @@ cpu26: cpu@26 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -996,10 +996,10 @@ cpu27: cpu@27 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache6>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1032,10 +1032,10 @@ cpu28: cpu@28 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1068,10 +1068,10 @@ cpu29: cpu@29 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1104,10 +1104,10 @@ cpu30: cpu@30 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1140,10 +1140,10 @@ cpu31: cpu@31 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache7>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1176,10 +1176,10 @@ cpu32: cpu@32 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1212,10 +1212,10 @@ cpu33: cpu@33 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1248,10 +1248,10 @@ cpu34: cpu@34 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1284,10 +1284,10 @@ cpu35: cpu@35 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache8>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1320,10 +1320,10 @@ cpu36: cpu@36 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1356,10 +1356,10 @@ cpu37: cpu@37 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1392,10 +1392,10 @@ cpu38: cpu@38 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1428,10 +1428,10 @@ cpu39: cpu@39 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache9>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1464,10 +1464,10 @@ cpu40: cpu@40 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1500,10 +1500,10 @@ cpu41: cpu@41 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1536,10 +1536,10 @@ cpu42: cpu@42 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1572,10 +1572,10 @@ cpu43: cpu@43 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache10>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1608,10 +1608,10 @@ cpu44: cpu@44 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1644,10 +1644,10 @@ cpu45: cpu@45 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1680,10 +1680,10 @@ cpu46: cpu@46 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1716,10 +1716,10 @@ cpu47: cpu@47 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache11>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1752,10 +1752,10 @@ cpu48: cpu@48 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1788,10 +1788,10 @@ cpu49: cpu@49 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1824,10 +1824,10 @@ cpu50: cpu@50 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1860,10 +1860,10 @@ cpu51: cpu@51 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache12>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1896,10 +1896,10 @@ cpu52: cpu@52 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1932,10 +1932,10 @@ cpu53: cpu@53 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -1968,10 +1968,10 @@ cpu54: cpu@54 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2004,10 +2004,10 @@ cpu55: cpu@55 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache13>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2040,10 +2040,10 @@ cpu56: cpu@56 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2076,10 +2076,10 @@ cpu57: cpu@57 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2112,10 +2112,10 @@ cpu58: cpu@58 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2148,10 +2148,10 @@ cpu59: cpu@59 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache14>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2184,10 +2184,10 @@ cpu60: cpu@60 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2220,10 +2220,10 @@ cpu61: cpu@61 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2256,10 +2256,10 @@ cpu62: cpu@62 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
@@ -2292,10 +2292,10 @@ cpu63: cpu@63 {
 			device_type = "cpu";
 			mmu-type = "riscv,sv48";
 			next-level-cache = <&l2_cache15>;
-			riscv,isa = "rv64imafdcv";
+			riscv,isa = "rv64imafdcbv";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "v", "sscofpmf", "sstc",
+					       "b", "v", "sscofpmf", "sstc",
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 4c045da95d72d840fdaa9240136e35007317d987..2917b315728ff839fb43f77713224907bf2d5cf0 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -54,9 +54,9 @@ cpu_0: cpu@0 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <0>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -84,9 +84,9 @@ cpu_1: cpu@1 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <1>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -114,9 +114,9 @@ cpu_2: cpu@2 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <2>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -144,9 +144,9 @@ cpu_3: cpu@3 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <3>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -174,9 +174,9 @@ cpu_4: cpu@4 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <4>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -204,9 +204,9 @@ cpu_5: cpu@5 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <5>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -234,9 +234,9 @@ cpu_6: cpu@6 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <6>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -264,9 +264,9 @@ cpu_7: cpu@7 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <7>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
