Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21852CA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjeRD0orUmP491zDMMmDZc+HX0DGM93xfYn3ja0cZFQ=; b=mKCqLaUvtbPfPy
	ucZZKEsH6r600JfYnfwZA/t8/QctNMXOBTz/8rToQDbIe9JS4GcVjehfzV5sQEqJI37I6oA5vRs/O
	5igclCZnlchgyQAwuX4w2o5zAdeg9Y9K4ZcG3hd0JQrTdhtNIZ8nQb5KDJ58VMuZB11/++bsSi12j
	djxtqD21Ip4tMi08dQ3ZEsfX5NSAHA9l8X2yJPccq0dgua96tLR4o3WO3nOI1eRIcoREXc1/NIGFT
	BMH8QHYOInprAxK3tPWdMzJpuT5RiaZUzGK0e8WDcx/Bddr6uZpushTY0OnGI7VEMqG1TrwhTEEEr
	zY0sdMnzTEzzvccdTFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbNd-00000008sP2-3UaK;
	Mon, 25 Aug 2025 17:53:17 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqasc-00000008oud-1lZp
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:21:15 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-88432d9cfcaso44204939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142473; x=1756747273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=inPuRqu0IVKFbVu2JiNuVLxhTQe+DyFQrAZ77DUFX0+4CpZdgLicIZvy/R3C2K/ohL
         nfLzNo7VIJO3UwO1DYjgGYL7BKt4AKpdCFkylOzrUricP56N8y/KWONhavSmEbLFa42k
         6QJHSyKk+uegloA08908VoBLRL/ckpC0O/0MSim0XM59Kxb1t2jjcORA4+V5wWlf20tq
         bU6QUlZClHQ0ljDApcZtfFPIhHhfYdnx8KsL9KwbQ4mCAqdNefDDbE7v/an1QlISq4im
         0Xy0K6j6n5jgygByCkeWxPd2IM6PVsLGaE3AmTuwE5iEAh0panU5s9Sq6BS6P9oJi8th
         +aIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142473; x=1756747273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=Dh9k8gV2di2KkA32A24ttGA2OYJ97yIgfqsKM6QnwdD73oB/VPTV63GUu+CoDqHVv4
         sOW4mUNWIk9Vc5V2VeIO+z/3VMasGG2n4GeV29D3T267GSXnvZ8JrbsrPnmsdQnc0PeI
         ns7zV0yaQ5O6shzEGXPrNVOp3GlUa3zJknb/LzCmgFdDzEcwu/dGlbfHDlA2ajUXX4XE
         /tEont4xAzZQm1cg/Ui+1DuMZIjgfw+0/7CMJ9FULxseJ63UsbaHcK/7jfVXd7NAOgg/
         iA1DQ2P5Pyv+K8s0D2gZwIaV6vrAVnFNF47wXU1fGgIcww8lUKx8oD4mZoXbPMMCHfHM
         M/yA==
X-Forwarded-Encrypted: i=1; AJvYcCVkYDD1Ip7Q8pJFwVa2nvPpAHVFTQQLSwqzuKOhjOK7k9oJm3uM0NOKBFPVSRkL6CsPW1arPp1De/gaWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBIWFYke72cGhpkx+bXWFX0FiNn0R/zV2fx3sh10QmxoJhCsAS
	sqfcuEP0iO1CP06nj+QSxh3vfgN4hQM2XHuhBtJSFuz6lRvT1LCfox4IDxd9s3RHNLpEB+TEkpw
	F5wq1NW0=
X-Gm-Gg: ASbGncthuN8+veOlhazj2VfxdcBR7NX8R+wDR2Ztq3zY48GZG2ivXb658rdPH6LBdk8
	JitzhEDMaJvdsYD3dcBmQfa8f0XSYY1zjkKbmeUyR4uTplzZtMgZlHHjcgeeNMAvU1a3U/CTolG
	tBKZfLlLLF+7+V6mZ/s5BF2vJ9a0N2ev9cGGbin05aLVsQOdL0LGKiF3V1Nf5LB6hUOOwbniums
	W+xse6xi5HcoLYO/YMz+yHGj5uXlZzRSuCtDzu3VmmTMsQjAYvfoJ9dOw5eZ+h4xjhMlGmtbxhh
	ZcC86lI8OjRySnP+9TS4T70+1/l5o3VCjUN0EuP4yMag1l6wG3xrg04DjX5Sg7rnAkqP3pANM6j
	fxbd+ZrOB3hy3gNPxnzYVT6N5SgtiZhtaYxB0M2QLcL20JNStcaO6nOwbsIu5N4jzZjpcg5KsS0
	gp
X-Google-Smtp-Source: AGHT+IHaZdCnT4aGtFFcRgzebFZsbTIztmo+Z151ok+iHPQRKBlJjXS71cSRNdn35Lml0SBstQEFDg==
X-Received: by 2002:a05:6602:4c10:b0:876:19b9:1aaa with SMTP id ca18e2360f4ac-886bd1cf44emr1652168639f.9.1756142473552;
        Mon, 25 Aug 2025 10:21:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:13 -0700 (PDT)
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
Subject: [PATCH v13 6/7] riscv: dts: spacemit: define fixed regulators
Date: Mon, 25 Aug 2025 12:20:55 -0500
Message-ID: <20250825172057.163883-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_102114_458084_1DDAB35E 
X-CRM114-Status: UNSURE (   8.41  )
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
index ae9409fe398b2..a11a60b9f369b 100644
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
