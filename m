Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18852C07E99
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 13:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9FE2613B2
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 13:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9FE2613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/RiL+meuRMDJAhxi6hYZ8s8Hu1OO+Zx6MKbqEHL3GTk=; b=anwSrifSoWxq64
	lnZoQUCpjIoYWIFhsKJyFND/+7VY2PErbvyZsTU1OSlB5NR8zZx7ltDWJGX6Yn85O3sovSl8LvAvD
	V4sNwtQOcD6lY8Ix4oYGEoem1AWQtq+BQFOOISNGYiCSwQttFm1/YcdPxF7GUYsZ/xRDvF5NERWCz
	HefvMfZwdCHrxZX9v+fKZkG4//GRN8PslA2KJcP7Tyax9Rp0tjipNNFjwM50mW3u+x2qqMKetkIqV
	1ShkwHVGDg6N8THBAEL2jZghmpdY4KC+EWmCiCxeAk5rxf9s4b9LPMfbwJdLHr9oEFiXhxl5KkBcB
	HzSS1SL39PyOQY6rpfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1r11-001svA-BC; Fri, 09 Jul 2021 13:58:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1r0m-001sor-1H; Fri, 09 Jul 2021 13:57:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D05D613B2;
 Fri,  9 Jul 2021 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625839067;
 bh=HyNehvqgAJQzHq1MhZD/QmNgbhv9hin721hnafe3LcI=;
 h=From:To:Cc:Subject:Date:From;
 b=toOdvWw5iKKMV7gg70ONZoGKe3kIMcaKbL9tBcnZ6fQCipRadtQuP6o5myjdowG6K
 yBxVgSqRaP1ZSBfkmvIFC5FC1N6TEY6CddTYG62SR6Fg/6iEgwLmLwX5VxogkIGDUs
 afRoG2e5sMmA9EYSqOG4P1jb90w3Alz4L7pbqmOlpbVkirRXJ2kVpmFRD7sJsBKXUO
 vY8zqFToJJxgS1uYKx9x0/78G+QMfqcv9e5W/U3ad5Rmfs6B3pL7NCxdi0PWJe4lgD
 p+PFFgmr1TBdGROLHQbTeNMFNTKjCiZordM2C8hglZ25/+Rf4fkN5G355TVrYZpL54
 h5lCS444TGgUg==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1m1r0i-0004lB-Ik; Fri, 09 Jul 2021 15:57:44 +0200
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
Subject: [PATCH v3 0/2] convert designware-pcie.txt and kirin-pcie.txt to yaml
Date: Fri,  9 Jul 2021 15:57:41 +0200
Message-Id: <cover.1625838920.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_065748_187227_ABDC8F55 
X-CRM114-Status: GOOD (  10.01  )
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

This series applies after this one:
   https://lore.kernel.org/lkml/cover.1625826353.git.mchehab+huawei@kernel.org/

It basically converts two PCI DT-bindings to DT schema. On this version, I'm
addressing some of your comments from v2, and rebased it on the top of
my Hikey 960/970 tree (based on linus/master).

The example for the designware file is producing some warnings here, as it
can't find the right propertiesPattern. No idea why.

Mauro Carvalho Chehab (2):
  dt-bindings: PCI: designware-pcie.txt: convert it to yaml
  dt-bindings: PCI: kirin-pcie.txt: convert it to yaml

 .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
 .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
 .../bindings/pci/designware-pcie.txt          |  77 ----------
 .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
 .../bindings/pci/hisilicon,kirin-pcie.yaml    |  79 ++++++++++
 .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
 .../devicetree/bindings/pci/kirin-pcie.txt    |  41 ------
 .../bindings/pci/layerscape-pci.txt           |   2 +-
 .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
 .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
 .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
 .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
 .../bindings/pci/samsung,exynos-pcie.yaml     |   2 +-
 .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
 .../devicetree/bindings/pci/snps,dw-pcie.yaml | 135 ++++++++++++++++++
 .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
 .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
 .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
 MAINTAINERS                                   |   4 +-
 19 files changed, 239 insertions(+), 143 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/kirin-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml

-- 
2.31.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
