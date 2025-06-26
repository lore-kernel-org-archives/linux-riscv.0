Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F17C83010
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnYd2l0SYd5PEBSyxG1BCWfIaWCYwvx90rgFUEeVLM=; b=Jv4eul/GSf7C4C
	puoSL5a0dIhVgGop39d7QSS/NtoAwqZCwtM4SZ7OfeBuFryCbKizr/3dOtQhhldmhEadCqhhJ9zuT
	4l3mz/Sw59l+bHuTe8te0kMfJQjN2pSdEmLzDA6wW4U0CXTHS0O+GFc7Nyv8hM7BN9ufc52XU+NJJ
	vZhWP0sWMu5bmZahhLggrw4qSp6bDsMIV3lJtcFLvkJfs09rBZg8PPRzwFW9/8uCgD+z3yO49g6qI
	t3CDq1ncad2RRlhFmvFox+wFRqcK7zqc8ojKeZ1hoU2V1YvEubWnlII4QYXEFCTxRWhzB/kMIWXn5
	emB5aqVKi0UrWxzSHcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUncv-0000000Bvh2-0AmB;
	Thu, 26 Jun 2025 14:30:57 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnR4-0000000BtSP-1ycl
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 14:18:44 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4a58ebece05so10981211cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947521; x=1751552321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=M5qRjT3/N5ML8AuE47UFaB4tH318KLjNMmmVRNRBKqAaa5gNBUIk58duZi5JOQaVUC
         o9/VAuNarENazSrid51r/Ms4nwu/byFm/k+BpLCF1nTsGPWkuUpje+Xbl7W+3R7K/MAs
         +lozi+iV5TeaJuZ9KcKGtTUkFAbu3IIOqxqccj/yUd5Vn0+pZZh/BNVObzvt5AS1MQRH
         9hxgoU95XSD4kzhbeKFWHEE6eK/VwarXOL1T7g51lVzEB0UnKyqLh/TKRmZAoTbh4Wyr
         8CxEpbxV8z/qGN33IiT8tBibR6WxA/rHil6MPiX3t6KdfHwW1OP+huUaYwCIse4KWHYx
         cXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947521; x=1751552321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=tJEnJRuWO0ZROLgEkh0IerfKtrMW1avaWiBzYcnz81djvnySzoVDzJBSU+ciF2Ja3T
         BEGfe7CAqDHAeZe+mWhdgHQGk5iNyR7VZehnFJ2OGBhdzFb3leKraABPUhwtvLOkDstw
         68h2g/K7vZS1mcoGQIf70CWCQWLHo5rZDNYs3GYW2A0mFGQfBTG6Nm/0I3QKwfB8uTOQ
         oI1YVy9pwFgR/Y746MYQfZhyG1ZdVYDsUgeO0WDwaZ9zN3LEqvqgwBHkayvS0akwg9E5
         ldjLwWCJVvPbA9revyG6QoPQ1yxmBk1FXy92D5/OQb0buFy2uQZUXMUuTcups9wy5piE
         mtFA==
X-Forwarded-Encrypted: i=1; AJvYcCUIT0+Fr7bGJvyex7MEJPFBx2NWyGA8/1UxS8iDR44grd9ZTrhuTBi7oeVDoCHDYpFm5yHvp6C4LGczhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ULjoQEEGc8RacYseOl7DBZ7A6CHQatEWA473aMRuX5JCHzmY
	NVs6dxx2Gb/xl4CR2E1ABJ/hOI6/F2W3X0g9G8ApZrUZatFMJ5aSb51m88sDCbv9x5o=
X-Gm-Gg: ASbGncsKioZT7CGkWfJaNneyOHcx2DolqupWIl8ELoXynMrrwnQiNXEneCC6VIC5bUc
	lcqz+jzEYSfOTRE4DpGpUNy151h/mF41z3w26HuBvdpiucFbwhi/R26RPChWQQynjHVrIj4XF9g
	TIK0ej8aYrMetZlI+iQSx07ux8h4hZBEvbEfuiQ/BtlkzmdDMuIlNPhh6I+7qT5cnT6Rs/kQIut
	VzHPEtAQ1x4xakooTDkh109ZgFqd/kLLiqCC/sXx6DbLs0GT1i9fr7vzwwKDb9SadgIC7XFJNgA
	g8BFRym8tPfZmBH6Dyd4tEbTglOjrfSk73EDtcEacoLO0qyU3xDDThX9405lRq+oVfGtK6N2jOI
	b3fXyWC1mymYBjPxwhEgybq0QD9MV4mqVgaU=
X-Google-Smtp-Source: AGHT+IHsx3U02C9l97yXNhErNtXWuqZBL2Ji63UbeBAH3WQ3eJzVVCOgX1IG2CL+5mxLNXJrr6vN/A==
X-Received: by 2002:a05:622a:13cb:b0:494:7a16:18e3 with SMTP id d75a77b69052e-4a7c07ca74cmr99997701cf.29.1750947521231;
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
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
Subject: [PATCH v5 6/7] riscv: dts: spacemit: define fixed regulators
Date: Thu, 26 Jun 2025 09:18:25 -0500
Message-ID: <20250626141827.1140403-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071842_502355_C6D33D3B 
X-CRM114-Status: UNSURE (   8.22  )
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
