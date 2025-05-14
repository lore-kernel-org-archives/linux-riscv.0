Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3C3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8xwLJ9RkdXCnckqW7trkZQyGL4Zw/gYL/iGov/AWJY=; b=yb7QJdwMPhfXJF
	ELWpbM80V84CUGCW7klWM5Z8NSx7sQIyPvqCjDzbWQ8Ko7P/YhNsXKPvWQXZSihCkgP7IfomubyUY
	yznrEUW90JjgXDDKKVY3cEp2975UWYSvfAeWM2BFotiQF2wvtnQRRwDx8qejWidG+gKtfVwJybuqX
	aQNA+YtsnmHOiuoLlPEiGab7Gp6wwAoH/5dUZTHCQzsWbR6uOxiE4DcVlnrE9My4Rw1ZwipdOYDb9
	Fe+gUzUQNjlIE3RB8S+48gB4wyV1kkUIZ/qZDEcCbnqZAYRv4Eyt6oHZrabqSft380ugAU6fznH2y
	+W1/rlrex9jTC/SNqX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfV-0000000Fge5-2Dac;
	Wed, 14 May 2025 16:09:17 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDqa-0000000FYSc-37gX
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:16:42 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b200178c011so5891411a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235800; x=1747840600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk63sxs2U7qcH/1MxMeZqMavzt0+9Gyw14EWY4Q3d8I=;
        b=ZR6Za/GKi8FvPZ6HzOH/uNGIWEQ0wMuRYox7dJGLt4OSXUO67DnPHtjB2SH1FOusi0
         EtNyce4cmquwtxG27UmjbGxQpgNnYT1SInuNTIr+t4VbLuSrDuFI4uVwu9qF3CeQVBBx
         F6ID7A7KDImlg2vKrE+HiEJHZ9pKzgBEE05WgGNxlim2Hic84qObaNrSSQjOjSmO9ERA
         SKXmS1/cgULw/peFYVvwc8v+lwRUtqOZzLhFnUjsmizYLfV7YPI7qKhk0y47efguC4Uf
         89vwm8+ZYrnM9PdQGDmCMy/3iS1sHfqfYGrqVLCdt6U8kP3Ba+9NcQqaDT19SN+awaUv
         ETTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235800; x=1747840600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk63sxs2U7qcH/1MxMeZqMavzt0+9Gyw14EWY4Q3d8I=;
        b=UfPARKpg5K0hP66m2TqKtxvEIjSPAEh8H09CGrwu4/k3a18OGCGYRTYMbUlHV38rqm
         OiBkY1q1HBRtJAaWCo3A5SThqjPxz6KQ7p77CboLpN83snJVkcLLKS1Nkalz98Qeos75
         WZBm3DCn1ikskm7CB9+pRiZ1+1DVL7viLWGB6jg1MxUCS2fqaVGFCH1DzbnsNDkIuyE3
         bi+nh5OzLa9RWx7vaZYoGwO0P7kSh+6VSFjGMoJU+fe18TZpekbvrmtp0N3vecCix5Tx
         mCxqzt2SJPCBzgEpnmRlVr5JtC66fTUIYtUb92TSxdDBpGdItOVPHQACPUf3TSM4bmE2
         Kmlg==
X-Forwarded-Encrypted: i=1; AJvYcCUdtZ7AKqX+YPH48Gt6+zzUomOWBJhNzph1KuMSPqY5hdlsbNhOPbZl6b/XbLBjDDsohtDs9XaqawbURg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu6i4MrM6RXOPA7Mj6cIkLNn9HJxoJgI16gF0yUofCfnFlB3qh
	4Y6aTFgearyvuyNahe+q/w1XzKqCRKIUWW4hZEmG98nUYcvh24bt
X-Gm-Gg: ASbGnctYr6J2Jd6CHJ1aTP27Juqy515gPm9yGrmMn7dJ53mFIUEVTKFGq8Co2OgOrFl
	TU7gHiyVd1kvbUSQ+woCD4jKYhFbD8XUewIGSdI+HQkLEaEAIcundhMKNgP/bL0g2h2PKOm02S6
	Yyx7Dx36eEe4abTvZ78vkQ1bUAD1McM8Velo51ygV0ADKGphw+gVFSqtecMIMlmId9SqUAjwL35
	1uqL0aksYGS23CnVJE4fdxozHC9V9tN/H4W5tMeslAdTeYrObf54Vehhio7pZ0Qv+Qkh7QhYMgA
	R0uYzsjfmtbFyV2uecabrcSXYFoq5EMT5DQqKD2hw96bNmyFKT+19xzymaJAVQ==
X-Google-Smtp-Source: AGHT+IFVhGXwVJA7GfrR5d/GNxff5+t7Oq4qT9e9svGDPhwAwhC/g6DCMDDErxKEOnsLKP7tWLY0Hw==
X-Received: by 2002:a17:902:ccc7:b0:223:5a6e:b2c with SMTP id d9443c01a7336-23198125a4amr56343115ad.17.1747235799045;
        Wed, 14 May 2025 08:16:39 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:38 -0700 (PDT)
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
Subject: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Date: Wed, 14 May 2025 23:15:52 +0800
Message-ID: <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747235487.git.rabenda.cn@gmail.com>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081640_788354_41BE338D 
X-CRM114-Status: UNSURE (   9.28  )
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

sg2042 support Zfh ISA extension [1].

Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1737721869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%28xrvm%29_20250124.pdf [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 256 ++++++++++----------
 1 file changed, 128 insertions(+), 128 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index f483f62ab0c4..8dd1a3c60bc4 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -256,11 +256,11 @@ core3 {
 		cpu0: cpu@0 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
@@ -283,11 +283,11 @@ cpu0_intc: interrupt-controller {
 		cpu1: cpu@1 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
@@ -310,11 +310,11 @@ cpu1_intc: interrupt-controller {
 		cpu2: cpu@2 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
@@ -337,11 +337,11 @@ cpu2_intc: interrupt-controller {
 		cpu3: cpu@3 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
@@ -364,11 +364,11 @@ cpu3_intc: interrupt-controller {
 		cpu4: cpu@4 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <4>;
@@ -391,11 +391,11 @@ cpu4_intc: interrupt-controller {
 		cpu5: cpu@5 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <5>;
@@ -418,11 +418,11 @@ cpu5_intc: interrupt-controller {
 		cpu6: cpu@6 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <6>;
@@ -445,11 +445,11 @@ cpu6_intc: interrupt-controller {
 		cpu7: cpu@7 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <7>;
@@ -472,11 +472,11 @@ cpu7_intc: interrupt-controller {
 		cpu8: cpu@8 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <8>;
@@ -499,11 +499,11 @@ cpu8_intc: interrupt-controller {
 		cpu9: cpu@9 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <9>;
@@ -526,11 +526,11 @@ cpu9_intc: interrupt-controller {
 		cpu10: cpu@10 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <10>;
@@ -553,11 +553,11 @@ cpu10_intc: interrupt-controller {
 		cpu11: cpu@11 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <11>;
@@ -580,11 +580,11 @@ cpu11_intc: interrupt-controller {
 		cpu12: cpu@12 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <12>;
@@ -607,11 +607,11 @@ cpu12_intc: interrupt-controller {
 		cpu13: cpu@13 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <13>;
@@ -634,11 +634,11 @@ cpu13_intc: interrupt-controller {
 		cpu14: cpu@14 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <14>;
@@ -661,11 +661,11 @@ cpu14_intc: interrupt-controller {
 		cpu15: cpu@15 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <15>;
@@ -688,11 +688,11 @@ cpu15_intc: interrupt-controller {
 		cpu16: cpu@16 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <16>;
@@ -715,11 +715,11 @@ cpu16_intc: interrupt-controller {
 		cpu17: cpu@17 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <17>;
@@ -742,11 +742,11 @@ cpu17_intc: interrupt-controller {
 		cpu18: cpu@18 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <18>;
@@ -769,11 +769,11 @@ cpu18_intc: interrupt-controller {
 		cpu19: cpu@19 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <19>;
@@ -796,11 +796,11 @@ cpu19_intc: interrupt-controller {
 		cpu20: cpu@20 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <20>;
@@ -823,11 +823,11 @@ cpu20_intc: interrupt-controller {
 		cpu21: cpu@21 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <21>;
@@ -850,11 +850,11 @@ cpu21_intc: interrupt-controller {
 		cpu22: cpu@22 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <22>;
@@ -877,11 +877,11 @@ cpu22_intc: interrupt-controller {
 		cpu23: cpu@23 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <23>;
@@ -904,11 +904,11 @@ cpu23_intc: interrupt-controller {
 		cpu24: cpu@24 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <24>;
@@ -931,11 +931,11 @@ cpu24_intc: interrupt-controller {
 		cpu25: cpu@25 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <25>;
@@ -958,11 +958,11 @@ cpu25_intc: interrupt-controller {
 		cpu26: cpu@26 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <26>;
@@ -985,11 +985,11 @@ cpu26_intc: interrupt-controller {
 		cpu27: cpu@27 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <27>;
@@ -1012,11 +1012,11 @@ cpu27_intc: interrupt-controller {
 		cpu28: cpu@28 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <28>;
@@ -1039,11 +1039,11 @@ cpu28_intc: interrupt-controller {
 		cpu29: cpu@29 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <29>;
@@ -1066,11 +1066,11 @@ cpu29_intc: interrupt-controller {
 		cpu30: cpu@30 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <30>;
@@ -1093,11 +1093,11 @@ cpu30_intc: interrupt-controller {
 		cpu31: cpu@31 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <31>;
@@ -1120,11 +1120,11 @@ cpu31_intc: interrupt-controller {
 		cpu32: cpu@32 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <32>;
@@ -1147,11 +1147,11 @@ cpu32_intc: interrupt-controller {
 		cpu33: cpu@33 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <33>;
@@ -1174,11 +1174,11 @@ cpu33_intc: interrupt-controller {
 		cpu34: cpu@34 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <34>;
@@ -1201,11 +1201,11 @@ cpu34_intc: interrupt-controller {
 		cpu35: cpu@35 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <35>;
@@ -1228,11 +1228,11 @@ cpu35_intc: interrupt-controller {
 		cpu36: cpu@36 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <36>;
@@ -1255,11 +1255,11 @@ cpu36_intc: interrupt-controller {
 		cpu37: cpu@37 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <37>;
@@ -1282,11 +1282,11 @@ cpu37_intc: interrupt-controller {
 		cpu38: cpu@38 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <38>;
@@ -1309,11 +1309,11 @@ cpu38_intc: interrupt-controller {
 		cpu39: cpu@39 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <39>;
@@ -1336,11 +1336,11 @@ cpu39_intc: interrupt-controller {
 		cpu40: cpu@40 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <40>;
@@ -1363,11 +1363,11 @@ cpu40_intc: interrupt-controller {
 		cpu41: cpu@41 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <41>;
@@ -1390,11 +1390,11 @@ cpu41_intc: interrupt-controller {
 		cpu42: cpu@42 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <42>;
@@ -1417,11 +1417,11 @@ cpu42_intc: interrupt-controller {
 		cpu43: cpu@43 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <43>;
@@ -1444,11 +1444,11 @@ cpu43_intc: interrupt-controller {
 		cpu44: cpu@44 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <44>;
@@ -1471,11 +1471,11 @@ cpu44_intc: interrupt-controller {
 		cpu45: cpu@45 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <45>;
@@ -1498,11 +1498,11 @@ cpu45_intc: interrupt-controller {
 		cpu46: cpu@46 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <46>;
@@ -1525,11 +1525,11 @@ cpu46_intc: interrupt-controller {
 		cpu47: cpu@47 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <47>;
@@ -1552,11 +1552,11 @@ cpu47_intc: interrupt-controller {
 		cpu48: cpu@48 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <48>;
@@ -1579,11 +1579,11 @@ cpu48_intc: interrupt-controller {
 		cpu49: cpu@49 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <49>;
@@ -1606,11 +1606,11 @@ cpu49_intc: interrupt-controller {
 		cpu50: cpu@50 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <50>;
@@ -1633,11 +1633,11 @@ cpu50_intc: interrupt-controller {
 		cpu51: cpu@51 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <51>;
@@ -1660,11 +1660,11 @@ cpu51_intc: interrupt-controller {
 		cpu52: cpu@52 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <52>;
@@ -1687,11 +1687,11 @@ cpu52_intc: interrupt-controller {
 		cpu53: cpu@53 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <53>;
@@ -1714,11 +1714,11 @@ cpu53_intc: interrupt-controller {
 		cpu54: cpu@54 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <54>;
@@ -1741,11 +1741,11 @@ cpu54_intc: interrupt-controller {
 		cpu55: cpu@55 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <55>;
@@ -1768,11 +1768,11 @@ cpu55_intc: interrupt-controller {
 		cpu56: cpu@56 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <56>;
@@ -1795,11 +1795,11 @@ cpu56_intc: interrupt-controller {
 		cpu57: cpu@57 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <57>;
@@ -1822,11 +1822,11 @@ cpu57_intc: interrupt-controller {
 		cpu58: cpu@58 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <58>;
@@ -1849,11 +1849,11 @@ cpu58_intc: interrupt-controller {
 		cpu59: cpu@59 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <59>;
@@ -1876,11 +1876,11 @@ cpu59_intc: interrupt-controller {
 		cpu60: cpu@60 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <60>;
@@ -1903,11 +1903,11 @@ cpu60_intc: interrupt-controller {
 		cpu61: cpu@61 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <61>;
@@ -1930,11 +1930,11 @@ cpu61_intc: interrupt-controller {
 		cpu62: cpu@62 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <62>;
@@ -1957,11 +1957,11 @@ cpu62_intc: interrupt-controller {
 		cpu63: cpu@63 {
 			compatible = "thead,c920", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
+			riscv,isa = "rv64imafdc_zfh";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
 					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm",
+					       "zifencei", "zihpm", "zfh",
 					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <63>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
