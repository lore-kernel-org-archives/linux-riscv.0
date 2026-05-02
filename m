Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0EACD3424
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vupkLyDjLujwU1xEDqeMcpMfrCtHLVICmg6SkMp8/0=; b=2FO31L2iHMyNNt
	JnZdprpBQNSRIlJvS6GI3QNa/q+jmcENXNcWv72/DsWvsrcl7XAdyuXVkb0iADGVQ42b/asjZNa4j
	t/c0n2KCVyekkiR73R34faHrO/MfVuxCwmpyNwRryDnfETO3u3NABk8yJJUCi/9MW2nMvx7MJsv2o
	lAOqC5IhnOykyXVg5O+6Ef/5wqUgn0pLrvxNmGPyO93dDlFWMsOwnlYTPkxyw+WLsCPERsDGBZDmE
	wQw97WT6JkLyhb3myOCHFTHTUX0QubM8HiWOw2P1l7s50oJFkb/68O0GQUTK94804sD4+0lHkUawv
	p52UgISA+tT31jIZ/rNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M1-00000008m24-2g1W;
	Sat, 02 May 2026 10:13:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7Ly-00000008m0q-3O47
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 10:13:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8296d553142so1683526b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716822; x=1778321622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJKp1v+dhpmw+gdo81yg2J+fP8PT0lbJ9HKJa2rNBWI=;
        b=YyX9kQxqOlrDn7Hvndc28eq6DXkD6p9BQ6S4WVEeZMwaMr7PGSJdvXQs3SrppRpE6c
         c6akQ2qE3px1eYguMibppk97tqwVAjBrvEiUZWrkZ2Z+f+RLKeq1LhB8ecxUdcaq9l/5
         pmNA1IAHFJYLcLIhpAdXoJlkrKeqm5orEFqalYyqULbphlj4NqVZhiaBnxHeQySV15Hm
         SLKVqfLjDH+i93tf940GBixN2iZicN0AoBx/VcLzVgPBzDnqtzYOOy+fPfxs8zJLVt/f
         PTZZn2IqQLUkT0IVHL+tGrQct2NMZibbxU0wl7m4v0pQkvrO++99Z7ZTOFwasdI3Nt2C
         tTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716822; x=1778321622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJKp1v+dhpmw+gdo81yg2J+fP8PT0lbJ9HKJa2rNBWI=;
        b=oTyDHbzOQhQX6kVTygLM9uDkJrRSk3yoqBdangldOHMhrf2N3sRifI8OE48+11l4nC
         ob5+YCj2ya79fqsGViELJaDDBtpORl6I+bkxiHipfWb/WfNdEO17E1IBBaYjEAvNeK5i
         9qPQsUFybMGhBUL66Djj2vijdX1oyCsvdrVTq7XPNGB61+9AhoNP+V3njAZ5v9SC4MsN
         Z+UNH8LvXn6F1C2TV1jUnGeFYa/EKnoUsekRkHOEXEAqYfrxQ+7PYjDDhFt9wleJf9VG
         IWG6T906gTSlFhMHqWjwa4waIb5IkOc4xpmztlr8BIgn3sfeIxZ9Py4msxwT0I2l6gdV
         6QAg==
X-Forwarded-Encrypted: i=1; AFNElJ+SpJ/51oirDxsD5Xr6k9UfnBQdtnlLL9aHaelMA1HsdzMrk7oH/znGKSsUW+SfjYiCFfWYZyJ10HEnXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzws0BC9Yjs5znSycsXZPLb7t5grolMhWSLPaLbgheKpc1waZlK
	AKPkpPQJRw18ZwroVTz2XlhSx6fisA2r5Wp3kQRrli4UGSKVcEAQpDp1
X-Gm-Gg: AeBDietPKd44sqJF+JPfrrsowzsrIxH/OGv080glV1BLm0CNEP3CXu5Yq5yk3EIrHRe
	rOH99Z/14+HwmW3NSiBFzOLO3Oyu364BjF89EPdwTfmM8tIu97Srftwn44194Lx+2euwW1lcR0K
	O+eumL4xR+3BL8VvNK8qHB4JA0yywbHtmPzWo3rd4WNFZ5Tc01eQAmo6HdfX2tdW2SXtZphxY3D
	cnYPACjx5D3RQv2nnBs6dIakqsVJcAKU85zrjNDjbB0tPS3Q7AEOzWwVQWNrYmXA4gTPx14ZMi/
	MKCBugPBOgRb0UuzzsECnLSF/m1Zxbz/FjyFGy44/S8lkRDQjk7IWyexBd3qMhvB1URIWnsue++
	a8UIx0vG3fvGfopUjsbk6gTO1KmEfufGuUVF4FfXRqyxNw0h+eVtHX3KSyBpuYsPeUs17DqH2pA
	dd1OBvZzG+gyx0gO6+z2yQoSpZ5IUUIEZdkA==
X-Received: by 2002:a05:6a00:1405:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-8352d28c7d3mr2337323b3a.43.1777716821723;
        Sat, 02 May 2026 03:13:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158bc863sm4946839b3a.26.2026.05.02.03.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/5] riscv: spacemit: Add PCIe RC controller support for K3
Date: Sat,  2 May 2026 18:13:13 +0800
Message-ID: <20260502101319.2364052-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_031342_847662_4C4952DC 
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

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

Inochi Amaoto (5):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple phy handles support
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for msi handle check
  dt-bindings: pci: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 142 +++++++++
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 289 +++++++++++++++++-
 3 files changed, 428 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
