Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF23CCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 03:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGXRRNjMZsSJdBGQlbIG66fP5dxjfQBETzO/evj+O+4=; b=ZCde9KYmhEWILn
	eqfilXiOfn9X15BW1D870T02XsJr8joTvKwLEms3oNr2oeU+eqB3LgIKT+Re/nT0JuADuxYzs0BT6
	Nq1kz54rE3g8MNYNhxMRH56iNwMNzJtYmuTAM9jsMY/fPim2kBD0fvJ4nCdS7fe+5nYC+emf4aaER
	Wp8Hn/mm/m3FI+6je6mUdxPR7NKJmH8qmEDAJotNKG2e4FEjlq6+DvDG0eBLh8b1uz9q6ZnKclqwv
	9ovM+CGXxfeLEf+SbXQydVZzmAaUqactWsvBsQYgLZ2/XCEFqZ1kRIWYU+rNRdzqYaLRU4h5FLDor
	N8yE3Q/C0BUr76KmJWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgkB-0000000BnAW-1sgs;
	Mon, 20 Oct 2025 03:39:35 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgk9-0000000BnAD-0ana
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 03:39:34 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7c2846c961fso1736961a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 20:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931572; x=1761536372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=OzsuhuPvcD7jHY+FaBIyY8itfYKsV1Vgjg7FgBigPF1/Fnr+NAqWc5CGWr5VxkObDQ
         NkVZl1WBkOrr/1uDwqbSar9C2nqTw5ujUn9RkyYjZnpVQqZ3mU5hqDME7dVlnJkYXa91
         8VnSitYfzxV5lSvQjY/PZzJtUoE1Fr/qsGVB1QiHJOUA3UNH4qfjwTttx7NlQgJ2nG36
         IwCTtGfBnfiaJH84DbQq3tN3qnebtTSIAw71PTqm41bP+6vAVRKybI2cbg+PQMv6AYOW
         g5600nBUYDe6UDqCvdhkAzDnaYfUV8YMmoaNayKGdHeNhN3cPumPwC+tBsna9oRwC3Gx
         s66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931572; x=1761536372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=eLevXEXJ03W3ruXpTp5vy921deq1riN5CWwWOLlMRnbvISbB5fSY73vjSHbRSfmn0b
         HoI27vG/9mg0540+bPqsptWOaCOZ/LGWfdQ+fQu7/MmOAl1SBjZaHG+rAYuosDCfzWbO
         ULy7DaG8ki+FJth5xBdCZjfH8EQUkkQFCIn2QvADoy9fZlaXd59xli96ssHtPLaDcnBz
         7UTCCVkohK61k9h9TD4qLom9bq6IcU1GH3BIrbCz6W87GEZDc8xxU+PE1TtiMrfv5tYi
         bQf+6On0jXbpGv6EipZp7AmMnbjbnMb6CT/sOQf5jdX2oSTfDSXzHitbrDigpfOv+M8K
         RAVg==
X-Forwarded-Encrypted: i=1; AJvYcCUyCNMuUu1N4siErw6+qdz/ESyAjmd3H1DytnOMK+XV83FmBF9hI2KoILAtSu4Y5gCNAhD6r/tRnuyaAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/0WlzsSBSruEqmxmIL0k50Q6W1HXR4++/oc7SQjhn3Iu7xmGr
	E5qg+MdbdtytAwRMfjJr06B8hZriMkZt0NMOdJGFqu0Eg6iNXKA9vYg/
X-Gm-Gg: ASbGncvOwo82/mgJ4K7yKU0Y07OeeoMXz4253QiMZ6CkIL+zoOZccdGJfMW/nNhzvOs
	hEoeu7Zicftci0jFNryqTx0Z2TnGwAu6c+SuzndwGWe6jdEQfLCrw7vamL92wqzM6VgkzBrtvf/
	C+K45Tb2nTSWkb86iG7jOHNqU6FgYJVvmcCXO26i8WJ8gJzfh/w6QppP/44PLoDbBeM2Ug9yS0o
	nzgKH12Jp38UFU7bxX9OR9SIrJ3NzqPZRyyZfYAt9zk9cHtOLGnCOdK666SBMbRWAit9sD1r3JX
	U1QNvLS54KG7cJTBHLzFahCC+zBIj2kBt4vw6SlrWPVOdZVFeoPvsceurNgOWqG+bDBNerdpXgw
	HjCakB8LUMLKyJmsuwqc3Etil3vXS9PwaVFyNvu8/3blEO5UyFFJF3d7yP8+RerFNay4bA0it8+
	9AX8nsi9ggzw==
X-Google-Smtp-Source: AGHT+IHOs0K/WHwSdDIh+Y1Yr2b9rRO8V71RUx/TA5imJO1TgmZR2tfJC9CXblqfxCEeOeM8R6VM+w==
X-Received: by 2002:a05:6830:4985:b0:745:a30c:b088 with SMTP id 46e09a7af769-7c27c912669mr6299929a34.5.1760931572053;
        Sun, 19 Oct 2025 20:39:32 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c28890f2a6sm2259202a34.24.2025.10.19.20.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:39:30 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 3/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
Date: Mon, 20 Oct 2025 11:39:22 +0800
Message-Id: <1ad96631cc9d9d7403a2bed5585d856fa101a2ef.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_203933_206433_8CE82AD9 
X-CRM114-Status: UNSURE (   7.91  )
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

Enable PCIe controllers for Sophgo SG2042_EVB_V1.X board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c6..a186d036cf36 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -164,6 +164,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
