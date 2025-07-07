Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76DEC83F09
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yjQltvTpvrhdrwJKQP3suyNZfLqu1CSDlNFVpx27EMM=; b=4lCKVgjiSl6zfX
	pbQbBSA3+in5pyJm+wHts7TOn7PAn9WcMZK4J3A4Y8/inNnsP65FnCGKRqvbavytX/OKsH4FxQZkL
	mfG14d54yorKjKAB9+IpeS8Jd3mZ7y+0pGoYzHf8NO25fjCmuo1r59WkDyrjxwFOEI1vsaAWYY2i4
	h8PFL71DUHsoga8BOPk8Q//Z9I4Zhd0pxOfYniwquhiFS9fsdULumeErzjsJNFJbS9O8HhM/3lwh+
	HMMJH7wYinzKClV09Rzw40Nlne+u5Vj8x/QtaadjVknViXV+vUsTlCMhlbeCY2O0fgsS8Q1BeNfP9
	r0TSVRsoWRWfBTldpNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcVZ-00000001Hy4-1zNY;
	Mon, 07 Jul 2025 03:27:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcKM-00000001H5V-2XaE
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 03:15:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3121aed2435so2575101a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 20:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751858133; x=1752462933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgHuIQzRjbIGIw97Rf0Y5kwsfcFv4NN7YtxkMOdOJDQ=;
        b=F9BeUaJsq+nqu6Dh0ZHfOB3S9U5piNFnH/Oyxn9DyIDeoDuk1BiNH2MpGj1VDz7aTS
         e15FCQH5gtivFyqG0DlSH8L6JgAovCve9ppwYknJpXPeHLrMoGSrBpbOVu5FFHNBl1h8
         swP8EyYRHdNZWdGlPlrMtKKbwVtzmCYpkbP99sdM/YFpSIztKaqHh2nrcsL/vT9Qk2kg
         uafMvbWlL87JNg2ozGnfKZgaw+I4Po2EU3fRKYSCVnM6SQ8GyGDlVaDWeDW1jBpnzi4/
         uGOrZVTRJnno5nX8PU4hfgliJvcmi70EAjyDpE/GMywFxpPsjh0tkWHjx3vBbwWHa8B7
         9uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751858133; x=1752462933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgHuIQzRjbIGIw97Rf0Y5kwsfcFv4NN7YtxkMOdOJDQ=;
        b=f8+sSKg0kKhW2BIOdzV3QFwI260qrd6cIS3+GBgUSuPqJFnuNCzbCe3xqamSJCVQko
         Cg0mO8UXodJBmZHdhza3FCXKLOOyqhg9pDapEFHfno+3e8lit5iX28XK4ZF+q3QbEmD2
         osJ6YV2CD4Nm8N6e+3nurxB/Mnf2oPdZIoweTZ5jCATi9R5pgTqmBxDnNnT4ttkTSLrJ
         S2x+R2X0zE/MMIXigaJ7CMjTw8HfJuo41eql28HRwqNXX83u6uqxa8BXhcenIJeXMQ5Q
         19RMVEKymjauc6jngNa07pF9rH7tEe3xGeNXSRGewxBB2x2uVWuz8SYwwKIHo0OQY0IV
         K1AA==
X-Forwarded-Encrypted: i=1; AJvYcCXeSbF4DVpgEBYLUOOYhmg1dvZbbrpx9P1R6QVcTfsjpYzPDreNcN3lqx+UgbyQH2z1lZ7BYxtBKLeLfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLrQ6ioHZBksyAZ0F6mE7s+U1wgrXqY/vOop6BT6v7U5RJ3KDu
	XLDPdLIbneVN1Rwc9guTf/TCEQnwIg3/TXnm7mUS0DK6MBQOmj3mAuki
X-Gm-Gg: ASbGnctHIwYMamRE9lUpLl6XmGJTo7Q9UcnEqVuTZuIkrIGM6S4XgDrgMEaA9Moq+zs
	iyR8fi1i3NmkQ9fyHbJcA50BC3vrmTQqx6GOdt01Toaf6cXg6jFCHba/g6G/2mg48Cki5HIO/NW
	xV20wWLh+h3kOjoqDw/2HugWozacEYN74XvjJP55hkUvCyI6jUTsIrf0xGYso0Dcn6ZgXVKrqy1
	xyGOIlmsljSKglVoX+yesQHYyuCfNq6KNErbUov7gn7+FT3pLPxe6/p9uXT4aWSSRlLcXyXipzj
	HJSjC8XI4gHYvHAeRJkT5NYYurPOPMoHwX7p+Y76pgLIK1Rsgy1RBV01qlXCfpync0pxKoN1
X-Google-Smtp-Source: AGHT+IGXz4bB9fC0ERMdWP3sqXc37lcw/itXqrImuUxIiatFHgAm22uKTwWtbMW3rqXMQWhe16XmGg==
X-Received: by 2002:a17:90b:2e84:b0:313:279d:665c with SMTP id 98e67ed59e1d1-31aba822176mr11446220a91.7.1751858132780;
        Sun, 06 Jul 2025 20:15:32 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaaf5ac85sm7579800a91.40.2025.07.06.20.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:15:32 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: sg2044: add ziccrse extension
Date: Mon,  7 Jul 2025 11:15:18 +0800
Message-ID: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_201534_667277_9453E820 
X-CRM114-Status: UNSURE (   7.88  )
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

sg2044 support ziccrse extension.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++----------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 2a4267078ce6..1f31bec58a93 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -32,7 +32,7 @@ cpu0: cpu@0 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -67,7 +67,7 @@ cpu1: cpu@1 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -102,7 +102,7 @@ cpu2: cpu@2 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -137,7 +137,7 @@ cpu3: cpu@3 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -172,7 +172,7 @@ cpu4: cpu@4 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -207,7 +207,7 @@ cpu5: cpu@5 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -242,7 +242,7 @@ cpu6: cpu@6 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -277,7 +277,7 @@ cpu7: cpu@7 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -312,7 +312,7 @@ cpu8: cpu@8 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -347,7 +347,7 @@ cpu9: cpu@9 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -382,7 +382,7 @@ cpu10: cpu@10 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -417,7 +417,7 @@ cpu11: cpu@11 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -452,7 +452,7 @@ cpu12: cpu@12 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -487,7 +487,7 @@ cpu13: cpu@13 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -522,7 +522,7 @@ cpu14: cpu@14 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -557,7 +557,7 @@ cpu15: cpu@15 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -592,7 +592,7 @@ cpu16: cpu@16 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -627,7 +627,7 @@ cpu17: cpu@17 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -662,7 +662,7 @@ cpu18: cpu@18 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -697,7 +697,7 @@ cpu19: cpu@19 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -732,7 +732,7 @@ cpu20: cpu@20 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -767,7 +767,7 @@ cpu21: cpu@21 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -802,7 +802,7 @@ cpu22: cpu@22 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -837,7 +837,7 @@ cpu23: cpu@23 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -872,7 +872,7 @@ cpu24: cpu@24 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -907,7 +907,7 @@ cpu25: cpu@25 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -942,7 +942,7 @@ cpu26: cpu@26 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -977,7 +977,7 @@ cpu27: cpu@27 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1012,7 +1012,7 @@ cpu28: cpu@28 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1047,7 +1047,7 @@ cpu29: cpu@29 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1082,7 +1082,7 @@ cpu30: cpu@30 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1117,7 +1117,7 @@ cpu31: cpu@31 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1152,7 +1152,7 @@ cpu32: cpu@32 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1187,7 +1187,7 @@ cpu33: cpu@33 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1222,7 +1222,7 @@ cpu34: cpu@34 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1257,7 +1257,7 @@ cpu35: cpu@35 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1292,7 +1292,7 @@ cpu36: cpu@36 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1327,7 +1327,7 @@ cpu37: cpu@37 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1362,7 +1362,7 @@ cpu38: cpu@38 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1397,7 +1397,7 @@ cpu39: cpu@39 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1432,7 +1432,7 @@ cpu40: cpu@40 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1467,7 +1467,7 @@ cpu41: cpu@41 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1502,7 +1502,7 @@ cpu42: cpu@42 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1537,7 +1537,7 @@ cpu43: cpu@43 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1572,7 +1572,7 @@ cpu44: cpu@44 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1607,7 +1607,7 @@ cpu45: cpu@45 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1642,7 +1642,7 @@ cpu46: cpu@46 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1677,7 +1677,7 @@ cpu47: cpu@47 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1712,7 +1712,7 @@ cpu48: cpu@48 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1747,7 +1747,7 @@ cpu49: cpu@49 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1782,7 +1782,7 @@ cpu50: cpu@50 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1817,7 +1817,7 @@ cpu51: cpu@51 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1852,7 +1852,7 @@ cpu52: cpu@52 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1887,7 +1887,7 @@ cpu53: cpu@53 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1922,7 +1922,7 @@ cpu54: cpu@54 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1957,7 +1957,7 @@ cpu55: cpu@55 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -1992,7 +1992,7 @@ cpu56: cpu@56 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2027,7 +2027,7 @@ cpu57: cpu@57 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2062,7 +2062,7 @@ cpu58: cpu@58 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2097,7 +2097,7 @@ cpu59: cpu@59 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2132,7 +2132,7 @@ cpu60: cpu@60 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2167,7 +2167,7 @@ cpu61: cpu@61 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2202,7 +2202,7 @@ cpu62: cpu@62 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
@@ -2237,7 +2237,7 @@ cpu63: cpu@63 {
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
 					       "zfa", "zfbfmin", "zfh", "zfhmin",
-					       "zicbom", "zicbop", "zicboz",
+					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
 					       "zvfbfmin", "zvfbfwma", "zvfh",
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
