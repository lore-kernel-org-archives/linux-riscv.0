Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9895D1171F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTq10HZaP8inOsXRSnAyc2WGjQE3Yc30EbJ3yuT47Y8=; b=Hltn75krlEQAkV
	1MUDeIxyMKra65kVGU0qCQQQcuyYMpzKEjlb3sShFPIphpqdhMM0t3Djy6t0BoP08hdqcm11bW9s0
	6VaYWX4VN7GRrX2D6hb/EJ9N9RaKFNdcJcGy0XvcVnL59cvjWCONGDSxR3oJFF8YeWX08hdtTS5op
	i35CEEL5yyoWpDlWdxyXU6bJ+pvQh5GnwmLqZsOTuB1yRZO7DqJ0UON9+fWaE9aqnXbAsaXmGzOQI
	oSwzWQ3TjSyg1H06oJV8qdySPtnNajpANw7suwSPrsJrV3pYSxJRr5DGr5fggCihvgA7gD1VVcySY
	D6U4fP8vPIW65aT1SiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FU1-00000002wwq-1PHg;
	Fri, 25 Oct 2024 08:15:45 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FMW-00000002vYU-3ScL
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 08:08:02 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7180ab89c58so1103380a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 01:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843680; x=1730448480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN5eVpbvHpbGL4WpynMeSKENdrHYe60OqvDbvd5Xiq4=;
        b=BOoGvLRihyznRwwnRCMziVA9jKkIAOW7rK1Dnn1s2qtPHdpKlL6sq8MoxaveQGUaQ9
         rC/VvmNZpxr1otOEen+2YkI9JML0X7ZOsRKxcgT9X83eU0lUUSQIpTdA3pL2HvNsB82u
         J3R6sSHOZYm6H9blWCWho0eNE9RnR3ZR6SIQ6EnMDmq4ypg8Zx/a5NaCQYFvDP3svlaV
         MryEi0ar2oO7Eqz3yP6iGS88uj2Hn0+bQJHbjNZz527gjpnJ3b6F6zCLfSUqJfQbkMf/
         ubmDSBYgGovYJOmQYTx+/soEx7bFL8AGYx1cQkv0dO8adQXaAdb0sMtTKSu2lQu9bBVy
         iEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843680; x=1730448480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN5eVpbvHpbGL4WpynMeSKENdrHYe60OqvDbvd5Xiq4=;
        b=Fh4W8LBqqgsjhCAw0QJNqmW8pGPL8sPA1i2wyj16geSckWco/lGb2iooumbG6Fc6qo
         1CQb0bAxICz5YKa57T9kAD2bm6WmYyj1kkzHRMD+LC8zl2EcgEEeLLCm22EWhBhZeVgO
         v7+aRehKyW1dQ8+SQ5cIAcm9mjPc0ofbn/xRsAlV23oF1aHptoW6lcweSy1hLKi8XkLc
         ab/KuCXF0T2HT3vY0FdGBYJc9P+2HwCF4osogd13P2yK3M/CVPVEiBMQ5GUov4OpfLCO
         UpIWr8DVdKFN/PSs/WGLRvdc/YkEwn4961jmPMZm/mte83hJljcWyxgTa20061Wf9d4a
         5gvg==
X-Forwarded-Encrypted: i=1; AJvYcCVYoU2v45tLPF2Ul3XEXs49uvtPNXYDJecKK3s4uRVXNkYE1/CG9PaUjzjqHWZsYrxpvfFGbUmWGumMGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX3HMp5foT7QR8146ZMppb0VGVTc0LtTLbz97CE9dVrJ9IhDiN
	5rb4xRi0z5fP/q7uqHpWfMO+Nbjhz02Gdl0gfwzMbanLNY1sOHDJ+tPmDMqL
X-Google-Smtp-Source: AGHT+IE+aA1kZV0Gkelsvo6Wh/wBlEOQ5MwEkYl2tGn0oofv0qQbf+/aSQ5fFXMTaUtSRKeXwOxgcg==
X-Received: by 2002:a05:6830:6f01:b0:718:10ce:c6a7 with SMTP id 46e09a7af769-7184b348e49mr7419539a34.30.1729843679811;
        Fri, 25 Oct 2024 01:07:59 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec1859b627sm160231eaf.18.2024.10.25.01.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:07:58 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v5 3/3] riscv: sophgo: dts: add pwm controller for SG2042 SoC
Date: Fri, 25 Oct 2024 16:07:51 +0800
Message-Id: <f3a0748a6c59ba3ee8090a9092040a63823affca.1729843087.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729843087.git.unicorn_wang@outlook.com>
References: <cover.1729843087.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010800_887150_F69F5FBD 
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

From: Chen Wang <unicorn_wang@outlook.com>

SG2042 has one PWM controller, which has 4 pwm output channels.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 4e5fa6591623..cc33115fcd8c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -165,6 +165,15 @@ port2a: gpio-controller@0 {
 			};
 		};
 
+		pwm: pwm@703000c000 {
+			compatible = "sophgo,sg2042-pwm";
+			reg = <0x70 0x3000c000 0x0 0x20>;
+			#pwm-cells = <2>;
+			clocks = <&clkgen GATE_CLK_APB_PWM>;
+			clock-names = "apb";
+			resets = <&rstgen RST_PWM>;
+		};
+
 		pllclk: clock-controller@70300100c0 {
 			compatible = "sophgo,sg2042-pll";
 			reg = <0x70 0x300100c0 0x0 0x40>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
