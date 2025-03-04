Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962FBC282D3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qXKsDmXGr4YNjIx9yT1hcQzHiNZl942Ap9jpz2BzYOM=; b=voY8BIgJnQgZrX
	caZ6LBieuw2XPzjrBwjBdzLvl9gAjO2cTXsbz3Juc12/3VEZTuuTa8nhHTAEX+airAJsNnZOlt/nq
	xbeBVBGCONtsZfX5nb3aMmHGH3KgubNvxr06xbbNJFDenqUbCxUXd55EjAdRqWNJLOuwBR5MkWoE6
	fXZpfp0LDmzxclAq9zmQdu1pokoTn5OyFiy5inyWFIPf5pYcS4lCQKs/EmK+uDyOwEc1rFuqZJ7RB
	QVew3qIQRQ5zJeiEuIke1zpGxdbdQRJJO3F0c8NIGM2/6uOveVEHGc2uuiXb1j7R8wLXq7iDyl5xP
	HHyJs/ZHkx9H1Pbp/YWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNmi-00000003fji-0cW9;
	Tue, 04 Mar 2025 08:37:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNmL-00000003fbH-30FV
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Mar 2025 08:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UoXbxXKgyk87JlDdAMTtGXs2RE6Oglf8lNp5fJA+vrg=; b=iG2RyPC73/nroITuh/GN9xqnhY
	f1Ju1Ixx31DmM9EHGeuzWpfWCMs4dlQJOeYYJ/36R1z9Cya2AUGPl3u9d9sVSYHr3E/pzH+9YRyBT
	NC+d5aW8NRvn3DgbUb2JlsdblsSxe3PJrw3dEMlWhF7OHI3dG1D1qqCGCEo/yJinkHnr56jesIf7o
	5B/DKtD8UfgZ2HuUtCkJuWOg6LEv4hgpG0djjgIimbpD2pQd7tR6ii/jRmCKi+A8RCAnLGB2bXLg4
	05VNlMT4fbryFQYoCPGwgkg2dDdPMuN4BxtBJG8vUjA2mrKd1bKSb6EAt/6qoQzOf7NR9Pe1Vd8al
	4UbTGG6A==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNmI-00000000SaI-2mcY
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 08:37:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2232b12cd36so71637355ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 00:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741077383; x=1741682183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoXbxXKgyk87JlDdAMTtGXs2RE6Oglf8lNp5fJA+vrg=;
        b=RTUXs7V+5ylbZMmetdjq3gJzI09gFT42o5fa6/xCp9ytp7cUnXweCfsqrrQ4Aqn2to
         CmYnHkz6T8sEaKnGnsmahq8E4Y4p0alsFLRolr4Kmnw35MTLNdv+aOhDqx4ztNN8/ey5
         /0CeRbpbsI9tHyP4K6xDj96rkDHuOW3WwLWp87I4pKerCq/PfNn80qEnffRcwFoGQLt/
         zapDAepPoF9wWXe1M5/h7hkgLKtu6I3IV9k29bjlyzn8UKytAciLFYFCqLjldA58Rq2u
         45MNyKyst+hpGqjWD/Sfc9u7xpr4C3AVosPD5L3QLj6AxBzYQGSy1UP4THJQJ6P5oTW6
         hLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077383; x=1741682183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoXbxXKgyk87JlDdAMTtGXs2RE6Oglf8lNp5fJA+vrg=;
        b=Cp4xZoZO/QPCT49cjHXGbCIzFyAZOGWTc8oHh2rUIfBuhGgBbLQZas148c2UTjbg+u
         qzK2HT019w74dTLg2Rot1EhlWaOWDppMBjX42gox9ic1TmRFklhClTRCS21p7X2acaap
         vaAMMMZ2DLuxQiJUUewGZdkghHPWBBkykoh5lNLqJ/37Zh+GiSDwVwavQvXtSJupHNn3
         9ZruemOsQW0vGp2I2/1y6mOr1kgnwBqgMpVC0woyk4TRwUxNrLHSTWNEZ+moqGgh4i0O
         8lzkhu72R7rCHKJcFLHjMTcJEokGQuJbmXOxKqjYEORmQzDMwI9VdZ9jP39A1IEODh70
         zXjw==
X-Forwarded-Encrypted: i=1; AJvYcCUsecmei/quJsuLQtaiHzd5EIWe+w9wZrZSw2pKIWxWjZzmTZIflC7RBARncu0P4NSt+Cv+kffvzM+nLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUSDb6kEYiM9lZxokCxdFEf437CMSPWeqahxkkNVvyaYIDWa9b
	21wXkTmZg/N58gayy4L8GtzC4gWbK51oIAA6FLAY5FO4mCHO94mL
X-Gm-Gg: ASbGncuUplnUMVBd+K+moszgsOA9zHZigN2npHsy6nIPqUWeOXIUCwPs83cpR4CyAgW
	pbJdeTpDThXUamS/nnBRiJWBLWG4sQSvD/aTBIaFDj967nSMo8oKxFE10Vhn3Ms3EUqavvRs7me
	nBEYTzljbQY1n3bkQiGm7iifHQUac9/1zpF40y5Kq7sypcbiOSgZyfKQZjJ2zVd28lxxxnVXZ35
	4mlYDH81yxSFLu3HQABrDGGIniuHKKqwfXJYXqqBGxUb4LH7xQ5eqYlza6SF5ovZF7kuR30dhm6
	7bsTlUyD0Bz3BIZlENFf0rKQklDU7PEqx1gJShM=
X-Google-Smtp-Source: AGHT+IHftL+KBeXBmrscPavFmNZrOosSLvGSCAflYbLbvZZUp4Q0oBIUi+ZQvunyvSVmM/kyQ7jFFA==
X-Received: by 2002:a17:902:d2cb:b0:223:6747:f82b with SMTP id d9443c01a7336-22368f7b57dmr221738015ad.13.1741077382988;
        Tue, 04 Mar 2025 00:36:22 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc3b7sm90597735ad.173.2025.03.04.00.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:36:22 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 0/2] spi: sophgo: add Sophgo SPI NOR controller driver
Date: Tue,  4 Mar 2025 16:35:41 +0800
Message-ID: <20250304083548.10101-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_083726_719615_B17CFA80 
X-CRM114-Status: UNSURE (   9.69  )
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

---

Changes in v2:

  Fixed following issues as per comments from Yixun Lan, Chen Wang, Inochi Amaoto, thanks.

  - Replaced "sophgo" to "sg2044" to avoid conflicts with other drivers.
  - Improve driver code:
    - Improve coding style.
    - Removed the [PATCH 3/3] in previous submission that based on the baseline not submitted.
    - Added error handler to destroy mutex if probe fail.

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250224101213.26003-1-looong.bin@gmail.com/ [1]
---

Longbin Li (2):
  dt-bindings: spi: add SG2044 SPI NOR controller driver
  spi: sophgo: add SG2044 SPI NOR controller driver

 .../bindings/spi/spi-sg2044-nor.yaml          |  52 ++
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-sg2044-nor.c                  | 500 ++++++++++++++++++
 4 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
 create mode 100644 drivers/spi/spi-sg2044-nor.c

--
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
