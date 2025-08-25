Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D4BC8303F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLQOT3cRtegqdOZu4QetuOJyfZE2lwx1MO5fVzyBzHo=; b=BOyu24wXHPsI3B
	0S++XiPcxJ7lYv1FSuw/29C+6kUooaSSoc347wvtHOCdPUFtePvf386MqZAaKZyfoi8SbnFfudYdb
	/2aFnym2EGB0qBubowmhSU7fJEWz5ZeplBimoV7Xnq/orsTNQTCrncgfjZceCCsvprefxlPJGDvHt
	+1Tzp/W90hcEye9nYcvwg5WKgWceLq9oNL74v85iRNyRvW3IlwH7zs94nG62z8mvUxKdi3VAP7q89
	GQQexY7z9fjQPVGw4oV2TUpVaf8T8xZpGR1AF8IeSqASfI6QsdvJoEdlLXfijNR9bSdo0y/z3jAK9
	zqi5bEY4bhOlVPyFqUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbNe-00000008sPp-2EqX;
	Mon, 25 Aug 2025 17:53:18 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqase-00000008ov0-0VVY
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:21:17 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-88432d932d6so55264539f.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142475; x=1756747275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=KHqCtN3Zkkz/KJzNVLQSAGMLsEPYKzcUPkjxhZ/vo+1L+wIuuht0ENqQOKtmRx/M1R
         2xI2LUKo37ygWpGAM1WGu7oHVbY9pcd068U0oO77ufzx+xL4XebyXb5QpizjqIePVN1A
         u/CulGEgfKgCfInHGPfWb5yUZis17oUZwMiABUq4p1q94DfNhN4QSSF4By2hj/vfv7+p
         QV/pvDhHRJOB8ONfwE57M7lyv90gtyBxiyBT3+L0OA5vER7X4FK/hIuYYPQM+LSpHura
         o4zSIupZcVei6t+XHUmfV/6Ehldn2Mm/ycOGByshGRFraBNvJVrcNYr9GfimNjJaHTUt
         uBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142475; x=1756747275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=pfoIoI11aSq/FfdPcn9u5QXn1FtxqvsQ+4HEWPlOwOK7+s8/8fENRo7oXwDYHkN37o
         iCuTLQS422eu/3sp7/AbyVhVNFSbrCi2sOYCRe+Yfbidmrc6ano5AsDjfekNmVTXPQKv
         uOr4+Zd54JY5wF76Q0rs7Ark80EiNtEleXVAkHPw+l1PhIuuRD/U+HbvoSKoKd0c26rd
         9C6sXtNOuGXWaLXCPebCYNwzMZZ+UXM9QGzOlHDlhY+nGFqkDHwmYJY+gBDtWxaudD0h
         /C72sCx2lW1VUPyO8k4gZfdtHKVTFTWMdjruC4TTq56tioZfM827Dr5Xvhe2s+krTsSB
         mvNw==
X-Forwarded-Encrypted: i=1; AJvYcCW7X7Y1B9/4Anc/0Oev7NpsvVI1kuFZhFq8j7Z8tLfzlMxvxm1zmJUtH1T6vE49sv399gLvBFwffJvF9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/9ApM1xA/29ZDDDOwUFjSiA8C8gSTxfOU0uSj7CUWU02As99T
	Mg1I0L9ms57bc5YSVL21/BxLn+ptVfNC5vkmy74cxKfzc2G+a2hskcFrQHjKSSPJxB8=
X-Gm-Gg: ASbGncsZ1F3Q7ctnXy3JcxHNKYRKdV7nmpfCeYmlaSQK9YeuiodlNhvHfmRze+gVz/f
	ad8d/cdZo4WGToJoSKtkDwKSjTit+79upVZWkp+0KRjG+9BjB2WZt7Gg2X+rtfVNZfF5Zg+beTA
	JONlW7gkgHGz6ekuMXTyhSo2wfy14uPXtaq7+S9Wc5QQSpy1Sm22YsdJR+6Ka+eKXPQAJdQ1DPQ
	H/2TrAFDJRaVCsjGMGJJP2eqR87J8jB+BwRrkNc9dssXnIh97HBfZj4u6+dNkpBPg1QfnUVjNY/
	EQ5nUDfcSgNJUtTXjENPW0hW+6eqzkBFiLlRuWUDUbcS/nbCSTaVofYLCOGqAn9Qw6homXNcRli
	NIHswuJjeJpQCD6s4rvJQ/P8xubj/Ldc3zphH/E/L8fSmGIW3B8V8tMtkMsqiT69kHg==
X-Google-Smtp-Source: AGHT+IFaVPmcRIepO8mSzmP9PzGXjZwSc4TayWxRM79v7g/HByE5zJt50D0eHv9Uu2pV8a3THcTTMA==
X-Received: by 2002:a05:6602:3a84:b0:881:6cf9:b8df with SMTP id ca18e2360f4ac-886bd1baf78mr1747744339f.10.1756142475231;
        Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:15 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 7/7] riscv: dts: spacemit: define regulator constraints
Date: Mon, 25 Aug 2025 12:20:56 -0500
Message-ID: <20250825172057.163883-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_102116_156856_78C9E809 
X-CRM114-Status: UNSURE (   8.16  )
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

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a11a60b9f369b..a9a2596a94e89 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -68,6 +68,110 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
