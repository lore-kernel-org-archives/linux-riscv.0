Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0811EE77180
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qsVZMM7KwKgLRejrzwa19GU7S92tS5SkHehXzCV2Ud4=; b=hf+e82/+y78IzU
	nSREwhlpI+kZ+CAnqLAC5PO5fcsgxDP4Nm83PmfUBnhCMz/ANgud9xO163ZDtLSYovIJ8tPVBSEXH
	Pm7lpYlhveDAywqbMGVMyq81+2RX33i89eGPvuAIqCw3dACibFTn4RkmdNjeUIB4WQTzW84uvjXA5
	YZB0fgO4QaLS9yIhTaP4nlIJXmcOTfPC1vu5prBF+lF2Lt6lD4JUBG+DjWtgCyNOyghPH7aSeIuxC
	n9jTCjJ4+/131epYE/B398zWM8iGxxzdlfIoGVFKQDFVhH9HWsZcYwCBLiOUwrNl49SDbznpqxPXo
	iGCEeRV3GLtqcu8o6FHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY3G-00000006gxt-0nPQ;
	Mon, 09 Dec 2024 07:19:30 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKY3E-00000006gxN-2u0S
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:19:29 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5f2be8023e1so169381eaf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728767; x=1734333567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=57haV1hL4VOUvIZiseouq+09JE1910goYy3qPq1Xmko=;
        b=Tp0piR+Zt+XSP834ogYRnnANLGVekTIEXvQXshIWuJtPY9Mt50zFM7QbcQkdzPo5lg
         VB9OyYw0JjYEJ5Zw1xac1LYmTdI8PlUv3rAeWlNQGAJp09Qi2IysEYjUDR+7OlkZkLQU
         KO79sCDnHYVVtr8pXbQ8nN9Zhwbnks+v/dlC6pDdz89RxVtdSOndLo0iTHp35pdJCIve
         t4f2vclpTa7Jg9k7Ty/rKjAENHr7XlDVdfBoN83xvRVziORhLJUYSmQN9Y3cQPR+7WPs
         twDgk3V5kBhXPPMQWLuUoMNTYuJ/v+PIFRtLTEqrr7nsXwpu2T7+FSmhh6Fa6xCoqHUn
         cg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728767; x=1734333567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57haV1hL4VOUvIZiseouq+09JE1910goYy3qPq1Xmko=;
        b=ZuBvZIq89rKh8yRm7PFiYxdEUzk1TRgBERWdWB7IG084GyKBULzPZ4Ibef7tL1og9K
         6iSkjl7Mab5iajSOIhVF6YOYC0UYo3DNh2SgjZFi5Gn4Aeiyvo17UTQDhCGluVFZBjx9
         Kby3jT+ScySa4zrQcc350P1NofyBo9PU1zJ4H2OQikPdFNYKc0EAcU3CfMyytjPdLw9x
         RszILqI38uIZNMU1n6DQJKyB7pelG11poDbod3cfdeOTIYHPlw1aN8u6tjZi3LrZNL+w
         /YrKz7+YHWhZrUEZNHx8pk0vDOEBuL+NpAyZv8kBJ+pm0vzTJ1iBTLOumMmrdOF+Xg53
         wzxw==
X-Forwarded-Encrypted: i=1; AJvYcCXp5Bozt5FZE3p4KiR8uW2fJuDaln3VtB+adh5QxvjSVjfNw0Z1RxbtS1zo20CMbUCyZfnY+L6T7ZfL7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfIVApF3XX0dJp6Iv879Z7ww2d/7n3gNCb5NihcimZQy1PdXZm
	5Q6b6jjlVLsX+NlowLbY7azM/TYMBRtp0UrzFYoRZNN8PJvCEH8m
X-Gm-Gg: ASbGnctUUafMVo+/AQReL6cRZwrudq3JZsqWeROf3Yes8mRpwHF/HnxdB0vsWffJcOx
	EsgE36br7kPTP3xcFMetM5lFWNmBoOT6KF4SRzU+s/G3RwdACVdVIqA+qU1RRlfLW2R7Badk4Em
	FkHw8EAUCLAc2AA0exJRHsA1/PkfvQTF5E9dH0TteGtliabDPAXKyFvwEc2ldNhPis7Nsk0zPvF
	koT7I+ikJQvyp8kVq1g+zu8nG9HEM3piWH8sLIr7Chd6QeZfCkjT8YRYdMF
X-Google-Smtp-Source: AGHT+IHAxPFhGdfgb685u348vhj4CVicXrWXrCLtKPo9QFaUPAstgj+S9PSpclTwWeED/WDNIQpYrA==
X-Received: by 2002:a05:6870:1cc:b0:29e:2bd6:2265 with SMTP id 586e51a60fabf-29f71b643c4mr6950283fac.7.1733728767595;
        Sun, 08 Dec 2024 23:19:27 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f566e5666sm2487711fac.18.2024.12.08.23.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:19:27 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v2 0/5] Add PCIe support to Sophgo SG2042 SoC
Date: Mon,  9 Dec 2024 15:19:18 +0800
Message-Id: <cover.1733726572.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_231928_735689_92F20680 
X-CRM114-Status: GOOD (  15.26  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Sophgo's SG2042 SoC uses Cadence PCIe core to implement RC mode.

SG2042 PCIe controller supports two ways to report MSI:

Method A, the PICe controller implements an MSI interrupt controller
inside, and connect to PLIC upward through one interrupt line. Provides
memory-mapped msi address, and by programming the upper 32 bits of the
address to zero, it can be compatible with old pcie devices that only
support 32-bit msi address.

Method B, the PICe controller connects to PLIC upward through an
independent MSI controller "sophgo,sg2042-msi" on the SOC. The MSI
controller provides multiple(up to 32) interrupt sources to PLIC.
Compared with the first method, the advantage is that the interrupt
source is expanded, but because for SG2042, the msi address provided
by the MSI controller is fixed and only supports 64-bit address(> 2^32),
it is not compatible with old pcie devices that only support 32-bit
msi address.

This patchset depends on another patchset for the SG2042 MSI controller[msi].
If you need to test the DTS part, you need to apply the corresponding
patchset.

Link: https://lore.kernel.org/linux-riscv/cover.1733726057.git.unicorn_wang@outlook.com/ [msi]

Thanks,
Chen

---

Changes in v2:
  The patch series is based on v6.13-rc2.

  Fixed following issues as per comments from Rob Herring, Bjorn Helgaas, thanks.

  - Improve driver binding description
    - Define a new embeded object property msi to replace the "sophgo,internal-msi".
    - Rename "sophgo,link-id" to "sophgo,pcie-port" as per suggestion from Bjorn,
      and add more explanaion for this property.
    - Use msi-parent.
  - Improve driver code:
    - Improve coding style.
    - Fix a bug and make sure num_applied_vecs updated with the max value.
    - Use the MSI parent model.
    - Remove .cpu_addr_fixup.
    - Reorder Kconfig menu item to keep them in alphabetical order by vendor.

Changes in v1:
  The patch series is based on v6.12-rc7. You can simply review or test the
  patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1731303328.git.unicorn_wang@outlook.com/ [1]
---

Chen Wang (5):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  dt-bindings: mfd: syscon: Add sg2042 pcie ctrl compatible
  riscv: sophgo: dts: add pcie controllers for SG2042
  riscv: sophgo: dts: enable pcie for PioneerBox

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 141 +++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  89 +++
 drivers/pci/controller/cadence/Kconfig        |  11 +
 drivers/pci/controller/cadence/Makefile       |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c  | 534 ++++++++++++++++++
 7 files changed, 790 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
