Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B71C54755
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wk4OKBipYj02zIN+di+OWJhCNt8kiKo9JrjZjnLEIPE=; b=AMxgPpfQaR8LtL
	QllAoYSUnrmYHG0V3DAEV/VIhYbua3xQAV2R6BSCZr+pZSEUy4z36uN5n/80WDnsN+gebbpaJ5rIu
	+5eEqy1IrMYeqomIZS6uktoGsnMmio732Yxq2y6kVgh0KgYcWa8xbqo0AvO7oW6ggZEml+OqV+tJc
	1yHXu4WaPMSFLv3uLuRgkI3ZS5CVC/BaLILFw0jIRX3JE75MAOeLOWJAE3KUxb/yHflLlcmaa8yWA
	qp/0oUNs+qaBClTXUztRbHxcrKLoJoCxBJh1aINs/6ob7iIMAPFvnGsNk5M2s6fcGQbYKYBaRhrV4
	x+bTb+FY3MYOFPz3yDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfU-0000000Fge1-3lnT;
	Wed, 14 May 2025 16:09:16 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDqW-0000000FYQq-1srQ
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:16:37 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b24f986674fso1039370a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235795; x=1747840595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSNshIEpt+vTNZ0iI7OJc3q9DGe0ixa+1zHMIDR3V6c=;
        b=L2zk+6xHmdspoPU1zDgk53eNEzF+GKjtpcJSqjm+qoTXGBsdaXBhCmYj404t/VS6pq
         +PSCZPhqmqCuhIJt++VAGHZYYP5PB6V6oc0EasbxHY30KXJWIRSbb/PObW3jHYlEEDir
         CuRNEUswTlRrORjdwxdBL15ZQ6MqazFCjW+M4WY15lxVI/QfwPONCWZehBjil2mU9SrX
         io5huumDKYkd4CcGHpQn4zuocTC5puN2O0bxa40NDjgKuKXBAV8eUU0k9bpKKpjGLUhy
         8rLeWOKMCyvZA0bAqmv3HjruvYibGYhjNvOPRfBRfP4muMVtd5CfApEg0J2UB4VnExww
         WfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235795; x=1747840595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSNshIEpt+vTNZ0iI7OJc3q9DGe0ixa+1zHMIDR3V6c=;
        b=S+UVnwePRZhlilpK2VBC7apcY4J4vgomSy0JLH3emlv4EupojV/guZtxRusMM2y+Df
         +joHVWoqh1u5K7m3GOXE7DezNfgX1P8Pk7QJj1f6/UbfaRyITXy5BoKc67oNVhZX50Ap
         diDhOjvqXY3YzC959Mkhc9wuh8vyBuiqDoKG1d2AqKiN9aYRTS4C4RhiLGYtmJnzDyjv
         Fxdt4UC53HsWZdg0Np/Rt3db2Op6bVoguojENIJ4rorEx/17c+P3KRsl1VLAl5Qysg8T
         sBU/A/9dFKfgp55CXbSmP4KGUZ6m2qsvK1/Io9dR05yFoh59Azu6uzGhsczAp4p2DTO8
         MlRg==
X-Forwarded-Encrypted: i=1; AJvYcCVAe2FfGF5ZKdB/H73SToogdgGVgvizBzJK3rlZVq8LB2dXp7SwKFP00hPT272ZCdfbLhdlEfWdXGc54A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDLzdj71wTSTuBQe2d7ZkvOR6uyaIvF50v8ZRrBSd/V4QE4HUP
	7ZeZixrgLqjK353P7TRVmzRotog4d+//20onSyMJjZn4YgaH1A36
X-Gm-Gg: ASbGnct1HM3Ow8U43/lzyfgTqzptQPMO3HMc34gkd9JvnhC1QOP9hy8RewZ4veo+Q1n
	XfCTNGuEldP6dEmu1KzBE13JRVbW1PR1BIbtHNYmHlTwd7EMnArAdSzeP/gH4plfDMbEzMffZhM
	pgR7uGVY0Mr8PTIu8v0OzMrlMWxwCJoi+UWm7xa/Un+AdUBe+Wul8Km/bbpTeBbqXS8b8tPv173
	H/p9psTieJ3pifKepSlgqJfV4duBBFlD/qu3bHbYMVHBh3/8HDWrcpY307PJe58MrR+FDmHrm58
	9NoEpZZC56FX/qQKerIyHvcAKtKatjz2QJwxhVZE0SAC/tDue3VoaIozSlvW4A==
X-Google-Smtp-Source: AGHT+IF1o8jBmrhnpa1/qEJx34l0Eeelr8gGTDl0Wl9z0XMZh2PZTHOtD360cJa9S7hmGWNdbhjaSw==
X-Received: by 2002:a17:903:3c26:b0:215:58be:334e with SMTP id d9443c01a7336-23197f3877emr60300035ad.10.1747235794425;
        Wed, 14 May 2025 08:16:34 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:34 -0700 (PDT)
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
Subject: [PATCH v2 2/3] riscv: dts: sophgo: add ziccrse for sg2042
Date: Wed, 14 May 2025 23:15:51 +0800
Message-ID: <158b561a96e12c1d45a6b96d2039e03448ebea62.1747235487.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081636_512698_59B5F323 
X-CRM114-Status: UNSURE (   8.73  )
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

sg2042 support Ziccrse ISA extension [1].

Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 320 ++++++++++++--------
 1 file changed, 192 insertions(+), 128 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index dcc984965b6b..f483f62ab0c4 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -259,8 +259,9 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
@@ -285,8 +286,9 @@ cpu1: cpu@1 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
@@ -311,8 +313,9 @@ cpu2: cpu@2 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
@@ -337,8 +340,9 @@ cpu3: cpu@3 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
@@ -363,8 +367,9 @@ cpu4: cpu@4 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <4>;
 			i-cache-block-size = <64>;
@@ -389,8 +394,9 @@ cpu5: cpu@5 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <5>;
 			i-cache-block-size = <64>;
@@ -415,8 +421,9 @@ cpu6: cpu@6 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <6>;
 			i-cache-block-size = <64>;
@@ -441,8 +448,9 @@ cpu7: cpu@7 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <7>;
 			i-cache-block-size = <64>;
@@ -467,8 +475,9 @@ cpu8: cpu@8 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <8>;
 			i-cache-block-size = <64>;
@@ -493,8 +502,9 @@ cpu9: cpu@9 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <9>;
 			i-cache-block-size = <64>;
@@ -519,8 +529,9 @@ cpu10: cpu@10 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <10>;
 			i-cache-block-size = <64>;
@@ -545,8 +556,9 @@ cpu11: cpu@11 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <11>;
 			i-cache-block-size = <64>;
@@ -571,8 +583,9 @@ cpu12: cpu@12 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <12>;
 			i-cache-block-size = <64>;
@@ -597,8 +610,9 @@ cpu13: cpu@13 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <13>;
 			i-cache-block-size = <64>;
@@ -623,8 +637,9 @@ cpu14: cpu@14 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <14>;
 			i-cache-block-size = <64>;
@@ -649,8 +664,9 @@ cpu15: cpu@15 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <15>;
 			i-cache-block-size = <64>;
@@ -675,8 +691,9 @@ cpu16: cpu@16 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <16>;
 			i-cache-block-size = <64>;
@@ -701,8 +718,9 @@ cpu17: cpu@17 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <17>;
 			i-cache-block-size = <64>;
@@ -727,8 +745,9 @@ cpu18: cpu@18 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <18>;
 			i-cache-block-size = <64>;
@@ -753,8 +772,9 @@ cpu19: cpu@19 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <19>;
 			i-cache-block-size = <64>;
@@ -779,8 +799,9 @@ cpu20: cpu@20 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <20>;
 			i-cache-block-size = <64>;
@@ -805,8 +826,9 @@ cpu21: cpu@21 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <21>;
 			i-cache-block-size = <64>;
@@ -831,8 +853,9 @@ cpu22: cpu@22 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <22>;
 			i-cache-block-size = <64>;
@@ -857,8 +880,9 @@ cpu23: cpu@23 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <23>;
 			i-cache-block-size = <64>;
@@ -883,8 +907,9 @@ cpu24: cpu@24 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <24>;
 			i-cache-block-size = <64>;
@@ -909,8 +934,9 @@ cpu25: cpu@25 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <25>;
 			i-cache-block-size = <64>;
@@ -935,8 +961,9 @@ cpu26: cpu@26 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <26>;
 			i-cache-block-size = <64>;
@@ -961,8 +988,9 @@ cpu27: cpu@27 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <27>;
 			i-cache-block-size = <64>;
@@ -987,8 +1015,9 @@ cpu28: cpu@28 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <28>;
 			i-cache-block-size = <64>;
@@ -1013,8 +1042,9 @@ cpu29: cpu@29 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <29>;
 			i-cache-block-size = <64>;
@@ -1039,8 +1069,9 @@ cpu30: cpu@30 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <30>;
 			i-cache-block-size = <64>;
@@ -1065,8 +1096,9 @@ cpu31: cpu@31 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <31>;
 			i-cache-block-size = <64>;
@@ -1091,8 +1123,9 @@ cpu32: cpu@32 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <32>;
 			i-cache-block-size = <64>;
@@ -1117,8 +1150,9 @@ cpu33: cpu@33 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <33>;
 			i-cache-block-size = <64>;
@@ -1143,8 +1177,9 @@ cpu34: cpu@34 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <34>;
 			i-cache-block-size = <64>;
@@ -1169,8 +1204,9 @@ cpu35: cpu@35 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <35>;
 			i-cache-block-size = <64>;
@@ -1195,8 +1231,9 @@ cpu36: cpu@36 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <36>;
 			i-cache-block-size = <64>;
@@ -1221,8 +1258,9 @@ cpu37: cpu@37 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <37>;
 			i-cache-block-size = <64>;
@@ -1247,8 +1285,9 @@ cpu38: cpu@38 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <38>;
 			i-cache-block-size = <64>;
@@ -1273,8 +1312,9 @@ cpu39: cpu@39 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <39>;
 			i-cache-block-size = <64>;
@@ -1299,8 +1339,9 @@ cpu40: cpu@40 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <40>;
 			i-cache-block-size = <64>;
@@ -1325,8 +1366,9 @@ cpu41: cpu@41 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <41>;
 			i-cache-block-size = <64>;
@@ -1351,8 +1393,9 @@ cpu42: cpu@42 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <42>;
 			i-cache-block-size = <64>;
@@ -1377,8 +1420,9 @@ cpu43: cpu@43 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <43>;
 			i-cache-block-size = <64>;
@@ -1403,8 +1447,9 @@ cpu44: cpu@44 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <44>;
 			i-cache-block-size = <64>;
@@ -1429,8 +1474,9 @@ cpu45: cpu@45 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <45>;
 			i-cache-block-size = <64>;
@@ -1455,8 +1501,9 @@ cpu46: cpu@46 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <46>;
 			i-cache-block-size = <64>;
@@ -1481,8 +1528,9 @@ cpu47: cpu@47 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <47>;
 			i-cache-block-size = <64>;
@@ -1507,8 +1555,9 @@ cpu48: cpu@48 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <48>;
 			i-cache-block-size = <64>;
@@ -1533,8 +1582,9 @@ cpu49: cpu@49 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <49>;
 			i-cache-block-size = <64>;
@@ -1559,8 +1609,9 @@ cpu50: cpu@50 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <50>;
 			i-cache-block-size = <64>;
@@ -1585,8 +1636,9 @@ cpu51: cpu@51 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <51>;
 			i-cache-block-size = <64>;
@@ -1611,8 +1663,9 @@ cpu52: cpu@52 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <52>;
 			i-cache-block-size = <64>;
@@ -1637,8 +1690,9 @@ cpu53: cpu@53 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <53>;
 			i-cache-block-size = <64>;
@@ -1663,8 +1717,9 @@ cpu54: cpu@54 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <54>;
 			i-cache-block-size = <64>;
@@ -1689,8 +1744,9 @@ cpu55: cpu@55 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <55>;
 			i-cache-block-size = <64>;
@@ -1715,8 +1771,9 @@ cpu56: cpu@56 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <56>;
 			i-cache-block-size = <64>;
@@ -1741,8 +1798,9 @@ cpu57: cpu@57 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <57>;
 			i-cache-block-size = <64>;
@@ -1767,8 +1825,9 @@ cpu58: cpu@58 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <58>;
 			i-cache-block-size = <64>;
@@ -1793,8 +1852,9 @@ cpu59: cpu@59 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <59>;
 			i-cache-block-size = <64>;
@@ -1819,8 +1879,9 @@ cpu60: cpu@60 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <60>;
 			i-cache-block-size = <64>;
@@ -1845,8 +1906,9 @@ cpu61: cpu@61 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <61>;
 			i-cache-block-size = <64>;
@@ -1871,8 +1933,9 @@ cpu62: cpu@62 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <62>;
 			i-cache-block-size = <64>;
@@ -1897,8 +1960,9 @@ cpu63: cpu@63 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "zicntr", "zicsr", "zifencei",
-					       "zihpm", "xtheadvector";
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <63>;
 			i-cache-block-size = <64>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
