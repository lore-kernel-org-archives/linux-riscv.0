Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54E9C982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0+Xk4QuusTmAcBucmmSLMynAWzHLsc78GWyuoHM18k=; b=LqEp0uphWjTjVh
	jdXpwzcIgDn8tNxPXK1gF5V3tOBVylEhd/A4OJia7J4mNwjNERCdnEFtAKndmI422IataLNRQlYFd
	TJ606L+80QBoU6heJq7qNuw2dk6MPPj4ydtJ4XZS3lzGacIXZX6zwBX/9g1Vn6cSRbuUrzXUcjE1W
	E6OtyJ4DhjH7ws5DcZEGnOyYEwb+i8C+JLoGzdCW+giMvTjcmW3Hd3GJh9lfYzQ8HBXLOoKFp8nAg
	4p6GAjVtHb7ypXgkH5N5TXEN1Kk5z7+6S6/z5zIXXJ4PAYNXdmFyj033yziXN1P4Io7BuOgN3fqhe
	44b0GuXbhTxVMyr3W3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8i-00000006szQ-1n4T;
	Wed, 23 Sep 2026 01:51:16 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8g-00000006sy9-0MIs
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:51:15 +0000
Received: by mail-pj2-x0e.google.com with SMTP id d9443c01a7336-2df4aa80a73so2694985ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128273; x=1790733073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6bw/fsy4XZLqY7688qpNAi5VG6nNf6KIvqtLcr0OWg=;
        b=SqyEVlqYp1UnGsEZUWwFc2AuZOYHcchm9UQTQXnCuHKkYEl1JoFMLf6AfsUO9vpms6
         88dtiSXDpC8HaMcqC3Qpgv4/MHW0jCnpzk1Y6HQbl+YrSGqYsQDQdc9by+oedjQStSe2
         pNjOKdACjeU1OVxqVspGp75333gMHuW+qYvJ1hC741b8lKfz1cR68lI3j2P2EBJswzKZ
         s44HDNVgkCxvXEMQGrYFtiDMPHi4m6/Be5J4ENPBiNlKlLnB0U2t072xydndDJTcRzA2
         Fob5HAmdST9hjkig2s0PNVbt3qe4CZHkVUKwly++cfVnrXix7Iv0YPM54OpV7Loh2Tyn
         LTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128273; x=1790733073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6bw/fsy4XZLqY7688qpNAi5VG6nNf6KIvqtLcr0OWg=;
        b=gJcxESYsq+99QOC8W4nYa56XEsqlfkoSS1qkn0wWy1+HU2AjOyDRV9aClvg/cbvdZA
         wodctgJOTPA7syg4x8pgdtZZQvaixbPeVCvVhmo6hO2IWBauYukgCkibKniYXcQcZbk1
         oPrE9ZXLYrA1MIAGBpfbhsgiGbn8IlO5AzNR2fbNQrnKJg+46NWRq8ZaYRB7v6UnPfB9
         N6wGKwSSgNmzZzpD6avmNQSYrEa8KyVO4l0pFDLlQqKMNw5wU4biEl02+OO1Zx07dZNF
         YYSnAN++N+5+VKjCGbPkvOfImCqRMpjGf/9nyomma2YzVI6T6cFIXkk748xNwmQLIo/B
         FlQg==
X-Forwarded-Encrypted: i=1; AKwUvBwbrDMI6JhtSJsmk5DGZmUgLjpgQu/fpztc76s2YS4UCl88E0Lbv3zA1h47p/dYqy5334nco5Ie+mTYcA==@lists.infradead.org
X-Gm-Message-State: AFuF++kjvc+7XcqHvffB8HllhlfodoyORqBIgBXtmgax2wKJEeXQ2uaL
	m+t9jn2r6bVcpEyBxgVbPfCirbPgSjCxYS+AaHsPe/K9c9nhEyg05io0
X-Gm-Gg: AYBFou0q9dqGZ3Iya/eJBYXC3GYz0qDhZ6fKEjzlhxjmOEAf02X2Ojzh5b0gI13GAzV
	9gYX740Z3Cu6OZbuMQecIVe+a1uBE4oJ+n02bA8bQeZOgR+ycoYJrYvyHCE6NPQjwtukt6weeV0
	QTKmaYkYGdngKWAnl2u0qbAVEVqPpW+CWgFc7omD/FFbOIibwvKDQyhGGPuEbdf2SWFHtnS5xZu
	Sfeoeh/3hGWjcS2o6FufEfRf8stfRxMsQPclcgUY5WScTmLPap7B4p4faN/V06dVoaVJetaQUEg
	EI+ub/Lth7+ZGXeIumMgmikC5NjmwgIQyrrN2x1vaYKfb3KYUE3jvrnH7YcOeQVPM9p+ecjxLSB
	hJsVnPIijdO3rV4ncXaC9qUrJOadIElxZrsgX/3pMiWvogZHWmul0/NPC3HxSyViW/OARmVygkp
	dua9qc81HSJFQ0drSQorJDRdN2AbB/has0+LbVckg6tHvnLtg=
X-Received: by 2002:a17:903:2c07:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2df69d3d22amr10510345ad.16.1790128272959;
        Tue, 22 Sep 2026 18:51:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f66b3sm2769165ad.73.2026.09.22.18.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Wed, 23 Sep 2026 09:50:09 +0800
Message-ID: <20260923015016.64069-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_185114_128019_25520BDB 
X-CRM114-Status: GOOD (  11.93  )
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

Since v5, multiple vendor fix are included in this series, you can find
in [1]. And this version required [2] for phy bulk data support.

[1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
[2] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

Changed from v5:
- https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
patch 1:
1. Return ENODATA for no device data found.
patch 2:
1. Add power_on/power_off suggested in [2].
2. Add zero phy check in the driver.
patch 5:
1. Add K3 device description.
patch 6:
1. Update comments.

Changed from v4:
- https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com/
patch 1:
1. fix comments
patch 2:
1. Use phy bulk data to simplify the code
patch 3:
1. Rebased to latest master
patch 6:
1. Apply several fix from the vendor code
2. Use separated init/deinit function for K3.
3. Add some error handle for K3 init function

Changed from v3:
- https://lore.kernel.org/linux-pci/20260703020003.485436-1-inochiama@gmail.com/
patch 5:
1. Add missing interrupt/interrupt-names check for K1

Changed from v2:
- https://lore.kernel.org/linux-pci/20260517014841.254085-1-inochiama@gmail.com/
patch 2:
1. Use unify PCIe phy get/enable/exit function for both K1 and K3.
patch 3:
1. New patch for updating device id for both K1/K3
patch 5:
1. Reuse binding for spacemit,k1-pcie-host
patch 6:
1. Multiple cleanup for the logic already generalized in the previous
   patches.
2. Use generic description for the Kconfig entry.

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

Inochi Amaoto (6):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  PCI: spacemit-k1: Add device id update helper
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  55 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 270 insertions(+), 33 deletions(-)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
