Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C24CCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pu1bj5jnPvj/qFZO60fsuJIBpSo6gtTw2wf8lA+Neps=; b=vLgWEC7iHC57EP
	dKKGYXqKbEA4wXYzbfSoytylv4iuPwPU/qN8M4ysEX6w68BHMc2P6OffYTPBFciJ/F1ckKGNep3Gg
	WMse8ll3Ztn/hq7L2WfgS6lRMgnN1OZlupi+fYyRGXizvV6DgG1YtbDYGWhVkLb964pX4KdQp/kvL
	7oM8V5EbdMlLz0t8YKlLCbTqKyNpcvo+Xzrs21uqpPxWT+fsgMQYl1lJwzsyIYapddsGaFUm6Az5y
	CaLur9Mp6L9Qlb9J1mGB03w6Al19kUUB7u8JDUqKmOF5mhjfCZtDrXhWRWJYXxjPsrFHtbvut0sDI
	AuWBfMAp4ZTU3PIOdRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQC-0000000CQgq-166A;
	Mon, 20 Oct 2025 08:39:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQA-0000000CQgM-0TCa
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 08:39:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3305870b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949553; x=1761554353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lC0+koW9LqBuD2DjLYQLY3ByhReVTR9v1Ofuem5KTnM=;
        b=NTu88POo14EkCe4oJoG75SN/zV2HDnlsLILhqOhl/Dqf5GqjpoAkKa0LbDJtJ2kD25
         5EL/6lY7qNYH0rniXIXg4vbE+PjBrq7tecN0GzRFmM2B4cAuU/CW7wIt042kpu7fqiMg
         1srUl+qyFvR+v2+nsxeS3JphAwRKu97CxRmvACC8V+dtw7CEgjugPAGFJ5X1heNyBl16
         YAiWBCzTjIpw5fOOSUeyoj+wLm8rqcm17NgKXf/NwRjB0IDNt37Wba+o7wVpcW2aCtWr
         wlQ45fAHdOLudVaZYNZzvvaVieEdZI7erIDJV/tXcDbKoIkfOyz+zaI7PcdYkAbjDhc3
         4TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949553; x=1761554353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lC0+koW9LqBuD2DjLYQLY3ByhReVTR9v1Ofuem5KTnM=;
        b=q3VgfzvSrMshne62Vu/YYSpFYuWuS+5y2uRmbpXuhn1BoFgAFZsQflBpnEVZQpLSZc
         LY/wKHbbTq6qY1J0wIB3pNf9YzCgx0f+on3dIwokFvREyTdzuWuopanCoiHb9pvFL/7N
         hp1lg8EeBam32J2HdGXfl5Lj7BOnR4Z7N8wj/VpgXrNF3BO9nhZhZi8Exr7bZRaoKe1n
         rZK2dphh8XN2unipohHGFdNTFn8sptkZ4zMBvjlMV/30Klrp8Rd4LUKIrtLbFsKRJ8si
         S1PAF0JcijS3hcTjPlQ/0GCC51B3Ul8LZ/Lma96DtPxcCGUTV7NH6XJmhYOUlMTIxYl+
         tzEg==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZExBuDxNv3ZxnvUkj3dCT4jXDw/gPgVPktT40TjnT6syXLtacs1pX9p4ozdh80XDkYbEkFqxfkNuSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8w9y2JwYg6Lcmz11DfGZ8QDGgDg/dXnA2DH/2VQGrHJ/NUN0f
	+TSOinLCPPvRUDyBO8UsNE03N/z+T0N9XHmKEfuhdieves3XWl1Mruzy
X-Gm-Gg: ASbGncu0YzJGTzJtjRPxVJ3HsMSXIDYzQUnFdYPJzWJ2+7F1iOtIdIxhEgOsjcSlka1
	06o7rpAongP++zshGvvEIMZJZVs3JYns3hy8RVTZwWSCieJ1Ye1VbidjV0S5TzPIPsD5voJgUn3
	FWleN6WTLOh+Rim/6r1LuYgl7REzK/TExm3o8V3JsCHNT9o+zqS4XsDR5WpbAjbzZqZkQGPw8Kd
	f6+PkLwYxdtIFWPmyfjYzhFF/SqtI04paAfutvJAA2rfp8mSxgBBHp7g4ewTTLXrbNZFERMB3X3
	lYgS3jLE6YCOQG7UVyTCSLFhNbz1TeOtFAX2gK3Jpq8yzbLhr1Sum0BaI/jy92QQ8+O39YOgU25
	OeghDm8AyKLxpNASb3Qu50Rf+HDOPUTabISpERZylRIR0j7SVtztdEgxS9jET+mBYxEXbzIAU1X
	jN0dLttgoDTW1rxSjm
X-Google-Smtp-Source: AGHT+IFfolMgNTgrjg6QCUPSwye2gWTgy0cB2CyUntFytqmxf6KYJJHGK5kXGlssp1Efpt+QdGtvtQ==
X-Received: by 2002:a05:6a20:9144:b0:2f4:f041:a065 with SMTP id adf61e73a8af0-334a86103e8mr16827774637.38.1760949552820;
        Mon, 20 Oct 2025 01:39:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:12 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Mon, 20 Oct 2025 16:38:30 +0800
Message-ID: <20251020083838.67522-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_013914_152959_30E81E7A 
X-CRM114-Status: UNSURE (   8.71  )
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

Add top syscon device bindings related DTS change for CV1800.

---

Changes in v2:

  - Add ranges property.
  - Use proper regex in patternProperties.
  - Add complete example including child nodes.

Changes in v1:

  - https://lore.kernel.org/all/20251012022555.6240-1-looong.bin@gmail.com/

Changed by RFC:

  - https://lore.kernel.org/all/20250611082452.1218817-1-inochiama@gmail.com/
---

Longbin Li (3):
  dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
  riscv: dts: sophgo: Add syscon node for cv18xx
  riscv: dts: sophgo: Add USB support for cv18xx

 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  5 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 42 ++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  5 ++
 .../dts/sophgo/sg2002-licheerv-nano-b.dts     |  5 ++
 5 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
