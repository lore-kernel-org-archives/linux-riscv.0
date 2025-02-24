Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09775C021B5
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l6nSO9Os8RdDE+e1Gn6Z4o/amEzpjPij+cxDaPAUGPU=; b=bDe5C3rF5Lm43c
	3NKcvtX9mCty4myZtG5HE5iq2r/PSGnDl/aixjmyd6iXnSN0nf+32bTnOPGjI2giZ9rC8XPI9csb+
	xmw5tYMnvw3mz3tKb/YMZCqQGuJQmAGy4pt8r2D7eDeE3rtUfjOoOEB1yveXIbEH59+fkrTnWFRJu
	Dy28ETqZsyh5cpiebhdsKn+U3r/uLaC7vq1whR6jEMWWlAZu7HdIdEdpj9/XT+h7Zk1dvueOZc89c
	aqKnF+2cXtTeSoRK5uy0O0Tpb847aMR8eGjeHKoy++GxHETJtaD47FPBprB6WohrnCJQEQLbq4DBw
	Wp7zlywe7iwLXq9Tdyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVbS-0000000D6T9-1RzI;
	Mon, 24 Feb 2025 10:22:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVS9-0000000D4T4-0aEl
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 10:12:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-222e8d07dc6so10401975ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 02:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391964; x=1740996764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPGO+zy6qEo7yGIQSUB6POZKOvKXrvFXwU9PL0lZRak=;
        b=HRn34lhXlWAoQTnqZ2b+KOGHJCmlIsUbpfUqZVXxXbiWbA2Njl6PCcJIwmgUnxMu6/
         n2Q6JbEof69UorWEDMKNBBzwZkuw3eBj0uSVp8CcADPU3I1eeAnjz6bF/4cNuxE9+id8
         nZb93jmrr32wXCyIUPV+6YSrlOPTVoSfiEMrxQPO+KEVXkVvM20WiioFo6QdkiHUfxi7
         7UDU4IN0Z/dvDRGQSP4Hwmci1fNw71dVR4psLeF7z1WkljtZ/F+ND4bAa7iYXzzCSdGk
         k9iAsJzYCkSskay+xOI5yOjRR1SIq/B7QVuKrP7Gyeee7l1aPxa9xYnjhDDATAhCf6Qf
         rmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391964; x=1740996764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPGO+zy6qEo7yGIQSUB6POZKOvKXrvFXwU9PL0lZRak=;
        b=RqD5howiku/Cn8QJZoMyYWuy+2uZeaPyA5JrZYgM4DXzI09nCaTZDjoQPuDwJiUasS
         De4LznI9GgDmfiAT3XiQ3iPib21MAKMEIwqPhDA0Ut+7w08d/aFqMcMBABHVNuByJ/OL
         4teHG8mSiZFYj9u1nSEcpEFo3/onMpSsjRrSs2o466JfzqneqOVc1ixhNm0Cx4Nh4tFQ
         mBe3O3BjIdGMrzaZZH1NjoTDpjHZVGEgjUSOxvgQ4NrkxvlxbuI0bwpb3ywziDQV9p4v
         JyVcyOUPAvFpDJz0c1BmPk3QF3jy7ccW//Y4e/RquB5hwIbCb36MgSxiZYNwGFi/0/Jg
         XWig==
X-Forwarded-Encrypted: i=1; AJvYcCWfx6LnJtiumzBzXnpdGLgQqBXs26BOlaZhsxRNZ08+aYrp5fTgBab9AugHL5rBVooi6YVbKT7Dq+D/HA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9f9Ej3gbNuq8EdbozJxLsi7cB5oZBRK2kDUD3BzIVCG04NNgD
	DyC1deDD4Rygn/MgW6tyisHQDRD3WGJfjFDe9jRFi/ja5TiHnyp5
X-Gm-Gg: ASbGncuofWKFoba7cS2E1ETLyJU1cFsn5i86rUAJWYpJw+kNjGEvPfXeEGs09YBuHMz
	uepmdh9FCRAJpGRUlFOsXsM4iizI2ar9J6tMC41kzVfvHegu658wyn2XzfJIVU+fCIWwNGNIlrz
	igHrSpt7IJbhGw21i0/TzV42FsbygTz32iAt6jBOQf7I5KlVM541KCIlzGuZzbCt7AyitzWmBjV
	J+grl/zYqTBX2DFLSzHlcpbpR1MIAh3PRgZ0S8lUSFm/N7TFOR7tSrDfALKXIuDD44rOeBN+/lI
	udRbLl0K2UJicjcRE45H
X-Google-Smtp-Source: AGHT+IHjrhSY3sFSqcYVrgR3HWHG17PPt8fPA3aXE8o1SDs3Jub8Wamh6wMCeD3ZCxlYYk/Q13AOhA==
X-Received: by 2002:a17:902:cec1:b0:215:58be:3349 with SMTP id d9443c01a7336-2219ffa04dcmr239987545ad.14.1740391964148;
        Mon, 24 Feb 2025 02:12:44 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a464f1sm173274365ad.206.2025.02.24.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:12:43 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] spi: sophgo: add Sophgo SPI NOR controller driver
Date: Mon, 24 Feb 2025 18:11:59 +0800
Message-ID: <20250224101213.26003-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_021245_175554_7F246685 
X-CRM114-Status: UNSURE (   8.25  )
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

Add SPI NOR driver for Sophgo, including read, write operations.
This driver is only suitable for NOR flash.

Longbin Li (3):
  dt-bindings: spi: add Sophgo SPI NOR controller driver
  spi: sophgo: add Sophgo SPI NOR controller driver
  riscv: dts: sophgo: add Sophgo SPI NOR controller driver

 .../bindings/spi/spi-sophgo-nor.yaml          |  52 ++
 .../boot/dts/sophgo/sg2044-sophgo-sd3-10.dts  |  18 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  24 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-sophgo-nor.c                  | 501 ++++++++++++++++++
 6 files changed, 605 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml
 create mode 100644 drivers/spi/spi-sophgo-nor.c

--
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
