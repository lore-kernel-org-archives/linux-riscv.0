Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0AFC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvqvC0ab3umRnOnsXK3HdkvUy9UDtQKTH9Ch4Xz+vmY=; b=Qy1l1yppKsKUbJ
	lQEtGAF+WNVi+vRaUlBWnRdbJHiqiKBigiuwZuXHmQ4RRvMeDnFKSV+Ot6ONOTOCBkAhWPcnDMqNf
	9+g2ecAfcMPU02m73MYra4sLm4ur0YdvJxaOpqQ+EqqixydzRYLEpMapspK6apXcZDZHJRn1SKbn/
	5eN16Qrfj/E0+Uw/0NzbjQv0YX1YHa65aIR00/E0PperrHzUlEaPq2bIgAbVEy/N/nCUFEAcDExg9
	0xr2UtAkKCPmTz+cmtLFT+pvzMGIAdW5oGFWwsqOg0vYom+BjiHVrRw7D0ErVT4B0GkO6PGE0bUWp
	zJYLG9z2VqGwfYQiuB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3J-00HUFC-2K;
	Thu, 14 Dec 2023 10:34:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj3H-00HUCK-1n;
	Thu, 14 Dec 2023 10:34:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33638e7f71aso251035f8f.1;
        Thu, 14 Dec 2023 02:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550083; x=1703154883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0a4gKP5gtrabO/Q+KI+zErFhUsDo6C0jBoUDN/BuNw=;
        b=LZT/fkqLFHn+k0f9Rm8zH5wqVPnG6FfpcnNdMJnEpZAoW5YPsiZ1cnZFQVFE5JWbgU
         wV15u3IhpfVJ4351LiJJBci64fAoV7iCgpW87DJs+OkUYTcWPGYv/VH23DGLExeQ7Td0
         u4P35VNhTMV2GCMrq5K3YDG/gvJgix5pRV5HmlQV5Qi4LMeDmFqa4nwgxWP/QjWUXZl2
         iOGyHO7Grgv84P9vgx4mry34+QbGLKHJQJYFYvlmII+b+lLC9mg7H20zXeLSSZIe6e80
         5sf+1beVflnqZVPKr/gCsqctzRlpFp/afXDcqDF9S5i4UpOZ5xN59q1vL8Xh1cEhAM3x
         NiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550083; x=1703154883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0a4gKP5gtrabO/Q+KI+zErFhUsDo6C0jBoUDN/BuNw=;
        b=ehbVjta62unfl7u19Oduem1g91qJMAmkzjQdplnATNhhkhMYXMV1+31ZnoLG1W6wts
         HorC4rIMxi4tZYfAnOf9vnvEyYqEjZM1Y4iM8Shc2x2UBdiPU+mizkRBms4PrslOxciR
         +CgLymquvGxPfHikXmQuJATq5aGcmgIPBG9vKMys8NULpWNUSjVreeWiRiWHZhlVDyz6
         S4SLn/EE7bPnx47e2Q3o8K6MeV9ra+pwZODM1KndMnZpGO45fjh1eUu/Blh8FlkENULQ
         kflRQ4BnNqz+JQ/JxbILGotSIGVRAJhRLZeaF3U34z2F3jTSt70qviS0WC1Clcawtxcj
         Ve3g==
X-Gm-Message-State: AOJu0YyHL/I4x4B4Vf8h6tuR+ixb8SXcbCbmdcISM41h27P8AvLd2WAJ
	iH2kL0+spaHOH8+wdNovrAc=
X-Google-Smtp-Source: AGHT+IFPVXHLmiez1c1QHJ6CdvlmAC2BBhWMXcwVlLmX7+8rd1VLGR63bHn6K6EuANrCno+ey5HLvQ==
X-Received: by 2002:adf:e904:0:b0:336:4176:9229 with SMTP id f4-20020adfe904000000b0033641769229mr1327326wrm.54.1702550082488;
        Thu, 14 Dec 2023 02:34:42 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:34:41 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
Date: Thu, 14 Dec 2023 11:33:38 +0100
Message-Id: <20231214103342.30775-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214103342.30775-1-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023447_594248_770C0963 
X-CRM114-Status: GOOD (  13.42  )
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
appropriately, with inspiration from
https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi

The supply voltages are PWM-controlled, but support for that IP
is still in the works. So stick to a fixed 0.9V vdd-cpu supply,
which seems to be the default on most D1 boards.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6c..e211fe4c7 100644
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
+			opp-microvolt-speed0 = <900000>;
 		};
 
 		opp-1080000000 {
+			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt = <900000 900000 1100000>;
+			opp-microvolt-speed0 = <900000>;
 		};
 	};
 
@@ -115,3 +121,8 @@ pmu {
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
