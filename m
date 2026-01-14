Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E06D3CC84
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 23:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UX0QTV0kfIcqIAdR9mMScQIj8MPniRLMrD5nlBonBwQ=; b=JFyWADXW8RfZi9
	ToyME3bZni5ybd9hNQi528UVWBZxymt+bIdVY62oLcENWAYlLSdT3DBZ/3jQwcBf1O2hnkcbtv2vy
	12Rib2svjHYMJ5dTaz00FpGalCfCo8wBEGSz/EdT++plKwIBUN8Kli5iCtsJZcUrDekIUqeyh/5yc
	ikQ43GPH/s/F/79ZF+UVsthHg+EAHn+1J0SxmF22P+BsUaTcNW/NdR1mr5TLlle4yNU58/jwEju8F
	PMHAv+St0c72/QI9KKNRJAxALELgSikRQp69Ex+d3ZsgrOqWaLUgvhiEJsrdIY373E43wEGsCpTVu
	gyfufK5sCoGsZzmUfSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA9L-0000000B4Kq-3cpD;
	Wed, 14 Jan 2026 23:19:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA9J-0000000B4He-0A9u
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 23:19:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29f102b013fso3660115ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 15:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432776; x=1769037576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH2fdyuJzA/r4nCwD9bqyqAYCMVx76+tEK4L4ktZ6KE=;
        b=BeO2tHNFme2SQz79VhqBagpoI1103aBZ/QqwDx0uIDYz+GxGopGwBr5kwsFkcqSd+e
         MwDUppgozeDWPpLV+SXGwjj9YaMFUYeWYFlgnpnHvTZIZghKaOHk6Hfu3aSDrM9tWut7
         nau8ODMqUfaM3fWW512MXWnkMzLT7j8r+DOPLw+GvpekWsa+bS9ue9gq0C+ELAIoqpmd
         2/uEO1iVQpxzxa0PX1dYS3P0yjGd33eNTzCBJcUOX6mzEc/f+vSDxUEnhTD07DtZchvW
         A7fAnxEzofouwYPb94oUYAcU8/SmApuPjSa+9vSmRpjVHYIWt6TJB6qMbaxAZdxIpHzS
         zz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432776; x=1769037576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hH2fdyuJzA/r4nCwD9bqyqAYCMVx76+tEK4L4ktZ6KE=;
        b=nop+KONLgHA/qakY+8lyQlJllIKSmlce8P/AhTY3+MIRv3wne0hpcJ+Qd5ca8K39Nh
         EjA6QwJZxKBcSFEoXQjpYnwLM3ojxyi2Iki+y3svdP2TW2RjaF2yNbH3A4xGvZOE3HWJ
         YnZAV9q92BL2kBC6BJGBNQgGvXY9hh8tpJaWQGEfwbajcX/GZKcwMHpoOT1bnkttsPBu
         mdswa2Hmt7VjUsxLWqESC7DyPijkEoIRCQrJAhio5qBqa8GmFtl85qg696XEAhSQBT9y
         CLpV1SJe4T5VGcGeLEY33mx9LHDRRLe6xKqj7iejbuyjWaWt8A7B0J93N45NS7Igkua3
         sxqg==
X-Forwarded-Encrypted: i=1; AJvYcCVZWrVrz9aC48VjPNg+C8+z/f6jmwDdtXjGDLMOBTpC4Mzap7r/LSDu23MWNhE+jjEl9Tkr3SE/jCrTxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM3gKvJPlVpoNb5gG0/98F+qM1wbqpASwFJRB43Knb17YJZ2Ry
	x88xTnza38rVHwpiGUlsEBxHc9c/CCiJZF28P7tX7wwUi0GIjEjq+cF5oKkmjmfKAmU=
X-Gm-Gg: AY/fxX7icVCYuIxteqgpBMf3K4CuLqU7FQcMlt4msYkxkCMEEptgaD2eA/MFGUnl70J
	BaXKzEBPYLCGVllohrfUbhr7s2vtSxdW1yXxYp418GuXZ/oXEuSaxeLuot+f8/GI73oV+GkLJQb
	Y2d7xIoEksogXAiCZ6rhkPXdmoSJ1aVQvGK667ojct3Uk0hayiLuQD93KVbxVhDCqMpRlE56mtu
	7gzX+pvjT2ABlIrCplib8C2KAba7AHqRD3pvTcU/Ek1cpBJO//6eAAJEYphRCAP2w6fnbkQpKs4
	1Zl709eUwI3FO8DIQCH9iZ6jHbCs1uEu7W811rqWZB/e/sO47/Fj1apXSxk9y81f+pdWDQ8rRPa
	GkIFiQNHGr6f5HLqNZfpUBnri/kE2XR/bxJSggBKVB/+h11glyDWw6bmMKFur1acv3FdgbBjFrY
	AXfYMrBBkPHaepdnJlXBCqeRcBUZIe0cvJ4jmdod9h9tnc8l61LJz4uA==
X-Received: by 2002:a17:902:f68e:b0:295:543a:f7e3 with SMTP id d9443c01a7336-2a599dbf680mr41755545ad.27.1768432776367;
        Wed, 14 Jan 2026 15:19:36 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:36 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:19:00 +0800
Subject: [PATCH v2 4/4] riscv: dts: spacemit: k1: Add "b" ISA extension
MIME-Version: 1.0
Message-Id: <20260115-adding-b-dtsi-v2-4-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_151937_088958_7D9D2879 
X-CRM114-Status: UNSURE (   9.10  )
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

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update k1.dtsi to conform to this rule.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch, a split from the Patch 2 in v1. This patch is for
    Spacemit K1.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 4c045da95d72..2917b315728f 100644
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
