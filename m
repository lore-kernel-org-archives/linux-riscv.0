Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E740CD4F47
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 01:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klL4Kk4JQOjoaJsg5K4xwvY1hxjRMlXHzF9D1W1Y5Q0=; b=g2HXgpz7TzRx0w
	s6S/T5wb8AjZxx+V4eHaY5SFvzvXq6mXt9wNUoTKPEjAI/zZTLuBrqG2b79ceHON4Zi42Su+NOvdN
	vPKekpWAc0eP+8Sfjl/z+YHJ/3HZJ0/D4H2Bif9dclvDQt38mHABa1EPGe2BBKRfcBPftG0rRIYWz
	PFsTmUW9bwkkqOlDrbXB6G9RAj+iU7zAWKNZsGhf8l8L+tfgZKuOSmmfk2SB4EHygZJpZVKmafGuy
	0sJIAARaE3uMNBBoPv1GHrmdlUcX/hhLyQbIVKBbgfc+bTc8md7jcVJJuGkg/gU4/5nSaqLhlOp7S
	D2HUXkm6lo/xzQO1jvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQd5-0000000BsDC-1o8Q;
	Sun, 17 May 2026 01:49:19 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOQd2-0000000BsCJ-1HpM
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 01:49:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36622412e97so784272a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 18:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982555; x=1779587355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7RsZByyP81xsWgXZpteSqn5b3NI0aEqfKSesYIzFiI=;
        b=J91mQLPt7q/Dqf2jUJSCvypssVOAK8nV9p9pxd0g4ndffIS5Y2bKIYysixoW9Ok02h
         V79f6Tb/4FrxAXuqVHIus9oBm8/xBD7F0b3hWZmPIKT7EIGJzoSqSdfc8LGvAEgD6sZY
         LZG9zhS4xUoc6lqWdJTbiFtuCrygDkW7dhkLyBSoPU19uxs6+6ajOi+3B0saTi3KWExW
         VOsZihqJOzKUAogSnRcHPdevk35DU/XcXtHRen+4dwiMMvB+/9ca/t5ZnOWb0sRtKtwc
         fkSpzueshS/c6RBj9GEK+pLyaJwwhKKQ3X3JoWc3z7YQzcZRTFEohg0naBpU87KVMyOe
         ndnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982555; x=1779587355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7RsZByyP81xsWgXZpteSqn5b3NI0aEqfKSesYIzFiI=;
        b=GrRznPbsNzsE/Gnc+7zJNuPlTIbnlKFvtDci+0vCScSj7TiGeaHK/NkWHgi4rAtnxD
         setGlDD2MnUeeIhbeWBm5FGSjAkv3ZivJ8Ooj2WVDRx1M4ycr9Hhmx1RfueF1kS04s3r
         3w9SdEdS6FujFaZUDhWHlFMELetcYYv/KP1wQ14NMPrz8ZMeDFiY1WTTmGPxHYV7R3b4
         ABhz8zZvfHioNH4M61r+ghjEPoer1c9UuAZnbSwuVhYyudmfi/sg9arUJI+aOKgmHZNa
         1GoyqoI21hvrrHBTMJLQ32S5k7we3g2uvcVD5GCYHV3Wx4FqUZ+NhucDoA7DbMKFq1WQ
         k/5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/vycmkK7eczJOUn7nLhfGEfyJB3nGOZE3FnqQaFjz/RQnQUs07OK2hRThrpcmATcrJe3sIj+B7bWyi6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqDlc2K297Xn6F7iAan0msBlrt3tadLSAMx8Fo7TZdLUDDAySa
	F6ISa5/aatWbTWiEcUo8D51/x3wl5qVwaKi/ewgiYNLlKvzKMeNHnn1j
X-Gm-Gg: Acq92OFDHVpq6MMDfRc7rjpcRDBx1Yef1s8euOFtcL9IVFEmvM3Y37Rzga6B23bqkSt
	9wIcxZdTBsqAFi7+QEI11r5UEFSqB2EuGwXPrgHphuyN6aJmKkm2o6+NyE8wleDsnCE/pN8Fwhy
	+cDZsDyUU9PeroYQlxx2OeUZrvCdyKKUPF1/X53lf6BcxkvONqvy5/cDMck6suD7/uXzCnyO4j7
	BrUgeXQIJl+Uo6JrbXS4YVHej9jMKkKqxtZq41WItbaVG/2dfHadwNGZXqMqv0LFInl8BVfUJxO
	T0b3Xb6s4AO+gG14CEZwPXWN4ODZ4aUeVjafH4q2vb+HJDyWl7EcJpqkxsa8uCx/TPGT0ttNGbi
	TzwZdI6ePZmEbdJVOe5duL2I/Gy8PUOzZDXLc6jWKsgA+FCG3hzgG1ctjgHnYd4J25hriAbLoA9
	fWmFbtcXD5trhXkfW3cRW4EUGOim8UgJ8neA==
X-Received: by 2002:a17:90a:f10:b0:369:7b04:49d1 with SMTP id 98e67ed59e1d1-3697b044e5dmr2192326a91.1.1778982555040;
        Sat, 16 May 2026 18:49:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155b2c4sm6861899a91.3.2026.05.16.18.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:49:14 -0700 (PDT)
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
	Christian Bruel <christian.bruel@foss.st.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Alex Elder <elder@riscstar.com>,
	Nam Cao <namcao@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/5] riscv: spacemit: Add PCIe RC controller support for K3
Date: Sun, 17 May 2026 09:48:35 +0800
Message-ID: <20260517014841.254085-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_184916_349652_7E516526 
X-CRM114-Status: UNSURE (   8.26  )
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

Changed from v1:
patch 1:
1. Remove post_init callback.
patch 2:
1. Fix devm_kmalloc_array arguments order and error check.
patch 3:
1. Apply Rob's tag.
2. Change check from oneOf to anyOf.
3. Fix spelling mistakes in commit message.
patch 4:
1. Add comment about PHY handle.
2. Remove interrupt "app".
3. Fix spelling mistakes in commit message.
patch 5:
1. Remove all logic related to link up interrupt.
2. Clean up all unused macros.
3. Fix devm_kmalloc_array arguments order and error check.
4. Remove unnecessary start_link logic.
5. Make all magic number as a macro.
6. Fix spelling mistakes in code and commit message.

Inochi Amaoto (5):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 +++++++++++
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 210 +++++++++++++++++-
 4 files changed, 344 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
