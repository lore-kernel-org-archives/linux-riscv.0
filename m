Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15ABC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTof+AXr8XjL1KtxPhXi830l4gYZVkhBhcTtPDL8/mE=; b=hTaxVhjEJy1H76
	p3BydLqEOVR+AGuRS+bnTTITmnMTf0eZqxAXCRnYvj8S+B9vlD9vE/DB38L4GoGhNwWYZQlvK8buL
	YAaojBpZqR8+TlUZK6aPJ+P/dM16z4TUdS6Ad0X474MvUVf1xsistEvQt8056paBVx3aCxDTWo/ey
	tFCINAriKlYFXw+0mgxAYlRpYEH6sS1waUOJBD0h9HoVmnhdePQ66IrenyM3HyFsxnyKyoa94zrAc
	yKHYjmu6KsC/EFitEvuLgIf0ovGQk29yXmo6FX/SXk679CjONJacn/Q1WyUaf65t1aU7f5swDyRID
	XBffvMX9eiawQDN2NR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUl-005ddL-2W;
	Fri, 22 Dec 2023 11:15:11 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdUi-005dYx-2M;
	Fri, 22 Dec 2023 11:15:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso2197312a12.2;
        Fri, 22 Dec 2023 03:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703243705; x=1703848505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BvelMzmtyu1Sqb0MGaQ3BVDecc44IV/AoEGKsA1SR0=;
        b=OPBOXZynX6vrlYNdVYXxdA/FDb8ya+17PPSlIRiIG5fdrFHKu2LnVceJNnEPuT8V2A
         bCF/VzmNFb9X3j9AC+hyzAtCzew4xTy+YPHIoiGwWEVQXYtWij5IwkYBhN735ZCLUQ1K
         aKo3NDOYqdvbNYWQUFhBpkDGICURX7BLANCBFu1pxW9YIlYnjP3Rq1MDUgmJtxOpl0jP
         pS8vhY9lhjZy0mHZSKSa2nZeKxHC9KdQms2+VJNh6ktKHbv1XaZiX6boLuA7vZLIVGtt
         3Nq/hUiTcdTwXhuu/6O7A8m2/EBi8a8fiyxmpzVgtcvI7+Gb7he87KPYqP1DwM3peaSL
         5AiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243705; x=1703848505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BvelMzmtyu1Sqb0MGaQ3BVDecc44IV/AoEGKsA1SR0=;
        b=DobO36mcfQjHmWYI8Q76KqQkOBOP83nLRhFZIBvqJlneFHVhY9YyMoUFsbnJ9tQ25V
         7FzvjPs644ZT9DgHhXrhhrvSnSMxfnLnw+LVbQLS+FUVMzTG7tBCTO+JrA8HNUtt5Lvm
         /XSX56HZKGHqIzUv6fGlwocfPelShBNc+EXLy0Dw8zZKE0lHv7fZvr+TuJ3+pa46sNp8
         0ZAZf8jJ9ypjjU9jiY2i7AY6rNxndLKWWX8GZgBrJ/uRRw1VBDeoEmPRGNvbVvR8PONv
         wBkw9SWSoSs54SJKdKRwh6OFUcqAeVXQpg2l4P+dd12b57kVQiNYr/92TTX+1w+3Pkwp
         rN2w==
X-Gm-Message-State: AOJu0YyVBw5SibygWBz6PnFktApO2ihd5i/8SShfzqdavu1p8HO4D9L8
	6JtW6NAUZkFAIfnmUMleU6w=
X-Google-Smtp-Source: AGHT+IGWir11b4gGwRl3NO7lj7pMTMBbWgNmeSbRuM9TWOJnnwaniRMrtaZLnxpLWHffPO330BSmbA==
X-Received: by 2002:a05:6402:124b:b0:551:ab9e:53c6 with SMTP id l11-20020a056402124b00b00551ab9e53c6mr575373edw.52.1703243704565;
        Fri, 22 Dec 2023 03:15:04 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.91])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0055267663784sm2420469edb.11.2023.12.22.03.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:15:03 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v3 3/3] riscv: dts: allwinner: Fill in OPPs
Date: Fri, 22 Dec 2023 12:14:07 +0100
Message-Id: <20231222111407.104270-4-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231222111407.104270-1-fusibrandon13@gmail.com>
References: <20231222111407.104270-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031508_767812_4D2B42E5 
X-CRM114-Status: UNSURE (   9.56  )
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

Specify two voltage ranges, in order of increasing stability,
for each OPP.

Also define an nvmem cpu speed grade cell of length 2.

Link: https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133
Link: https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6c..7e2e015e0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -39,16 +39,23 @@ cpu0_intc: interrupt-controller {
 	};
 
 	opp_table_cpu: opp-table-cpu {
-		compatible = "operating-points-v2";
+		compatible = "allwinner,sun20i-d1-operating-points";
+		nvmem-cells = <&cpu_speed_grade>;
+		nvmem-cell-names = "speed";
+		opp-shared;
 
 		opp-408000000 {
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <950000 950000 1100000>;
+			opp-microvolt-speed1 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <1100000>;
+			opp-microvolt-speed1 = <950000 950000 1100000>;
 		};
 	};
 
@@ -115,3 +122,9 @@ pmu {
 			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
 	};
 };
+
+&sid {
+	cpu_speed_grade: cpu-speed-grade@0 {
+		reg = <0x00 0x2>;
+	};
+};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
