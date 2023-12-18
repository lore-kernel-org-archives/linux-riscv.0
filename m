Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7076CC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmLam4iEXvHmmwhj4dZGJD9uLQoT63CiGLcgX/1SN0k=; b=fXZKwzlIA5Dqrf
	NC+IAAgoS47uE+l+EG1AiuDwznlMTK07lehZcKTtvn95Prei6tBWzqnSHfSwTadk1CEZlzliye647
	T9EvZb61qgUFAKMIfKnOJGYF4JserVakeovpI0uig0AdNjjYL3dHhvQJcWRcAdPxNL7scnbETTuVN
	1j0E3PjW5jUdKYMa3aEjcg9sKKYVcvd3aJueWgrEESo3mrhLu5kSubj8KDNsqnRrL3tCnJG57DcKl
	3kQDFmet7JRwTiyg+BHT4Rqi0FxriCkQ/ZCbiwIHu8UTx2ygb6oK69aj9yKSq0Nv/rFcdf03ITHRJ
	l/tkQME9NP+1siI+m8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBS7-009yd7-1C;
	Mon, 18 Dec 2023 11:06:27 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBS3-009yZ7-18;
	Mon, 18 Dec 2023 11:06:24 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-552fba34d69so1975508a12.3;
        Mon, 18 Dec 2023 03:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897578; x=1703502378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LeaDDQj7Ki4b0Ekhl8dm8Jbb6kPpIVsluEl7LY+BBI=;
        b=W9kbjWUYfnnLZOOUjkajeSYg4ZnGvDVf7Cor276Krl1VLTXSvMTIPblHQ7OS4Cu5Wz
         Utt/nhbkKV1Ar+Ceg4s71UC6GCKTNGSo1DhDpMyHnwytgTc6mfy0fCIJIo+n4PChRIfO
         B1xpGYhelaHI8+GGMCRk0itrMYi0QUPoE9m1pjqMdCdD/EHB3va1xHbALIBMkjjjE2km
         g9E5eScZ1JBcdjwgIbVKb+JucyHvokikTX7niSJdqghJdQU8e7UZBxCfBaDMDG0Y66yo
         Y+nSzejLwt7+LF9UVUPlaQUZqsUbX0hBbmWyzNGF+qiftpWnJEKDkuanZwirNsbN0W6V
         cwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897578; x=1703502378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LeaDDQj7Ki4b0Ekhl8dm8Jbb6kPpIVsluEl7LY+BBI=;
        b=vodLCBqaIUVjhiJiYLgIRmng7gzbRCE/omHjBuyj7pWOiyYtQ8LuGiFEE31AcCd6e6
         VTeAptvBq01pvZ+SlqpvzWkJcERxWxXOfcQJh5preop+dIBP3ROIMLu4R9HNmcVU9v95
         b7sh/wGcvPN3sBadfAmfCeVIw7ol2bSPGcmvfmXMgMO0X84XJTcuaWYfIdug0FArKR88
         S+77qz8M+XC4iustZT5YGvyujgsFtm/sc6W2JgS7cDy8/I4nXaoCp1pUlRcnxx2yDHqf
         7/kRpedHg414iFFelNloihS8/TYrfzO8vrALvhipLcyPZDd4O4hNzxU3eDzASlT+b+DZ
         4BLQ==
X-Gm-Message-State: AOJu0Yy3WK3VTh/aJ3i1NPIZkDerlbgVaVxQQum/qwzdK6S6EkKM5i/f
	e3Rz1DT5/3FLIBZfhglCGQ4=
X-Google-Smtp-Source: AGHT+IGPZifkd//LzKxHy7u8xX0XqBW45bgrlj+EqkgnlzlL1DsOZUIoi9IVE+ojfJGXuEukc/v8NA==
X-Received: by 2002:a17:906:74d5:b0:a23:65ec:8252 with SMTP id z21-20020a17090674d500b00a2365ec8252mr258761ejl.48.1702897578653;
        Mon, 18 Dec 2023 03:06:18 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:06:17 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 1/5] riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
Date: Mon, 18 Dec 2023 12:05:39 +0100
Message-Id: <20231218110543.64044-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030623_399843_2BDAB246 
X-CRM114-Status: GOOD (  13.35  )
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

Two OPPs are currently defined for the D1/D1s; one at 408MHz and
another at 1.08GHz. Switching between these can be done with the
"sun50i-cpufreq-nvmem" driver. This patch populates the opp table
appropriately, inspired by
https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi

The supply voltages are PWM-controlled, but support for that IP
is still in the works. So stick to a target vdd-cpu supply of 0.9V,
which seems to be the default on most D1 boards.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6c..2f1771c19 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
 	};
 
 	opp_table_cpu: opp-table-cpu {
-		compatible = "operating-points-v2";
+		compatible = "allwinner,sun20i-d1-operating-points",
+				 "allwinner,sun50i-h6-operating-points";
+		nvmem-cells = <&cpu_speed_grade>;
+		nvmem-cell-names = "speed";
+		opp-shared;
 
 		opp-408000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt = <900000 900000 1100000>;
+			opp-microvolt-speed0 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000 900000 1100000>;
+			opp-microvolt-speed0 = <900000 900000 1100000>;
 		};
 	};
 
@@ -115,3 +121,9 @@ pmu {
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
