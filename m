Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1793BC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm48GGdmpYhbTkcOQGIGmjYZI52WsMvtNtLgM8FdPA0=; b=TFQ/MEo60nxeOA
	rzHSKZLV9h+J4SEV4bSmAQc0OXq1owUrLcK6j7yl+hkGcHmiNUsV1k5oRUxVgQB7BPAFtGDzrCZBe
	UlRMxajtMyXjsxzlQDvkklTKzMAwcqVwyblLGLASaIWUUr9EPDQxsQu02Ssc35ZdCdv1JCG9YgZwb
	Z+6Lwv6XEZUq/1PJSxaovPHWg1F5gJ08ge7DUJdTGeUPEpPK8KnN93+c1KoqDQA6kPyjmZEO/GBSw
	/tbzyMWqxMi3cr8PS/je4Fs6F2yfwjvJr0A3qAYIWBdzq/UWYKdLOt72BZcrYHkdHvIIrlxU+fKpk
	xqNxqL9yIZD3NBh5UDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fHW-0000000F9sy-0HlL;
	Wed, 08 May 2024 11:16:18 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fHR-0000000F9oL-0zT4
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:16:14 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A37F24155D
	for <linux-riscv@lists.infradead.org>; Wed,  8 May 2024 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715166968;
	bh=/V1XrjVIykV/6kKtO7hT6IY0af9h2AXu+LfSqihAnro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=PyklEU2Bvqn/MWrQjPyGVPOXkqC0k4bdPS3TQtKQ5tFwEjOBoE7ACM3bijbJ/5iYu
	 mQKKigRx5vHb9OfcSJQ+58KJ0pRLH/clknRIZCegsahyS/Wy6s5RB2Og7lJi8xzI0O
	 FtyV2+WwdCUzHGUViC2knyXn1Tfs1WS3pynp/nu3nTcUhMD4458kKc15LdFCe/9Azi
	 Hl0Kck9dRzeHUUjbmvgpwsiZp7x+UN+4GCLDBPljH5GuY7mJszMth9/di35JcU8A4O
	 vA/ioTYEr6PDHUp3DZj7mZ68IPkH3bFliIfyG/8Im5jKJ33JgeY98xMTHytw4UjaV/
	 6lRs+NZZhu+bQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a59a17f35c8so277170666b.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166968; x=1715771768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V1XrjVIykV/6kKtO7hT6IY0af9h2AXu+LfSqihAnro=;
        b=W62o/RX9mjpr/OCqsx2uqX/MbbOekqHaTYKbnHMess2ZtbDPcjSFzBzY3Sn/fNV/+U
         k2KhkPVwTxkOcqSCy4107g90HgUKKnJecx79CtjR1YyY8IoKfjT/kNP8+hA+T9Fo00Dq
         JGjSI96nKpZ3aGRsJSwIFI2j1UjzXWk9GNUY5JyPgxaLJNUFWxrvXyRxLz5EpyiALWsb
         8WbN2QgeGzSfYB5HXjNXlNtY088txqsbW86dQGaCxzoi1z4myV6Lfy/XMfeEQ9U7ZGe6
         d2jjzVCSQtMfz6vCwaobcG0oa9HlaUYioTWliGFIvXXsjD2iMi/55R817JO1RGx3CjV+
         tUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBxFtBFfoGDTaGCqXgwU6AuSFLDjGP8fO/re1enDFLVk0hNsOB1yd//nOROvWS6oBAlntEtJr5+MjPyFouzvnDatX+VrxgROvdqSLmJdIn
X-Gm-Message-State: AOJu0YycGBnNWDq/TGC8d3S+jb+0eg3WAiOkc+6KeomFm++Wa/vLN2l/
	Wj9uZSu7h5rQ5Ar4GEQYeiLgySn9dRH+U0w5m9HbxC+HvINNHyfR17Vc4dzyQ8onx4kTGYrDsee
	/FohV606GT5zzrqMFXVJeJU5LwbvrM9YVXwAbTqICL5WMR1jmNhgSDRPqH+khUs/ChXeOiBVNc4
	r5qc5zVQ==
X-Received: by 2002:a50:8750:0:b0:571:cb02:418a with SMTP id 4fb4d7f45d1cf-5731daa2c96mr1402053a12.40.1715166968346;
        Wed, 08 May 2024 04:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6TPvf3Ivj5W/nYnn3IO32jmZvtFJ0qUyRLDwfBkqqGUcetVJihJg5ZpM/8Zui9NrEJ+6fzg==
X-Received: by 2002:a50:8750:0:b0:571:cb02:418a with SMTP id 4fb4d7f45d1cf-5731daa2c96mr1402037a12.40.1715166968077;
        Wed, 08 May 2024 04:16:08 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:8ce6:9eb:cd7b:fcdd])
        by smtp.gmail.com with ESMTPSA id co22-20020a0564020c1600b00572a865af10sm7513556edb.44.2024.05.08.04.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:16:07 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 2/2] riscv: dts: starfive: Enable Bluetooth on JH7100 boards
Date: Wed,  8 May 2024 13:15:55 +0200
Message-ID: <20240508111604.887466-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_041613_492368_E42A3409 
X-CRM114-Status: GOOD (  10.12  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add pinctrl and UART nodes for the Broadcom Wifi/Bluetooth module on the
BeagleV Starlight and StarFive VisionFive V1 boards.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index ae1a6aeb0aea..1f79481bfd96 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -289,6 +289,41 @@ GPO_SDIO1_PAD_CDATA_OEN_BIT3,
 		};
 	};
 
+	uart0_pins: uart0-0 {
+		rx-pins {
+			pinmux = <GPIOMUX(40, GPO_LOW, GPO_DISABLE,
+				  GPI_UART0_PAD_SIN)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+		};
+		tx-pins {
+			pinmux = <GPIOMUX(41, GPO_UART0_PAD_SOUT,
+				  GPO_ENABLE, GPI_NONE)>;
+			bias-disable;
+			drive-strength = <35>;
+			input-disable;
+			input-schmitt-disable;
+		};
+		cts-pins {
+			pinmux = <GPIOMUX(39, GPO_LOW, GPO_DISABLE,
+				  GPI_UART0_PAD_CTSN)>;
+			bias-pull-down;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+		};
+		rts-pins {
+			pinmux = <GPIOMUX(42, GPO_UART0_PAD_RTSN,
+				  GPO_ENABLE, GPI_NONE)>;
+			bias-disable;
+			drive-strength = <35>;
+			input-disable;
+			input-schmitt-disable;
+		};
+	};
+
 	uart3_pins: uart3-0 {
 		rx-pins {
 			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
@@ -393,6 +428,20 @@ wifi@1 {
 	};
 };
 
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		max-speed = <4000000>;
+		device-wakeup-gpios = <&gpio 38 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio 35 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart3_pins>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
