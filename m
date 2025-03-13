Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE85C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZF5pSaP9YndQ+dKk3jaC1KOI1WPdoNcf9dVrf6CNrQY=; b=wjAHZRBr5H1EAs
	XAqyV6wf2l1uuRa3Tk5Rcnn8PKPs9uedbKoGzrSivPzNM1Q4uZjBDYv+fBoWapHxUDoKuvXmxSCl+
	nFpbAktuXlS2vYkmoCMXX1h9MwBlmbhW7Zz5fFj3zlCqma4NTd/eI3sD2RHswGuXkhclsmKfuxXvc
	C4JKOmgmNkE9Q+vR8pda+1wLQ2pW8Mqlma+BGKUuU5jb99/sud5cPPYbqOa1Wwm+MBm3sLEBk8d6d
	6OE1dPVkka4zZPQMgWI5eUudh4cwbG++a7h5ygT6ahytYtaNwBhqQX8gU8daWuHR/gN6qfwzj7fQo
	l599/vXZAywfrAqPdy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjQi-0000000BVgM-1O0y;
	Thu, 13 Mar 2025 14:21:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiLv-0000000BLoy-2s0E
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:12:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-224171d6826so21126065ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871518; x=1742476318; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whAbkbFeemn/zGkgo0Y/FdRAbnzleJIZKjpHt+Srrxs=;
        b=FIm9sE7LPYsa1+3tkKDYGdJxYOL8KQeGFlzWccoUVYE12vnA1MdDkmbuKXIrqFe4ay
         dI9j29vgAkmNWazP/y56SV7WYYqqVLsvNGMuFV9fmb1JZRZcxRcBGuqnnXpqocI3OIkA
         MbFBsV/AQUxI4J4t5WN5hy62BIOmx21UhoX99HE33H1ffNQOJ+syW7W6KMm0jLqalS71
         YUMxyt6XcxtuAmZp6oIGFhYS8DJlskjsi6n89prQx3RQ71jJsanxF3ydCfaoJj6L/slJ
         XHovF1nLjpx7RYpTgEwTWl0Je7fN6DNdikmzE6StgHsca+liU4DWn3ye1tbx+OIBklI4
         RWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871518; x=1742476318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whAbkbFeemn/zGkgo0Y/FdRAbnzleJIZKjpHt+Srrxs=;
        b=KpRYTAfYHE3ziE0AsICkRLFT2mZQMLhTc4XPMEisFATxahyZl+Ua4tE2tljbTte5dB
         IMD72J7y5P5kJrDyKiaj6zOopydftiLmqqkAxeVAW3+haG3vOopGibRPGofFSIaKoAbv
         l3DjeF8uALfuaPPv23m+PA8//2HQjD6CvCGxeB2j4SEcebDUSV7ieaKoqjgKxPWTxwxX
         6vB6jT/xVroAW4w6xTZFA7tKipUn0f11/SNvxxt5ZMXIePKec3qnbgQu3ekhyC4vg/tO
         Qx7vfRizewVDJrMAfEWpg2cmp2eYo0uXt9JIPuF7JjJJY69cUA6imdOO0KEWRm0y+RY/
         yiCA==
X-Forwarded-Encrypted: i=1; AJvYcCU2pZUx+81PrDYbTVPOtwk2nw2TnezQSJPeUVkLXI+tMRGp+/EchMoSz36eU4SwwkpQFjfHCnpIXKvU4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkHE3cfIPK5BjnmC8Lkjdhs5Xutzt8w03M+AqHbimXQdf7Gwmo
	f3W9GmO9QM7uNUJBJFq5/UnuD6vFapS1+jGrwnfm2IYZ4Bvij6a8
X-Gm-Gg: ASbGnctyLG8eA9aOFkXaLZHhEBPCeGp0HLTYyIjugsUuXzyVmKwf9N/VwG3E9YfvNlg
	cuLuCXpJrpkYhm+KPFBVyhCsLh66SP5T+qlbd0rkPD5z7ZqiNiJjunpKenz+tW8RGmc824Kgz22
	I5qLCKMIYyVERHnKCtETYsHqrzpHYulit3ucLkLOF3f1103PAkwyCI3wLAMLZc7rXM525e8CC2g
	GvHLYRuI2koAAnYmXEDTy1pD1m8HdqluXLCWRsqinWsxbOROClzXUHCXCgMUnEC2ujs9krlMWsr
	Kp9EJ6Dg62XGQX5AeTSNr/u63dA1h2mPljI=
X-Google-Smtp-Source: AGHT+IGYDZAgi/KLUPOznQ5xgfjN0dWdgaVF7llKO+O2iscvEuZFt77ZOFuioppulgZ1uLXSYl+/UQ==
X-Received: by 2002:a17:903:230d:b0:223:f9a4:3fb6 with SMTP id d9443c01a7336-2242887b4abmr382460685ad.11.1741871517948;
        Thu, 13 Mar 2025 06:11:57 -0700 (PDT)
Received: from [198.18.0.9] ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d52sm12539615ad.116.2025.03.13.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:11:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v3 0/2] (no cover subject)
Date: Thu, 13 Mar 2025 21:11:48 +0800
Message-Id: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJTZ0mcC/3WMywrCMBBFf6XM2kgysZC48j+Ki6SdtAP2QSJBK
 f13064EcXku95wVEkWmBNdqhUiZE89TAX2qoB3c1JPgrjCgxFoiGpFCL9LCgnRAR62T1nko7yV
 S4NdRau6FB07POb6PcFb7+tvISijhrbGOOnuxSt360fHj3M4j7I2MfzwsnvE+oPam7iR9e9u2f
 QCfbwvy1gAAAA==
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741871512; l=1276;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ymhFzABxxhmuPpjW8bVGj4OoIaYa+Zw8k01HF8R1co4=;
 b=ceQjO7hj4JE91EZ1K+OmC7H/r1+Yyt7wnSBhFNdaAQyaqmBpaeoOe3uYiEL1M4O+ok1M+xlVp
 c0kytGfEnFvDm4NumSnrSAsMqwu9q4iIQxryJ1f2zrVPUKtWQcjC/En
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061159_725791_596A5883 
X-CRM114-Status: UNSURE (   7.53  )
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

This is tested on milkv-pioneer board. Using driver/spi/spidev.c
for creating /dev/spidevX.Y and tools/spi/spidev_test for testing
functionality.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v3:
- disable the spi status on sg2042-milkv-pioneer board
- create dt-binding of compatible property
- replace the general compatible property with SoC-specific in dts
- Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com

Changes in v2:
- rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- order properties in device node.
- remove unevaluated properties `clock-frequency`.
- set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com

---
Zixian Zeng (2):
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      riscv: sophgo: dts: Add spi controller for SG2042

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: aa5ee7180ec41bb77c3e327e95d119f2294babea
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
