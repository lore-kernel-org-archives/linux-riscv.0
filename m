Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DA9C7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leVC3lNKq9GrI8x3a+o37IhB5PAqCXAD/IqVN6J4ZnI=; b=kMTEDfl2n3hj6D
	jzAbuBy9kL6U/OtV7VClauQbH86hm5pEe3wWNwJWhMtJNPq4xksFxJv0om7//nNCurDQOrDGEwUIY
	RT/Beptw5U9X45ZDuBvNvUTBA8Z/eEUNSOTn4C0XdN3Yi75ikNZAp9VgavBzvgcpsHq+silgIl2zO
	Q8xbskar9gXMIcAyX0q02ROvsvf+zhLURu/0u8XTozpnrd/zsUmP0lLZPMeBWdRZddVEZvqBdlzb2
	IbBZfFXNrJvu2+d+1o16YnhpdDQKgfG228v6mmiXcRY/wB16Ne9f8PSHzLfQLZLMGe0rAuoRHnjgb
	OksEibl1HtK+t41sLCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUncv-0000000BvhY-3Nye;
	Thu, 26 Jun 2025 14:30:57 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnR5-0000000BtTL-1z2t
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 14:18:44 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4a589b7dd5fso20590581cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947522; x=1751552322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=NEHRFBpUEiSrJhzHpkJzBKtyQTj/b0sAYnjKIKuOpgf4PoNTA1lUtK/q69PvxdNP/W
         f4Olfh8cNFb6qvgh+iRUEs+qspekpMssWuCsaAHheOPfOTCqOHiw2PK/Jyahqq6LTRoU
         bAznQE0AV79wv7AWgF8sJfc9GBpdMJDg5dSy7tEV8zf5NamYnYLrBsHUNO7jrjmb46pg
         fwcVOZEXOxWEHw9UK7rBhhR5U/oQlSS3koUc46h6UHqxU61h5vW2ZtYheWvnL6HTo1Vb
         wkrvYsew8Xleg+mUBlkXiajMaUr/L9qKrgU7xrjXWWIeGE5gFDhvNG4ytOZv1vJV6YJ9
         ujjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947522; x=1751552322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=bFEBiQCCG9K9pXHDwLJ2vEDV+Cm0FN4RQgaDINPcYzx9gdpBP9yj15NYfQKfdWDD/k
         rFtHgeRVcF/6vTk0ebUxXWHY4c8hj+VR1zbY9HV9M15VwMDberP5Sw3RWjdwVL+/Vmc1
         YHHDjq31cEsPxJa3uY85Rla3nr1EqS9BqNBf0lBFu9u54l8Evww0yle7efmUykmpsq3t
         4l6LkIb4GYr4esvoKJJnaVKJPk7atvLO8qQxJsIt7SoV2nIjaTBxsLaNf8Gf60NjqZrF
         2UAqaQFx+EOrT7/63PPH2y6FPKVQi++oEVaBHbuE31t6mjlKORgEKLOACnLqIOFnf6s3
         r3SA==
X-Forwarded-Encrypted: i=1; AJvYcCWh2ezRYxWqTQNtpIqbEK9+7f699xAB8aU8ufRQ+L+Ip0TQcbl8CLUd4stAbryKmjV8CPc2i3/CpRO7fA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoqJiy+sFOU/G2yHLaV7pU+QD3HXTGMstmvW84q7dnSrNvXLsB
	dl2zRScImk5QEO+Mc6Zr6RcA6/3ojocWD4U0flwMwjeN5kFzXyx0YbUberByqkJ/g0w=
X-Gm-Gg: ASbGncuTspNWBV0s7JsLjS8zBOaLl0FohekMT+JjdVIa/e2m22hJfgE/bH7iJNGtqUF
	oVTilv03RfRyd5+H6NGYDHMXQ34rKGhtwzXhld2tNMOschC0mMZH1u/J4rcLZ4c+BjAR9ZZC4GZ
	2NVDT+/iDD480DXc3DIcku4B2EtezAzaErogDgz5f2q/StiikiaGbdi15+JWKrLK9BWHpFbkcYO
	iyUYFXNAC/kTSoUOkzHmSkAE5VdTgHII1pDvYbBR1zmYqUmp0TSlcxsZw0B9nTfkSEuVaHGRD+T
	IWueRRzV7aRWbaOg/ScRg7KHwKhh1oyPSSQrj9jt1oJwSrqKpNStOOO5mWq1BQP4+/4QJzuBAp9
	uI9zI/tX37k+hIBFU9imkF3TuxfQIuEqDifo=
X-Google-Smtp-Source: AGHT+IG0Rk7kT5PaDL3EOhOatM4r51p1IXWy9NzWq0w2KHZQHF1mWKjHXAOtLVKooNvRWcbRmq/RBg==
X-Received: by 2002:a05:622a:4015:b0:476:8cad:72e0 with SMTP id d75a77b69052e-4a7c067c552mr130102131cf.15.1750947522631;
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/7] riscv: dts: spacemit: define regulator constraints
Date: Thu, 26 Jun 2025 09:18:26 -0500
Message-ID: <20250626141827.1140403-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071843_517320_B7B0164B 
X-CRM114-Status: UNSURE (   8.26  )
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
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
