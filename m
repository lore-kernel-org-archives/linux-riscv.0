Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A2CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGXRRNjMZsSJdBGQlbIG66fP5dxjfQBETzO/evj+O+4=; b=xCLmY2agXS5n2Y
	/YH9DVjyk3kaeQHNK6p+0Ctq/SxrzEK0OyA5YJpdJmKxt6d0pSw54adNpLQL2AGTej0M7LRll4hFF
	gYL37/ZVtYLXZOuNPdOmazF1ibt8JvdYD+kyy4qJQrSKWLpKeCOANvHnkeqw1tYZN24iVi9hmjnBL
	8DtCGywzR32li3IfJlxNpQizPZ3dM5w0YPDNiYnwEwr7OhF4FFvQ3opS/pH7Z8/TpGvLix4VUMrML
	cGEXX+SzbY1oLfWBA7xJPtnvbhdqBd2e9HbeYnsoug4KbVOzOJWz2xFdNhyK9bvF0WBUdNUcs2uiC
	wLAZOvYCYrZrcFfDYjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAHm-0000000BcPx-3lvf;
	Wed, 10 Sep 2025 02:10:14 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAHk-0000000BcNP-0Z0g
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:10:13 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4b548745253so88291251cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470211; x=1758075011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=G8hjRxDSw1KajrkYGmzR8brtF/8koasotCeEXn9akuxobbpZBkevLgcRo3b2/UBnK3
         a7ufsa5CP4aO4qFLj9OB8M0PkvTk8+98f6qOWGQClb/QdTliLaHrAZUnwKhHStcR9vVZ
         M6oi0H6QP1gLOI2exHlVCiB5CQSctV78ADpgFy2NLVw0FkM62w6/nBWboWteTAqumS+x
         L/SWjiVzdnaEv7A79OAfjZPY+sHZ5Jpl5i53bGP5ryk984K6UT+ofnX49yVJ/dUzwmaq
         DegK6UW6U/z009kYPSdU13Rgew6/ZW8a2ed7DwyqpXQjW/r7KbUQMUPqrLcycIn9YzKG
         fYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470211; x=1758075011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=P5SMVvq+8ZxzVyDfdQ/zd2re4pBFSV8+Sbx/M1Cc+cI+3tZ3BjiKA2vk/xSBjkdt96
         kSBAm7NpO+SQawMyebItAZvIezzQ2XE3agdNCcm7y5ODH7aqpxUHSvXrKJg4OvVysXDh
         +oXZhc+FrBfcskMeNS9Wg0YYDczNqA5ckehqF2nFKRj5IbgGco8F1QQsxNvC0CFusFox
         fLXM7hwXELuXYOJuzDa0Q8hF1fK/+Gz+lTrDpPjgr7CtFj+7hySrKtGQmnB1A5i61ZHu
         6DYlLZJzybp3m4khSmUXLJnhq9K9RiFam8XhjIq0a5JXKwHNYlb2jYPLqcO62tX3+HvU
         7LpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1A5kO6x8idxUckKId4/bpqMTLMX8oD+ROHxWiJmNZFtrgaukqTd9MOrM1FzxH8G/9RizlAcLD2vqDxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrrjjlPoAnDbgkoNlTNB2GlnVDLKLaLG8PyOcYAivO7icwNFb0
	rRmBRZYIPZUf959Yz+VSql3GGmFm5OamPwIRLT4BHcd7ulNUVb5WJ5AQ
X-Gm-Gg: ASbGncvJk2xwf0uv3liHLUjzJEg2c7ZzFNomZmNhR/dwP3juVIuNSbbxpUDrqokZ9KB
	a+rWBHuXUNcXZJQwUjJCjR01626hJ7gH3G35YT/uR8pkDohN807I/RtibKx0XVILSzj88RmKxU1
	2dFXwGffLLvddvs1HYfOli1CVExzOQkZPjMHjL4+5nQ62C8x8MmCXpLMMEZLOvFkDvpKai8W4iJ
	2726tDT/UUB7hRoSuB0/VfpLFVxFROKywRg0N0D4IpNcqyt/LrKQGadXo89Q4EIu90I1uo7Nfls
	TaXnvkieVA1fdEeE4wvpQkVG+Z2mdVB3Vh4IuUY6+yFGnEC4ZsxKplkgb0VdOFVYLWd6vm5yHJm
	Fou2kIe+djqTPedeFTfWVyDukzOtP08l9
X-Google-Smtp-Source: AGHT+IFuaLhFcKitf9ZA1Gn5XpJiUTwI3uqTd3riF4+17FcbGqTmvMmJT20lOqveQiIDe1ADGGm6JA==
X-Received: by 2002:a05:622a:647:b0:4b3:cbc:18b9 with SMTP id d75a77b69052e-4b5f83c890dmr144732481cf.33.1757470210737;
        Tue, 09 Sep 2025 19:10:10 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbbc0ecsm17446521cf.25.2025.09.09.19.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:10:10 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 6/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
Date: Wed, 10 Sep 2025 10:10:01 +0800
Message-Id: <2d85c8b221bf4aceae6f3dfaef6d53221daf7e70.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_191012_183564_ECA3F3E1 
X-CRM114-Status: UNSURE (   8.42  )
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
