Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17D1C369C2
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 00:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wzc31bUBnlIP9PQtIosaINyU5qh/9Sv7kHQNFrVygtQ=; b=bV0Pf7YF/w/kF2
	sG7IYRpBtcRtGXdlUI2PUtW2jWNHDCLbKdNl27yLIvA78r2iOARZ0jb8SJOfl2rFECY+5Pgba5A1u
	9lXcWs6aecLiD/2Cf53fA9amXuKz2ichIfOBQ6FDceQ37nsbD2aqz7oNFJ1Qvk+MqJiQM1QcUl5OO
	im29gY1Vw2VO6zH3/mZ8NeBntX4XixWDg7Db9q7gVAkVqvnnX4cO91wqZRfhqmsKvUv8xxu7qvCOg
	TURGEpbS7CGO1nyTf1dZze9zt/qeGGKzrQEed8n0jDLuIxZETvS1HF35Qz48HYOmYstYkp4PwrYWB
	cBS1u9Sp0N55BRkkD6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBNTL-00000004ey0-16I8;
	Sun, 04 May 2025 00:44:47 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBNTI-00000004exV-22jj
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 00:44:46 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so53529676d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 May 2025 17:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746319483; x=1746924283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBTdU5/DczpzT7bxTMClec5iVTOpUIHz+Uhri46H47k=;
        b=lb7FWcktYaYU/vpwN6sZf6O/Ns+HOMeSpoa8O3x1+iAV3ZyNQhgNuBOPKTxT7xiX6Y
         L5qwmXcxJ+JgBEMTDSvm9Ihc7Eb6Jofyu7YFgFknZR8A0Qp2NaX0ulnELeXkrdd73rxo
         mJjDL8rirltvFSUDOak9YndsE0TguhTLU/5LQpD9adyRHTwym9ACRrCyOitw5UWIZ/9E
         ZdkeE14soWJQ2E1zIPpX8C9a/UQsNFIPAGUrd58VBGTXcduaHsr50qKlFLxov1KBWOGG
         tArrJ5X2QccmWWDz/0ij/6ZdqR6OR6G4Z4SpcuMjPOEsDeztUZUG8mpXhgtnqwfXBz8+
         PVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746319483; x=1746924283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBTdU5/DczpzT7bxTMClec5iVTOpUIHz+Uhri46H47k=;
        b=seANaPA6UAfXV3F1WfRI6RAnovz7Egt89Zp9W/yUf3RZ+ebk1MAge0+Wev9tGrKTL1
         JlV8E3oP5dFs/HVgUDhr77VnuLO+fRB04JOiD+/Y3YT56smg67aJ0pQAhalypJc2ZDxN
         v/ZW/cty2S47v67POH+1KJTxTdHADgEtOqcLR+vEMJVIxkFjP2ouiXrByA1dPI48+M9s
         ZqLjht+7L1NXCB6itMQ958PfnVkRZnVM72RJsd1hOrsAHCSW/e6ret0iUbBwY5yVHxmc
         hB1W0xto3NpFSqlmCL1QO4jNwO4RK9BZ/lPEFODa0wHJcsjkYJyM06m+zaaxOYNViA1/
         NmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPB6kSyrwaWABZUA4ZzjdoQ+CFwxL+XhfkuJurJ1f0TCiH9drAkWWC7Lq2Selb8/Lr+QBkJpszq6jZKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7wobxf9emMQxH55ypPmpoUhM5Jy0OYF6OdqLHW9PGt6+C5uTq
	Kmi6xQuXOCBJrmOBdMSLbM8YHK3S4lV9a4XEOpDDXvORoLpsoN2H
X-Gm-Gg: ASbGncvZkJaX18Yp1ao4S4FdSiRJ7HMBSEjfJxVhY8iWQCK4D64Q/14iVWDHuB7cRig
	TYass7cMMlLnMJMwu37ibBz5XDqj1BT6fhFGAYIPPR9RWJvV+H7zuHxl/ltfOapiVsvFT1NNuh6
	/TMa905imXu6aA6PTVqnt67Oow9Qqy5Xb2YXqdlIEG0TwVrDVID6+u88PmleUsgzTBmg2kcwRRB
	BHR9vWeXHhhxGtfVJXUgU4rE0IEcNBRbdWEuGFSTKxM/tDbWquP79eY5b7prXpAF2yuxLGKLaWG
	s64aKitCZVFwNlQN
X-Google-Smtp-Source: AGHT+IEDwbk2Ni1OGcnEfuTByVJGsVIbn0PVA4xwx3Q1aAWNwQLEX82DH4thMivs0ayFz/by16ai8Q==
X-Received: by 2002:a05:6214:20e6:b0:6f5:dad:5a60 with SMTP id 6a1803df08f44-6f515264f21mr128971706d6.3.1746319482732;
        Sat, 03 May 2025 17:44:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f3b05efsm38597456d6.23.2025.05.03.17.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 17:44:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Niklas Cassel <cassel@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shradha Todi <shradha.t@samsung.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Date: Sun,  4 May 2025 08:44:17 +0800
Message-ID: <20250504004420.202685-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_174444_527462_E8F8E1AB 
X-CRM114-Status: GOOD (  11.23  )
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

Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
to implement RC mode.

For legacy interrupt, the PCIe controller on SG2044 implement
its own legacy interrupt controller. For MSI/MSI-X, it use an
external interrupt controller to handle.

The external MSI interrupt controller patch can be found on [1].
As SG2044 needs a mirror change to support the way to send MSI
message and different irq number.

[1] https://lore.kernel.org/all/20250413224922.69719-1-inochiama@gmail.com

Changed from v2:
- https://lore.kernel.org/all/20250304071239.352486-1-inochiama@gmail.com
1. patch 1: remove "|+" for description
2. patch 1: apply Rob's tag
3. patch 2: remove empty irq_eoi and use handle_level_irq as the right
	    irq handle function.

Changed from v1:
- https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.com
1. patch 1: remove dma-coherent property
2. patch 2: remove unused reset
3. patch 2: fix Kconfig menu title and reorder the entry
4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
5. patch 2: rename the irq handle function to match the irq_chip name

Inochi Amaoto (2):
  dt-bindings: pci: Add Sophgo SG2044 PCIe host
  PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver

 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 +++++++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 258 ++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
