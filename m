Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6F606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 04:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JvkC0Bcl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ty2ekBR1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VPmDyepbtIyfYtETQ1yTzmSZDPiJan/nlZ16AOkbCLA=; b=JvkC0BclD7Nbp9Kw8F2MttQeBS
	IabiiodQRFEeutWZfiSqqVV3D2Aui0SdC43vyeuUI+R9fcQlZfnGoUaXAr4obPYyIvyv6qszSaXYa
	2RdZYlOQLEwC64Vg1vnG5iWfn9C62DRH8/Ms1E4ZRcFSsJyHZ7pcJQMf8xGTHPETKIKiiYI5R6EIV
	XN5RT+N7vQli9MB5ZTRwxdg0WI8xUqyI6YfgojDRLijkAiDawvFztkOHORsjqpENcIAAwyUpKgUYO
	JbFd5E1DNH4gbWZR9bj69SdAg5fEm7gc+7zJl3eWIRdlqFzSsNnC/EiSQ1K1TW+rBL+Ks4jyUXXsH
	zmpb2I+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Pw-00000008N7e-3npG;
	Wed, 25 Nov 2026 04:15:36 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Pu-00000008N7E-0FPk
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 04:15:35 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso2049532a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 20:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580133; x=1796184933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
        b=Ty2ekBR1DHDg55xY41h2XPv4c5lSDzCbaZqHgTlcCNyXeTtBgTLfXrBSEqAhpARZab
         avtfPUVnxoErvAmuNTykAhanqaU4u1L6jQAAYFDK0hF0KnQ3L2kHs7SnwVi9UXw41nJU
         ke+BcoPnPSLACXwUexd58uNZXfsK7gJtZR13wEH0x62SV+dUS2Mn4ZASRZAGVlghrKSF
         k0muGvA8vlTF+Ok5GMWwl+EiybfImrDVJAKTuw5Br7KVkLTH8A9ZaHir0NejtmH75oGk
         +FPoZ/ES+Rxikf2dMThEat05B8BVj4vH/RHZHj2hW+yXYRDYwK/AEpVngq55w6YK1Kod
         M+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580133; x=1796184933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dZ7m1mSWDeoCgTYM1P+lZfpnqZnFCwEoDUl13Sf3Bs=;
        b=KQmW8PtXTnwlKctMD+P3lz7QOXQWDPTqjdh6gYSOX6CFotsQw7UykUfno4HQv1d6s3
         hsw+1JmaRqJwWoiaaEAgpFiVmHLNCpe3zeQjJsqD75wgvia75I17v7VEA1Ts/cbh0DoW
         ZVoilJm/bbwWe8uO3DmJzSMlk1PHfmfmjlifeBkH9vhzrEa/zUdzYm5TiHA1ZzOGACyD
         Q/V2S5+35FKNCWyStfswmpcbmA1q/cWm958x+fOALSlb3kgQG6W8vaWqjMge1LlNs7f4
         KfPqINRHFG/Voap+Q9uLlrg0n18UNroNkRHw1Zgt0mFNmFEmDtGRCHa+ndHh2EUSNu73
         kDuQ==
X-Forwarded-Encrypted: i=1; AL+hErFNlrCLvMy1fpN1Tr3XFGeCrYMD/4/iN4WJsmWgn5xRvTLcnGdYy7d735tY7hq3Ah15yDTN44Dm6LbLkQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+m0CT7yZX13xWaaxmgOsDrcWONu3o9KBKGa8Q6rI6zX4XwyLPS
	BLZCC16ArDXwnrcb+7pcqiAStguZD+dHhtmYRKVnIMfCegKQbCNJvREO
X-Gm-Gg: AZFdTZcXkWm1Kx7hV3mmoPXNge/xhENyK8p41CH5aLtxrEI/+Cioz0wfEAeyzv8rtO4
	XqtEXLRC5flttSL/e2Z4K9eL0HkWGJ6jDj1LaBj+FNxrqZS6NpKqZbGMLjUNs1fkhuZJeZnLMLI
	oS+sX5OgAdTFz6v7pSo0TSZa+BQhUeCh02ZYYp8P6NMKEkFUQXpplIU2oEzp/RxBzT1GLJJthlX
	vNHTqnDDF3A/ITtvFWO9ICGaWIUE5b6g6VkxGlexswzIjqx1b7Bz5Y7zR6NUMfi6x3M6jyGrdPK
	AyYIYXD/GIgd8fhbLJ+nmzqe4sAmTdf3Gjkquejq63BX4P7V6kLF3G9tVb5ncryTATLo4wMTyeE
	bRFc5AIFW7NRAOctReRXyS26zdUTKrNPe1sgduRSUzsS7dC+0k+oGR9VSzd8Oz1UMijPiuqQ1Bl
	7sQUVoR0Yn8oZLFEZ2ws0p0i00qz86IURKMssDMc7fzHMaL8xXaR+GFAc3LW1oN24LmBkfAtYXk
	WYE7+tnVZbbYg36ssfxzhmfaFkKLEbLvM8kq97RFPlLdOZYGmdGpM1cPGeiih8IMY4hoho5luvA
	szM/3bxCYVG29PpjMH/LjDbAJws=
X-Received: by 2002:a17:90b:4983:b0:3b4:1357:d529 with SMTP id 98e67ed59e1d1-3b41c97c444mr16500146a91.51.1795580132845;
        Tue, 24 Nov 2026 20:15:32 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm25848152a91.13.2026.11.24.20.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:32 -0800 (PST)
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
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Wed, 25 Nov 2026 12:15:14 +0800
Message-ID: <20261125041523.242588-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_201534_130856_7AE6C68C 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

Since v5, multiple vendor fix are included in this series, you can find
in [1]. And this version required [2] for phy bulk data support.

[1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
[2] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/

Changed from v7:
- https://lore.kernel.org/linux-pci/20260929083755.458238-1-inochiama@gmail.com/
1. rebased to v7.4-rc1
2. Apply Andy, Rob, Aurelien's tags to related patches.
patch 1:
1. The const declaration is reserved, as the it hold the pointer of the
   static const data.
patch 6:
1. Add comment to the PCIe topology description to the commit message.
2. Fix some 80 chars line problem.

Changed from v6:
- https://lore.kernel.org/linux-pci/20260923015016.64069-1-inochiama@gmail.com/
patch 6:
1. Keep PERST# when init failed like the deinit.

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
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 235 ++++++++++++++++--
 4 files changed, 268 insertions(+), 33 deletions(-)

--
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
