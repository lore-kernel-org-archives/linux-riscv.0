Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DD1CA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 20:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUYDnL/BgIRuoCW/t1FzNvvfGTEdkPP8nZDeWToFeoo=; b=CJjYeJdu5JQL+w
	Pmy918Kmp6QJN1FzayHmY0q5qDATIfPIYBPKlXRMyd67J14yep6ZlQRecQTFwTIVE1TlOzZbzu1aG
	fXE9Sft2Ym12LPbMk28bRaqH0pBFs+GavJ0KG+28k0fbhzAichd8LOSkMnoDM3WVk2NpBDmmBJnft
	vZVaC+SDTC7f4cEBa0ga3v7rHhK/JH3sPjHAzgjel4ZwfHzl+FoW7IJpV/porPI77m2Z++W+I/Ki9
	Z130W8169uRKkqt5gPnI/hJ2E7TvT9pBylUIiq3uwB5LApEdICx5IHEOiNagpKYgeEn+4vXSIthA6
	EgSxYxnsiST4v99JJSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVM-000000018Ip-0iSR;
	Thu, 18 Sep 2025 20:45:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVK-000000018ID-2VY1
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 20:45:23 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77b0a93e067so1339663b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 13:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758228322; x=1758833122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtrLIyGEWOU6fa2LicSTWFbyugqQN0mZ4i8wIx/QdRc=;
        b=kMUYTMhpw7Xx3dIQ+vGHil5ugWPAf0w5flfhQlE7lnpxpd6NYrhuzEJ+AaarAfsWsU
         hRbyhzig0jXO+FnqmkPKmk+qht22K/g+ilzg59LcVIOLTaRRELdgkkprCNfRUCZtBOov
         Ojdb5Q/sf/7svCZUcfORypsVRlzhO1mUvwGKzoX3wz/9xw0pUM+ASgYfY6te+HhDbzmk
         DntvtiGI1GRwAssCxO8ZHNDuH14psQns+E7bF2eFFcIS8zPsol0GrZ2oKGKkgxKV4wkV
         BIme4uaqYcFUGXRBl76SmJbaRX3z948469aOIeMIDEOvD09j4U0pnmBx805mWPTMYHuu
         S1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758228322; x=1758833122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtrLIyGEWOU6fa2LicSTWFbyugqQN0mZ4i8wIx/QdRc=;
        b=Kn9bMmQjz6ue4IqhGJ42uhly2EbbSe+fVWuqT5oBwQwT5C3ON3UA4+KBsynNrwvuqf
         DmDzuJFUTcx4/12+kl317WDd0br4ZP2sd3YQpuyWfirFSIqG3Knumb+XQKeLEvljahVl
         m9VQyzxSVPaflnqo0sPcoTQxMMoAJWvQC3+LOJ7k8wxKoKtpcls4rpSJi/F4VLeur8S8
         QvRIq1SL9QRlcSYlcMm9NmP6wPANpqaIS2on4MVJIMWkpgJRsyuMALz78/diF96nmcIX
         AbSknM9DPJgI1/HKqFJhPAdDUwqyF/m/gQb4p4L196eCqONgAS6Psz7gCgI5fuB7ZjXy
         Snnw==
X-Gm-Message-State: AOJu0YyAvr2wpvgiaUIq+E7xhTwq8YPP3JVW4ksu4X2n7AowBj/BHgDm
	Xg+kOTzIgmY+eaHSnLewqS2Sk82uLibnew+FGtzj49+hM1xUfJEUppNW
X-Gm-Gg: ASbGncsdlDUBLTJ0kfIxgOUoXtv1rL7ftpTeo8DzdX1M576pfejKJNuwlWUHjF+t2uO
	7A4lDs88kIhdVCsKwvSTi71DoUUEYWOAGy9wF69OsZ0rZ8YrKRqxl05dmvUBtfYie0exfObGUrT
	uMHJP0dZ7bjrka7BkE0zBzcjwDrgnP4RlA+Z+iNsJZTxpNp0lpUaoeUgwglscPTaB6xvucbUvuN
	klkE762F1T3D3W6DAejEHJ3byxZkcB+l7bdEFcFvgecKA0XzzXEvGm2bbtx+zDt6IbWtOlvkom8
	iDIBdJnKVS5V3ZrwJFS1t49u8S85sckbrIaEeURzNiewmHTnrsQp30JWVCROnABy9uSHHaJyIJO
	ms1Hz2UyiX5j8A7C+4RqbdXvlsCeVeCoDa/lrqFhvmUX5xSCCx8o=
X-Google-Smtp-Source: AGHT+IE8751B+bVDOfdJ1EVLTNVCctqoy8v2KTEAWN2TnaxEmjyaFaE2yRT5zYFCYRIrStFZWJzm6A==
X-Received: by 2002:a05:6a20:9189:b0:247:f6ab:69cc with SMTP id adf61e73a8af0-29262399d44mr1426160637.26.1758228321256;
        Thu, 18 Sep 2025 13:45:21 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35aff2sm3178181a12.1.2025.09.18.13.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 13:45:20 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: dts: thead: add ziccrse for th1520
Date: Fri, 19 Sep 2025 04:44:48 +0800
Message-ID: <71ac2ff73a63bd8674c4bc91fd287390d5339609.1758228055.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1758228055.git.rabenda.cn@gmail.com>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_134522_639988_ADA35FB3 
X-CRM114-Status: GOOD (  10.48  )
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

Existing rv64 hardware conforms to the rva20 profile.

Ziccrse is an additional extension required by the rva20 profile, so
th1520 has this extension.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 59d1927764a6..7f07688aa964 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -24,8 +24,10 @@ c910_0: cpu@0 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
@@ -49,8 +51,10 @@ c910_1: cpu@1 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
@@ -74,8 +78,10 @@ c910_2: cpu@2 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
@@ -99,8 +105,10 @@ c910_3: cpu@3 {
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "xtheadvector";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm",
+					       "xtheadvector";
 			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
