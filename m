Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4891BC07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 11:25:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1B561006
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 11:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1B561006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dIZnt0w7tA6z7OzyFbzFEob5yG32qFY8zIigSEILFCc=; b=XTOPoYSPsmP+2G
	PZaM1jgmpgZWugvxU+vUK2adh3CZpZNDLrpSTnW968+SN4oejrHgn1yD89CvhFKLNLZy4wjkclYN/
	905wAld/cv+Q2tLje8/EVKEITLJTYaRlM3xnm8o0aCbsrsMCXkjK5OdwdoWq6Bvi886QWxo0BUvUJ
	zFOim3k94XEm2VibG0/v/xJi7YQr3KylVyV+mFzAoQgS4R5PIsK3k2KdYIpHCcifjn3JIKVqY6/ev
	7DPswvjwfOUjonr8dU6D94DGrqAuPMxT7BsYfaNIy0dljY479qngc8oYhNfJ5DLvUTaWZCtDMsXvV
	UWJtsT7zOKMsb3/Mo3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3GXd-00AAnz-72; Tue, 13 Jul 2021 11:25:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3GQS-00A8AQ-U2; Tue, 13 Jul 2021 11:18:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 344AA61178;
 Tue, 13 Jul 2021 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626175088;
 bh=G3DpPuSACBy7CTePMGBCkcBIAOUG+KzTOSbhqPO32E0=;
 h=From:To:Cc:Subject:Date:From;
 b=ESQW+vzQ0c21D41buSWvccNUGNN5X8LojV5B2NWlcjYl2b6wJFnmkm9KDpYL3TNL4
 rrN9gvVBsEag7eI0F+SoyUW+J0OXR/jx+8pQ+G3L2wf0MKChDFnsWYxxs9UBsbPGb3
 aBVcjc4QeCYJH34IodncdvAo5y3Of1z7bEwT8A1aVLwyz+qdfP6FuEeiSnp3LCwFXm
 cFq3kW0T54mQ9bcWKq1SWiMHvSj/V/egkSpQ7K0Vqggii237AqGFUdSwVvv5vFtfNp
 oUqISdXQa/Du+5om3X1ugLJoi8bcUNt+w74aGT3o97FhKjPGPWJ0d9lgRc7fXGeDYf
 468P+XCrKyARQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1m3GQK-006b3Y-Rv; Tue, 13 Jul 2021 13:18:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 0/5] convert designware-pcie.txt and kirin-pcie.txt to yaml
Date: Tue, 13 Jul 2021 13:17:50 +0200
Message-Id: <cover.1626174242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_041809_084223_F976786C 
X-CRM114-Status: GOOD (  15.45  )
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

Hi Rob,

This series (in particular, the last patch) depends on this series:
	https://lore.kernel.org/lkml/cover.1626157454.git.mchehab+huawei@kernel.org/

It convert designware-pcie.txt and kirin-pcie.txt to DT schema.

This series uses a different strategy than v4: after doing lots of tests and
trying to tweak the syntax, I opted to create two files instead of one.

The first one (snps,dw-pcie.yaml) uses the pci-bus.yaml schema.
The second one (add snps,dw-pcie-ep.yaml) uses the pci-ep.yaml schema.

Without splitting it into two, I was unable to find a way that would work,
due to the need of using:

	AllOf:
	   - $ref: /schemas/pci/pci-bus.yaml#

For the non-endpoint part.

In order to make easier to review, I also opted to split the patch into
4 ones:

patch 1:
   adds the Designware PCI DT schema;
patch 2:
   adds the Designware PCI endpoint DT schema;
patch 3:
   changes the existing references to point to the new schemas.
   On yaml files, it uses the proper $ref to point to the right DT schema;
patch 4
   drops the old txt file.

Patch5 is independent: it converts the pcie-kirin.txt to DT schema and
adds a reference to the newly-converted DWC schema.

It should be noticed that I had to make a few amends at the "reg" field
on patches 1 and 2, in order to avoid warnings about some properties
found on some DWC-dependent DT schemas, as some have "addr_space",
"link", "app" and "elbi".

With this change, it now passes "make dt_binding_check".

Mauro Carvalho Chehab (5):
  dt-bindings: PCI: add snps,dw-pcie.yaml
  dt-bindings: PCI: add snps,dw-pcie-ep.yaml
  dt-bindings: PCI: update references to Designware schema
  dt-bindings: PCI: remove designware-pcie.txt
  dt-bindings: PCI: kirin-pcie.txt: Convert it to yaml

 .../bindings/pci/amlogic,meson-pcie.txt       |  4 +-
 .../bindings/pci/axis,artpec6-pcie.txt        |  2 +-
 .../bindings/pci/designware-pcie.txt          | 77 ---------------
 .../bindings/pci/fsl,imx6q-pcie.txt           |  2 +-
 .../bindings/pci/hisilicon,kirin-pcie.yaml    | 81 ++++++++++++++++
 .../bindings/pci/hisilicon-histb-pcie.txt     |  2 +-
 .../devicetree/bindings/pci/kirin-pcie.txt    | 41 --------
 .../bindings/pci/layerscape-pci.txt           |  2 +-
 .../bindings/pci/nvidia,tegra194-pcie.txt     |  5 +-
 .../devicetree/bindings/pci/pci-armada8k.txt  |  2 +-
 .../devicetree/bindings/pci/pcie-al.txt       |  2 +-
 .../devicetree/bindings/pci/qcom,pcie.txt     | 14 +--
 .../bindings/pci/samsung,exynos-pcie.yaml     |  4 +-
 .../bindings/pci/sifive,fu740-pcie.yaml       |  4 +-
 .../bindings/pci/snps,dw-pcie-ep.yaml         | 90 +++++++++++++++++
 .../devicetree/bindings/pci/snps,dw-pcie.yaml | 96 +++++++++++++++++++
 .../pci/socionext,uniphier-pcie-ep.yaml       |  4 +-
 .../devicetree/bindings/pci/ti-pci.txt        |  4 +-
 .../devicetree/bindings/pci/uniphier-pcie.txt |  2 +-
 MAINTAINERS                                   |  5 +-
 20 files changed, 297 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/kirin-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml

-- 
2.31.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
