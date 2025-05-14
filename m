Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3DBC3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+tqj+hz76W01J4SEho84STONDNgmpTKkfpeXOdOtug=; b=eY1l04cywDFQcz
	MuhZlK7qXtJjCyZLs7m8vDr9eOHtRqNETRGN8hpFcMy7m7ibbBGSi9Y4OqM28tXGmmhEuyFMd0Ger
	WQ5JWGrze/zCUg+Fc/VxsG6zZIfyL7khI9VhSp0P2osLfpQ7B+oVMrHJ41GGZt3YMyvao99K1e3ft
	vZ+UQauACsKPUtu3hWlYFsQ2uiYXwfqi9cG3Z5Td3KxCUHG7e7WburOyCvxoXlOJI35UWs22WDD0E
	uJSS3c6C4xgJaW73S/2MePoOkmpiFIZ6CK8ZCNznWsQg8NUsVAvXnKv58rD2rFVU6uKvVCK9Oy/KN
	IdNw7CJfQlAIueYCupvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfU-0000000Fgdv-17Wq;
	Wed, 14 May 2025 16:09:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDqR-0000000FYNX-28LZ
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:16:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22c336fcdaaso64858235ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235791; x=1747840591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a35Mb5xv+JgUWPv5strx0bmY1FlpWriHQwx24Tiy42c=;
        b=PNFhhdpKF9jocLCmjhZBjPJCFMstgtQ0bd9XJ0ub/cVkQQNJtYg/+Z2XL/Krb4n1Sq
         oPjtCJ+uktp7vPewevL9kBbELLN6biGgBWR/olygLKc8glmu59N52JP/lHtmCXmzQaPu
         bXX/BPjodqwxX09b7ywOBAW/I+pEjEte+pIqLfKV1lcKwhlGwmh51bUWwt9GZABYKyIE
         j5ubqzaicjs2rnpfR+nFp/Fz8i2msRXWqfA3G18eoYH8J5XBebFonGX/6CX6S6mCT0f6
         RuxxmcOuvj7h2Q2t8YdmNQBpttJd4f4IkTdLOh4GAsqjAgLsl2MAUzm6AB3WjPwlsOVU
         Qseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235791; x=1747840591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a35Mb5xv+JgUWPv5strx0bmY1FlpWriHQwx24Tiy42c=;
        b=WRcaZBs6aGBDo9O+ddCPl+v4YJSspCjsqaOgafkc1ExsUUXnE6vlgevepKhxh5rpDs
         E5urwRqq3JEHztFnVa23AUDPS+UyI92fZ8DmIG7H/d9FPnF2hHaxRk6xQwp51zp/5B/n
         iFjxqC8BmbkJo2f9IMW7L6FJFWGOVIO7ApPoMBE0X1CeP9vpRWhtudPVJ/n4zXhm6KwL
         FqY5nNwZ0sFtwtKnZsZl5fj1w4VOkwSh5T5EBXFf6sNKhYXHRjkkPgkk4hFnFChtp9z1
         8uyd0dS4h4Z180xcSRQnoPIM/x05ceF9IGpto/SUORk9mJcuYNMxmAlLSZprRVRoxi1C
         GugA==
X-Forwarded-Encrypted: i=1; AJvYcCWkpUVdLg0OiyQfzKwk1bHJGD/AzkkP6Q4Ra73KtTWFbolXtti4S+YKhsIsfgeV7+WKCR+ej649cFVhGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2dlAgaTcJ1mFXJlDT6czCgPlx8wibSKIVscY15z/QlDoLs0Hz
	p35Ha446pSQop2SO39AwbkUJEYmq1AQJnP4IQYrLacHsugMMQp4+
X-Gm-Gg: ASbGncuYQHPU0uxEM6BjG6ETvKCCaim1Xmuz06T2mjb4ku4dxsgooSs5MutWz38MsfO
	KkZH1TkKV90tTiwBYboyDcha5WqxTzWzyoMIPo8Qv1nwWipO+QmmuRjGjfmAXWQIp8hZ/O1EMSb
	dediWCRUukGyvMhmQHLXdpr/mXrfPT6bAcO5r22QUWRNGmR4l4ORH81c/Z5oMRJGYRq+I7DIofi
	dV1aiNQDvwduC1md13STEKm8cawzUC4hWW/P2EkHpSUJ3D7iLqj/dvCQHo97KPYzdoyaLU/n0JK
	Sv264TNaTBaVZ2/URsMva6gr2L4sYrmfGPB7NtH1BFV1n4ogNB5eQT2mUmOv6A==
X-Google-Smtp-Source: AGHT+IEYc95Gg+A5K6HjA91IiT3JB5safTYvQdkwqGPEJmYbxDkbd6IgoGAsow3q91Tk6V+7agDrvg==
X-Received: by 2002:a17:902:e54d:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-231980c96c6mr48397085ad.2.1747235790035;
        Wed, 14 May 2025 08:16:30 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:29 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
Date: Wed, 14 May 2025 23:15:50 +0800
Message-ID: <8ea337dfd3458a5dc39a3b1892b4825899b74df3.1747235487.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081631_554285_5B2C1844 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

The sg2042 SoCs support xtheadvector [1] so it can be included in the
devicetree. Also include vlenb for the cpu. And set vlenb=16 [2].

This can be tested by passing the "mitigations=off" kernel parameter.

Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-4-236c22791ef9@rivosinc.com/ [1]
Link: https://lore.kernel.org/linux-riscv/aCO44SAoS2kIP61r@ghost/ [2]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++-------
 1 file changed, 128 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index b136b6c4128c..dcc984965b6b 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -260,7 +260,8 @@ cpu0: cpu@0 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -285,7 +286,8 @@ cpu1: cpu@1 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -310,7 +312,8 @@ cpu2: cpu@2 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -335,7 +338,8 @@ cpu3: cpu@3 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -360,7 +364,8 @@ cpu4: cpu@4 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <4>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -385,7 +390,8 @@ cpu5: cpu@5 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <5>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -410,7 +416,8 @@ cpu6: cpu@6 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <6>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -435,7 +442,8 @@ cpu7: cpu@7 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <7>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -460,7 +468,8 @@ cpu8: cpu@8 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <8>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -485,7 +494,8 @@ cpu9: cpu@9 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <9>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -510,7 +520,8 @@ cpu10: cpu@10 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <10>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -535,7 +546,8 @@ cpu11: cpu@11 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <11>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -560,7 +572,8 @@ cpu12: cpu@12 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <12>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -585,7 +598,8 @@ cpu13: cpu@13 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <13>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -610,7 +624,8 @@ cpu14: cpu@14 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <14>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -635,7 +650,8 @@ cpu15: cpu@15 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <15>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -660,7 +676,8 @@ cpu16: cpu@16 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <16>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -685,7 +702,8 @@ cpu17: cpu@17 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <17>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -710,7 +728,8 @@ cpu18: cpu@18 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <18>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -735,7 +754,8 @@ cpu19: cpu@19 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <19>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -760,7 +780,8 @@ cpu20: cpu@20 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <20>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -785,7 +806,8 @@ cpu21: cpu@21 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <21>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -810,7 +832,8 @@ cpu22: cpu@22 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <22>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -835,7 +858,8 @@ cpu23: cpu@23 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <23>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -860,7 +884,8 @@ cpu24: cpu@24 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <24>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -885,7 +910,8 @@ cpu25: cpu@25 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <25>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -910,7 +936,8 @@ cpu26: cpu@26 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <26>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -935,7 +962,8 @@ cpu27: cpu@27 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <27>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -960,7 +988,8 @@ cpu28: cpu@28 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <28>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -985,7 +1014,8 @@ cpu29: cpu@29 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <29>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <30>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <31>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <32>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <33>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <34>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <35>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <36>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <37>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <38>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <39>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <40>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <41>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <42>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <43>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <44>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <45>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <46>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <47>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <48>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <49>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <50>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <51>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <52>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <53>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <54>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <55>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <56>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <57>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <58>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <59>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <60>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <61>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <62>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "zicntr", "zicsr", "zifencei",
-					       "zihpm";
+					       "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <63>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
