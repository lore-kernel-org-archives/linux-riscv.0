Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE51C83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLQOT3cRtegqdOZu4QetuOJyfZE2lwx1MO5fVzyBzHo=; b=uvyVMtWLJlf697
	pGp86dD+SHkdy5Es5WUcAecWoZs/0Cd6+k+TN3b+GzGtEayArlS48yMOsZ8PkiKANHh7YPv7dDi9L
	NS0PgBIi/zEqhpfGeMjKNfLiSh5VNPUHiKeXLjJQGv8wrtPk8sSf2jpU08mNiVvkCfRmAVKEVE7kK
	f5te/IpukF2KIMPXzU/WTSFIP/XYkjH/Ps/exEkBAsmuXEcws1sYSrAV56bPhntwT4d0MZ2/hxZ47
	xTM9JdMU3a+p8Lyjs9JAnnnt9maPXowBiA7jcLNlBz5h5GuMGiRzCJBzUBLPha0kjyxG9MoiR4Czj
	ASrRxdNhR6A5wATnsHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefU-0000000BUFC-05v7;
	Sat, 26 Jul 2025 13:10:28 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefQ-0000000BUCg-483k
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 13:10:26 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-87653e3adc6so113977339f.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535424; x=1754140224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=nj4cPdFEiWenj5AyQ267/a6iLP0xJd9zNvAY8CiLwXxdqG1Pjvnf7iHhmV774cKKBP
         RPBPRtIJ0nKo9xeklnDAAtrVy11kb5cne1+oR0CbMktGjpiFGrx8KJaiRAVNNUzT0gIa
         +XqR2RzCsTnULG/C862k55gpyl3VnTz1ZS2wSayJAB1pD1iWa1lScCp77a5vqww0a41w
         NLhKrhVfPVclTzGs4qQRBUIN0KXXKWwoucjKA0qqJqGSYVuJRkd5zrB9sPq67CrM0z40
         aQIl+5cyUa5CvQBnTHzdhwSan/RGuPlskyAz/1ExYmFPdiDDOzlghdhzai9fqUw2lBre
         cgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535424; x=1754140224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=q7GCnL9aiHWTHYj8y0BsoSo4t+dRHCYNUCCrFFrRPWcAwzZOjEfehhPVjfDur5XDUV
         BEBxnAHvvSDX7IrcL/1ra25IrMJDnynhgne7r5QjvrONG1VhmribvKEnBZFi9YHMg8VX
         T9wmnAkp3CGqPS3oXMJ25a+AjE8FqXh8X1Yef8GN33oBKKZCGxnaQRE9a42vXCGj/1zd
         p9SQJExiOj8Vrcyk9LzgIh+dXudmtxMeFiT29oqmG51SIxACATwFs4zhxLFYUgFxMm2f
         kNFkJm5IdxMrvTlPJd6wiU/QaRGdyFop9+lU2UFbWPDTWvdcyJi8P2RcUZSaVKZAB/O9
         jW9w==
X-Forwarded-Encrypted: i=1; AJvYcCXcyR0qbzEy50/SGrMomU76aU+K32r8AFq7iqJQi2P0iEIdPBowTdhk1QeJNg6Xx5SskDhcBraN7msj3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFfoAj3kjSZcZKNy+1Te/WTI8k1A6qwIqSMNhJtbH3KTZCVN+O
	gwYIo3BVfVvRg0UbYD6Dw444G2AGgIUbI7HSxEJoqBGcK+RRjeDRg3c2v0rcZ9Xgb4E=
X-Gm-Gg: ASbGncs/CKyH3BI91EtXpssTl6lYuDzwcpwNveSlSPbaP8JLGW4k+mFJ5iJgxfHONpA
	1J57Q6eqWG3p6cFyqeZnrUvwKUXvu53fpr0yZqiOwT8zok6UKRH1vke6WanNA8K/lnA3MWYvCXR
	h+jxv6pFFttZXXJgaioiXj1UhyOQfxC0sogzdE6MWV7WntpYHNKMSnteuYxF5DMjtiecLGyDpi4
	H81x//f2YkThXKRGP4En07V8CtAvKaPMPLMtaGyPzn9N7+30MocOUCwJrwD2rwZUX3k+twF7dno
	35nkGavcQWY1vqT3v82UwzhUHL6QEqCVQ6OXAiIGRKfyum6kZTwDkZ+AN+Yk4KgCyu58be8Swki
	wjEgdEPUiOaiplBn8MUzELFDrqY9GrzBoQAT2d3BPvoR8vhhT8A5K8KeSBtanX/hxYg==
X-Google-Smtp-Source: AGHT+IHnZ5VxjnvnLu84xJpltA7xsi0CvkodJCb16fAczrWGpj/N0ZZOz3kKEjYSRbp1bBk68OHmvg==
X-Received: by 2002:a05:6602:2dd0:b0:867:6680:cfd with SMTP id ca18e2360f4ac-8800f0e76f4mr1007709139f.1.1753535424237;
        Sat, 26 Jul 2025 06:10:24 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:23 -0700 (PDT)
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
Subject: [PATCH v10 8/8] riscv: dts: spacemit: define regulator constraints
Date: Sat, 26 Jul 2025 08:10:02 -0500
Message-ID: <20250726131003.3137282-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_061025_028093_2238BC90 
X-CRM114-Status: UNSURE (   8.18  )
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
