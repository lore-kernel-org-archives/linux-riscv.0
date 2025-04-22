Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FA4C369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 03:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ws/FFLtSE3O6V02K0obKARr/obxSPwbfv5qMc+TAX38=; b=17G3548noyoG47
	WPH3fXDjUCJcLj2Zb5+FO/fvJDLV+JRx+p6czBk7ASQ8PT+Cy9gH2NYdO8YJyMO4KbK9gbMXFHFY1
	lrIuuRdMm0fSGBdW25i7PwVI9j4h0FmC+z6YowYCwQmCe6cqE308Cpo6DyeRslnT/WlaFtxL7cxxh
	Pp4dhj7r7USM4KgSvZHhKytaKOXvolsg7hetmzL0/tFAFaXGzLk6kj+bvfktuoPng4/xssFFU4Dpv
	UH5/3GQV5xrTOQJqajKDoE/VJJ7TleUj3jVlh4/xj+YTMqGvpUFtmln4megT4yoAmPRWkjU+OeCWJ
	MGfX4UM3wqa31z2uqDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u74ft-00000005k7t-1cIM;
	Tue, 22 Apr 2025 03:51:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73M3-00000005c2H-0R8o
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 02:27:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223f4c06e9fso38870725ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 19:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288842; x=1745893642; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ6lBxALj1e3hUxjwMwYeVCjpq+uXRd66ywkq8grLp8=;
        b=V45aZJnyepb52nz2+wxN/yrUCzgDYlYkcm8t8Rc5ekNh+4RMydYjErFahnKIeusgEa
         S+opk77x81XbA4oTPbWlp1j4KsEyDe2mO6/zkspK6C/+Rv+dUkpbpwKLwX14sK7IINaV
         HIrvsKNN4Xw/oOeO2vcszJGbVeascW+MsPllRuOZgKpVEYQqALpxpUr/rEbdnLTbEO9E
         KdzxFJM457hlPDhF/WUBfQDYYKkyMEqNQCrCh/PAEQy0O2Hd3wMgBEWQJO34zu0m6i5Z
         KvZEeY/aoTcIG2a1v6ohGUJhUGT7fjt3l4O/nLOKw2L11UEQ7rlLVUYatyWdf2/K3vBn
         iMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288842; x=1745893642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ6lBxALj1e3hUxjwMwYeVCjpq+uXRd66ywkq8grLp8=;
        b=VmisvPePARC3/a07s5GUV00s3uYXbvuEb217YlUHn784wEUTSgSOTaQwnxXfMEWk3t
         KCOFOPiNCg1ZLJs/s3yLn9SkZCPX2ZtF8GQ32GSBAdentrzTWk0q9My9Gc/A/XqGm3gT
         bjPaxySrxwcplq7uDxTquXtdimSyXbOQPWYP3wotDY37/UM8jwW9d/SHa1TQQ/I2kVck
         c+yP3Tg2XxDIGm+i5REE8OwLL2k5gQcNq3cI8gKHvvC1JpUL/zLLUYx2qxdGsPywoAn4
         +0gWYdBYwgCyoh90G1g7slK6ehZvWzPcKi4WecHroLupJWi9q+8mt/KQaQqpyEyKZUnI
         WoAw==
X-Forwarded-Encrypted: i=1; AJvYcCVik6BG/DRDnxmpUXYmMehd3scnd8mRTbpy8kIy37EGA4p+n4VvHuOzEg8yHA1rPH30PHxf6KLhBtzMgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz61senrqgr8g4MYlJYPKASu14S0dW2Hbs29ts8RYD2FSGPQJM7
	mdPGt3T1ntMe3U7V2WOY6VqoGL+weggjk+N4PRH6UMDvzUHMkB2C
X-Gm-Gg: ASbGncvuINRN44In77IDGe/ybaxwitraAsobP2F9rf7oywsuTRyI/IbMAtqRhzONIJn
	iFmNyRMcL0hCOApoDn1lpnDV7PMbTXgvzQYL9hC6VDpN9xRdIUqu2Dr3IDLP9luH3wvZ/0yVGoa
	GntLjRUo0sqr1WpsbRJvGnT8pdAQBAhprA3C9GcSTswoX4Be4zeC9rEA9RnOFDOY+utE09l78iw
	a10OxW7p9UNBrvHi6sGAQul43JZNzBz+H8wIuab9/F0BZuJodwlvX7clnnT2+xT5VeQKVyxtA/t
	dxvvQ+v4FqkWHKOVf7Wjf028iAWt6HAK2xymBoiOEueEhcWFPvYOuuv56mQ=
X-Google-Smtp-Source: AGHT+IE8s/PFyhjhaPYvt6bB4xUY2xwxqA7TDLSF0+XalAWL5s37/k3bBFnYGUpM6h2mO0zvjsBAyA==
X-Received: by 2002:a17:903:1ca:b0:215:a303:24e9 with SMTP id d9443c01a7336-22c53e1a14amr189152745ad.3.1745288841169;
        Mon, 21 Apr 2025 19:27:21 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:20 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v5 0/3] Add basic SPI support for SOPHGO SG2042 SoC
Date: Tue, 22 Apr 2025 10:27:07 +0800
Message-Id: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHv+BmgC/3XOTQ6CMBCG4auQrq1pZwq0rryHcdHCAE3kJ9QQD
 eHuFjYYjMtv0udNZxZo9BTYJZnZSJMPvu/iSE8JKxrb1cR9GTcDAakA0DxUNQ+D54QVWCqsMNa
 x+HoYqfKvrXS7x9348OzH9xae5Hr9bUySS+6MNpZKo4yU17q1/nEu+patjQn+OIhOO1cBOp2Wg
 o4Od4cSd4dccMp0piBHqRwcndqdEvnuVHQobBE/aSVh+u2WZfkA/FtuWkYBAAA=
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=2109;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=6ruMT3OdM4nY9Z0xw4P1SJg0rahSN0BTucJQnw6em2c=;
 b=Kj1qEicqpG/qzfM8OeIPXYUsPfB0PdPORtKudCqG7QpQxQ0XMb8oe6nVkuDtBB7dm46FpexHj
 NO49kygB3CsCfxsOrjUleGzoqTipOVfWhsD5zr4HT2DxYinoxMp14Uz
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_192723_168898_09AB6B3B 
X-CRM114-Status: GOOD (  10.36  )
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

The way of testing can be found here [2].

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v5:
- patch 1: New patch merges all vendors fall back to snps,dw-apb-ssi into one entry
- Link to v4: https://lore.kernel.org/r/20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com

Changes in v4:
- Adjust the order of spi nodes
- Place the binding after Renesas
- Fix the description issues of patches
- Link to v3: https://lore.kernel.org/r/20250313-sfg-spi-v3-0-e686427314b2@gmail.com

Changes in v3:
- Remove the spi status on sg2042-milkv-pioneer board
- Remove clock GATE_CLK_SYSDMA_AXI from spi [3]
- Create dt-binding of compatible property
- Replace the general compatible property with SoC-specific in dts
- Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com

Changes in v2:
- Rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- Order properties in device node.
- Remove unevaluated properties `clock-frequency`.
- Set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst [1]
Link:
https://lore.kernel.org/all/CAKyUbwXqg13Ho7QHw8vV2W6OcObphwhQ8HUrZMDNBxrVxLmdug@mail.gmail.com/
[2]
Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/clock.rst#clock-tree [3]

---
Zixian Zeng (3):
      spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      riscv: sophgo: dts: Add spi controller for SG2042

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   | 19 ++++++----------
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
