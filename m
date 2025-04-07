Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC56C3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHc+kx0AZ6elh5/zxdiyXkTn7zCDg/4rRL+s658U1i0=; b=C5o8WUTms4cfPc
	FoJNqRd/wYDv8WBDIqpzuN/Jjccc9ULT+D5H5sFUHXDP09GHwQ95IYRSgCU10Rav62VIbZgAYDrXq
	5ZTXmjFgGlmoMfpPHPul5ryUdFIuQf8ztofa5KiEs2DuT4fyQtS6+busfrHpJMhP9+FT9JZcoUlNu
	h3AJ4NDHRQVH1ZSv9+4E6KMFvxPngC0ONsTPIS6wwzxB4qTw6xmGRrr8ocvLd1rIdss4G2jOer/bb
	myttIAGDdKE7C5GKs4dX+p4ywpgBqfmN9Ksd50WdbqmNWruyHLDFoJajv5A7kLkthDUy9Gtx0EPUB
	E9PbVIdAyTgRqY4lkj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g5Y-0000000GaVr-472q;
	Mon, 07 Apr 2025 06:36:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g4m-0000000GaMX-1llD
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 06:35:21 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso2517069a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007719; x=1744612519; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nUKnCXni+ZS+V5rei8asTaXf4mmG/ra2/KlqUzUvNL8=;
        b=O1vIGdfwJsHsiftovzxs5g4onBhRjWErlk9bxTQXV09oH+TC/jgenPjvvXOOLEiKZU
         GJrJ+9tz4cEq+g8XWq4Zo6NiJkopBVs3LvOBlslt957wXUKh/ihG6i9G0DBE2T7Wjg9X
         Ov/GsfSf7gA6C7sFjm/DZ8KkjibFSEVZKsSuxSvRMRyxEudMrKDOrNwjZTtHILaj1hbp
         1RItf6XA2K3dHpOvRBtmMrcz5IjZBH7fBDZpNh0AYt7GyLiOoW/NA8PuIMnNvWjqtZjI
         tK+O+Mlw+e4yOmQ5/1K8sKzoLlcyKwAv+/HMc5fgi0wsgFBJos/07BE8deuXWCre8W6T
         IYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007719; x=1744612519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUKnCXni+ZS+V5rei8asTaXf4mmG/ra2/KlqUzUvNL8=;
        b=WVi1jz7oSeLB8r6LVJgJeCyml5GByWvp09m6TT5e05QPYFYyTqIenFJiQfv+vgVlsw
         b27C6DnwulxH+cID/nvIVLoOSdtkm9NamL3EelGtjCAfOT2tI86EU+oiTCeQj7zdiLp1
         v7OO/z3yUyulHHrT8gsfpL0E4uAwkqPllIbITK7lgD1mJxOn5GctINu9NnaOp75MZmiM
         Hn5CseNnGsx75Cl0t5P+O/DeKWmh9EYEnITfUvJrh9EgcG7Ex1Jx8He1LbuJfAUYP+sb
         LMDZROeLNCOCu88RzBX+z42aKp6xk4ZCiu88YKttsrqyeuUQBNL9HHOF6xp46g4LU3JO
         d9zg==
X-Forwarded-Encrypted: i=1; AJvYcCUlLrskAcCwTUpYhW9sXLTQWnbpMuoXXvosIA9zCh87/d0wg1PzfUbB7ou6ZKSEsjbs6lcyBWqO1k3S4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2kwAixLJrQyMuHCVAGnTRk5wFfSXvdOQfu5HKflgyCcsilBv/
	1lmDa+Ok8fOz0EUB+cUwZtUL3FQnQUm2jwgwkZOpdfImsaGCz4Q3
X-Gm-Gg: ASbGncsZPekMWQbh6l3bmZz0jf6wo8QXtQGVzYWOSsH9J3Np0FoP963p6SIGLPlxbFW
	HppjsOJ7CrJaVm6q5dcpLkV2Yn13+f6vulCW7n5ZHqvErProyLCMCZOt3GZEEuxCJ8+w/tnycdK
	8AD8ZuMMs61qJ8CWGsirhFan8BGkG1icW8is7Qt/n9JNwm8Jhrr/+Fs7+jMKx19xHYbRwwdpOgD
	P8AJMr+NvMdgMkleCr+BoQzTDjLaWt09HmJ8so/Z3NywV5Tr+ydry6Te4VeEODs1GsRYsDzhOwN
	V/laev3vqd1e28km03sPakGq2G1Pyzm4ci1T
X-Google-Smtp-Source: AGHT+IGRG2C26zGOmhoXFbiYCUXmZOta5ZKasjUrRKCZwa8ZEA1iM0n9fmVIC+YnuIVVcjAsIQP16Q==
X-Received: by 2002:a17:90b:5190:b0:2ff:62f8:9a12 with SMTP id 98e67ed59e1d1-306a62134c9mr12842046a91.23.1744007718706;
        Sun, 06 Apr 2025 23:35:18 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::610c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da691sm8048044a91.47.2025.04.06.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:35:18 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v4 0/2] Add basic SPI support for SG2042 SoC
Date: Mon, 07 Apr 2025 14:35:11 +0800
Message-Id: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB9y82cC/3XMTQ7CIBCG4as0rMXAQCu48h7GBbRDS2J/AoZom
 t5d2k2NxuU3meedScTgMZJzMZOAyUc/DnnIQ0HqzgwtUt/kTYBByQAUja6lcfIUhQODtWHaWJK
 /p4DOP7fS9ZZ35+NjDK8tnPh6/W0kTjm1WmmDjZaa80vbG38/1mNP1kaCPw6yU9Y6EFaVDcNvJ
 3YnuNidoIxipSoJJ8GlhU+3LMsbN/KdLQ4BAAA=
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744007713; l=1831;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=PrUQRbB1c+rJuvNmtq5sRl5XHonz7LhulE1jv95UeZM=;
 b=+Go8UegZSi0E77pZKJXd0DldPDvqti7TxLG0uptVeWXzxZduvooGHEgeSM4M2YYM6pATGfmqi
 JNh79RwI3F1B23p/37XeiAocKXBVwsXHOPhGKqqgwGevMOI5xoQHKvL
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_233520_471962_FA8537BE 
X-CRM114-Status: UNSURE (   9.98  )
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

Implemented basic SPI support for SG2042 SoC[1] using 
the upstreamed Synopsys DW-SPI IP.

This is tested on milkv-pioneer board on bus level. Using 
driver/spi/spidev.c for creating virtual /dev/spidevX.Y and 
tools/spi/spidev_test for testing functionality.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v4:
- Adjust the order of spi nodes
- Place the binding after Renesas
- Fix the description issues of patches
- Link to v3: https://lore.kernel.org/r/20250313-sfg-spi-v3-0-e686427314b2@gmail.com

Changes in v3:
- Remove the spi status on sg2042-milkv-pioneer board
- Remove remove clock GATE_CLK_SYSDMA_AXI from spi[2]
- Create dt-binding of compatible property
- Replace the general compatible property with SoC-specific in dts
- Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com

Changes in v2:
- Rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- Order properties in device node.
- Remove unevaluated properties `clock-frequency`.
- Set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com

[1] https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst
[2] https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/clock.rst#clock-tree

---
Zixian Zeng (2):
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      riscv: sophgo: dts: Add spi controller for SG2042

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
