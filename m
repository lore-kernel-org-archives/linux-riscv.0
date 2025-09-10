Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7B0CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 10:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F0Xc3frNbod66wVYFC9rTgH67DNTNvCswpSEdyX/7r8=; b=gqR11oO87F4kVA
	JSsDSl8z1tMc4Pzae+MAf7C5VxEGScKlxhVOYxdHcOjCMYgvSAOl82X7sxRu2yABq/OElABlWUv0e
	GKsIqZ8ewLigIRv/urpsHVKfxXqiZJiXCruU2k7EXFJDcmBkVE6nb+abiA2grq75amRQmBItq4dDK
	Bz3wRqaws4l57b8St9xILD4dgCt4IlGMEU1UrbQ/8+c3PwYfiddxjdUv1NKUNj9fl7o4M3iKSCThP
	KUBsMiY8k4NfTjTWUOMQhz5nY1I5VOF3NIZGubjBNzIl8IbWE6A9PYNKMu/14pcMlwLVfJV7B4wpN
	TOI7oL7kV0ycU1Q/3BJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIUZ-0000000DehC-3St5;
	Wed, 10 Sep 2025 10:55:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIUX-0000000DefN-2flx
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 10:55:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24c863e852aso59917945ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 03:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501756; x=1758106556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7GXWw8MaeHW/oWTutEt1o2w6pMSijMTWoDbapjmuta4=;
        b=irlWpkzHgZ98MTD06SQIqH/n8nZfrWwtDEXesk3iE7XfY5UkARVbXf4CnTiqfSW1OO
         3L88gN0D+em3aYqoWfNk6hP2vFtjKrSAP+pCofiBkruPYi9Y5WRKP4O56/a3WBUYASZf
         7USZcWa9W3UKl/DJFtOVXfxA2kjAgPH4+UlzLMDiM2G2LJGh2H24dAjg0s3jg1B/pgwe
         tXi6w4JcX7htc3jtd4z4uEUxPwCHaCbDiWexmJDN2Yjp0aAJCI9MNYFVMVmwlKRzKRBl
         dBjSmDmU8gUClQok8UzI1Rzy7FQ0qBs4kGZB/P6YKyOBoWarcbN+crzvtPRP94blqeFK
         lWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501756; x=1758106556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GXWw8MaeHW/oWTutEt1o2w6pMSijMTWoDbapjmuta4=;
        b=wYLNKC/UCi1bQQxl6sr4AgSN8dI6s5f04R4uWnjaC6ZpToQVhJOTiuJoeWI+HpgDhI
         CB8BavLhlStO+mc444ZC0mRoSVYCbR/N+6ztnGNIhB7ZptgK9St9VXZ1HGg67e1J4ewt
         2weKmJ6yRU1YPp6wgaaDw53pZTnjwUd5FC7FbjLXWlkww7Be9h25tVRdBhVMXjMUz9GN
         +DBS34ebazYGC1QwAkiKS39dQyr7EquOsE3R+cY6sGmdX1atY4J9bYoTdSBDQoF7OMYx
         vWR89+SC+oI4bH5DFIHX54tYsIt74Jg+10eSQcvdZkI9Z6TfmbWY/hxMUnuBwT/UAxH4
         fsUA==
X-Gm-Message-State: AOJu0Yyxn0aXYy2vXWwB7qfq1HChpcWxUBRLxI3c9ZtAw6YaQvzcMZXu
	07I8vtTb3k/vN+XQp4f1v5xWhULBe2/etXez1PhO4JXff3EMqq1OGcTc
X-Gm-Gg: ASbGnct8lSckasdgOUHo6Ga52TiqHNfN3uWNxkuPm5cMUM3Q0z1G3fgG2qyIuXdMzWO
	4s1RUDs5TYn/3Wspft9e+Ou0q59VyT6eyJCeBjHuQIZkU7V/BD2Kswm6YELSpEgcpMhcXuFjzMr
	/x8iUD0Wt0uy1RwkqkAbY6Voz9QvJYg1fQrWfKaf0utQIIHaOflnRD10NcFxPtCisJsFl9hxwaz
	Z+5+wrHuydY0tWsLrRcuVP76zzNCPCndStk3sYYMvzHUwkuXYpTxuj2SzHpfkbaz3zttc+Iyy1O
	EOGago3yuqYDpvVpvo7NSflfzAo1G9XV9JzyeVX/BK0dmJaJEg7feVKuiDGawhyiWyTFUoDMLtK
	6UyNyPOKGSvVXtyc4tvngVAa28MQjoaK+
X-Google-Smtp-Source: AGHT+IEc1SZvL9menS2CCGzMWuE65vRhggNsjQ+wsTtnGKyo5BGQkanHUlzqFtbunROhAfHt5DJDzA==
X-Received: by 2002:a17:902:e843:b0:24c:7f2f:d9e6 with SMTP id d9443c01a7336-2516d81a032mr191413965ad.10.1757501755737;
        Wed, 10 Sep 2025 03:55:55 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2a922630sm23903705ad.104.2025.09.10.03.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:55:55 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dts: sophgo: sg2042: added numa id description
Date: Wed, 10 Sep 2025 18:55:31 +0800
Message-ID: <20250910105531.519897-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_035557_703986_BC2E565E 
X-CRM114-Status: UNSURE (   8.17  )
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

According to the description of [1], sg2042 is divided into 4 numa.
STREAM test performance will improve.

Before:
Function    Best Rate MB/s  Avg time     Min time     Max time
Copy:           10739.7     0.015687     0.014898     0.016385
Scale:          10865.9     0.015628     0.014725     0.016757
Add:            10622.3     0.023276     0.022594     0.023899
Triad:          10583.4     0.023653     0.022677     0.024761

After:
Function    Best Rate MB/s  Avg time     Min time     Max time
Copy:           34254.9     0.005142     0.004671     0.005995
Scale:          37735.5     0.004752     0.004240     0.005407
Add:            44206.8     0.005983     0.005429     0.006461
Triad:          43040.6     0.006320     0.005576     0.006996

[1] https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/pic/mesh.png

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 64 +++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi      | 20 +++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
index 77ded5304272..94a4b71acad3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
@@ -272,6 +272,7 @@ cpu0: cpu@0 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache0>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -299,6 +300,7 @@ cpu1: cpu@1 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache0>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -326,6 +328,7 @@ cpu2: cpu@2 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache0>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -353,6 +356,7 @@ cpu3: cpu@3 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache0>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -380,6 +384,7 @@ cpu4: cpu@4 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache1>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu4_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -407,6 +412,7 @@ cpu5: cpu@5 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache1>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu5_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -434,6 +440,7 @@ cpu6: cpu@6 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache1>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu6_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -461,6 +468,7 @@ cpu7: cpu@7 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache1>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu7_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -488,6 +496,7 @@ cpu8: cpu@8 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache4>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu8_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -515,6 +524,7 @@ cpu9: cpu@9 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache4>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu9_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -542,6 +552,7 @@ cpu10: cpu@10 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache4>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu10_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -569,6 +580,7 @@ cpu11: cpu@11 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache4>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu11_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -596,6 +608,7 @@ cpu12: cpu@12 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache5>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu12_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -623,6 +636,7 @@ cpu13: cpu@13 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache5>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu13_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -650,6 +664,7 @@ cpu14: cpu@14 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache5>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu14_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -677,6 +692,7 @@ cpu15: cpu@15 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache5>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu15_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -704,6 +720,7 @@ cpu16: cpu@16 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache2>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu16_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -731,6 +748,7 @@ cpu17: cpu@17 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache2>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu17_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -758,6 +776,7 @@ cpu18: cpu@18 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache2>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu18_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -785,6 +804,7 @@ cpu19: cpu@19 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache2>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu19_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -812,6 +832,7 @@ cpu20: cpu@20 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache3>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu20_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -839,6 +860,7 @@ cpu21: cpu@21 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache3>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu21_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -866,6 +888,7 @@ cpu22: cpu@22 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache3>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu22_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -893,6 +916,7 @@ cpu23: cpu@23 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache3>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <0>;
 
 			cpu23_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -920,6 +944,7 @@ cpu24: cpu@24 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache6>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu24_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -947,6 +972,7 @@ cpu25: cpu@25 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache6>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu25_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -974,6 +1000,7 @@ cpu26: cpu@26 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache6>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu26_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1001,6 +1028,7 @@ cpu27: cpu@27 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache6>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu27_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1028,6 +1056,7 @@ cpu28: cpu@28 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache7>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu28_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1055,6 +1084,7 @@ cpu29: cpu@29 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache7>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu29_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1082,6 +1112,7 @@ cpu30: cpu@30 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache7>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu30_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1109,6 +1140,7 @@ cpu31: cpu@31 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache7>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <1>;
 
 			cpu31_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1136,6 +1168,7 @@ cpu32: cpu@32 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache8>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu32_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1163,6 +1196,7 @@ cpu33: cpu@33 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache8>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu33_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1190,6 +1224,7 @@ cpu34: cpu@34 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache8>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu34_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1217,6 +1252,7 @@ cpu35: cpu@35 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache8>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu35_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1244,6 +1280,7 @@ cpu36: cpu@36 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache9>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu36_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1271,6 +1308,7 @@ cpu37: cpu@37 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache9>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu37_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1298,6 +1336,7 @@ cpu38: cpu@38 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache9>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu38_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1325,6 +1364,7 @@ cpu39: cpu@39 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache9>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu39_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1352,6 +1392,7 @@ cpu40: cpu@40 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache12>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu40_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1379,6 +1420,7 @@ cpu41: cpu@41 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache12>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu41_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1406,6 +1448,7 @@ cpu42: cpu@42 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache12>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu42_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1433,6 +1476,7 @@ cpu43: cpu@43 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache12>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu43_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1460,6 +1504,7 @@ cpu44: cpu@44 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache13>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu44_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1487,6 +1532,7 @@ cpu45: cpu@45 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache13>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu45_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1514,6 +1560,7 @@ cpu46: cpu@46 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache13>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu46_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1541,6 +1588,7 @@ cpu47: cpu@47 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache13>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu47_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1568,6 +1616,7 @@ cpu48: cpu@48 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache10>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu48_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1595,6 +1644,7 @@ cpu49: cpu@49 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache10>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu49_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1622,6 +1672,7 @@ cpu50: cpu@50 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache10>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu50_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1649,6 +1700,7 @@ cpu51: cpu@51 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache10>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu51_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1676,6 +1728,7 @@ cpu52: cpu@52 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache11>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu52_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1703,6 +1756,7 @@ cpu53: cpu@53 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache11>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu53_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1730,6 +1784,7 @@ cpu54: cpu@54 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache11>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu54_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1757,6 +1812,7 @@ cpu55: cpu@55 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache11>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <2>;
 
 			cpu55_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1784,6 +1840,7 @@ cpu56: cpu@56 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache14>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu56_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1811,6 +1868,7 @@ cpu57: cpu@57 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache14>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu57_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1838,6 +1896,7 @@ cpu58: cpu@58 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache14>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu58_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1865,6 +1924,7 @@ cpu59: cpu@59 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache14>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu59_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1892,6 +1952,7 @@ cpu60: cpu@60 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache15>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu60_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1919,6 +1980,7 @@ cpu61: cpu@61 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache15>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu61_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1946,6 +2008,7 @@ cpu62: cpu@62 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache15>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu62_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -1973,6 +2036,7 @@ cpu63: cpu@63 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache15>;
 			mmu-type = "riscv,sv39";
+			numa-node-id = <3>;
 
 			cpu63_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..029561b6ad81 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -19,6 +19,26 @@ / {
 	#size-cells = <2>;
 	dma-noncoherent;
 
+	distance-map {
+		compatible = "numa-distance-map-v1";
+		distance-matrix = <0 0 10>,
+				  <0 1 15>,
+				  <0 2 25>,
+				  <0 3 30>,
+				  <1 0 15>,
+				  <1 1 10>,
+				  <1 2 30>,
+				  <1 3 25>,
+				  <2 0 25>,
+				  <2 1 30>,
+				  <2 2 10>,
+				  <2 3 15>,
+				  <3 0 30>,
+				  <3 1 25>,
+				  <3 2 15>,
+				  <3 3 10>;
+	};
+
 	aliases {
 		serial0 = &uart0;
 	};
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
