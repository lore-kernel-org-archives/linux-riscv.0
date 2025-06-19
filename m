Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BEAC7115D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnYd2l0SYd5PEBSyxG1BCWfIaWCYwvx90rgFUEeVLM=; b=WocexWuLfuSkPx
	OWoAZeWPTVdd48fmdbJiG0Ff3e5CuPJN20lMNe3AbaGmFHI+xt2lhTBGKk4UsRK+lUVbQjKfzicva
	ifdBdrzuDMZFibom1wAs7pjfXO9+BQjtMQpBUd1sqnI+6cExKRfeYUyAL4DC8n9Nenm50e2X1mgaq
	tDsgUeY4eh9RlOH1fkcZCeuy16PdDbpLf2oqEHXTdMHz8WB6qDSjnQGFptPRuWWweT5a9A91T8P20
	Xuh5ut1lzaVB1rPudLJZjrEvk1aL/NvmVsWHs291DcmjDIl7Pzf0RezUHX7QOEey4kbLDjEfr1nSn
	HEADgUw13gx5isgkZYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIem-0000000Devx-0iJ9;
	Thu, 19 Jun 2025 17:02:32 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFgQ-0000000DDzB-3QOR
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:52:03 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3dc9e7d10bdso2468205ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341122; x=1750945922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=bBcgeaNwnmcMJnlUJpHl4ZnkEfesxAj+pAcvSVtbM5IE9OsaCDF1HVfLON7Jrnvwb1
         9oa7ZosWmckTU/tkaOPWUcCiCP53N+G5z//bi3wv/+4I5fyEPt4lAbBujfgE0soosh9p
         wfBvHFpUv4oqpCpM/94pOvfEmH6roi2WZddfBG7WWt7mBsGONAUA7O6fk42f4jF5WgPl
         XW435+upsTF7mXnZO94AfphOzmT+zkWX1nxlVJ/IHRAnyHHyCP2I1zq877pyU9Wl1mw8
         n3d6KRLyFAqxC1FATuBu7UUCE4erBlOPQ1j5YytDZwRK6ycv3k75TyXgMBKHzv8lpKMZ
         yjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341122; x=1750945922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=FZ+CmX70tDHEJ8pvF2pShzIGwH9lpmSPC/SFK1MX/ZE79dKep7tDIE3tDr4AQYoGg+
         0dlEsglFUm7k7krdaTjYLq3PB0iSHdZfVmn7++gAdy7JmBqLsgI/kZv9K6eVDM+d+ep/
         3dxmg4Zgd8Pt8lzm+4k4gF+aNWaM/O0vBMyaH1eTEueg9aL852ThpUGH+1HWE0/HXves
         HenEjm23M6Zen0TdcexoWmQoNjCL2relrqMowTx1wFsfyu4JrnGn5GR9H/Xbyr0ZBmYU
         eNHSg2XHG8G2+PJ6Wa8oNAKwASycwigax3A56OiKJwcAuadKzjwcMicLNUIs7c1CL+kP
         Tyqw==
X-Forwarded-Encrypted: i=1; AJvYcCUnK0hrG9ICRxZdiamKHISDOPhaFf11tmpbBD1psDvDRmNkjfvdbrQDGo0sjvI542vQJe0AOMsRdn1eWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhdqsB89RxMu9yzqk491hcw5yLFMWDU5LW8CLXH+I7qKxdIRyV
	WmZ/4+f4HTMGqxPT1Kh/dHbBhUNUMpZOTEQk7OdHy9l3R+/yW0fUgHR5R80ka7WdmuM=
X-Gm-Gg: ASbGncvbaSpsGY+8GmaysariosJ8bNTHh2/Y+y9KVKQGF3EYx+Y8994GLHDz9PNSgFz
	AyQ1rJBUvxtdROsGK5QpWh4UkMbLOUw5yesSnot1veio5Gk/UHl20UJIo0ES9YbpgHGzC66cMUo
	isbkCrKbonjZsMjyTfEX3fg2K/tVPaNghSZ+FpCr6NQJZpfWkDrYYCX6owE8lq9F79cxqNzOKXn
	NxSuLBO8YQ1mPhC50fsRYkYDXC9QeMZ1B6kFzX3fvh1374+CyZnAdcRTKbw7ScRNDZD+0szCM1L
	qCsFrYM5KX58yO1IVYJ+k5LELudKRNjFXe2L5kJPU9G3tJ+HDnCTPGXQcWqrTF5lzcYQikOUgmv
	vq9XQb3aT/iU+rm9/sfAvR1tXhxGBnM0=
X-Google-Smtp-Source: AGHT+IGE/+9c8lEGLG5Mz9Y+oJ+vIpq7U0/P4Uj/YFoaee96+eti9bY0TLGKxf+d/f/CIswKZrljdQ==
X-Received: by 2002:a05:6e02:168b:b0:3dc:7cc1:b731 with SMTP id e9e14a558f8ab-3de07c21db4mr231847495ab.0.1750341121785;
        Thu, 19 Jun 2025 06:52:01 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:52:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] riscv: dts: spacemit: define fixed regulators
Date: Thu, 19 Jun 2025 08:51:49 -0500
Message-ID: <20250619135151.3206258-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065202_857014_189176B3 
X-CRM114-Status: UNSURE (   8.10  )
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

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
